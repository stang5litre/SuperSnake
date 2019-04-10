#!/system/bin/sh

export PATH=/system/bin:$PATH

mount -o rw,remount /system

cp -p /system/stang/tools/etc/floating_feature/vertical/floating_feature.xml/system/etc/floating_feature.xml