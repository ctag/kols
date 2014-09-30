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

cp menu.json menu.json.bkup

#echo "" > menu.json

echo "1" > menuCount.txt

cat prefix.json > menu.json

cd /mnt/us/documents/

find /mnt/us/documents/ -name '*.pdf' -exec /mnt/us/extensions/kols/bin/append.sh "{}" \;

cd /mnt/us/extensions/kols

cat postfix.json >> menu.json

