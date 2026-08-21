#!/bin/sh
set -e

INITRD_DIR="./initrd"
OUTPUT="root/boot/initrd.img"

chmod +x $INITRD_DIR/init

cd "$INITRD_DIR"
find . | cpio -o -H newc | gzip -9 > "../../$OUTPUT"
echo "initrd.img gerado com sucesso!"
