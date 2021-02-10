#!/bin/bash

REX_ROOT=$HOME/Projects/rexdev
mkdir -p $REX_ROOT
cd $REX_ROOT
git clone -b dev git@github.com:passlab/rexompiler.git rex_src
mkdir rex_build
cd rex_src
git submodule update --init
./build
cd ../rex_build
../rex_src/configure --prefix=$REX_ROOT/rex_install --with-boost=/usr --with-boost-libdir=/usr/lib/x86_64-linux-gnu/ --enable-languages=c,c++,fortran --disable-tests-directory --disable-tutorial-directory
make core -j6
make install-core
