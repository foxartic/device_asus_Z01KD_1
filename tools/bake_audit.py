#!/usr/bin/env python3
"""Classify every file whose timestamp is newer than the flashed image, so the
live system is provably reproducible from device/asus/Z01KD_1,
vendor/asus/Z01KD_1, kernel/asus/Z01KD_1 or a platform repo.

Buckets:
  BAKED                a copy rule installs a byte-identical tree file
  MISMATCH             a rule exists but the source differs from live
  MISSING SOURCE       a rule points at a file that is not there
  PLATFORM BUILD       built from an AOSP/Lineage repo, no copy rule needed
                       (see BUILD_OWNED below for which repo)
  LIVE-ONLY            hand-pushed scaffolding that is deliberately not baked
"""
import os
import re
import hashlib

LINEAGE = os.environ.get("LINEAGE", "/home/harry/lineage")
# live_touched.txt and live_all.md5 come from the running device:
#   adb shell 'touch -t 200901010000 /data/local/tmp/ref;
#              find /system -type f -newer /data/local/tmp/ref' > live_touched.txt
#   adb shell 'cd /system && md5sum $(find . -type f)' > live_all.md5
AUDIT = os.environ.get("AUDIT", "/home/harry/audit")
DT = os.path.join(LINEAGE, "device/asus/Z01KD_1")
VT = os.path.join(LINEAGE, "vendor/asus/Z01KD_1")

VARS = {
    "TARGET_COPY_OUT_VENDOR": "system/vendor",
    "TARGET_COPY_OUT_SYSTEM": "system",
    "TARGET_COPY_OUT_PRODUCT": "system/product",
    "TARGET_COPY_OUT_ODM": "system/odm",
    "TARGET_OUT_VENDOR": "system/vendor",
    "TARGET_OUT_VENDOR_ETC": "system/vendor/etc",
    "TARGET_OUT_VENDOR_LIB": "system/vendor/lib",
    "TARGET_OUT_VENDOR_LIB64": "system/vendor/lib64",
    "TARGET_OUT_SYSTEM_ETC": "system/etc",
    "TARGET_ROOT_OUT": "system",
}

# Live files that a fresh build produces on its own, with the repo that builds
# them.  Each was verified by diffing the live copy against its source input.
BUILD_OWNED = {
    "/system/addon.d/50-lineage.sh": "vendor/lineage/prebuilt/common/bin/50-lineage.sh",
    "/system/vendor/etc/vintf/manifest.xml": "device/asus/Z01KD_1/manifest.xml (assemble_vintf)",
    "/system/build.prop": "build/make builds it from PRODUCT_PROPERTY_OVERRIDES, "
                          "including ro.opengles.version in device.mk",
    "/system/bin/vold": "system/vold (Checkpoint.cpp is modified, uncommitted)",
    "/system/product/priv-app/Settings/Settings.apk":
        "packages/apps/Settings (UsbDetailsFunctionsController.java, uncommitted)",
}

LIVE_ONLY = {
    "/system/bin/bootlog.sh": "boot diagnostics, no pstore on this kernel",
    "/system/etc/init/bootlog.rc": "boot diagnostics",
    "/system/etc/init/zzbootlog.rc": "boot diagnostics",
    "/system/etc/init/zz-norescue.rc": "superseded by persist.sys.disable_rescue in device.mk",
    "/system/vendor/etc/vintf/manifest.xml.bak-rfs": "backup of the pre-edit manifest",
    "/system/vendor/etc/init/hw/init.asus.usb.rc.bak-mtpd-live": "backup of the pre-MTP rc",
    "/system/vendor/bin/hw/android.hardware.wifi@1.0-service.asus81":
        "orphan from the Wi-Fi debugging: no init script or DT_NEEDED refers to it",
}

PAIR = re.compile(r"^\s*([^\s:]+):([^\s:]+)\s*\\?\s*$")
VAR = re.compile(r"\$\(([A-Za-z0-9_]+)\)")


def expand(text, base):
    def sub(m):
        name = m.group(1)
        if name == "LOCAL_PATH":
            return base
        return VARS.get(name, "<" + name + ">")
    return VAR.sub(sub, text)


def norm_dest(dest):
    dest = dest.lstrip("/")
    if dest.startswith("system/"):
        return dest
    if dest.startswith("vendor/") and not dest.startswith("vendor/asus"):
        return "system/vendor/" + dest[len("vendor/"):]
    if dest.startswith("product/"):
        return "system/" + dest
    return dest


def md5(path):
    h = hashlib.md5()
    with open(path, "rb") as fh:
        for chunk in iter(lambda: fh.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def copy_rules():
    rules = {}
    mks = [os.path.join(d, f) for d in (DT, VT) for f in sorted(os.listdir(d)) if f.endswith(".mk")]
    for mk in mks:
        base = os.path.dirname(mk)
        with open(mk, encoding="utf-8", errors="replace") as fh:
            for line in fh:
                m = PAIR.match(line.rstrip("\n"))
                if not m:
                    continue
                src, dest = expand(m.group(1), base), expand(m.group(2), base)
                if "<" in src or "<" in dest:
                    continue
                dest = norm_dest(dest)
                if not src.startswith("/"):
                    # vendor trees spell blob paths relative to the repo root
                    cand = os.path.join(LINEAGE, src)
                    src = cand if os.path.exists(cand) else src
                    if not src.startswith("/"):
                        continue
                rules.setdefault(dest, []).append((src, mk))
    return rules


def module_rules():
    """BUILD_PREBUILT modules: LOCAL_MODULE_PATH + stem or module name."""
    rules = {}
    for dirpath, dirnames, filenames in os.walk(DT):
        if ".git" in dirpath or "Android.mk" not in filenames:
            continue
        mk = os.path.join(dirpath, "Android.mk")
        base = dirpath
        blocks = open(mk, encoding="utf-8", errors="replace").read().split("include $(CLEAR_VARS)")
        for block in blocks[1:]:
            if "BUILD_PREBUILT" not in block:
                continue
            fields = dict(re.findall(r"^LOCAL_(MODULE|MODULE_STEM|SRC_FILES|MODULE_PATH)\s*:?=\s*(.+)$",
                                     block, re.M))
            if not fields or "SRC_FILES" not in fields:
                continue
            name = fields.get("STEM", fields.get("MODULE", "")).strip()
            dest_dir = expand(fields.get("MODULE_PATH", "$(TARGET_OUT_VENDOR_ETC)").strip(), base)
            if "<" in dest_dir:
                continue
            src = os.path.join(base, fields["SRC_FILES"].strip())
            dest = norm_dest(dest_dir + "/" + name)
            if not dest.startswith("system/"):
                dest = "system/" + dest
            rules.setdefault(dest, []).append((src, mk))
    return rules


def main():
    rules = {}
    for src_map in (copy_rules(), module_rules()):
        for dest, hits in src_map.items():
            rules.setdefault(dest, []).extend(hits)
    touched = [l.strip() for l in open(AUDIT + "/live_touched.txt") if l.strip()]
    livesum = {}
    for line in open(AUDIT + "/live_all.md5"):
        parts = line.split()
        if len(parts) == 2:
            livesum["system/" + parts[1].lstrip("./")] = parts[0]

    print("destinations with a tree rule: %d" % len(rules))
    buckets = {}
    for path in touched:
        rel = path.lstrip("/")
        live = livesum.get(rel)
        if live is None:
            buckets.setdefault("NOT IN LIVE SCAN", []).append((path, ""))
            continue
        if path in LIVE_ONLY:
            buckets.setdefault("LIVE-ONLY", []).append((path, LIVE_ONLY[path]))
            continue
        hits = rules.get(rel, [])
        if hits:
            differ = []
            baked = None
            for src, mk in hits:
                if not os.path.exists(src):
                    differ.append((path, live, src, "missing", mk))
                elif md5(src) == live:
                    baked = (path, live, src.replace(LINEAGE + "/", ""))
                else:
                    differ.append((path, live, src.replace(LINEAGE + "/", ""), md5(src), mk))
            if baked:
                buckets.setdefault("BAKED", []).append(baked)
            else:
                buckets.setdefault("MISMATCH", []).extend(differ)
        elif path in BUILD_OWNED:
            buckets.setdefault("PLATFORM BUILD", []).append((path, live, BUILD_OWNED[path]))
        else:
            buckets.setdefault("NO RULE", []).append((path, live))

    for name in sorted(buckets):
        rows = buckets[name]
        print("\n=== %s (%d)" % (name, len(rows)))
        for row in rows:
            print("  " + " | ".join(str(x) for x in row).replace(LINEAGE + "/", ""))


if __name__ == "__main__":
    main()
