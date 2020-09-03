#!/bin/bash

if [ -z "$1" ]; then
    LLVM=$HOME/llvm
else
    LLVM=$1
fi

if [ -z "$2" ]; then
    LLVM_VERSION=10
else
    LLVM_VERSION=$2
fi

if [ -z "$3" ]; then
    USE_GPU=0
else
    USE_GPU="-DCLANG_OPENMP_NVPTX_DEFAULT_ARCH=sm_$3 -DLIBOMPTARGET_NVPTX_COMPUTE_CAPABILITIES=$3"
fi

export LLVM_SRC=$LLVM/llvm_src
export LLVM_PATH=$LLVM/llvm_install
export LLVM_BUILD=$LLVM/llvm_build

mkdir -p $LLVM_SRC
mkdir -p $LLVM_PATH
mkdir -p $LLVM_BUILD
cd $LLVM_SRC
git clone -b release/$LLVM_VERSION.x https://github.com/llvm/llvm-project .
cd $LLVM_BUILD
if [$USE_GPU == 0]; then
    cmake -G Ninja -DLLVM_USE_LINKER=gold -DLLVM_ENABLE_RTTI=ON -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$LLVM_PATH -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt;openmp;libcxx;libcxxabi" $LLVM_SRC/llvm
else
    cmake -G Ninja -DLLVM_USE_LINKER=gold -DLLVM_ENABLE_RTTI=ON -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_INSTALL_PREFIX=$LLVM_PATH -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt;openmp;libcxx;libcxxabi" -DLLVM_TARGETS_TO_BUILD="host;NVPTX" $USE_GPU -DLLVM_BUILD_EXAMPLES=ON $LLVM_SRC/llvm
fi

ninja -j6 -l6
ninja install -j6

if [$USE_GPU == 0]; then
    echo "Done."
else
    cmake -G Ninja -DLLVM_USE_LINKER=gold -DLLVM_ENABLE_RTTI=ON -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_INSTALL_PREFIX=$LLVM_PATH -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt;openmp;libcxx;libcxxabi" -DLLVM_TARGETS_TO_BUILD="host;NVPTX" $USE_GPU -DLIBOMPTARGET_NVPTX_ENABLE_BCLIB=ON -DLIBOMPTARGET_NVPTX_CUDA_COMPILER=$LLVM_PATH/bin/clang -DLLVM_BUILD_EXAMPLES=ON $LLVM_SRC/llvm
    ninja -j6 -l6
    ninja install -j6
fi

export PATH=$LLVM_PATH/bin:$PATH
export LD_LIBRARY_PATH=$LLVM_PATH/libexec:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LLVM_PATH/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$LLVM_PATH/libexec:$LIBRARY_PATH
export LIBRARY_PATH=$LLVM_PATH/lib:$LIBRARY_PATH
export MANPATH=$LLVM_PATH/share/man:$MANPATH
export C_INCLUDE_PATH=$LLVM_PATH/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$LLVM_PATH/include:CPLUS_INCLUDE_PATH

