TOOLCHAIN=arm-none-eabi

CC=$(TOOLCHAIN)-gcc
OBJCOPY=$(TOOLCHAIN)-objcopy
OBJCOPY_FLAGS=-O binary
CFLAGS=-nostdlib

src=sum
asm_src=startup


default:$(src).bin

all:default bin

$(src).elf:$(src).o $(asm_src).s
	$(CC) $(CFLAGS) -o $@ -T $(src).lds $<

$(src).bin: $(src).elf
	$(OBJCOPY) $(OBJCOPY_FLAGS) $< $@

bin:
	-dd if=/dev/zero of=flash.bin bs=4096 count=4096
	-dd if=sum.bin of=flash.bin bs=4096 conv=notrunc

clean:
	-rm -f *.o *.elf *.bin


