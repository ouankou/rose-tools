#!/bin/bash

# Please only run this script in the root folder of ROSE/REX compiler,
# which has the compiler source code as subfolder.

git clone -b dev git@github.com:passlab/ompparser.git
cd ompparser
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../../ompparser_install ..
make
make install
