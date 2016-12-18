mkdir build
cd build
cmake \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DBoost_INCLUDE_DIR=$PREFIX/include \
    -DBUILD_SHARED_LIBS=ON \
	-D_GLIBCXX_USE_CXX11_ABI=1\
    ..
make VERBOSE=1
make install
