#!/bin/bash

export BOOST_SRC=/datadrive/wang113/boost/boost_src
export BOOST_PATH=/datadrive/wang113/boost/boost_install

mkdir -p $BOOST_PATH
cd $BOOST_PATH/..
wget https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.bz2
tar --bzip2 -xf boost_1_73_0.tar.bz2
mv boost_1_73_0 boost_src
rm boost_1_73_0.tar.bz2
cd $BOOST_SRC
./bootstrap.sh --with-toolset=clang --prefix=$BOOST_PATH
CC=clang CXX=clang++ ./b2 install --prefix=$BOOST_PATH
