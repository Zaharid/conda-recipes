#!/bin/bash
CC=cc CXX=c++ ./configure --prefix=$PREFIX 
make -j${CPU_COUNT}
find -name *.la -print0 | xargs -0 -I {} sed 's%lib/../lib64%lib%g'
make install

cd wrappers
make
make install
