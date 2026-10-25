setprop ro.btmac `btnvtool -x 2>&1`
setprop bt.version.driver "BTFM.CHE.2.1.1.c2-00078-QCACHROMZ-1.154265.1"
wifi_mac=`sed -n '1 p' /factory/wlan_mac.bin`
wifi_mac=${wifi_mac//Intf0MacAddress=/ }
setprop ro.wifimac $wifi_mac
wifi_version=`cat /asusfw/wifi/wifi_version`
wifi_version=${wifi_version//wifi_version=/ }
setprop wifi.version.driver $wifi_version
