#!/bin/bash
source config.sh

./kernel.sh
./dumb-init.sh
./carl-exit.sh
./dropbear.sh
./pktsnif.sh
./vi.sh
./rootfs.sh
