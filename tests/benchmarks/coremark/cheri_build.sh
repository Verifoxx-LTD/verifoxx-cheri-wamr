#!/bin/bash

cd coremark

echo "Build coremark for Hybrid .."
aarch64-none-linux-gnu-gcc -march=morello -O3 -Iposix -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1  -lrt"\" \
        -DITERATIONS=400000 -DSEED_METHOD=SEED_VOLATILE -DPERFORMANCE_RUN=1 \
        core_list_join.c core_main.c core_matrix.c core_state.c \
        core_util.c posix/core_portme.c \
        -o ../coremark-hybrid.exe -lrt

echo "Build coremark for Purecap .."
aarch64-none-linux-gnu-gcc -march=morello -mabi=purecap -O3 -Iposix -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1  -lrt"\" \
        -DITERATIONS=400000 -DSEED_METHOD=SEED_VOLATILE -DPERFORMANCE_RUN=1 \
        core_list_join.c core_main.c core_matrix.c core_state.c \
        core_util.c posix/core_portme.c \
        -o ../coremark.exe -lrt

echo "Build coremark with wasi-sdk .."
/opt/wasi-sdk/bin/clang -O3 -Iposix -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1"\" \
        -Wl,--export=main \
        -DITERATIONS=400000 -DSEED_METHOD=SEED_VOLATILE -DPERFORMANCE_RUN=1 \
        -Wl,--allow-undefined \
        core_list_join.c core_main.c core_matrix.c core_state.c \
        core_util.c posix/core_portme.c \
        -o ../coremark.wasm

cd ..

echo "Compile coremark.wasm to coremark.aot SKIPPED for now.."
#wamrc -o coremark.aot coremark.wasm

echo "Done"
