#!/bin/bash 
CACHEPATH=cache
curl -o "${CACHEPATH}/alpine-rootfs.tar.gz" "https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/x86_64/alpine-minirootfs-3.20.3-x86_64.tar.gz"
cd "${CACHEPATH}"
mkdir -p rootfs
cd rootfs
tar xvf ../alpine-rootfs.tar.gz
cp ../../src/dumb-init/dumb-init ../../src/overlay
cp ../../src/carl-exit/carl-exit ../../src/overlay
cp -r ../../src/overlay/* .
chmod +x dumb-init
chmod +x carl-exit
find . | cpio -o -H newc > ../../rootfs.cpio

