# Folders
BOOT = boot
KERNEL = kernel

# Run os.bin by qemu
run: os.bin
	qemu-system-i386 os.bin

# Build os.bin
os.bin: $(KERNEL)/kernel.bin $(BOOT)/boot.bin
	cat $(BOOT)/boot.bin $(KERNEL)/kernel.bin  > os.bin

# Build kernel.bin
$(KERNEL)/kernel.bin: $(KERNEL)/kernel.c
	gcc $(KERNEL)/kernel.c -o $(KERNEL)/kernel.bin

# Build boot.bin
$(BOOT)/boot.bin: $(BOOT)/boot.asm
	nasm -f bin $(BOOT)/boot.asm -o $(BOOT)/boot.bin

# Clean
clean:
	rm -f $(BOOT)/*.bin $(BOOT)/*.o
	rm -f $(KERNEL)/*.bin $(KERNEL)/*.o
	rm -f *.bin *.o