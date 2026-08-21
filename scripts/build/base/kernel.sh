#!/bin/sh
set -e

KERNEL_VER="6.6.1"
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${KERNEL_VER}.tar.xz
tar -xf linux-${KERNEL_VER}.tar.xz
cd linux-${KERNEL_VER}

make defconfig
make -j$(nproc) bzImage
cp arch/x86/boot/bzImage ../../root/boot/vmlinuz
