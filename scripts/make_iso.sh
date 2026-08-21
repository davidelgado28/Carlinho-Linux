#!/bin/sh
set -e

ISO_DIR="./iso_build"
OUTPUT="carlinho-linux.iso"

echo "Preparando estrutura da ISO..."
rm -rf "$ISO_DIR"
mkdir -p "$ISO_DIR/boot/limine"

cp root/boot/vmlinuz "$ISO_DIR/boot/"
cp root/boot/initrd.img "$ISO_DIR/boot/"
cp root/boot/limine.conf "$ISO_DIR/boot/limine/"

echo "Gerando a imagem Carlinho Linux ISO..."
xorriso -as mkisofs -b boot/limine/limine.conf \
    -no-emul-boot -boot-load-size 4 -boot-info-table \
    -o "$OUTPUT" "$ISO_DIR"

echo "=================================================="
echo " ISO criada com sucesso: $OUTPUT"
echo "=================================================="
