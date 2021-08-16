#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .
export FFLAGS=$(echo $FFLAGS | sed 's/-fopenmp/-fno-automatic/g')
./configure --prefix=$PREFIX 
make -j${CPU_COUNT}
make install
