#!/bin/bash
# unfortunately the easiest way I can find to do this is to build it from source

if [ ! -d ".travis/cmake/build/install/bin" ]; then
	rm -rf ".travis/cmake"
	mkdir -p ".travis/cmake" && cd ".travis"
	git clone --recursive --depth 1 --branch v3.6.1 https://github.com/Kitware/CMake.git cmake
	cd cmake && mkdir build && cd build

	# Build libcurl for HTTPS support
	pushd .
	curl -O https://curl.haxx.se/download/curl-7.50.0.tar.gz
	tar -xzvf curl-7.50.0.tar.gz
	mkdir build-curl && cd build-curl
	cmake ../curl-7.50.0 -DCMAKE_INSTALL_PREFIX=../install -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DBUILD_CURL_EXE=OFF
	cmake --build . --target install
	popd

	cmake .. -DCMAKE_INSTALL_PREFIX=./install -DCMAKE_BUILD_TYPE=Release -DCMAKE_USE_SYSTEM_CURL=ON -DCURL_INCLUDE_DIR=./install/include/curl -DCURL_LIBRARY=./install/lib/libcurl.so
	cmake --build . --target install
	cd install/bin
else
	cd ".travis/cmake/build/install/bin"
fi
CMAKEPATH=$(pwd)
export PATH="$CMAKEPATH:$PATH"
cd ../lib
export LD_LIBRARY_PATH="$(pwd):$LD_LIBRARY_PATH"
