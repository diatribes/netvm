#!/bin/bash
curl -o dropbear-2024.86.tar.bz2 https://matt.ucc.asn.au/dropbear/dropbear-2024.86.tar.bz2
tar xvf dropbear-2024.86.tar.bz2 
cd dropbear-2024.86/
./configure --enable-static --disable-zlib CC=musl-gcc
make
mkdir -p "${SRCPATH}/overlay/usr/bin"
cp -v dbclient "${SRCPATH}/overlay/usr/bin"
cp -v dropbearkey "${SRCPATH}/overlay/usr/bin"
cp -v dropbearconvert "${SRCPATH}/overlay/usr/bin"
