#!/bin/bash

#
# Installs dependencies and sets stuff up
#

apt install make python3 qemu clang binutils nasm genisoimage wget > /dev/null

mkdir -p iso/boot/grub
wget -o iso/boot/grub/stage2_eltorito https://www.dropbox.com/s/ogc03xaxw00lhh5/stage2_eltorito?dl=1

touch iso/boot/grub/menu.lst
echo default=0 > iso/boot/grub/menu.lst
echo title SOS 0.1.0 Alpha > iso/boot/grub/menu.lst
echo kernel /boot/kernel.elf > iso/boot/grub/menu.lst