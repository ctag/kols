#!/bin/sh

#
# append.sh
#

cd /mnt/us/extensions/kols

priority=`cat menuCount.txt`

echo "," >> menu.json

title=`echo "$1" | awk -F/ '{ print $NF }'`

#echo $title

echo "{" >> menu.json
echo "\"name\": \"$title\"," >> menu.json
echo "\"priority\": $priority," >> menu.json
echo "\"action\": \"/mnt/us/koreader/koreader.sh\"," >> menu.json
echo "\"params\": \" --asap '$1'\" " >> menu.json
echo "}" >> menu.json

priority=$(( priority +1 ))
echo $priority > menuCount.txt

#menuCount=$(( menuCount + 1 ))
#echo "menu: $menuCount"
#export menuCount

