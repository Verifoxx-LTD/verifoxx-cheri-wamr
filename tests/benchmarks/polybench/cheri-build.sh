#!/bin/bash

# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

OUT_DIR=$PWD/..
POLYBENCH_CASES="datamining linear-algebra medley stencils"

if [ ! -d PolyBenchC-4.2.1 ]; then
    git clone https://github.com/MatthiasJReisinger/PolyBenchC-4.2.1.git
fi

cd PolyBenchC-4.2.1

for case in $POLYBENCH_CASES
do
    files=`find ${case} -name "*.c"`
    for file in ${files}
    do
        file_name=${file##*/}
        if [[ ${file_name} == "Nussinov.orig.c" ]]; then
            continue
        fi

        echo "Build ${file_name%.*}_native-hybrid"
        aarch64-none-linux-gnu-gcc -march=morello -O3 -I utilities -I ${file%/*} utilities/polybench.c ${file} \
                -DPOLYBENCH_TIME -lm -o ${OUT_DIR}/polybench-${file_name%.*}_native-hybrid

        echo "Build ${file_name%.*}_native-purecap"
        aarch64-none-linux-gnu-gcc -march=morello+c64 -mabi=purecap -O3 -I utilities -I ${file%/*} utilities/polybench.c ${file} \
                -DPOLYBENCH_TIME -lm -o ${OUT_DIR}/polybench-${file_name%.*}_native-purecap

        echo "Build ${file_name%.*}.wasm"
        /opt/wasi-sdk/bin/clang -O3 -I utilities -I ${file%/*}      \
                utilities/polybench.c ${file}                       \
                -Wl,--export=__heap_base -Wl,--export=__data_end    \
                -Wl,--export=malloc -Wl,--export=free               \
                -DPOLYBENCH_TIME -o ${OUT_DIR}/polybench-${file_name%.*}.wasm

        echo "Compile ${file_name%.*}.wasm into ${file_name%.*}.aot SKIPPED"
        #wamrc -o ${OUT_DIR}/${file_name%.*}.aot ${OUT_DIR}/${file_name%.*}.wasm
    done
done

cd ..

echo "Done"
