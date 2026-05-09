#
# Copyright (C) 2024 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from TECNO-KM6 device
$(call inherit-product, device/tecno/TECNO-KM6/device.mk)

# Inherit common OrangeFox stuff
$(call inherit-product, vendor/twrp/config/common.mk)

# Product Specifics
PRODUCT_NAME     := ofox_KM6
PRODUCT_DEVICE   := TECNO-KM6
PRODUCT_BRAND    := TECNO
PRODUCT_MODEL    := TECNO Spark 40 Pro
PRODUCT_MANUFACTURER := TECNO
