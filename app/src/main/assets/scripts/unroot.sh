#!/system/bin/sh

if (! is_mounted /system) ; then mount -o rw /system ; fi
if (! is_mounted /system rw) ; then mount -o rw,remount /system ; fi
if (! is_mounted /system rw) ; then mount -t ext4 -o rw $SYSTEM /system ; fi
if (! is_mounted /system rw) ; then mount -t f2fs -o rw $SYSTEM /system ; fi


if [ ! -f /su/bin/su ]; then
mv -f /system/xbin/su /system/xbin/root
rm -rf /system/xbin/su
rm -rf /system/bin/su
rm -rf /system/bin/daemonsu
rm -rf /system/bin/supolicy
rm -rf /system/bin/.app_process
rm -rf /system/bin/.app_process_init
rm -rf /system/bin/.app_process64
rm -rf /system/bin/.app_process64_original
rm -rf /system/bin/.install-recovery.sh
rm -rf /system/etc/.install-recovery.sh			
rm -rf /system/bin/.ext
rm -rf /system/xbin/.tmpsu		
rm -rf /system/xbin/su
rm -rf /system/xbin/daemonsu
rm -rf /system/xbin/supolicy
rm -rf /system/lib64/libsupol.so	
rm -rf /system/etc/install-recovery.sh
cp -p /system/scripts/build.prop /system/build.prop
chmod 0644 /system/build.prop
cp -p /system/scripts/SysScope/SysScope.apk /system/app/SysScope/SysScope.apk
chmod 0644 /system/app/SysScope/SysScope.apk
cp -p /system/scripts/boot.img /dev/block/sda17
setprop sys.powerctl reboot
sleep 3
reboot 

elif [ -f /su/bin/su ]; then
	mount -o rw,remount rootfs /
am start -n eu.chainfire.flash/.ui.activity.MainActivity
fi


