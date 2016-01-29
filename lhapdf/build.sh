#!/bin/bash
CC=cc CXX=c++ ./configure --prefix=$PREFIX 
make -j${CPU_COUNT}
make install

cd wrappers
make
make install
