#!/bin/bash
#This has to be here because autotools doesn't find the right cython
(cd wrappers/python && cython --cplus lhapdf.pyx)
./configure --prefix=$PREFIX 
make -j${CPU_COUNT}
make install

cd wrappers
make
make install
