#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common mithorium-common
include device/xiaomi/mithorium-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/tissot

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
  boot \
  system

# Bootloader
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# Kernel
BOARD_KERNEL_CMDLINE += veritykeyid=id:
TARGET_PREBUILT_KERNEL := device/xiaomi/kernel-mithorium/tissot/Image.gz-dtb

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_METADATA_PARTITION := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
