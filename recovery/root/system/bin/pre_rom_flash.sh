#!/system/bin/sh
echo "I: Running pre-ROM-flash script..." >> /tmp/recovery.log;
echo "I: Arguments received=\"$@\"" >> /tmp/recovery.log;
mkdir -p /data/cache/recovery/;
exit 0;
