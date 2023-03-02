#! /bin/bash
CHERI_PURECAP=1		# 1 for purecap, 0 for hybrid
CONFIG_TYPE=Debug	# Debug or Release
INSTALL_PREFIX=$HOME/install

echo Running with CHERI_PURECAP=$CHERI_PURECAP, Config=$CONFIG_TYPE and Install=$INSTALL_PREFIX ...

[ ! -d "./build" ] && mkdir ./build
cd build
cmake --toolchain ../toolchain.cmake -DCMAKE_BUILD_TYPE=$CONFIG_TYPE --install-prefix $INSTALL_PREFIX -DCHERI_PURECAP=$CHERI_PURECAP -DWAMR_BUILD_PLATFORM=linux-cheri-purecap -DWAMR_BUILD_AOT=0 -DWAMR_BUILD_LIBC_BUILTIN=1 -DWAMR_BUILD_FAST_INTERP=1 -DWAMR_BUILD_SIMD=0 ..

if [ "$?" == "0" ]
then
        echo Completed, now cd to build folder and run \"cmake --build .\" to build, or \"cmake --install .\" to install 
else
	echo Command failed 
fi

