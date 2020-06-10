#!/bin/bash

# Boost is not installed here. Please use $BOOST_PATH to indicate the location of Boost.
sudo apt update
sudo apt install -y openjdk-8-jdk
sudo apt install -y \
    automake \
    bison \
    build-essential \
    cmake \
    curl \
    flex \
    g++ \
    gcc \
    gcc-multilib \
    gdb \
    gfortran \
    ghostscript \
    git \
    graphviz \
    iputils-ping \
    libtinfo-dev \
    libtool \
    ninja-build \
    vim \
    wget \
    zlib1g-dev

# Setup environment
export ROSE_SRC=/datadrive/wang113/rose/rose_src
export ROSE_PATH=/datadrive/wang113/rose/rose_install
export ROSE_BUILD=/datadrive/wang113/rose/rose_build
export PATH=$ROSE_PATH/bin:$PATH
export LD_LIBRARY_PATH=$ROSE_PATH/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$ROSE_PATH/lib:$LIBRARY_PATH

mkdir -p $ROSE_BUILD
git clone -b develop https://github.com/rose-compiler/rose.git $ROSE_SRC
cd $ROSE_SRC
./build
cd $ROSE_BUILD
$ROSE_SRC/configure --with-boost=$BOOST_PATH --enable-clang-frontend --enable-tests-directory --enable-languages=c,c++,fortran --prefix=$ROSE_PATH CXXFLAGS=-std=c++11 CC=clang CXX=clang++
make core -j6
make install-core
