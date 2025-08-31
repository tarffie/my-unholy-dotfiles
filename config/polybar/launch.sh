#!/bin/sh
#############################
# Launch Script for Polybar #
#############################

DIR="$HOME/.config/polybar"
killall -q polybar
# the line underneath worked before we created launch-wallpaper script, but somehow stopped after??
#while pgrep polybar >/dev/null; do sleep 1; done 
polybar -c "$DIR"/config.ini &

# 
# IPC settings and test
# 
#
ln -sf /tmp/polybar_mqueue.$! /tmp/ipc-main
echo message >/tmp/ipc-main
