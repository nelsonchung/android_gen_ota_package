export FOLDER_NAME="ota_package_nelson"
export OTA_TOOL="./build/tools/releasetools/ota_from_target_files"

export TARGET_V1="201708111203"
export TARGET_V2="201708101459"
export MORE_INFO=""

echo "1.    Generate incremental package: "
echo "2.    Generate incremental package without timestamp check: "
read option

case "$option" in
    //"")
    //;;
    "1")
        target_option="--block -v -i"
        #TARGET_V1="201708101459"
        TARGET_V1="201708111203"
        TARGET_V2="201709071450"
    ;;
    "2")
        target_option="--block -n -v -i"
        #TARGET_V1="201708111203"
        TARGET_V1="201709071450"
        TARGET_V2="201708111203"
        MORE_INFO="-notimestampcheck"
    ;;
     *)
    echo "Not support"
    exit 1
    ;;
esac

export OTA_TARGET_V1="$FOLDER_NAME/msm8953_64-target_files-eng.nelson_chung-$TARGET_V1.zip"
export OTA_TARGET_V2="$FOLDER_NAME/msm8953_64-target_files-eng.nelson_chung-$TARGET_V2.zip"
export OTA_UPDATE_FILE="$FOLDER_NAME/update_incremental_from_"$TARGET_V1"_to_"$TARGET_V2"$MORE_INFO.zip"
$OTA_TOOL $target_option $OTA_TARGET_V1 $OTA_TARGET_V2 $OTA_UPDATE_FILE

#./build/tools/releasetools/ota_from_target_files -i $OTA_TARGET_V1 $OTA_TARGET_V2 $OTA_UPDATE_FILE
#./build/tools/releasetools/ota_from_target_files -v -i $OTA_TARGET_V1 $OTA_TARGET_V2 $OTA_UPDATE_FILE
#./build/tools/releasetools/ota_from_target_files -n -v -i $OTA_TARGET_V1 $OTA_TARGET_V2 $OTA_UPDATE_FILE
#./build/tools/releasetools/ota_from_target_files --block -n -v -i $OTA_TARGET_V1 $OTA_TARGET_V2 $OTA_UPDATE_FILE
#./build/tools/releasetools/ota_from_target_files --block -v -i $OTA_TARGET_V1 $OTA_TARGET_V2 $OTA_UPDATE_FILE
