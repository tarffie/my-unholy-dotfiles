#!/bin/sh
path=$HOME/personal/screenshots/
date="`date "+%Y-%m-%d-%H-%M-%S"`"
screenshot="$path$date-screenshot.png"
/usr/local/bin/import $screenshot
chmod 0600 $screenshot
