#!/system/bin/sh

if [ -f /system/csc/others.xml ] ; then
   sed -i 's/<CscFeature_SystemUI_ConfigOpBrandingForIndicatorIcon>LTE/<CscFeature_SystemUI_ConfigOpBrandingForIndicatorIcon>TMB/g' /system/csc/others.xml
    chown 0:0 /system/csc/others.xml
    chmod 644 /system/csc/others.xml
    chcon u:object_r:system_file:s0 /system/csc/others.xml
fi