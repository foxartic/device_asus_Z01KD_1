#!/usr/bin/env python3
"""Give the 8.1 keymaster HAL a matching library set.

/system/lib64/libkeymaster_portable.so is the Android-11 build, while
/system/lib64/libsoftkeymasterdevice.so and
/vendor/lib64/hw/android.hardware.keymaster@3.0-impl.so are Android 8.1 blobs.
keymaster::AuthorizationSet changed layout between those releases, so the mixed
pair faults the moment an AuthorizationSet crosses the boundary (SIGSEGV in
AuthorizationSet::Clear from SoftKeymasterContext::CreateKeyBlob, reached from
AndroidKeymaster::AttestKey - i.e. every lockscreen unlock). A11 dropped the
keymaster 3.0 default implementation, so the HAL itself cannot be rebuilt from
source and has to keep the 8.1 ABI.

The legacy namespace searches /system/lib64 before /system/vendor/lib64, so a
same-named vendor copy can never win; the 8.1 pair therefore gets private names
and the consumers' DT_NEEDED entries are retargeted at them.

    python3 build_km81_shims.py [--stage DIR] [--only lib|lib64]

Without --stage the artifacts land in prebuilts/livepatch/, which device.mk
copies into the image; with --stage everything is written into DIR instead,
leaving the trees untouched, which is what the on-device test uses. The vendor
tree is only ever read.
"""
import argparse
import os
import subprocess
import sys

DEVICE = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
TREE = os.path.abspath(os.path.join(DEVICE, "..", "..", ".."))
SRC81 = os.path.join(DEVICE, "prebuilts/system/vendor")
VT = os.path.join(TREE, "vendor/asus/Z01KD_1/proprietary/vendor")
LIVEPATCH = os.path.join(DEVICE, "prebuilts/livepatch")

RENAMES = [
    (b"libkeymaster_portable.so", b"libkeymport81.so"),
    (b"libsoftkeymasterdevice.so", b"libsoftkeym81.so"),
]

SOURCES = ["libkeymaster_portable.so", "libsoftkeymasterdevice.so"]

BITNESS = ["lib64", "lib"]


def patch_bytes(data):
    hits = []
    for old, new in RENAMES:
        assert len(new) <= len(old), (old, new)
        count = data.count(old)
        if count:
            data[:] = data.replace(old, new.ljust(len(old), b"\0"))
            hits.append((old.decode(), count))
    return hits


def rewrite(src, dst):
    with open(src, "rb") as handle:
        data = bytearray(handle.read())
    hits = patch_bytes(data)
    with open(dst, "wb") as handle:
        handle.write(data)
    return hits


def needed(path):
    out = subprocess.run(["readelf", "-d", path], capture_output=True, text=True).stdout
    names = []
    for line in out.splitlines():
        for tag in ("NEEDED", "SONAME"):
            if tag in line and ".so" in line:
                names.append(line[line.index("[") + 1:line.index("]")])
    return names


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--stage", help="write every artifact here instead of the trees")
    ap.add_argument("--only", choices=BITNESS, default=None)
    args = ap.parse_args()

    for bits in BITNESS if not args.only else [args.only]:
        impl_src = os.path.join(VT, bits, "hw/android.hardware.keymaster@3.0-impl.so")
        out_dir = os.path.join(args.stage, bits) if args.stage else os.path.join(LIVEPATCH, bits)
        hw_dir = os.path.join(out_dir, "hw") if args.stage else os.path.join(LIVEPATCH, bits, "hw")

        for lib in SOURCES:
            src = os.path.join(SRC81, bits, lib)
            if not os.path.exists(src):
                sys.exit("missing %s" % src)
        if not os.path.exists(impl_src):
            sys.exit("missing %s" % impl_src)

        os.makedirs(hw_dir, exist_ok=True)
        for lib in SOURCES:
            private_name = [new.decode() for old, new in RENAMES if old == lib.encode()][0]
            for name, count in rewrite(os.path.join(SRC81, bits, lib), os.path.join(out_dir, private_name)):
                print("%s: %s x%d -> %s" % (private_name, name, count, bits))
        impl_out = os.path.join(hw_dir, os.path.basename(impl_src))
        for name, count in rewrite(impl_src, impl_out):
            print("%s: %s x%d (%s)" % (os.path.basename(impl_out), name, count, bits))
        print("  %s needs: %s" % (bits, " ".join(needed(impl_out))))


if __name__ == "__main__":
    main()
