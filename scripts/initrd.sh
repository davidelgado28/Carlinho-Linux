#!/bin/sh
set -e

INITRD_DIR="./initrd"
OUTPUT="root/boot/initrd.img"

cd "$INITRD_DIR"
find . | cpio -o -H newc | gzip -9 > "../../$OUTPUT"
