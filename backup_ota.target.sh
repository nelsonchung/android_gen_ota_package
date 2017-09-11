
export NOW_TIME=`date +"%Y%m%d%H%M"`
export DEST="ota_package_nelson"
mkdir -p $DEST
export OTA_TARGET_V2="$DEST/msm8953_64-target_files-eng.nelson_chung-$NOW_TIME.zip"
export OTA_FULL_PACKAGE="$DEST/msm8953_64-ota-eng.nelson_chung-$NOW_TIME.zip"

cp out/target/product/msm8953_64/msm8953_64-ota-eng.nelson_chung.zip $OTA_FULL_PACKAGE
cp out/target/product/msm8953_64/obj/PACKAGING/target_files_intermediates/msm8953_64-target_files-eng.nelson_chung.zip $OTA_TARGET_V2

# backup image
#mkdir -p $DEST/$NOW_TIME
#cp out/target/product/msm8953_64/*.img $DEST/$NOW_TIME 
#cp out/target/product/msm8953_64/emmc_appsboot.mbn $DEST/$NOW_TIME

