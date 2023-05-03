#! /bin/bash
CHERI_PURECAP=1		# 1 for purecap, 0 for hybrid
CONFIG_TYPE=Debug	# Debug or Release
NATIVE_TEST_LIB=0	# 1 to additionally build iwasm native test shared object library, 0 to skip this step (default=0)
FRONTEND_APP=0		# 1 to build a bespoke front-end app instead of iwasm, 0 to use iwasm (default=0)
INSTALL_PREFIX=$HOME/install

echo Running with CHERI_PURECAP=$CHERI_PURECAP, Config=$CONFIG_TYPE and Install=$INSTALL_PREFIX ...

[ ! -d "./build" ] && mkdir ./build
cd build
cmake --toolchain ../toolchain.cmake -DCMAKE_BUILD_TYPE=$CONFIG_TYPE --install-prefix $INSTALL_PREFIX -DCHERI_PURECAP=$CHERI_PURECAP -DWAMR_BUILD_PLATFORM=linux-cheri-purecap \
-DWAMR_BUILD_NATIVE_TEST_LIB=$NATIVE_TEST_LIB -DWAMR_BUILD_AOT=0 -DWAMR_BUILD_LIBC_BUILTIN=1 -DWAMR_BUILD_FAST_INTERP=1 -DWAMR_BUILD_SIMD=0 \
-DWAMR_BUILD_DEBUG_PREPROCESSOR=0 -DWAMR_BUILD_MEMORY_TRACING=0 -DWAMR_DISABLE_HW_BOUND_CHECK=1 -WAMR_APP=$FRONTEND_APP \
..

if [ "$?" == "0" ]
then
        echo Completed, now cd to build folder and run \"cmake --build .\" to build, or \"cmake --install .\" to install 
else
	echo Command failed 
fi

