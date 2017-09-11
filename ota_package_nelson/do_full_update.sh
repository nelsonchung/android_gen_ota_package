adb root
sleep 3 
#export SDCARD_NAME="614A-7B40"
export SDCARD_NAME="7D96-1DB5"

echo "1.    Copy msm8953_64-ota-eng.nelson_chung-201708111203.zip to sd card: "
echo "2.    Copy msm8953_64-ota-eng.nelson_chung-notimestampcheck-201708101459.zip to sd card: "
echo "3.    Switch to recovery mode and start do upgrade mechanism: "
read option

case "$option" in
    "1")
        file_name="msm8953_64-ota-eng.nelson_chung-201708111203.zip"
    ;;
    "2")
        file_name="msm8953_64-ota-eng.nelson_chung-notimestampcheck-201708101459.zip"
    ;;
     *)
        adb push -p command /cache/recovery/command
        adb shell sync
        adb reboot recovery
        exit 1
    ;;
esac


adb push -p $file_name /storage/$SDCARD_NAME/update.zip
sleep 3
adb push -p command /cache/recovery/command
adb shell sync
adb reboot recovery
