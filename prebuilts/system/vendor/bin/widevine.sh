#!/system/vendor/bin/sh

/system/vendor/bin/is_keybox_valid
/system/bin/is_hdcp_valid

# start install_key_server
setprop "atd.start.key.install" 1
