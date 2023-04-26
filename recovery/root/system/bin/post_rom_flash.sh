#!/system/bin/sh
echo "I: Running post-ROM-flash script..." >> /tmp/recovery.log;
echo "I: Arguments received=\"$@\"" >> /tmp/recovery.log;
D=/data/system/package_cache;
if [ -d $D ]; then 
	echo "I: Removing dangling cache files (\"$D\") left behind by the installer..." >> /tmp/recovery.log;
	rm -rf $D/*;
fi
exit 0;
