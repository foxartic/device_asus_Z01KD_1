#
# Copyright (C) 2017-2020, 2026 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Arrow stuff
$(call inherit-product, vendor/arrow/config/common.mk)

# Inherit from Z01KD_1 device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := asus
PRODUCT_DEVICE := Z01KD_1
PRODUCT_MANUFACTURER := asus
PRODUCT_NAME := arrow_Z01KD_1
PRODUCT_MODEL := ASUS_Z01KD

PRODUCT_RELEASE_NAME := Z01KD_1
PRODUCT_SHIPPING_API_LEVEL := 26
PRODUCT_GMS_CLIENTID_BASE := android-asus
TARGET_VENDOR := asus
TARGET_VENDOR_PRODUCT_NAME := Z01KD_1
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="WW_Phone-user 8.0.0 OPR1.170623.032 15.0610.1909.39-0 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := asus/WW_Phone/ASUS_Z01KD_1:8.0.0/OPR1.170623.032/15.0610.1909.39-0:user/release-keys

# ArrowOS: no vendor/lineage in this tree
TARGET_SUPPORTS_QUICK_TAP := false