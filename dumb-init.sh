#!/bin/bash
cd src/dumb-init
musl-gcc -o dumb-init -O2 dumb-init.c
