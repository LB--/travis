#!/bin/bash
# Builds the latest version of Boost

if [ ! -d ".travis/boost-install/lib" ]; then
	rm -rf ".travis/boost"
	rm -rf ".travis/boost-install"
	mkdir -p ".travis" && cd ".travis"
	git clone --recursive https://github.com/boostorg/boost.git boost >/dev/null
	cd boost && chmod +x bootstrap.sh
	./bootstrap.sh --prefix="$(pwd)/../boost-install"
	./b2 headers
	# We have to build boost using GCC 5.1
	# If you know how to build boost with Clang 3.8, fix this!
	./b2 toolset=gcc-5 cxxflags="-std=c++14" variant=release link=static --with-locale install -d0
else
	mkdir -p ".travis/boost" && cd ".travis/boost"
fi
cd ../boost-install
export BOOST_ROOT="$(pwd)"
