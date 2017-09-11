
export FOLDER_NAME="ota_package_nelson"
export OTA_TOOL="./build/tools/releasetools/ota_from_target_files"

#export NOW_TIME=`date +"%Y%m%d%H%M"`
#export NOW_TIME="201708071330"
#export NOW_TIME="201708071610"
#export NOW_TIME="201708081633"
#export NOW_TIME="201708091152"
export NOW_TIME="201708101459"
export OTA_TARGET_FILE="$FOLDER_NAME/msm8953_64-target_files-eng.nelson_chung-$NOW_TIME.zip"
export OPTION_KEY_WORD=""
export OTA_FULL_OTA_PACKAGE="$FOLDER_NAME/msm8953_64-ota-eng.nelson_chung$OPTION_KEY_WORD-$NOW_TIME.zip"


echo "1.    Generate full package: "
echo "2.    Generate full package without timestamp check (option -n): "
echo "3.    Generate full package (option --downgrade): "
read option

case "$option" in
    //"")
    //;;
    "1")
        target_option="--block -v"
        $OTA_TOOL $target_option $OTA_TARGET_FILE $OTA_FULL_OTA_PACKAGE
    ;;
    "2")
        target_option="--block -n -v"
        OPTION_KEY_WORD="-notimestampcheck"
        OTA_FULL_OTA_PACKAGE="$FOLDER_NAME/msm8953_64-ota-eng.nelson_chung$OPTION_KEY_WORD-$NOW_TIME.zip"
        $OTA_TOOL $target_option $OTA_TARGET_FILE $OTA_FULL_OTA_PACKAGE
    ;;
    "3")
        #target_option="--block --downgrade -v"
        target_option="--downgrade -v -i"
        OPTION_KEY_WORD="-downgrade"

export OTA_TARGET_V1="$FOLDER_NAME/msm8953_64-target_files-eng.nelson_chung-201708111203.zip"
export OTA_TARGET_V2="$FOLDER_NAME/msm8953_64-target_files-eng.nelson_chung-201708101459.zip"

        OTA_FULL_OTA_PACKAGE="$FOLDER_NAME/msm8953_64-ota-eng.nelson_chung$OPTION_KEY_WORD-$NOW_TIME.zip"
        $OTA_TOOL $target_option $OTA_TARGET_V1 $OTA_TARGET_V2 $OTA_FULL_OTA_PACKAGE
    ;;
     *)
    echo "Not support"
    exit 1
    ;;
esac

#./build/tools/releasetools/ota_from_target_files -n -v $OTA_FULL_UPDATE_FILE
#./build/tools/releasetools/ota_from_target_files -n $OTA_FULL_UPDATE_FILE
#./build/tools/releasetools/ota_from_target_files -n -v $OTA_TARGET_FILE $OTA_FULL_OTA_PACKAGE_IGNORE_TIMESTAMP
#./build/tools/releasetools/ota_from_target_files -n -v -k build/target/product/security/verity_key $OTA_TARGET_FILE $OTA_FULL_OTA_PACKAGE_IGNORE_TIMESTAMP
#./build/tools/releasetools/ota_from_target_files -n -v -k build/target/product/security/verity $OTA_TARGET_FILE $OTA_FULL_OTA_PACKAGE_IGNORE_TIMESTAMP
#./build/tools/releasetools/ota_from_target_files --block -n -v $OTA_TARGET_FILE $OTA_FULL_OTA_PACKAGE_IGNORE_TIMESTAMP
