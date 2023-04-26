#
# Copyright (C) 2022 Team Win Recovery Project
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2022-2023 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

# enable ext4
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Inherit from common mithorium-common
include device/xiaomi/mithorium-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/daisy

TW_HAS_EDL_MODE := false

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
  boot \
  system \
  vendor

# Bootloader
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# Kernel
BOARD_KERNEL_CMDLINE += veritykeyid=id:
KERNEL_DIR := $(DEVICE_PATH)/prebuilt
TARGET_PREBUILT_KERNEL := $(KERNEL_DIR)/Image.gz-dtb

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_METADATA_PARTITION := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)

# TWRP
TW_INCLUDE_REPACKTOOLS := true

TW_DEFAULT_BRIGHTNESS := 100
TW_MAX_BRIGHTNESS := 255

TW_NO_SCREEN_BLANK := true
TW_SCREEN_BLANK_ON_BOOT := true
#
