#!/bin/bash
# We build clang manually because I don't know a better way

mkdir -p ".travis/clang" && cd ".travis/clang"
svn co -q http://llvm.org/svn/llvm-project/llvm/trunk llvm
cd llvm/tools
svn co -q http://llvm.org/svn/llvm-project/cfe/trunk clang
cd ../projects
svn co -q http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt
svn co -q http://llvm.org/svn/llvm-project/libcxx/trunk libcxx
cd ../..
CLANGPATH=$(pwd)
mkdir build && cd build
cmake -G "Unix Makefiles" ../llvm/tools/clang -DCMAKE_INSTALL_PREFIX="$CLANGPATH/install" -DCMAKE_BUILD_TYPE=RELEASE
make install
cd ../install
ls -lah
CLANGPATH=$(pwd)
export PATH="$CLANGPATH:$PATH"
