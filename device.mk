    
# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_output_policy_24bit.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy_24bit.conf \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_extcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_extcodec.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_skush.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_skush.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration_24bit.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_24bit.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/configs/audio/audio_tuning_mixer_tasha.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tasha.txt \
    $(LOCAL_PATH)/configs/audio/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    $(LOCAL_PATH)/configs/audio/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_ZE554KL.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_ZE554KL.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_ZE554KL_24bit.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_ZE554KL_24bit.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_ZE554KL_EU.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_ZE554KL_EU.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_ZE554KL_EU_24bit.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_ZE554KL_EU_24bit.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_i2s.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_skus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_skus.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_skush.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_skush.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_wcd9326.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9326.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9335.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9340.xml \
    $(LOCAL_PATH)/configs/audio/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9330.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9330.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9335.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/surround_sound_rec_5.1.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/surround_sound_rec_5.1.cfg \
    $(LOCAL_PATH)/configs/audio/surround_sound_rec_AZ.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/surround_sound_rec_AZ.cfg \
    $(LOCAL_PATH)/configs/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/configs/gps/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf \
    $(LOCAL_PATH)/configs/msm_irqbalance_sdm630.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance_sdm630.conf \

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config \

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/goodixfp.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodixfp.kl \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/fts_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/fts_ts.kl \
    $(LOCAL_PATH)/prebuilts/init/init.goodix.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.goodix.rc \

# Low power Whitelist
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml \

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.manual_postprocessing.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
    frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.manual_sensor.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_0_3.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \

# App widgets feature: SystemServer only starts AppWidgetService if
# android.software.app_widgets is declared (SystemServer.java:1334), and
# SystemConfig only reads TOP-LEVEL etc/permissions dirs (subdirs are
# skipped as 'non-xml'), so it must go to system/etc/permissions.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \

# QTI
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/privapp-permissions-qti.xml \

# Ramdisk
PRODUCT_PACKAGES += \
    init.asus.usb.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.target.rc \
    fstab.qcom \
    ueventd.qcom.rc \

# Audio: legacy policy manager config + speaker amp/route libs from stock
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    $(LOCAL_PATH)/prebuilts/audio/libaudioroute.so:$(TARGET_COPY_OUT_VENDOR)/lib/libaudioroute.so \
    $(LOCAL_PATH)/prebuilts/audio/libtfa98xx.so:system/lib/libtfa98xx.so \
    $(LOCAL_PATH)/prebuilts/audio/libtfa98xxrcv.so:system/lib/libtfa98xxrcv.so \
    $(LOCAL_PATH)/prebuilts/audio/lib64/libtfa98xx.so:system/lib64/libtfa98xx.so \
    $(LOCAL_PATH)/prebuilts/audio/lib64/libtfa98xxrcv.so:system/lib64/libtfa98xxrcv.so \
    $(LOCAL_PATH)/prebuilts/audio/android.hardware.wifi.supplicant@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.wifi.supplicant@1.0.so

# Audio: A2DP HAL is only pulled in by treble_common.mk, which this
# non-Treble product never inherits
PRODUCT_PACKAGES += \
    audio.a2dp.default

# RIL: without this rild takes the no-ril path and never registers IRadio
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so

# NFC: NfcNci is never pulled in by the non-Treble product, and the NXP
# module is installed under its instance name while the AOSP impl loads
# the default variant
PRODUCT_PACKAGES += \
    NfcNci

PRODUCT_COPY_FILES += \
    vendor/asus/Z01KD_1/proprietary/vendor/lib64/hw/nfc_nci.nqx.default.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/nfc_nci.default.so

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/configs/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy \

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/fstman.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/fstman.ini \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \

# WiFi: compile HAL + supplicant from source in the tree
# (hardware/qcom/wlan-caf, external/wpa_supplicant_8). The stock 64-bit
# copies of these are absent from the firmware image, and the CAF modules
# are gated on BOARD_WLAN_DEVICE/WPA_SUPPLICANT_VERSION in BoardConfig.mk.
# NOTE: libwcnss_qmi / wcnss_service are intentionally NOT listed - they are
# gated on TARGET_USES_QCOM_WCNSS_QMI + QCPATH, which this device never sets,
# so listing them makes the build abort with a missing-module error.
PRODUCT_PACKAGES += \
    libcld80211 \
    lib_driver_cmd_qcwcn \
    libwifi-hal-qcom \
    libwpa_client \
    wpa_cli \
    wpa_supplicant \


# ---------------------------------------------------------------------------
# Live-system bake (2026-10-24)
#
# Every blob below was pulled off the running device (PBRP backup of the
# 15.1-20261019-UNOFFICIAL-Z01KD_1 userdebug build) and is byte-identical to
# what that build actually runs.  They live in prebuilts/system/<path> and are
# copied to the matching install path so a fresh build reproduces the live
# system without any manual pushing.
# ---------------------------------------------------------------------------

# Hardware feature XMLs: the live system carries these in BOTH
# system/etc/permissions and system/vendor/etc/permissions.  The vendor copy is
# already produced by the rules above; add the system copy here.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.camera.manual_postprocessing.xml:system/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.nfc.hcef.xml:system/etc/permissions/android.hardware.nfc.hcef.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.vulkan.compute-0.xml:system/etc/permissions/android.hardware.vulkan.compute-0.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level-0.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version-1_0_3.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    $(LOCAL_PATH)/prebuilts/system/etc/permissions/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# HIDL base library: the live system has android.hidl.base@1.0.so in the
# plain, vndk and vndk-sp directories of both system/ and vendor/.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/system/lib/vndk-sp/android.hidl.base@1.0.so:system/lib/vndk-sp/android.hidl.base@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/lib/vndk/android.hidl.base@1.0.so:system/lib/vndk/android.hidl.base@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/lib64/vndk-sp/android.hidl.base@1.0.so:system/lib64/vndk-sp/android.hidl.base@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/lib64/vndk/android.hidl.base@1.0.so:system/lib64/vndk/android.hidl.base@1.0.so

# HIDL client libraries.  On the running device system/lib{,64}/ holds the
# *vndk* variant of these (the direct variant is replaced) and a second
# copy of it lives in system/vendor/lib{,64}/.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/system/lib/android.hardware.nfc@1.0.so:system/lib/android.hardware.nfc@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/lib/android.hardware.radio.deprecated@1.0.so:system/lib/android.hardware.radio.deprecated@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/lib/android.hardware.radio@1.0.so:system/lib/android.hardware.radio@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/lib/android.hidl.base@1.0.so:system/lib/android.hidl.base@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/lib/hw/audio.a2dp.default.so:system/lib/hw/audio.a2dp.default.so \
    $(LOCAL_PATH)/prebuilts/system/lib/libcap.so:system/lib/libcap.so \
    $(LOCAL_PATH)/prebuilts/system/lib/libqservice.so:system/lib/libqservice.so \
    $(LOCAL_PATH)/prebuilts/system/lib/modules/qca_cld3/qca_cld3_wlan.ko:system/lib/modules/qca_cld3/qca_cld3_wlan.ko \
    $(LOCAL_PATH)/prebuilts/system/lib64/android.hardware.biometrics.fingerprint@2.1.so:system/lib64/android.hardware.biometrics.fingerprint@2.1.so \
    $(LOCAL_PATH)/prebuilts/system/lib64/android.hardware.radio.deprecated@1.0.so:system/lib64/android.hardware.radio.deprecated@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/lib64/android.hardware.radio@1.0.so:system/lib64/android.hardware.radio@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/lib64/android.hardware.radio@1.1.so:system/lib64/android.hardware.radio@1.1.so \
    $(LOCAL_PATH)/prebuilts/system/lib64/android.hardware.wifi@1.0.so:system/lib64/android.hardware.wifi@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/lib64/android.hardware.wifi@1.1.so:system/lib64/android.hardware.wifi@1.1.so \
    $(LOCAL_PATH)/prebuilts/system/lib64/android.hidl.base@1.0.so:system/lib64/android.hidl.base@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/lib64/libqdutils.so:system/lib64/libqdutils.so

# Vendor copies of the vndk / keymaster libraries.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/android.hardware.configstore-utils.so:system/vendor/lib/android.hardware.configstore-utils.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/android.hardware.configstore@1.0.so:system/vendor/lib/android.hardware.configstore@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/android.hardware.keymaster@3.0.so:system/vendor/lib/android.hardware.keymaster@3.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/android.hardware.nfc@1.0.so:system/vendor/lib/android.hardware.nfc@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/android.hardware.radio.deprecated@1.0.so:system/vendor/lib/android.hardware.radio.deprecated@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/android.hardware.radio@1.0.so:system/vendor/lib/android.hardware.radio@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/android.hidl.base@1.0.so:system/vendor/lib/android.hidl.base@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libAsusRGBSensorHAL.so:system/vendor/lib/libAsusRGBSensorHAL.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libbinder.so:system/vendor/lib/libbinder.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libcap.so:system/vendor/lib/libcap.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libhardware_legacy.so:system/vendor/lib/libhardware_legacy.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libkeymaster1.so:system/vendor/lib/libkeymaster1.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libkeymaster_messages.so:system/vendor/lib/libkeymaster_messages.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libkeymaster_portable.so:system/vendor/lib/libkeymaster_portable.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libkeymaster_staging.so:system/vendor/lib/libkeymaster_staging.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libsoftkeymaster.so:system/vendor/lib/libsoftkeymaster.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libsoftkeymasterdevice.so:system/vendor/lib/libsoftkeymasterdevice.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libtinyalsa.so:system/vendor/lib/libtinyalsa.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libui.so:system/vendor/lib/libui.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/libxml2.so:system/vendor/lib/libxml2.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/modules/qca_cld3/qca_cld3_wlan.ko:system/vendor/lib/modules/qca_cld3/qca_cld3_wlan.ko \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib/vendor.qti.hardware.factory@1.0.so:system/vendor/lib/vendor.qti.hardware.factory@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/android.hardware.biometrics.fingerprint@2.1.so:system/vendor/lib64/android.hardware.biometrics.fingerprint@2.1.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/android.hardware.configstore-utils.so:system/vendor/lib64/android.hardware.configstore-utils.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/android.hardware.configstore@1.0.so:system/vendor/lib64/android.hardware.configstore@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/android.hardware.keymaster@3.0.so:system/vendor/lib64/android.hardware.keymaster@3.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/android.hardware.nfc@1.0.so:system/vendor/lib64/android.hardware.nfc@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/android.hardware.radio.deprecated@1.0.so:system/vendor/lib64/android.hardware.radio.deprecated@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/android.hardware.radio@1.0.so:system/vendor/lib64/android.hardware.radio@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/android.hardware.radio@1.1.so:system/vendor/lib64/android.hardware.radio@1.1.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/android.hardware.wifi.supplicant@1.0.so:system/vendor/lib64/android.hardware.wifi.supplicant@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/android.hardware.wifi@1.0.so:system/vendor/lib64/android.hardware.wifi@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/android.hidl.base@1.0.so:system/vendor/lib64/android.hidl.base@1.0.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/hw/nfc_nci.default.so:system/vendor/lib64/hw/nfc_nci.default.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libbinder.so:system/vendor/lib64/libbinder.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libcap.so:system/vendor/lib64/libcap.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libhardware_legacy.so:system/vendor/lib64/libhardware_legacy.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libkeymaster1.so:system/vendor/lib64/libkeymaster1.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libkeymaster_messages.so:system/vendor/lib64/libkeymaster_messages.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libkeymaster_portable.so:system/vendor/lib64/libkeymaster_portable.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libkeymaster_staging.so:system/vendor/lib64/libkeymaster_staging.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libsoftkeymaster.so:system/vendor/lib64/libsoftkeymaster.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libsoftkeymasterdevice.so:system/vendor/lib64/libsoftkeymasterdevice.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libtinyalsa.so:system/vendor/lib64/libtinyalsa.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libui.so:system/vendor/lib64/libui.so \
    $(LOCAL_PATH)/prebuilts/system/vendor/lib64/libxml2.so:system/vendor/lib64/libxml2.so

# Vendor helper scripts and binaries that only exist on the live device.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/btwifimac.sh:system/vendor/bin/btwifimac.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/get_emmc_info.sh:system/vendor/bin/get_emmc_info.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.asus.gesture.sh:system/vendor/bin/init.asus.gesture.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.class_main.sh:system/vendor/bin/init.class_main.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.crda.sh:system/vendor/bin/init.crda.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.mdm.sh:system/vendor/bin/init.mdm.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.qcom.class_core.sh:system/vendor/bin/init.qcom.class_core.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.qcom.coex.sh:system/vendor/bin/init.qcom.coex.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.qcom.early_boot.sh:system/vendor/bin/init.qcom.early_boot.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.qcom.post_boot.sh:system/vendor/bin/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.qcom.sdio.sh:system/vendor/bin/init.qcom.sdio.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.qcom.sensors.sh:system/vendor/bin/init.qcom.sensors.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.qcom.sh:system/vendor/bin/init.qcom.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.qcom.usb.sh:system/vendor/bin/init.qcom.usb.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.qcom.wifi.sh:system/vendor/bin/init.qcom.wifi.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/init.qti.qseecomd.sh:system/vendor/bin/init.qti.qseecomd.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/ln_fw.sh:system/vendor/bin/ln_fw.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/qca6234-service.sh:system/vendor/bin/qca6234-service.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/qmi-framework-tests/qmi_test_mt_client_init_instance:system/vendor/bin/qmi-framework-tests/qmi_test_mt_client_init_instance \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/sp:system/vendor/bin/sp \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/umount_apd.sh:system/vendor/bin/umount_apd.sh \
    $(LOCAL_PATH)/prebuilts/system/vendor/bin/widevine.sh:system/vendor/bin/widevine.sh

# Vendor init scripts and firmware manifests that only exist on the live device.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/system/vendor/etc/init/hw/init.asus.rc:system/vendor/etc/init/hw/init.asus.rc \
    $(LOCAL_PATH)/prebuilts/system/vendor/etc/init/hw/init.goodix.rc:system/vendor/etc/init/hw/init.goodix.rc \
    $(LOCAL_PATH)/prebuilts/system/vendor/etc/init/qseecomd.rc:system/vendor/etc/init/qseecomd.rc

# Modem firmware manifests (live device only).
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/system/vendor/firmware/modemr.jsn:system/vendor/firmware/modemr.jsn \
    $(LOCAL_PATH)/prebuilts/system/vendor/firmware/modemuw.jsn:system/vendor/firmware/modemuw.jsn

# Miscellaneous live-only system files.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/system/bin/dts_hpx_service:system/bin/dts_hpx_service \
    $(LOCAL_PATH)/prebuilts/system/etc/sensors_init.sh:system/etc/sensors_init.sh \
    $(LOCAL_PATH)/prebuilts/system/etc/wlfx0recovery-resource0xwlf:system/etc/wlfx0recovery-resource0xwlf

# Other live-only files.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/system/wlfx0recovery-from-bootbak0xwlf:system/wlfx0recovery-from-bootbak0xwlf

# Ramdisk helper scripts (live device: /sbin/diag.sh, /sbin/mntdump.sh)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/sbin/diag.sh:root/sbin/diag.sh \
    $(LOCAL_PATH)/rootdir/sbin/mntdump.sh:root/sbin/mntdump.sh \

# The stock init.qcom.rc lives in the ramdisk; the vendor copy carries the
# Lineage additions (qca_cld3 WLAN insmod, per_mgr/per_proxy, thermal-engine,
# adsprpcd, pd_mapper, hvdcp_opti, energy-awareness) and imports init.asus.rc.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.hw.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.rc \

# Live-only system properties (dalvik heap sizing + Qualcomm BT SoC name)
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.5 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m \
    qcom.bluetooth.soc=cherokee \

# Inherit vendor
$(call inherit-product, vendor/asus/Z01KD_1/Z01KD_1-vendor.mk)
