#!/vendor/bin/sh




ln_fw() {
    platform=`getprop ro.boot.id.prj`
    if [ $platform == "5" ]; then
        ln -s /system/vendor/firmware/sdm660/cppf.b00 /data/widevine/cppf.b00
        ln -s /system/vendor/firmware/sdm660/cppf.b01 /data/widevine/cppf.b01
        ln -s /system/vendor/firmware/sdm660/cppf.b02 /data/widevine/cppf.b02
        ln -s /system/vendor/firmware/sdm660/cppf.b03 /data/widevine/cppf.b03
        ln -s /system/vendor/firmware/sdm660/cppf.b04 /data/widevine/cppf.b04
        ln -s /system/vendor/firmware/sdm660/cppf.b05 /data/widevine/cppf.b05
        ln -s /system/vendor/firmware/sdm660/cppf.b06 /data/widevine/cppf.b06
        ln -s /system/vendor/firmware/sdm660/cppf.b07 /data/widevine/cppf.b07
        ln -s /system/vendor/firmware/sdm660/cppf.mdt /data/widevine/cppf.mdt

        ln -s /system/vendor/firmware/sdm660/widevine.b00 /data/widevine/widevine.b00
        ln -s /system/vendor/firmware/sdm660/widevine.b01 /data/widevine/widevine.b01
        ln -s /system/vendor/firmware/sdm660/widevine.b02 /data/widevine/widevine.b02
        ln -s /system/vendor/firmware/sdm660/widevine.b03 /data/widevine/widevine.b03
        ln -s /system/vendor/firmware/sdm660/widevine.b04 /data/widevine/widevine.b04
        ln -s /system/vendor/firmware/sdm660/widevine.b05 /data/widevine/widevine.b05
        ln -s /system/vendor/firmware/sdm660/widevine.b06 /data/widevine/widevine.b06
        ln -s /system/vendor/firmware/sdm660/widevine.b07 /data/widevine/widevine.b07
        ln -s /system/vendor/firmware/sdm660/widevine.mdt /data/widevine/widevine.mdt

        ln -s /system/vendor/firmware/sdm660/dxhdcp2.b00 /data/widevine/dxhdcp2.b00
        ln -s /system/vendor/firmware/sdm660/dxhdcp2.b01 /data/widevine/dxhdcp2.b01
        ln -s /system/vendor/firmware/sdm660/dxhdcp2.b02 /data/widevine/dxhdcp2.b02
        ln -s /system/vendor/firmware/sdm660/dxhdcp2.b03 /data/widevine/dxhdcp2.b03
        ln -s /system/vendor/firmware/sdm660/dxhdcp2.b04 /data/widevine/dxhdcp2.b04
        ln -s /system/vendor/firmware/sdm660/dxhdcp2.b05 /data/widevine/dxhdcp2.b05
        ln -s /system/vendor/firmware/sdm660/dxhdcp2.b06 /data/widevine/dxhdcp2.b06
        ln -s /system/vendor/firmware/sdm660/dxhdcp2.b07 /data/widevine/dxhdcp2.b07
        ln -s /system/vendor/firmware/sdm660/dxhdcp2.mdt /data/widevine/dxhdcp2.mdt
        echo "sdm660"
    else
        ln -s /system/vendor/firmware/sdm630/cppf.b00 /data/widevine/cppf.b00
        ln -s /system/vendor/firmware/sdm630/cppf.b01 /data/widevine/cppf.b01
        ln -s /system/vendor/firmware/sdm630/cppf.b02 /data/widevine/cppf.b02
        ln -s /system/vendor/firmware/sdm630/cppf.b03 /data/widevine/cppf.b03
        ln -s /system/vendor/firmware/sdm630/cppf.b04 /data/widevine/cppf.b04
        ln -s /system/vendor/firmware/sdm630/cppf.b05 /data/widevine/cppf.b05
        ln -s /system/vendor/firmware/sdm630/cppf.b06 /data/widevine/cppf.b06
        ln -s /system/vendor/firmware/sdm630/cppf.b07 /data/widevine/cppf.b07
        ln -s /system/vendor/firmware/sdm630/cppf.mdt /data/widevine/cppf.mdt

        ln -s /system/vendor/firmware/sdm630/widevine.b00 /data/widevine/widevine.b00
        ln -s /system/vendor/firmware/sdm630/widevine.b01 /data/widevine/widevine.b01
        ln -s /system/vendor/firmware/sdm630/widevine.b02 /data/widevine/widevine.b02
        ln -s /system/vendor/firmware/sdm630/widevine.b03 /data/widevine/widevine.b03
        ln -s /system/vendor/firmware/sdm630/widevine.b04 /data/widevine/widevine.b04
        ln -s /system/vendor/firmware/sdm630/widevine.b05 /data/widevine/widevine.b05
        ln -s /system/vendor/firmware/sdm630/widevine.b06 /data/widevine/widevine.b06
        ln -s /system/vendor/firmware/sdm630/widevine.b07 /data/widevine/widevine.b07
        ln -s /system/vendor/firmware/sdm630/widevine.mdt /data/widevine/widevine.mdt

        ln -s /system/vendor/firmware/sdm630/dxhdcp2.b00 /data/widevine/dxhdcp2.b00
        ln -s /system/vendor/firmware/sdm630/dxhdcp2.b01 /data/widevine/dxhdcp2.b01
        ln -s /system/vendor/firmware/sdm630/dxhdcp2.b02 /data/widevine/dxhdcp2.b02
        ln -s /system/vendor/firmware/sdm630/dxhdcp2.b03 /data/widevine/dxhdcp2.b03
        ln -s /system/vendor/firmware/sdm630/dxhdcp2.b04 /data/widevine/dxhdcp2.b04
        ln -s /system/vendor/firmware/sdm630/dxhdcp2.b05 /data/widevine/dxhdcp2.b05
        ln -s /system/vendor/firmware/sdm630/dxhdcp2.b06 /data/widevine/dxhdcp2.b06
        ln -s /system/vendor/firmware/sdm630/dxhdcp2.b07 /data/widevine/dxhdcp2.b07
        ln -s /system/vendor/firmware/sdm630/dxhdcp2.mdt /data/widevine/dxhdcp2.mdt
        echo "sdm630"
    fi
}

#do link firmware to /data/widevine
ln_fw

