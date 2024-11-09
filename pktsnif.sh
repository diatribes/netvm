#!/bin/bash
cd "${CACHEPATH}"
if [ ! -d "pktsnif" ]; then
    git clone https://github.com/diatribes/pktsnif.git
    cd pktsnif
    musl-gcc pktsnif.c --static -o pktsnif
    cd ..
fi

