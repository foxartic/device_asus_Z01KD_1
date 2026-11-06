#!/bin/bash
# Build the libhidltransport/libhwbinder shims Android 11 no longer provides.
# Android 10 merged both into libhidlbase but every 8.1 vendor HAL still lists the
# old names in DT_NEEDED; each shim exports nothing and only pulls libhidlbase in,
# so one HIDL runtime stays in the process.
set -e
LINEAGE=${LINEAGE:-/home/harry/los18}
OUT=${OUT:-$LINEAGE/out/target/product/Z01KD_1}
TOOLS=$(cd "$(dirname "$0")" && pwd)
DST=${DST:-$(dirname "$TOOLS")/prebuilts/livepatch}
CL=$(ls -d "$LINEAGE"/prebuilts/clang/host/linux-x86/clang-r383902b/bin)
SRC=$(dirname "$0")/hidl_shim.c
[ -f "$SRC" ] || { echo "missing $SRC"; exit 1; }

mkdir -p "$DST/lib" "$DST/lib64"

build() {
  local name=$1 arch=$2 outdir=$3 sysdir=$4
  "$CL/clang" --target="$arch" -fPIC -O2 -shared -nostdlib -fuse-ld=lld -B"$CL" \
    -Wl,--no-as-needed -Wl,-soname,"$name" \
    -L"$OUT/system/$sysdir" -l:libhidlbase.so \
    -o "$outdir/$name" "$SRC"
  echo "== $outdir/$name"
  ls -l "$outdir/$name" | sed 's/.*harry //'
  readelf -d "$outdir/$name" | grep -E 'SONAME|NEEDED' | sed 's/.*\[//;s/\].*//'
}

for n in libhidltransport.so libhwbinder.so; do
  build "$n" aarch64-linux-android29 "$DST/lib64" lib64
  build "$n" armv7a-linux-androideabi29 "$DST/lib"    lib
done
