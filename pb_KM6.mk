#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from TECNO-KM6 device
$(call inherit-product, device/tecno/TECNO-KM6/device.mk)

# Inherit some common PBRP stuff.
$(call inherit-product, vendor/pb/config/common.mk)

# Product Specifics
PRODUCT_NAME := pb_KM6
PRODUCT_DEVICE := TECNO-KM6
PRODUCT_BRAND := TECNO
PRODUCT_MODEL := TECNO KM6
PRODUCT_MANUFACTURER := TECNO

PRODUCT_GMS_CLIENTID_BASE := android-tecno
