#!/bin/sh
set -e

KBD_VER="2.6.4"
wget https://mirrors.edge.kernel.org/pub/linux/utils/kbd/kbd-${KBD_VER}.tar.xz
tar -xf kbd-${KBD_VER}.tar.xz
cd kbd-${KBD_VER}

./configure --prefix=/usr --disable-vlock --disable-nls
make
make DESTDIR="$(pwd)/../../sysroot" install