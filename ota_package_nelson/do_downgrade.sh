adb root
sleep 5
export SDCARD_NAME="987B-0DB2"
#adb push -p msm8953_64-ota-eng.nelson_chung-201708111203.zip /storage/$SDCARD_NAME/update.zip
adb push -p command /cache/recovery/command
adb shell sync
adb reboot recovery
