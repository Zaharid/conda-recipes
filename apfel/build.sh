#!/bin/bash
export FFLAGS=$(echo $FFLAGS | sed 's/-fopenmp/-fno-automatic/g')
./configure --prefix=$PREFIX  --disable-pywrap
make -j${CPU_COUNT}
make install
