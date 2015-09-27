#!/bin/bash
# We build clang manually because I don't know a better way

if [ ! -d ".travis/clang/install/bin" ]; then
	mkdir -p ".travis/clang" && cd ".travis/clang"
	git clone https://github.com/llvm-mirror/llvm.git llvm
	cd llvm/tools
	git clone https://github.com/llvm-mirror/clang.git clang
	cd ../projects
	git clone https://github.com/llvm-mirror/compiler-rt.git compiler-rt
	git clone https://github.com/llvm-mirror/libcxx.git libcxx
	cd ../..
	CLANGPATH=$(pwd)
	mkdir build && cd build
	cmake ../llvm -DCMAKE_INSTALL_PREFIX="$CLANGPATH/install" -DCMAKE_BUILD_TYPE=RELEASE
	cmake --build . && cmake --build . --target install
	cd ../install/bin
else
	cd ".travis/clang/install/bin"
fi
CLANGPATH=$(pwd)
export PATH="$CLANGPATH:$PATH"
