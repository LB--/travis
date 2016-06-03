#!/bin/bash
# unfortunately the easiest way I can find to do this is to build it from source

if [ ! -d ".travis/cmake/build/install/bin" ]; then
	rm -rf ".travis/cmake"
	mkdir -p ".travis/cmake" && cd ".travis"
	git clone --recursive --depth 1 --branch v3.5.2 https://github.com/Kitware/CMake.git cmake
	cd cmake && mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=$(pwd)/install -DCMAKE_BUILD_TYPE=RELEASE ..
	cmake --build . && cmake --build . --target install
	cd install/bin
else
	cd ".travis/cmake/build/install/bin"
fi
CMAKEPATH=$(pwd)
export PATH="$CMAKEPATH:$PATH"
