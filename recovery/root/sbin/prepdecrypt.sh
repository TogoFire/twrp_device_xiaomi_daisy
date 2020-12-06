#!/sbin/sh

tmp="/dev/tmp/decryption"
tool="magiskboot"
suffix=$(getprop ro.boot.slot_suffix)
bootpath="/dev/block/bootdevice/by-name/boot$suffix"
is_fastboot_twrp=$(getprop ro.boot.fastboot)

if [ "$is_fastboot_twrp" != "1" ]; then
	mkdir -p "$tmp"
	cd "$tmp"
	cp -f "/sbin/magiskboot" "$tmp"
	chmod 755 "$tool"
	$tool unpack -h "$bootpath"
	osver=$(grep -i 'os_version=' "$tmp/header"  | cut -f2 -d'=' -s)
	patchlvl=$(grep -i 'os_patch_level=' "$tmp/header"  | cut -f2 -d'=' -s)
	resetprop "ro.build.version.release" "$osver"
	resetprop "ro.build.version.security_patch" "$patchlvl-01"
	$tool cleanup
	cd /
	rm -rf "$tmp"
fi

setprop crypto.ready 1
exit 0
