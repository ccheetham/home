#!/usr/bin/env bash

set -e

umount -l /mnt/gentoo/dev{/shm,/pts,}
umount -R /mnt/gentoo
