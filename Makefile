BIN = ../build/main.bin

.PHONY: build r

build:
	mkdir -p build
	cd src && nasm main.asm -f bin -o $(BIN)

r: build
	qemu-system-x86_64 -drive format=raw,file=build/main.bin