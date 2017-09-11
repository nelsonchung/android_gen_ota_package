
HOME_PATH=`pwd`
#DATE_INFO=`date +"%Y-%m-%d"`
DATE_INFO_AFTER="$1"
DATE_INFO_BEFORE="$2"
echo $HOME_PATH
echo $DATE_INFO
find . -type d -name .git | awk -F ".git" '{print $1}' > git_repository

while read line 
do 
#echo "$line"
cd "$line"

#cmd="git log --after=\"$DATE_INFO_AFTER 00:00\" --before=\"$DATE_INFO_BEFORE 23:59\""
#result=`$cmd`
#echo $result
result=`git log --after="$DATE_INFO_AFTER 00:00" --before="$DATE_INFO_BEFORE 23:59"`

if [ "$result" != "" ] ;then
    #echo $result
    echo -e ""
    #echo ""
    echo "=====There are some modification in $line=========="
    git log --after="$DATE_INFO_AFTER 00:00" --before="$DATE_INFO_BEFORE 23:59"
fi
#pwd 
#echo "Change folder to $HOME_PATH"
cd $HOME_PATH
done < git_repository

