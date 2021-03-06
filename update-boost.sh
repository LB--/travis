#!/bin/bash
# Builds the latest version of Boost

if [ ! -d ".travis/boost-install/lib" ]; then
	rm -rf ".travis/boost"
	rm -rf ".travis/boost-install"
	mkdir -p ".travis" && cd ".travis"
	git clone --recursive --depth 1 --branch boost-1.62.0 https://github.com/boostorg/boost.git boost >/dev/null 2>&1 || echo "clone failed"
	cd boost && chmod +x bootstrap.sh
	./bootstrap.sh --prefix="$(pwd)/../boost-install"
	./b2 headers
	# We have to build boost using GCC
	# If you know how to build boost with Clang, fix this!
	./b2 toolset=gcc-6 variant=release link=static "$@" install -d0
else
	mkdir -p ".travis/boost" && cd ".travis/boost"
fi
cd ../boost-install
export BOOST_ROOT="$(pwd)"
