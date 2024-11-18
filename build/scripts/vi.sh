#!/bin/bash
cd "${CACHEPATH}"
if [ ! -d "neatvi" ]; then
    git clone https://github.com/aligrudi/neatvi.git
    cd neatvi
    make CC=musl-gcc LDFLAGS=--static
    cd ..
fi

