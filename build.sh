#!/bin/bash

nasm src/bootsector.asm -f bin -o bin/bootsector.bin
nasm src/kernel.asm -f bin -o bin/kernel.bin
cd bin/
cat bootsector.bin kernel.bin > simplicity.bin
qemu-system-i386 -fda simplicity.bin
