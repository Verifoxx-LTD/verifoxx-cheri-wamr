#! /bin/bash
CHERI_PURECAP=1		# 1 for purecap, 0 for hybrid
CONFIG_TYPE=Debug	# Debug or Release
NATIVE_TEST_LIB=0	# 1 to additionally build iwasm native test shared object library, 0 to skip this step (default=0)
FRONTEND_APP=0		# 1 to build a bespoke front-end app instead of iwasm, 0 to use iwasm (default=0)
AOT_CHERI_PTR=0	# Pointer padding and alignment, should correspond with WAMRc build
							# On Aarch64 pure-cap this should be 0, as native pointers are full capability
							# On Aarch64 hybrid or x86_64 this should be 16, as pointers need special alignment to match WAMRc
INSTALL_PREFIX=$HOME/install

echo Running with CHERI_PURECAP=$CHERI_PURECAP, Config=$CONFIG_TYPE and Install=$INSTALL_PREFIX ...

[ ! -d "./build" ] && mkdir ./build
cd build
cmake --toolchain ../toolchain.cmake -DCMAKE_BUILD_TYPE=$CONFIG_TYPE --install-prefix $INSTALL_PREFIX -DCHERI_PURECAP=$CHERI_PURECAP -DWAMR_BUILD_PLATFORM=linux-cheri-purecap \
-DWAMR_BUILD_NATIVE_TEST_LIB=$NATIVE_TEST_LIB -DWAMR_BUILD_AOT=1 -DWAMR_BUILD_LIBC_BUILTIN=1 -DWAMR_BUILD_FAST_INTERP=1 -DWAMR_BUILD_SIMD=0 \
-DWAMR_BUILD_DEBUG_PREPROCESSOR=0 -DWAMR_BUILD_MEMORY_TRACING=0 -DWAMR_DISABLE_HW_BOUND_CHECK=1 -WAMR_APP=$FRONTEND_APP -DWAMR_BUILD_AOT_CHERI_PTR=$AOT_CHERI_PTR \
-DWAMR_BUILD_AOT_EXCEPTION_WORKAROUND=1 \
..

if [ "$?" == "0" ]
then
        echo Completed, now cd to build folder and run \"cmake --build .\" to build, or \"cmake --install .\" to install 
else
	echo Command failed 
fi

