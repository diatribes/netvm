#!/bin/bash
CACHEDIR=cache
KERNELVER=6.6.58
mkdir -p "${CACHEDIR}"
curl -o "${CACHEDIR}/linux-${KERNELVER}.tar.xz" "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${KERNELVER}.tar.xz"
cd "${CACHEDIR}"
tar xvf "linux-${KERNELVER}.tar.xz"
cd "linux-${KERNELVER}"
cp ../../src/qemu-kernel-config .config
make -j8 && cp arch/x86/boot/bzImage ../../

