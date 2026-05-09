#
# Copyright (C) 2024 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# ─────────────────────────────────────────
# Base
# ─────────────────────────────────────────
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# GSI keys — allows booting developer GSI with verified boot
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Emulated storage without sdcardfs (project quotas + casefolding)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# ─────────────────────────────────────────
# Virtual A/B OTA
# ─────────────────────────────────────────
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER    := true

AB_OTA_PARTITIONS += \
    boot          \
    dtbo          \
    lk            \
    odm           \
    odm_dlkm      \
    product       \
    system        \
    system_ext    \
    vbmeta        \
    vbmeta_system \
    vbmeta_vendor \
    vendor        \
    vendor_boot   \
    vendor_dlkm

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

# ─────────────────────────────────────────
# Dynamic Partitions
# ─────────────────────────────────────────
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# ─────────────────────────────────────────
# API Level
# ─────────────────────────────────────────
# KM6 ships with Android 15; first_api_level = 31
PRODUCT_SHIPPING_API_LEVEL  := 31
PRODUCT_TARGET_VNDK_VERSION := 31

# ─────────────────────────────────────────
# OTA Scripts
# ─────────────────────────────────────────
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh

PRODUCT_PROPERTY_OVERRIDES += ro.twrp.vendor_boot=true

# ─────────────────────────────────────────
# Boot Control HAL
# ─────────────────────────────────────────
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# ─────────────────────────────────────────
# Fastbootd
# ─────────────────────────────────────────
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# ─────────────────────────────────────────
# Health HAL
# ─────────────────────────────────────────
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# ─────────────────────────────────────────
# Keymaster
# ─────────────────────────────────────────
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1

PRODUCT_PACKAGES += \
    android.system.keystore2

# ─────────────────────────────────────────
# Security HALs
# ─────────────────────────────────────────
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret

# ─────────────────────────────────────────
# MTK Path Utils
# ─────────────────────────────────────────
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# ─────────────────────────────────────────
# Update Engine
# ─────────────────────────────────────────
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# ─────────────────────────────────────────
# Additional Recovery Links
# ─────────────────────────────────────────
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1

TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.1
