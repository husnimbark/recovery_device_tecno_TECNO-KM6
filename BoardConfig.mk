#
# Copyright (C) 2024 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/tecno/TECNO-KM6

# ─────────────────────────────────────────
# Architecture
# ─────────────────────────────────────────
TARGET_ARCH         := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI      := arm64-v8a
TARGET_CPU_ABI2     :=
TARGET_CPU_VARIANT  := generic

# ─────────────────────────────────────────
# Bootloader
# ─────────────────────────────────────────
TARGET_BOOTLOADER_BOARD_NAME := TECNO-KM6
TARGET_NO_BOOTLOADER         := true

# ─────────────────────────────────────────
# Platform
# ─────────────────────────────────────────
TARGET_BOARD_PLATFORM := mt6789

# ─────────────────────────────────────────
# Kernel
# ─────────────────────────────────────────
TARGET_NO_KERNEL           := true
BOARD_RAMDISK_USE_LZ4      := true
TARGET_PREBUILT_DTB        := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_KERNEL_SEPARATED_DTBO := true

BOARD_BOOT_HEADER_VERSION  := 4
BOARD_KERNEL_BASE          := 0x3fff8000
BOARD_KERNEL_OFFSET        := 0x00008000
BOARD_KERNEL_TAGS_OFFSET   := 0x07c88000
BOARD_PAGE_SIZE            := 4096
BOARD_TAGS_OFFSET          := 0x07c88000
BOARD_RAMDISK_OFFSET       := 0x26f08000
BOARD_DTB_SIZE             := 203367
BOARD_DTB_OFFSET           := 0x07c88000
BOARD_VENDOR_BASE          := 0x3fff8000
BOARD_VENDOR_CMDLINE       := bootopt=64S3,32N2,64N2

BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# ─────────────────────────────────────────
# Partitions
# ─────────────────────────────────────────
BOARD_FLASH_BLOCK_SIZE              := 262144 # (BOARD_PAGE_SIZE * 64)
BOARD_SUPER_PARTITION_SIZE          := 12884901888 # 12 GiB
BOARD_MAIN_SIZE                     := $(shell echo $$(($(BOARD_SUPER_PARTITION_SIZE) - 4194304)))
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864

BOARD_USES_METADATA_PARTITION       := true
BOARD_SUPER_PARTITION_GROUPS        := main
BOARD_MAIN_PARTITION_LIST           += \
    odm_dlkm \
    product \
    system \
    system_ext \
    vendor \
    vendor_dlkm

# Filesystem types
# NOTE: odm_dlkm confirmed ext4 from partition log; others confirmed erofs from recovery log
BOARD_ODM_DLKMIMAGE_FILE_SYSTEM_TYPE    := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE     := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE      := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE  := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE    := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE      := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs

TARGET_COPY_OUT_ODM_DLKM  := odm_dlkm
TARGET_COPY_OUT_PRODUCT    := product
TARGET_COPY_OUT_SYSTEM     := system
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR     := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# ─────────────────────────────────────────
# Recovery
# ─────────────────────────────────────────
BOARD_HAS_LARGE_FILESYSTEM              := true
BOARD_USES_GENERIC_KERNEL_IMAGE         := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT  := true
TARGET_NO_RECOVERY                      := true
TARGET_RECOVERY_FSTAB                   := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT            := RGBX_8888
TARGET_USERIMAGES_USE_EXT4              := true
TARGET_USERIMAGES_USE_F2FS              := true
TARGET_USES_MKE2FS                      := true

# ─────────────────────────────────────────
# Virtual A/B
# ─────────────────────────────────────────
BOARD_USES_RECOVERY_AS_BOOT := false
AB_OTA_UPDATER              := true
TW_INCLUDE_LIBRESETPROP     := true

# ─────────────────────────────────────────
# AVB (Android Verified Boot)
# ─────────────────────────────────────────
BOARD_AVB_ENABLE := true

# ─────────────────────────────────────────
# Crypto
# ─────────────────────────────────────────
TW_INCLUDE_CRYPTO           := true
TW_INCLUDE_CRYPTO_FBE       := true
TW_USE_FSCRYPT_POLICY       := 2
TW_FORCE_KEYMASTER_VER        := true
OF_DEFAULT_KEYMASTER_VERSION  := 4
TW_INCLUDE_ADDITIONAL_FSTAB := true
TW_PREPARE_DATA_MEDIA_EARLY := true

# ─────────────────────────────────────────
# Security Patch Hack
# ─────────────────────────────────────────
PLATFORM_SECURITY_PATCH      := 2099-12-31
PLATFORM_VERSION             := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
VENDOR_SECURITY_PATCH        := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH          := $(PLATFORM_SECURITY_PATCH)

# ─────────────────────────────────────────
# Display & UI
# ─────────────────────────────────────────
TW_THEME    := portrait_hdpi
TW_FRAMERATE := 120
# TARGET_SCREEN_DENSITY := 440

# Brightness
# NOTE: override used due to MTK-specific range (0–5119)
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 1200
TW_MAX_BRIGHTNESS     := 5119

# Status bar icon positions
# TW_STATUS_ICONS_ALIGN  := center
# TW_CUSTOM_CPU_POS      := 300
# TW_CUSTOM_CLOCK_POS    := 70
# TW_CUSTOM_BATTERY_POS  := 790


# ─────────────────────────────────────────
# CPU Temperature
# ─────────────────────────────────────────
# zone0 is available from early boot; zone19 requires MTK thermal modules (load late)
TW_CUSTOM_CPU_TEMP_PATH    := /sys/devices/virtual/thermal/thermal_zone0/temp
TW_NO_CPU_TEMP := true

# ─────────────────────────────────────────
# Power
# ─────────────────────────────────────────
ENABLE_CPUSETS    := true
ENABLE_SCHEDBOOST := true

# ─────────────────────────────────────────
# USB
# ─────────────────────────────────────────
# KM6 uses ConfigFS; legacy android_usb node not present
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USB_STORAGE              := true

# ─────────────────────────────────────────
# Vibrator
# ─────────────────────────────────────────
# No timed_output on KM6; regulator-vibrator via LED unsupported
TW_NO_HAPTICS := true

# ─────────────────────────────────────────
# Tools & Features
# ─────────────────────────────────────────
TW_INCLUDE_FB2PNG      := true
TW_INCLUDE_NTFS_3G     := true
TW_INCLUDE_REPACKTOOLS  := true
TW_INCLUDE_RESETPROP   := true
TW_INCLUDE_LPTOOLS     := true
TW_INCLUDE_FASTBOOTD   := true
TW_EXTRA_LANGUAGES     := true
TW_LOAD_VENDOR_BOOT_MODULES := true
TW_EXCLUDE_APEX        := true
TW_ENABLE_FS_COMPRESSION := false

# ─────────────────────────────────────────
# Debug
# ─────────────────────────────────────────
TARGET_USES_LOGD    := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES      += debuggerd strace
RECOVERY_BINARY_SOURCE_FILES        += $(TARGET_OUT_EXECUTABLES)/debuggerd
RECOVERY_BINARY_SOURCE_FILES        += $(TARGET_OUT_EXECUTABLES)/strace

# ─────────────────────────────────────────
# Properties
# ─────────────────────────────────────────
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# ─────────────────────────────────────────
# Init
# ─────────────────────────────────────────
TARGET_INIT_VENDOR_LIB         := libinit_TECNO-KM6
TARGET_RECOVERY_DEVICE_MODULES += libinit_TECNO-KM6

# ─────────────────────────────────────────
# Build Hacks
# ─────────────────────────────────────────
BUILD_BROKEN_DUP_RULES                    := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
ALLOW_MISSING_DEPENDENCIES                := true

# ─────────────────────────────────────────
# Assert
# ─────────────────────────────────────────
TARGET_OTA_ASSERT_DEVICE := TECNO-KM6

# ─────────────────────────────────────────
# Device Version
# ─────────────────────────────────────────
TW_DEVICE_VERSION := TECNO-KM6

# ─────────────────────────────────────────
# OFOX UI
# ─────────────────────────────────────────
# OF_SCREEN_H := 2400
OF_STATUS_H := 138
OF_STATUS_INDENT_LEFT := 66
OF_STATUS_INDENT_RIGHT := 60
# OF_FL_PATH1 := /sys/class/torch/torch/torch_level
TW_NO_FLASHLIGHT := true
