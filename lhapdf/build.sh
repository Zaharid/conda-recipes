#!/bin/bash
./configure --prefix=$PREFIX 
make -j${CPU_COUNT}
make install

cd wrappers
cython --cplus lhapdf.pyx
make
make install
