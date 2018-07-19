#!/bin/bash
./configure --prefix=$PREFIX 
make -j${CPU_COUNT}
make install

cd wrappers
make lhapdf.cpp
make
make install
