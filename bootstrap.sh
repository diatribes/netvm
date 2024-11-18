#!/bin/sh

# Source config.sh
. ./config.sh

mkdir -pv "${CACHEPATH}"
mkdir -pv "${OUTPUTPATH}"

./build/scripts/kernel.sh
./build/scripts/dumb-init.sh
./build/scripts/carl-exit.sh
./build/scripts/dropbear.sh
./build/scripts/pktsnif.sh
./build/scripts/vi.sh
./build/scripts/rootfs.sh

