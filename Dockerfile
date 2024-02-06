# Используем базовый образ, поддерживающий вашу ОС
FROM ubuntu:22.04



# LABEL about the custom image
LABEL maintainer="nikolyan2004@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker for OS"

# Установка необходимых зависимостей и инструментов (если требуется)
RUN apt-get update && apt-get install -y libgtk-3-dev gcc nasm qemu-system-i386 build-essential && apt-get clean


# Копирование файлов вашего проекта внутрь контейнера
COPY . /app

# Установка рабочей директории
WORKDIR /app

# Команда сборки проекта (если требуется)
RUN nasm -f elf32 sys/boot/boot.asm -o boot.o
RUN gcc -fno-stack-protector -m32 -c sys/kernel/header.c -o bin/kc.o
RUN ld -m elf_i386 -T link.ld -o kernel boot.o bin/kc.o



COPY start.sh /start.sh
RUN chmod +x /start.sh
# Команда запуска вашего приложения (если требуется)
CMD ["sh", "./start.sh"]
