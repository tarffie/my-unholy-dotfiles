#!/bin/sh

if [ $# -ne 2 ]; then
  echo "Usage: sync_vm <target_directory> <ip_address>"
  exit 1 
fi

TARGET_DIR="$1"
IP_ADDR="$2"

rsync -avz --delete "$TARGET_DIR" "developer@$IP_ADDR:/home/developer/projects"
