#!/bin/bash
#
cmake -S . -DCMAKE_INSTALL_PREFIX=$PREFIX  -DAPFEL_ENABLE_PYTHON=off build
cmake --build build -j ${cpu_count}
cmake --install build
