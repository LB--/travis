#!/bin/bash
# Thanks to a redditor for informing that I didn't need to build from source
# We still use "build" in the path for compatibility with existing caches

if [ ! -d ".travis/cmake/build/install/bin" ]; then
	rm -rf ".travis/cmake"
	mkdir -p ".travis/cmake/build" && cd ".travis/cmake/build"
	curl -O https://cmake.org/files/v3.7/cmake-3.7.0-Linux-x86_64.tar.gz
	tar -xzvf cmake-3.7.0-Linux-x86_64.tar.gz
	mv cmake-3.7.0-Linux-x86_64 install
	cd install/bin
else
	cd ".travis/cmake/build/install/bin"
fi
CMAKEPATH=$(pwd)
export PATH="$CMAKEPATH:$PATH"
