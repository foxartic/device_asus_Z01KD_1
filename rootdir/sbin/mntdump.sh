#!/system/bin/sh
cat /proc/mounts > /cache/mounts.txt 2>/dev/null
dmesg > /cache/dmesg.txt 2>/dev/null
getprop > /cache/props.txt 2>/dev/null
ls -l /dev/block/bootdevice/by-name > /cache/byname.txt 2>/dev/null
