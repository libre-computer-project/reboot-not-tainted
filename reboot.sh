#!/bin/bash

cd $(readlink -f $(dirname ${BASH_SOURCE[0]}))

set -ex

tainted=$(cat /proc/sys/kernel/tainted)
if [ $tainted -ne 0 -a $tainted -ne 1024 ]; then
	exit
fi
sleep 25
loggedin=$(who)
if [ ! -z "$loggedin" ]; then
	exit
fi
reboot
