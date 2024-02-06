nasm -f elf32 sys/boot/boot.asm -o boot.o
gcc -fno-stack-protector -m32 -c sys/kernel/header.c -o bin/kc.o
ld -m elf_i386 -T link.ld -o kernel boot.o bin/kc.o
#qemu-system-i386 -kernel kernel -serial stdio
qemu-system-i386 -kernel kernel -nographic -append "console=ttyS0" -serial mon:stdio

