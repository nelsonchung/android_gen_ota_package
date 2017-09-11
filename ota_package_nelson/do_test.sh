adb root
sleep 3
export SDCARD_NAME="7D96-1DB5"
adb push -p msm8953_64-ota-eng.nelson_chung-downgrade-201708101459.zip /storage/$SDCARD_NAME/update.zip
adb push -p command /cache/recovery/command
adb shell sync
adb reboot recovery
