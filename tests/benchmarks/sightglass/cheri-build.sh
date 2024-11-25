#!/bin/bash

# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

OUT_DIR=$PWD/..
SHOOTOUT_CASES="base64 fib2 gimli heapsort matrix memmove nestedloop \
                nestedloop2 nestedloop3 random seqhash sieve strchr \
                switch2"

if [ ! -d sightglass ]; then
    git clone https://github.com/wasm-micro-runtime/sightglass.git
fi


cd sightglass/benchmarks/shootout

for bench in $SHOOTOUT_CASES
do
    echo "Build ${bench}_native-hybrid"
    aarch64-none-linux-gnu-gcc -march=morello -O3 -o ${OUT_DIR}/sightglass-${bench}_native-hybrid -Dblack_box=set_res -Dbench=${bench} \
        -I../../include ${bench}.c main/main_${bench}.c main/my_libc.c

    echo "Build ${bench}_native-purecap"
    aarch64-none-linux-gnu-gcc -march=morello+c64 -mabi=purecap -O3 -o ${OUT_DIR}/sightglass-${bench}_native-purecap -Dblack_box=set_res -Dbench=${bench} \
        -I../../include ${bench}.c main/main_${bench}.c main/my_libc.c

    echo "Build ${bench}.wasm"
    /opt/wasi-sdk/bin/clang -O3 -nostdlib \
        -Wno-unknown-attributes \
        -Dblack_box=set_res \
        -I../../include -DNOSTDLIB_MODE \
        -Wl,--initial-memory=1310720,--allow-undefined \
        -Wl,--strip-all,--no-entry \
        -o ${OUT_DIR}/sightglass-${bench}.wasm \
        -Wl,--export=app_main -Wl,--export=_start \
        ${bench}.c main/main_${bench}.c main/my_libc.c


    echo "Compile ${bench}.wasm into ${bench}.aot SKIPPED"
    #wamrc -o ${OUT_DIR}/${bench}.aot ${OUT_DIR}/${bench}.wasm
done

cd ..

echo "Done"
