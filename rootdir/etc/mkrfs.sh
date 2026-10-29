#!/bin/sh
# Recreates the stock ASUS /vendor/rfs layout inside the vendor output dir.
# tftp_server (pid runs as oem_2951) resolves the modem's RFS requests to these
# paths and mkdir()s <subsys>/<pd>/readwrite at request time; /system is
# read-only, so the tree has to be part of the image.
set -e
V="$1"
R="$V/rfs"

mkdir -p \
	"$R/apq/gnss/readonly/vendor" \
	"$R/mdm/adsp/readonly/vendor" \
	"$R/mdm/mpss/readonly/vendor" \
	"$R/mdm/slpi/readonly" \
	"$R/mdm/tn/readonly" \
	"$R/msm/adsp/readonly/vendor" \
	"$R/msm/mpss/readonly/vendor" \
	"$R/msm/slpi/readonly"

for d in apq/gnss mdm/adsp mdm/mpss msm/adsp msm/mpss; do
	ln -sfn /firmware "$R/$d/readonly/firmware"
	ln -sfn /vendor/firmware "$R/$d/readonly/vendor/firmware"
done
for d in mdm/slpi mdm/tn msm/slpi; do
	ln -sfn /firmware "$R/$d/readonly/firmware"
done

for d in apq/gnss mdm/adsp mdm/mpss mdm/slpi mdm/tn msm/adsp msm/mpss msm/slpi; do
	ln -sfn /persist/hlos_rfs/shared "$R/$d/hlos"
	ln -sfn /persist/rfs/shared "$R/$d/shared"
	ln -sfn "/persist/rfs/$d" "$R/$d/readwrite"
done

ln -sfn /data/vendor/tombstones/rfs/modem "$R/apq/gnss/ramdumps"
ln -sfn /data/vendor/tombstones/rfs/lpass "$R/mdm/adsp/ramdumps"
ln -sfn /data/vendor/tombstones/rfs/modem "$R/mdm/mpss/ramdumps"
ln -sfn /data/vendor/tombstones/rfs/slpi "$R/mdm/slpi/ramdumps"
ln -sfn /data/vendor/tombstones/rfs/tn "$R/mdm/tn/ramdumps"
ln -sfn /data/vendor/tombstones/rfs/lpass "$R/msm/adsp/ramdumps"
ln -sfn /data/vendor/tombstones/rfs/modem "$R/msm/mpss/ramdumps"
ln -sfn /data/vendor/tombstones/rfs/slpi "$R/msm/slpi/ramdumps"
