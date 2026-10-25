#!/system/bin/sh
gesture_type=`getprop persist.asus.gesture.type`
if [ -f "/sys/class/input/input1/gesturemode" ] ;then
	echo "$gesture_type" > /sys/class/input/input1/gesturemode
elif [ -f "/sys/bus/i2c/devices/i2c-4/4-0038/fts_test" ] ;then
	echo "$gesture_type" > /sys/bus/i2c/devices/i2c-4/4-0038/gesture_mode
else
	echo "NO this panel!"
fi
