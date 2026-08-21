#!/bin/sh
set -e

SYSROOT="../../sysroot"

touch $SYSROOT/etc/passwd $SYSROOT/etc/shadow $SYSROOT/etc/group

mkdir -p $SYSROOT/home/carlinho

echo "carlinho:x:1000:1000:Carlinho User:/home/carlinho:/bin/sh" >> $SYSROOT/etc/passwd
echo "carlinho:x:1000:" >> $SYSROOT/etc/group
