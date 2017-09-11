adb root
sleep 3
export SDCARD_NAME="7D96-1DB5"

echo "1.    Copy update_incremental_from_201708101459_to_201708111203.zip to sd card:"
echo "2.    Copy update_incremental_from_201708111203_to_201708101459-notimestampcheck.zip to sd card:"
echo "3.    Copy update_incremental_from_201708101459_to_201708111203.zip to cache:"
echo "4.    Copy update_incremental_from_201708111203_to_201708101459-notimestampcheck.zip to cache:"
echo "5.    Switch to recovery mode and start do upgrade mechanism: "
read option

case "$option" in
    "1")
        file_name="update_incremental_from_201708101459_to_201708111203.zip"
        command_file_name="command-incremental"
        dest="/storage/$SDCARD_NAME/update_incremental.zip"
    ;;
    "2")
        file_name="update_incremental_from_201708111203_to_201708101459-notimestampcheck.zip"
        command_file_name="command-incremental"
        dest="/storage/$SDCARD_NAME/update_incremental.zip"
    ;;
    "3")
        file_name="update_incremental_from_201708101459_to_201708111203.zip"
        command_file_name="command-incremental-cache"
        dest="/cache/update_incremental.zip"
    ;;
    "4")
        file_name="update_incremental_from_201708111203_to_201708101459-notimestampcheck.zip"
        command_file_name="command-incremental-cache"
        dest="/cache/update_incremental.zip"
    ;;
     *)
        adb push -p command-incremental /cache/recovery/command
        adb shell sync
        adb reboot recovery
        exit 1
    ;;
esac



adb push -p $file_name $dest 
sleep 3
adb push -p $command_file_name /cache/recovery/command
adb shell sync
adb reboot recovery
