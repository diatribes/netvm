#!/bin/bash 
cd "${CACHEPATH}"

if [ ! -d "sdhcp" ]; then
    git clone git://git.2f30.org/sdhcp
    cd sdhcp
    make CC=musl-gcc LDFLAGS=--static
    mkdir -vp "${SRCPATH}/overlay/usr/bin"
    cp -v sdhcp "${SRCPATH}/overlay/usr/bin/sdhcp"
    cd ..
fi

if [ ! -d "oksh" ]; then
    git clone https://github.com/ibara/oksh.git
    cd oksh
    ./configure --enable-static --cc=musl-gcc
    make
    cp -v oksh "${SRCPATH}/overlay/usr/bin/oksh"
    cd ..
fi

if [ ! -d "toybox" ]; then
    git clone https://github.com/landley/toybox
    cd toybox
    curl -o x86_64-linux-musl-cross.tar.xz https://landley.net/bin/toolchains/latest/x86_64-linux-musl-cross.tar.xz
    tar xvf x86_64-linux-musl-cross.tar.xz
else
    cd toybox
fi
cp -v "${SRCPATH}/qemu-toybox-config" .config
LINUX="${CACHEPATH}/${KERNELVER}" LDFLAGS=--static CROSS_COMPILE=x86_64-linux-musl-cross/bin/x86_64-linux-musl- make root
cp -v "${SRCPATH}/dumb-init/dumb-init" "${SRCPATH}/overlay"
cp -v "${SRCPATH}/carl-exit/carl-exit" "${SRCPATH}/overlay"
cp -v "${CACHEPATH}/pktsnif/pktsnif" "${SRCPATH}/overlay/usr/bin"
cp -v "${CACHEPATH}/neatvi/vi" "${SRCPATH}/overlay/usr/bin"
cp -vr ${SRCPATH}/overlay/* root/x86_64/fs/
chmod +x root/x86_64/fs/dumb-init
chmod +x root/x86_64/fs/carl-exit
chmod +x root/x86_64/fs/init
cd root/x86_64/fs/
find . | cpio -o -H newc > ../../../../../rootfs.cpio

