#!/bin/bash
# biicode can update cmake to 3.0.2, but we want 3.3 at least
# unfortunately the easiest way I can find to do this is to build it from source

if [ ! -d ".travis/cmake/build/install/bin" ]; then
	rm -rf ".travis/cmake"
	mkdir -p ".travis/cmake" && cd ".travis"
	git clone https://github.com/Kitware/CMake.git cmake
	cd cmake && mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=$(pwd)/install ..
	cmake --build . && cmake --build . --target install
	cd install/bin
else
	cd ".travis/cmake/build/install/bin"
fi
CMAKEPATH=$(pwd)
export PATH="$CMAKEPATH:$PATH"
