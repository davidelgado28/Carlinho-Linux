#!/bin/sh
set -e

GCC_VER="13.2.0"
wget https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VER}/gcc-${GCC_VER}.tar.xz
tar -xf gcc-${GCC_VER}.tar.xz
cd gcc-${GCC_VER}

./contrib/download_prerequisites
mkdir build && cd build
../configure --prefix=/usr --disable-multilib --enable-languages=c,c++
make -j$(nproc)
make DESTDIR="$(pwd)/../../../sysroot" install
