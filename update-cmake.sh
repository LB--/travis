#!/bin/bash

mkdir -p ".travis/cmake" && cd ".travis/cmake"
wget http://cmake.org/files/v3.3/cmake-3.3.2-Linux-i386.tar.gz
tar xf cmake-3.3.2-Linux-i386.tar.gz
cd cmake-3.3.2-Linux-i386/bin
CMAKEPATH=$(pwd)
export PATH="$CMAKEPATH:$PATH"
