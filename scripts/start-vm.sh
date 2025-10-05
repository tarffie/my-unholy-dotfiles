#!/bin/sh

if [ $# -ne 1 ]; then
  echo "USAGE: start-vm <vm name | vm uuid>"
  exit 1
fi

vm=$1
echo "Starting $vm.."
cmd="VBoxManage startvm $vm --type headless"

$cmd
status=$?

if [ $status -eq 0 ]; then
  echo "$vm has started successfully"
  exit 0
else
  echo "Could not start '$vm', exiting"
  exit 1
fi
