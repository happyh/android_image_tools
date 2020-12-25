#!/bin/bash
#########################################################################
# File Name: unpack.sh
# Author: happyhe
# mail: heguang@qiyi.com
# Created Time: Tue 15 Dec 2020 03:38:51 PM CST
#########################################################################
./unpackbootimg -i ./recovery.img
mkdir ramdisk && cd ramdisk
gunzip -c ../recovery.img-ramdisk.gz | cpio -i


./repack_ramdisk ./ramdisk ramdisk-new.gz
./mkbootimg --kernel recovery.img-zImage --ramdisk recovery.img-ramdisk.gz.new -o recovery.img.new
