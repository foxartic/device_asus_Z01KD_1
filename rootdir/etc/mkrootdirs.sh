#!/bin/sh
# Mountpoints for the ASUS firmware partitions have to be in the image itself:
# / is read-only by the time init reaches its mkdir lines.  Modes and owners
# mirror the init.qcom.rc and vendor init.asus.rc mount blocks.
ROOT=$1
[ -d "$ROOT" ] || exit 1

mkdir -p "$ROOT/firmware" "$ROOT/bt_firmware" "$ROOT/dsp"
chmod 0771 "$ROOT/firmware" "$ROOT/bt_firmware"
chmod 0771 "$ROOT/dsp"

mkdir -p "$ROOT/persist"
chmod 0771 "$ROOT/persist"

mkdir -p "$ROOT/factory" "$ROOT/asusfw"
chmod 0775 "$ROOT/factory" "$ROOT/asusfw"

# The build installs etc/rootdirs.keep as /firmware/.keep; the others need a
# file each so the directory is not empty in the staging tree.
for d in bt_firmware dsp persist factory asusfw; do
    : > "$ROOT/$d/.keep"
done
exit 0
