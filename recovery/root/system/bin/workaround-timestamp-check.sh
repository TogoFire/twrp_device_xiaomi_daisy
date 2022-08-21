#!/system/bin/sh

VAL="0"

resetprop "ro.build.date.utc" $VAL
for i in odm product system system_ext vendor; do
    resetprop "ro.${i}.build.date.utc" $VAL
done