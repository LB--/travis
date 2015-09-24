#!/bin/bash
# The official biicode installation script requires sudo, which isn't available on containers

mkdir -p ".travis" && cd ".travis"
git clone https://github.com/biicode/biicode.git
cd biicode
BIIPATH=$(pwd)
git submodule update --init --recursive
pip install -r client/requirements.txt
pip install -r common/requirements.txt
export PATH="$BIIPATH:$PATH"
