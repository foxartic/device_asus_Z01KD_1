#!/bin/bash
# Build the two audio shims that the 8.1 audio HALs need, straight from a
# freshly built tree:
#   libaudiocommon81.so                    private SONAME copy of the real
#                                          android.hardware.audio.common@2.0-util.so
#   android.hardware.audio.common@2.0-util.so  forwarder that keeps the old
#                                          SONAME and the 8.0-namespace
#                                          android::HidlUtils symbols, and calls
#                                          into the private copy
# The symbols it forwards were listed from the 8.1 impl blobs by
# tools/genshim-style nm diffing; audio_shim.c is that list, checked in.
set -e
LINEAGE=${LINEAGE:-/home/harry/lineage}
OUT=${OUT:-$LINEAGE/out/target/product/Z01KD_1}
TOOLS=$(cd "$(dirname "$0")" && pwd)
DST=${DST:-$(dirname "$TOOLS")/prebuilts/livepatch/lib}
CL=$(ls -d "$LINEAGE"/prebuilts/clang/host/linux-x86/clang-r344140b/bin)

SRC="$OUT/system/vendor/lib/android.hardware.audio.common@2.0-util.so"
[ -f "$SRC" ] || { echo "missing $SRC - run a build first"; exit 1; }
mkdir -p "$DST"
cd "$DST"

cp -f "$SRC" libaudiocommon81.so
python3 - <<'PY'
p = "libaudiocommon81.so"
old = b"android.hardware.audio.common@2.0-util.so"
new = b"libaudiocommon81.so"
d = bytearray(open(p, "rb").read())
if old not in d:
    raise SystemExit("SONAME string not found")
i = d.find(old)
d[i:i + len(old)] = new + b"\x00" * (len(old) - len(new))
open(p, "wb").write(d)
print("SONAME patched at", hex(i))
PY

"$CL/clang" --target=armv7a-linux-androideabi29 -fPIC -O2 -shared -nostdlib -fno-builtin \
  -fuse-ld=lld -B"$CL" \
  -Wl,-soname,android.hardware.audio.common@2.0-util.so \
  -Wl,--no-undefined -Wl,--no-as-needed \
  -L"$DST" -l:libaudiocommon81.so \
  "$TOOLS/audio_shim.c" -o android.hardware.audio.common@2.0-util.so

readelf -d android.hardware.audio.common@2.0-util.so | grep -E 'SONAME|NEEDED'
readelf -d libaudiocommon81.so | grep SONAME
md5sum android.hardware.audio.common@2.0-util.so libaudiocommon81.so
