#!/bin/bash
# biicode can update cmake to 3.0.2, but we want 3.3 at least

mkdir -p ".travis/cmake" && cd ".travis"
wget http://ftp.debian.org/debian/pool/main/c/cmake/cmake_3.3.2-1_arm64.deb
dpkg -x cmake_3.3.2-1_arm64.deb ./cmake/
cd cmake/bin
CMAKEPATH=$(pwd)
export PATH="$CMAKEPATH:$PATH"
