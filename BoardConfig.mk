#
# Copyright 2016 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

DEVICE_PATH := device/xiaomi/daisy

# Architecture
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8953
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78af000 firmware_class.path=/vendor/firmware_mnt/image androidboot.usbconfigfs=true
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_VERSION := 4.9
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
#TARGET_KERNEL_CLANG_COMPILE := true

ifeq ($(FOX_BUILD_FULL_KERNEL_SOURCES),1)
  TARGET_KERNEL_SOURCE := kernel/xiaomi/daisy
  BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
  TARGET_KERNEL_CONFIG := daisy_defconfig
else
  TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel
endif

# Crypto
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true

# Encryption
PLATFORM_VERSION := 16.1.0
PLATFORM_SECURITY_PATCH := 2099-12-31
TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_FBE := true
#TARGET_LEGACY_HW_DISK_ENCRYPTION := true
#TARGET_HW_KEYMASTER_V03 := true
#TARGET_KEYMASTER_WAIT_FOR_QSEE := true

#ifeq ($(RECOVERY_VARIANT),twrp)
#	TARGET_HW_DISK_ENCRYPTION := false
#	TARGET_SWV8_DISK_ENCRYPTION := false
#else
#	TARGET_HW_DISK_ENCRYPTION := true
#	TARGET_SWV8_DISK_ENCRYPTION := true
#endif

# Platform
TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_PLATFORM_GPU := qcom-adreno506

# GPT Utils
BOARD_PROVIDES_GPTUTILS := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_FLASH_BLOCK_SIZE := 262144
AB_OTA_UPDATER := true

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# System As Root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# TWRP Configuration
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TWRP_INCLUDE_LOGCAT := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_DEFAULT_LANGUAGE := en
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_HAS_EDL_MODE := true

# PROP
#TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

#TW_NO_EXFAT_FUSE := true

# exFAT FS Support
TW_INCLUDE_FUSE_EXFAT := true

# NTFS Support
TW_INCLUDE_FUSE_NTFS := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# For building
ALLOW_MISSING_DEPENDENCIES := true

# Recovery Installer
USE_RECOVERY_INSTALLER := true
RECOVERY_INSTALLER_PATH := $(LOCAL_PATH)/installer

# Sepolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private
SELINUX_IGNORE_NEVERALLOWS := true

# Use device bootctrl module
#USE_COMMON_BOOTCTRL := false

# BUILD FOX
FOX_USE_BASH_SHELL := 1
FOX_ASH_IS_BASH := 1
FOX_USE_NANO_EDITOR := 1
OF_AB_DEVICE := 1
OF_DISABLE_MIUI_SPECIFIC_FEATURES := 1
LC_ALL := 1
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := 1
OF_USE_MAGISKBOOT_FOR_ALL_PATCHES= := 1
OF_USE_MAGISKBOOT=:= 1
ALLOW_MISSING_DEPENDENCIES := true
FOX_USE_TAR_BINARY := 1
FOX_USE_ZIP_BINARY := 1
FOX_REPLACE_BUSYBOX_PS := 1
#OF_DISABLE_DM_VERITY_FORCED_ENCRYPTION := "1"; # disabling dm-verity causes stability issues with some kernel 4.9 ROMs; but is needed for MIUI
#OF_DISABLE_FORCED_ENCRYPTION := 1
#FOX_RECOVERY_INSTALL_PARTITION := /dev/block/platform/msm_sdcc.1/by-name/recovery
#OF_VANILLA_BUILD := 1
#OF_SKIP_ORANGEFOX_PROCESS := 1
#OF_DONT_PATCH_ON_FRESH_INSTALLATION := 1
#OF_FORCE_MAGISKBOOT_BOOT_PATCH_MIUI := "1"
#OF_NO_MIUI_OTA_VENDOR_BACKUP := "1"
#OF_NO_TREBLE_COMPATIBILITY_CHECK := "1"
#OF_FBE_METADATA_MOUNT_IGNORE := 1
#FOX_BUILD_FULL_KERNEL_SOURCES := 1
#FOX_USE_LZMA_COMPRESSION := 1
   	
# MAINTAINER
FOX_BUILD_TYPE := Stable
OF_MAINTAINER := TogoFire
#FOX_VERSION := R11

# OTA for custom ROMs
OF_SUPPORT_ALL_BLOCK_OTA_UPDATES := 1
OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR := 1

# use system (ROM) fingerprint where available
#OF_USE_SYSTEM_FINGERPRINT := 1

# -- add settings for R11 --
FOX_R11 := 1
FOX_ADVANCED_SECURITY := 1
OF_USE_TWRP_SAR_DETECT := 1
#OF_DISABLE_MIUI_OTA_BY_DEFAULT := 1
#exporOF_QUICK_BACKUP_LIST="/boot;/data;/system_image;/vendor_image;"
# -- end R11 settings --

#Rounded corners
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48

#Screen
OF_SCREEN_H := 2280
