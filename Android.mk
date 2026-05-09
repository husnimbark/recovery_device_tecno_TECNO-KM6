#
# Copyright (C) 2024 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), TECNO-KM6)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

endif
