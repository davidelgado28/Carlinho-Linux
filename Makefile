.PHONY: all clean kernel busybox kbd gcc initrd iso

SYSROOT = $(CURDIR)/sysroot
ROOT_BOOT = $(CURDIR)/root/boot

all: busybox kbd kernel initrd iso

busybox:
	bash scripts/build/base/busybox.sh

kbd:
	bash scripts/build/base/kbd.sh

gcc:
	bash scripts/build/base/gcc.sh

kernel:
	bash scripts/build/base/kernel.sh

initrd:
	bash scripts/initrd.sh

iso:
	bash scripts/make_iso.sh

clean:
	rm -rf $(SYSROOT) $(ROOT_BOOT)/vmlinuz $(ROOT_BOOT)/initrd.img iso_build carlinho-linux.iso
