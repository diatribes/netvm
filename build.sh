#!/bin/bash
export KERNELVER=6.11.7
./kernel.sh
./dumb-init.sh
./carl-exit.sh
./rootfs.sh

