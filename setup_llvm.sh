#!/bin/bash

if [ -z "$1" ]; then
    echo "Please provide a location of LLVM installation."
    return -1 2>/dev/null
    exit -1
else
    cd $1
    LLVM=$(pwd)
    cd -
fi

export LLVM_SRC=$LLVM/llvm_src
export LLVM_PATH=$LLVM/llvm_install
export LLVM_BUILD=$LLVM/llvm_build

export PATH=$LLVM_PATH/bin:$PATH
export LD_LIBRARY_PATH=$LLVM_PATH/libexec:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LLVM_PATH/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$LLVM_PATH/libexec:$LIBRARY_PATH
export LIBRARY_PATH=$LLVM_PATH/lib:$LIBRARY_PATH
export MANPATH=$LLVM_PATH/share/man:$MANPATH
export C_INCLUDE_PATH=$LLVM_PATH/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$LLVM_PATH/include:CPLUS_INCLUDE_PATH
