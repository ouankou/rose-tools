#!/bin/bash

# Please make sure ./build has been executed in the source folder of the ROSE/REX compiler

cd $ROSE_BUILD
$ROSE_SRC/configure --prefix=$ROSE_PATH --with-boost=/usr --with-boost-libdir=/usr/lib/x86_64-linux-gnu/ --enable-languages=c,c++,fortran --disable-tests-directory --disable-tutorial-directory --disable-projects-directory --enable-clang-frontend
