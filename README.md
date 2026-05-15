# BASIC BOOTLOADER
This is a basic bootloader written in Netwide Assembly, that boots up in the bootsector in 16-bit mode and switches safely to 32-bit protected mode.

## FUNCTIONALITY
- Implements a simple Global Descriptor Table(GDT) which implements two segment descriptors apart from Null.
- Contains a print function that displays text using VGA graphics.
- Switches from 16-bit mode to 32-bit mode and prints a success message.

## DEPENDENCIES
- NASM
- QEMU Emulator for emulating CPU.

![alt text](running.png)
