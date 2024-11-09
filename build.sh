#!/bin/bash
source config.sh

./kernel.sh
./dumb-init.sh
./carl-exit.sh
./dropbear.sh
./pktsnif.sh
./rootfs.sh
