#!/usr/bin/env python3
# Rewrite 8.1-era DT_NEEDED/SONAME strings in place to point at private copies
# living in /vendor/lib64 (or /vendor/lib), so the A10 /system copies (which lack
# the 8.1 ABI) are never picked up.  New names may be shorter; they are padded
# with NULs so every ELF offset in the file stays identical.
import sys

RULES = [
    (b"libbase.so", b"libbs81.so"),
    (b"android.hardware.gnss@1.0.so", b"android.hardware.gnss@18.so"),
    (b"android.hardware.audio.common@2.0.so", b"android.hardware.audio.common81.so"),
]

def patch(path):
    with open(path, "rb") as f:
        data = bytearray(f.read())
    hits = []
    for old, new in RULES:
        assert len(new) <= len(old), (old, new)
        n = data.count(old)
        if n:
            data[:] = data.replace(old, new.ljust(len(old), b"\0"))
            hits.append((old.decode(), n))
    if hits:
        with open(path, "wb") as f:
            f.write(data)
    return hits

if __name__ == "__main__":
    for p in sys.argv[1:]:
        print(p, patch(p) or "no change")
