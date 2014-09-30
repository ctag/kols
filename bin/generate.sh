#!/bin/sh

#
# generate.sh - kols main script
# This script will create a menu.json file based on available pdf files in /mnt/us/documents
# To be used with koreader on Kindle PaperWhite 2013 (pw2)
# By: Christopher "ctag" Bero <bigbero@gmail.com>
#
# This is my first 'external' script which I intend to leave publicly available
# If you wish for adjustments/features/changes please write me, and help me
# to understand something new about shell scripting :)
#
# TODOs are kept in the README.md for now
#

cd /mnt/us/extensions/kols

cp menu.json menu.json.bkup

echo "2" > menuCount.txt

cat prefix.json > menu.json

cd /mnt/us/documents/

find /mnt/us/documents/ -name '*.pdf' -exec /mnt/us/extensions/kols/bin/append.sh "{}" \;

cd /mnt/us/extensions/kols

cat postfix.json >> menu.json

