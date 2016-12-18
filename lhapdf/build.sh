#!/bin/bash
# Depending on our platform, shared libraries end with either .so or .dylib
if [[ `uname` == 'Darwin' ]]; then
    # Also, included a workaround so that `-stdlib=c++` doesn't go to
    # `gfortran` and cause problems.
    #
    # https://github.com/conda-forge/toolchain-feedstock/pull/8
    DYLIB_EXT=dylib
    export CFLAGS="${CFLAGS} -stdlib=libc++ -lc++"
    export LDFLAGS="-headerpad_max_install_names -undefined dynamic_lookup -bundle -Wl,-search_paths_first -lc++"
else
    DYLIB_EXT=so
    unset LDFLAGS
fi
./configure --prefix=$PREFIX 
make -j${CPU_COUNT}
make install

cd wrappers
make
make install
