#!/bin/bash
# biicode can update cmake to 3.0.2, but we want 3.3 at least

mkdir -p ".travis/cmake" && cd ".travis"
wget http://ftp.us.debian.org/debian/pool/main/c/cmake/cmake_3.3.2-1_i386.deb
dpkg -x cmake_3.3.2-1_i386.deb ./cmake/
# http://stackoverflow.com/a/501381/1959975 (temporary)
find . -exec ls -dl \{\} \; | awk '{print $3, $4, $9}'
cd cmake/usr/bin
CMAKEPATH=$(pwd)
export PATH="$CMAKEPATH:$PATH"
