#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021-2023 The OrangeFox Recovery Project
#	
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
# 	
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="daisy"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep \"$FDEVICE\")
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
   	export TW_DEFAULT_LANGUAGE="en"
   	export OF_DONT_PATCH_ENCRYPTED_DEVICE="1"
   	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
   	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
   	export OF_NO_TREBLE_COMPATIBILITY_CHECK="1"
	export OF_USE_SYSTEM_FINGERPRINT="1"
	export OF_ALLOW_DISABLE_NAVBAR=1
   	export FOX_USE_BASH_SHELL=1
   	export FOX_ASH_IS_BASH=1
   	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
   	export FOX_REPLACE_BUSYBOX_PS=1
	export FOX_ENABLE_APP_MANAGER=1
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1510672800" # Tuesday,   November 14, 2017 15:20:00 GMT
	export OF_QUICK_BACKUP_LIST="/boot;/data;/system_image;/vendor_image;"
	export OF_UNBIND_SDCARD_F2FS=1
	export OF_USE_GREEN_LED=0

	# don't try FBE decryption with A13
	export OF_SKIP_FBE_DECRYPTION_SDKVERSION=33

	# screen
        export OF_SCREEN_H=2280
        export OF_STATUS_H=95
        export OF_STATUS_INDENT_LEFT=50
        export OF_STATUS_INDENT_RIGHT=50

	# vanilla build
	export OF_VANILLA_BUILD=1

	# no additional check for MIUI props
	export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1

	# dispense with the entire OTA menu
	export OF_DISABLE_OTA_MENU=1

	# run a process after formatting data to work-around MTP issues
	export OF_RUN_POST_FORMAT_PROCESS=1

	# A/B
   	export OF_AB_DEVICE=1
   	export TARGET_DEVICE_ALT="daisy_sprout"
	export OF_TARGET_DEVICES="daisy_sprout,daisy"
	export FOX_RESET_SETTINGS="disabled"
fi
#
