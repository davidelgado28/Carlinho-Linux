#!/bin/sh
set -e

ISO_DIR="./iso_build"
OUTPUT="carlinho-linux.iso"

rm -rf "$ISO_DIR"
mkdir -p "$ISO_DIR/boot/limine"

cp root/boot/vmlinuz "$ISO_DIR/boot/"
cp root/boot/initrd.img "$ISO_DIR/boot/"
cp root/boot/limine.conf "$ISO_DIR/boot/limine/"

xorriso -as mkisofs -b boot/limine/limine-bios-cd.bin \
    -no-emul-boot -boot-load-size 4 -boot-info-table \
    -o "$OUTPUT" "$ISO_DIR"

echo "ISO criada com sucesso: $OUTPUT"
