#!/bin/sh

if [ $# -ne 1 ]; then
  echo "USAGE: start-vm <vm name | vm uuid>"
  exit 1
fi

vm=$1
cmd="VBoxManage controlvm $vm poweroff"
status=$?

if [ $status -eq 0 ]; then
  echo "$vm was shutdown successfully"
  exit 0
else
  echo "Couldn't shutdown $vm, maybe it wasn't on? Exiting"
  exit 1
fi
