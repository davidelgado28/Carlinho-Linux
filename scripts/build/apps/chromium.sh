#!/bin/sh
set -e

INSTALL_DIR="../../sysroot/opt/chromium"
mkdir -p "$INSTALL_DIR"

echo "Baixando o Chromium portátil para o Carlinho Linux..."

CHROMIUM_URL="https://github.com/ungoogled-software/ungoogled-chromium-binaries/releases/download/131.0.6778.85-1/ungoogled-chromium_131.0.6778.85-1.linux_x86_64.portable.tar.xz"

wget -O chromium.tar.xz "$CHROMIUM_URL"

echo "Extraindo o Chromium..."
tar -xf chromium.tar.xz -C "$INSTALL_DIR" --strip-components=1

rm chromium.tar.xz

mkdir -p ../../sysroot/usr/bin
ln -s /opt/chromium/chrome ../../sysroot/usr/bin/chromium

echo "Chromium instalado com sucesso no sysroot!"
