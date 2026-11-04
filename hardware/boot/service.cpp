/*
 * Copyright (C) 2026 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "bootctl-z01kd"

#include <android/hardware/boot/1.0/IBootControl.h>
#include <cutils/log.h>
#include <hidl/HidlTransportSupport.h>

using android::OK;
using android::sp;
using android::status_t;
using android::hardware::configureRpcThreadpool;
using android::hardware::hidl_string;
using android::hardware::joinRpcThreadpool;
using android::hardware::Return;
using android::hardware::Void;

using android::hardware::boot::V1_0::BoolResult;
using android::hardware::boot::V1_0::CommandResult;
using android::hardware::boot::V1_0::IBootControl;

// This device is single-slot: the bootloader has no A/B metadata, so the
// answers below are constants rather than reads of the misc partition.
class Z01KDBootControl : public IBootControl {
  public:
    Return<uint32_t> getNumberSlots() override { return 1; }

    Return<uint32_t> getCurrentSlot() override { return 0; }

    Return<void> markBootSuccessful(markBootSuccessful_cb cb) override {
        cb(CommandResult{true, ""});
        return Void();
    }

    Return<void> setActiveBootSlot(uint32_t slot, setActiveBootSlot_cb cb) override {
        bool valid = slot == 0;
        cb(CommandResult{valid, valid ? "" : "single-slot device"});
        return Void();
    }

    Return<void> setSlotAsUnbootable(uint32_t slot, setSlotAsUnbootable_cb cb) override {
        bool valid = slot == 0;
        cb(CommandResult{valid, valid ? "" : "single-slot device"});
        return Void();
    }

    Return<BoolResult> isSlotBootable(uint32_t slot) override {
        return slot == 0 ? BoolResult::TRUE : BoolResult::INVALID_SLOT;
    }

    Return<BoolResult> isSlotMarkedSuccessful(uint32_t slot) override {
        return slot == 0 ? BoolResult::TRUE : BoolResult::INVALID_SLOT;
    }

    // A single-slot boot image carries no slot suffix, and callers such as
    // vold's rollback check only compare it against a stored suffix.
    Return<void> getSuffix(uint32_t slot, getSuffix_cb cb) override {
        cb("");
        return Void();
    }
};

int main() {
    sp<IBootControl> service = new Z01KDBootControl();

    configureRpcThreadpool(1, true /* callerWillJoin */);

    status_t status = service->registerAsService();
    if (status != OK) {
        ALOGE("Could not register android.hardware.boot@1.0::IBootControl (%d)", status);
        return 1;
    }

    ALOGI("android.hardware.boot@1.0::IBootControl/default registered");
    joinRpcThreadpool();
    return 1;
}
