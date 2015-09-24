#!/bin/bash
# The official biicode installation script requires sudo, which isn't available on containers

mkdir -p ".travis/biicode" && cd ".travis/biicode"
BIIPATH=$(pwd)
git clone https://github.com/biicode/biicode.git
git submodule update --init --recursive
pip install -r client/requirements.txt
pip install -r common/requirements.txt
export PATH="$BIIPATH:$PATH"
