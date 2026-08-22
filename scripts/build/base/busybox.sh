#!/bin/sh
set -e

BUSYBOX_VER="1.36.4"
wget https://busybox.net/downloads/busybox-${BUSYBOX_VER}.tar.bz2
tar -xf busybox-${BUSYBOX_VER}.tar.bz2
cd busybox-${BUSYBOX_VER}

make defconfig
# Para build estático sem dependências externas:
sed -i 's/# CONFIG_STATIC is not set/CONFIG_STATIC=y/' .config
make -j$(nproc)
make CONFIG_PREFIX="../../sysroot" install