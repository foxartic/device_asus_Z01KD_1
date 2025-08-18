# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.asus.enable_navbar=0 \
# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    bt.max.hfpclient.connections=1 \
    persist.bluetooth.disableabsvol=true \
    persist.bt.a2dp.aac_disable=true \
    ro.bluetooth.emb_wp_mode=false \
    ro.bluetooth.wipower=false \
# CNE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature=1 \
# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    asuscontacts.adn.init.done=1 \
    camera.aux.asus.package_contain=com.asus \
    persist.camera.preview.ubwc=0 \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.example.cameratest,com.asus.atd.smmitest \
# DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.dpm.feature=10 \
# FUSE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.fuse_sdcard=true \
# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.gralloc.enable_fb_ubwc=1 \
    debug.sf.enable_hwc_vds=1 \
    debug.sf.hw=1 \
    debug.sf.latch_unsignaled=1 \
    dev.pm.dyn_samplingrate=1 \
    persist.demo.hdmirotationlock=false \
    vendor.display.enable_default_color_mode=1 \
# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true \
    media.settings.xml=/vendor/etc/media_profiles_vendor.xml \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mm.enable.qcom_parser=13630463 \
    mm.enable.smoothstreaming=true \
    mmp.enable.3g2=true \
    persist.mm.enable.prefetch=true \
    ro.qualcomm.cabl=0 \
    vendor.vidc.dec.enable.downscalar=1 \
    vendor.vidc.enc.disable.pq=false \
    vendor.vidc.enc.disable_bframes=1 \
    vidc.enc.dcvs.extra-buff-count=2 \
    vidc.enc.target_support_bframe=1 \
# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    asus.config.4_5gFor4gPlus=1 \
    gsm.phonebook.migration=1 \
    logtool.class=com.asus.csclogtool.LogService \
    logtool.package=com.asus.csclogtool \
    persist.asus.dclick=0 \
    persist.asus.flipcovermode=0 \
    persist.asus.gesture.type=0000000 \
    persist.asus.glove=0 \
    persist.asus.isoktocall.qc=1 \
    persist.asus.logcat.filenum=20 \
    persist.asus.pwrdbg \
    persist.asus.swipeup=0 \
    persist.asus.tarevtlog=0 \
    persist.charger.max_voltage_mv=9000 \
    persist.debug.coresight.config=stm-events \
    persist.hwc.enable_vds=1 \
    persist.logd.size=1048576 \
    persist.rmnet.data.enable=true \
    persist.vendor.overlay.izat.optin=rro \
    qemu.hw.mainkeys=1 \
    ro.asus.network.types=7 \
    ro.asus.phone.dualLte=1 \
    ro.asus.phone.dualVoWiFi=1 \
    ro.asus.phone.dual_nt_sup=4 \
    ro.board.platform=sdm660 \
    ro.internal.tcpdump.file=/data/logcat_log/capture.pcap \
    ro.product.board=sdm660 \
    sys.tcpdump.file=/data/logcat_log/capture.pcap \
# NFC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nfc.port=I2C \
# NTP
PRODUCT_PROPERTY_OVERRIDES += \
    persist.backup.ntpServer="0.pool.ntp.org" \
# Netmgr
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.mode=concurrent \
    persist.data.netmgrd.qos.enable=true \
    ro.use_data_netmgrd=true \
# QTI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.at_library=libqti-at.so \
    ro.vendor.qti.am.reschedule=true \
    ro.vendor.qti.am.reschedule_service=true \
    ro.vendor.qti.config.zram=true \
    ro.vendor.qti.core_ctl_max_cpu=4 \
    ro.vendor.qti.core_ctl_min_cpu=2 \
    ro.vendor.qti.sys.fw.bg_apps_limit=60 \
    ro.vendor.qti.sys.fw.bservice_age=5000 \
    ro.vendor.qti.sys.fw.bservice_enable=true \
    ro.vendor.qti.sys.fw.bservice_limit=5 \
    ro.vendor.qti.sys.fw.empty_app_percent=50 \
    ro.vendor.qti.sys.fw.trim_cache_percent=100 \
    ro.vendor.qti.sys.fw.trim_empty_percent=100 \
    ro.vendor.qti.sys.fw.trim_enable_memory=2147483648 \
    ro.vendor.qti.sys.fw.use_trim_settings=true \
# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    persist.data.df.agg.dl_pkt=10 \
    persist.data.df.agg.dl_size=4096 \
    persist.data.df.dev_name=rmnet_usb0 \
    persist.data.df.dl_mode=5 \
    persist.data.df.iwlan_mux=9 \
    persist.data.df.mux_count=8 \
    persist.data.df.ul_mode=5 \
    persist.data.iwlan.enable=true \
    persist.data.wda.enable=true \
    persist.radio.VT_CAM_INTERFACE=2 \
    persist.radio.flexmap_type=none \
    persist.vendor.radio.rat_on=combine \
    ril.subscription.types=RUIM,RUIM \
    rild.libpath=/system/vendor/lib64/libril-qc-qmi-1.so \
    ro.telephony.default_network=9,9 \
    telephony.lteOnCdmaDevice=1 \
# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.sdk.sensors.gestures=false \
    ro.vendor.sensors.cmc=false \
    ro.vendor.sensors.dev_ori=true \
    ro.vendor.sensors.facing=false \
    ro.vendor.sensors.mot_detect=true \
    ro.vendor.sensors.pmd=true \
    ro.vendor.sensors.sta_detect=true \
# Skip_validate
PRODUCT_PROPERTY_OVERRIDES += \
    sdm.debug.disable_skip_validate=1 \
# Time
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true \
# UBWC
PRODUCT_PROPERTY_OVERRIDES += \
# USB
PRODUCT_PROPERTY_OVERRIDES += \
# WFD
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
# WLAN
PRODUCT_PROPERTY_OVERRIDES += \
# ZRAM
PRODUCT_PROPERTY_OVERRIDES += \
