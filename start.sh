nasm -f elf32 sys/boot/boot.asm -o boot.o
gcc -m32 -c sys/kernel/header.c -o krnl.o
ld -m elf_i386 -T link.ld -o kernel boot.o krnl.o
qemu-system-i386 -kernel kernel -serial stdio


