#!/bin/bash

cd $(readlink -f $(dirname ${BASH_SOURCE[0]}))

set -ex

tainted=$(cat /proc/sys/kernel/tainted)
if [ $tainted -eq 0 -o $tainted -eq 1024 ]; then
	:
else
	exit
fi
sleep 30
reboot
