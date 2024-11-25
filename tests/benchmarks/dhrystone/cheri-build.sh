#!/bin/bash


echo "===> compile dhrystone src to dhrystone_native hybrid"
gcc -march=morello -O3 -o dhrystone_native-hybrid src/dhry_1.c src/dhry_2.c -I include

echo "===> compile dhrystone src to dhrystone_native purecap"
gcc -march=morello+c64 -mabi=morello -O3 -o dhrystone_native-purecap src/dhry_1.c src/dhry_2.c -I include

echo "===> compile dhrystone src to dhrystone.wasm"
/opt/wasi-sdk/bin/clang -O3 \
    -o dhrystone.wasm src/dhry_1.c src/dhry_2.c -I include \
    -Wl,--export=__heap_base -Wl,--export=__data_end

echo "===> compile dhrystone.wasm to dhrystone.aot SKIPPED"
#wamrc -o dhrystone.aot dhrystone.wasm
