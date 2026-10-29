LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.asus.usb.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.asus.usb.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.qcom.factory.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.qcom.factory.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.qcom.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.qcom.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := ueventd.qcom.rc
LOCAL_MODULE_STEM  := ueventd.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/ueventd.qcom.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.target.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.target.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.qcom
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.qcom
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

# Host-side view of the modem's RFS mounts. tftp_server answers RFS requests
# from /vendor/rfs/<subsys>/<pd>/... and mkdir()s <subsys>/<pd>/readwrite at
# request time; /system is read-only, so the whole tree has to ship in the
# image (stock ASUS layout: readonly/ + hlos/shared/readwrite/ramdumps links).
include $(CLEAR_VARS)
LOCAL_MODULE           := vendor_rfs_tree
LOCAL_MODULE_TAGS      := optional
LOCAL_MODULE_CLASS     := ETC
LOCAL_MODULE_STEM      := .keep
LOCAL_MODULE_PATH      := $(TARGET_OUT_VENDOR)/rfs
LOCAL_SRC_FILES        := etc/rfs.keep
LOCAL_POST_INSTALL_CMD := sh $(LOCAL_PATH)/etc/mkrfs.sh $(TARGET_OUT_VENDOR)
include $(BUILD_PREBUILT)

# First-stage init (Android 10) has to mount /system from an fstab inside the
# boot ramdisk before it can pivot into system-as-root; without this copy it
# finds an empty fstab and dies at execv("/system/bin/init").
include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.qcom.ramdisk
LOCAL_MODULE_STEM  := fstab.qcom
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.qcom
LOCAL_MODULE_PATH  := $(TARGET_RAMDISK_OUT)
include $(BUILD_PREBUILT)
