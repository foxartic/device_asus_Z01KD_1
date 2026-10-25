#!/system/bin/sh
# IMMEDIATE dump + loop. Old version slept 30s first, but this boot dies
# <30s after late_start, so it never captured anything. Dump first, then
# keep re-dumping every 8s so /cache/logcat.txt always reflects the LAST
# state before the bounce. /cache/diag-progress.txt proves it ran + timeline.
echo "diag START $(date)" > /cache/diag-progress.txt
ls -l /data/tombstones > /cache/tomb-list.txt 2>&1
echo "=== boot $(date) ===" > /cache/tomb-all.txt
for t in /data/tombstones/tombstone_0*; do
  echo "########## $t ##########" >> /cache/tomb-all.txt 2>&1
  head -60 "$t" >> /cache/tomb-all.txt 2>&1
done
ls -l /data/anr > /cache/anr-list.txt 2>&1
i=0
while [ $i -lt 40 ]; do
  echo "--- iter $i @ $(date) bootanim=$(getprop init.svc.bootanim) bc=$(getprop sys.boot_completed) ---" >> /cache/diag-progress.txt
  {
    echo "=== date ==="; date
    echo "=== iter $i ==="
    echo "=== init.svc.* (which services running/restarting/dead) ==="
    getprop | grep -E 'init.svc|bootanim|sys.boot_completed|vold.decrypt|dev.bootcomplete'
  } > /cache/diag-services.txt 2>&1
  logcat -d -b all > /cache/logcat.txt 2>&1
  dmesg > /cache/diag-dmesg.txt 2>&1
  i=$((i+1))
  sleep 8
done
echo "diag COMPLETE $(date)" >> /cache/diag-progress.txt
echo done > /cache/bl-diagdone
