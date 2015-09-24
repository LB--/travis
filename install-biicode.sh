#!/bin/bash
# The official biicode installation script requires sudo, which isn't available on containers

mkdir -p ".travis/biicode" && cd ".travis"
wget https://s3.amazonaws.com/biibinaries/release/3.3/bii-ubuntu-64_3_3.deb
dpkg -x bii-ubuntu-64_3_3.deb ./biicode/
cd biicode
ls -lah
BIIPATH=$(pwd)
export PATH="$BIIPATH:$PATH"
