#!/bin/bash 
CACHEDIR=cache
cd "${CACHEDIR}"

git clone git://git.2f30.org/sdhcp
cd sdhcp
make CC=musl-gcc LDFLAGS=--static
mkdir -vp ../../src/overlay/usr/bin
cp -v sdhcp ../../src/overlay/usr/bin/
cd ..

if [ ! -d "toybox" ]; then
    git clone https://github.com/landley/toybox
    cd toybox
    wget https://landley.net/bin/toolchains/latest/x86_64-linux-musl-cross.tar.xz
    tar xvf x86_64-linux-musl-cross.tar.xz
else
    cd toybox
fi
cp -v ../../src/qemu-toybox-config .config
LINUX="${CACHEDIR}/${KERNELVER}" LDFLAGS=--static CROSS_COMPILE=x86_64-linux-musl-cross/bin/x86_64-linux-musl- make root
cp -v ../../src/dumb-init/dumb-init ../../src/overlay
cp -v ../../src/carl-exit/carl-exit ../../src/overlay
cp -vr ../../src/overlay/* root/x86_64/fs/
chmod +x root/x86_64/fs/dumb-init
chmod +x root/x86_64/fs/carl-exit
chmod +x root/x86_64/fs/init
cd root/x86_64/fs/
find . | cpio -o -H newc > ../../../../../rootfs.cpio

