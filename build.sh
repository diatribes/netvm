#!/bin/bash
source config.sh

./kernel.sh
./dumb-init.sh
./carl-exit.sh
./rootfs.sh

