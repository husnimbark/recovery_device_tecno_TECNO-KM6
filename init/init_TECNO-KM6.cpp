/*
 * Copyright (C) 2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <android-base/logging.h>
#include <android-base/properties.h>
#include <fstream>
#include <string>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

using android::base::GetProperty;

// FIX: Create /tmp/prop.info so PBRP's mv command does not throw
// "bad '/tmp/prop.info': No such file or directory"
static void create_prop_info() {
    std::ofstream prop_info("/tmp/prop.info");
    if (prop_info.is_open()) {
        prop_info << GetProperty("ro.product.model", "TECNO KM6") << "\n";
        prop_info << GetProperty("ro.product.device", "TECNO-KM6") << "\n";
        prop_info << GetProperty("ro.build.version.release", "") << "\n";
        prop_info.close();
    } else {
        LOG(WARNING) << "init_TECNO-KM6: could not create /tmp/prop.info";
    }
}

void vendor_load_properties() {
    // Create prop.info for PBRP compatibility
    create_prop_info();

    // KM6 is a single-SKU device; no variant detection needed.
    // All props are set via system.prop / BoardConfig.
    LOG(INFO) << "init_TECNO-KM6: vendor_load_properties() done";
}