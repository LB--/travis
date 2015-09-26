#!/bin/bash
# biicode can update cmake to 3.0.2, but we want 3.3 at least

mkdir -p ".travis/cmake" && cd ".travis"
wget http://opensource.exmeritus.com/mirror/debian-ports//pool-hppa/main/c/cmake/cmake_3.3.2-1_hppa.deb
dpkg -x cmake_3.3.2-1_hppa.deb ./cmake/
# http://stackoverflow.com/a/501381/1959975 (temporary)
find . -exec ls -dl \{\} \; | awk '{print $3, $4, $9}'
cd cmake/usr/bin
CMAKEPATH=$(pwd)
export PATH="$CMAKEPATH:$PATH"
