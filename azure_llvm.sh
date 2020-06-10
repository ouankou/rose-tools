#!/bin/bash

# Please only run this script in the root folder of ROSE/REX compiler,
# which has the compiler source code as subfolder.

export LLVM_SRC=/datadrive/wang113/llvm9/llvm_src
export LLVM_PATH=/datadrive/wang113/llvm9/llvm_install
export LLVM_BUILD=/datadrive/wang113/llvm9/llvm_build

mkdir -p $LLVM_SRC
mkdir -p $LLVM_PATH
mkdir -p $LLVM_BUILD
cd $LLVM_SRC
git clone -b release/9.x https://github.com/llvm/llvm-project .
cd $LLVM_BUILD
cmake -G Ninja  -DLLVM_USE_LINKER=gold  -DLLVM_ENABLE_RTTI=ON -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$LLVM_PATH -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt;openmp;libcxx;libcxxabi" $LLVM_SRC/llvm
ninja install -j6 -l6

export PATH=$LLVM_PATH/bin:$PATH
export LD_LIBRARY_PATH=$LLVM_PATH/libexec:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LLVM_PATH/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$LLVM_PATH/libexec:$LIBRARY_PATH
export LIBRARY_PATH=$LLVM_PATH/lib:$LIBRARY_PATH
export MANPATH=$LLVM_PATH/share/man:$MANPATH
export C_INCLUDE_PATH=$LLVM_PATH/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$LLVM_PATH/include:CPLUS_INCLUDE_PATH

