#!/bin/sh

#
# generate.sh
# koPDF main script
# This script will create a menu.json file based on available pdf files in /mnt/us/documents
# To be used with koreader on Kindle PaperWhite 2013 (pw2)
# Script author: Christopher "ctag" Bero <bigbero@gmail.com>
#
# This is my first 'external' script which I intend to leave publicly available
# If you wish for adjustments/features/changes please write me, and help me
# to understand something new about shell scripting :)
#

# TODO:
# Chop this script into a standalone which will parse new menu.json files
# 	and a driver
#

cd /mnt/us/extensions/kols

priority=`cat menuCount.txt`

if [ $priority -gt 1 ]
then
	echo "," >> menu.json
fi

title=`echo "$1" | awk -F/ '{ print $NF }'`

echo $title

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

