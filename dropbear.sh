#!/bin/bash
cd "${CACHEPATH}"
if [ ! -d "dropbear-2024.86" ]; then
    curl -o dropbear-2024.86.tar.bz2 https://matt.ucc.asn.au/dropbear/dropbear-2024.86.tar.bz2
    tar xvf dropbear-2024.86.tar.bz2 
    cd dropbear-2024.86
    ./configure --enable-static --disable-zlib CC=musl-gcc
    make
else
    cd dropbear-2024.86
fi
mkdir -p "${SRCPATH}/overlay/usr/bin"
cp -v dbclient "${SRCPATH}/overlay/usr/bin"
cp -v dropbearkey "${SRCPATH}/overlay/usr/bin"
cp -v dropbearconvert "${SRCPATH}/overlay/usr/bin"

