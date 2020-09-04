#!/bin/sh

set -e

mount /dev/sda4 /mnt/gentoo
mount /dev/sda2 /mnt/gentoo/boot
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
