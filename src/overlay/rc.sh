#!/bin/sh
export HOME=/root
mount -t devtmpfs devtmpfs /dev
mount -t proc none /proc
mount -t sysfs none /sys
echo $(uname -a)
ifconfig eth0 up
sdhcp
cd
/usr/bin/oksh
/carl-exit