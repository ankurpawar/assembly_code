TOOLCHAIN=arm-none-eabi

CC=$(TOOLCHAIN)-gcc
LD=$(TOOLCHAIN)-ld
OBJCOPY=$(TOOLCHAIN)-objcopy
OBJCOPY_FLAGS=-O binary
AS=$(TOOLCHAIN)-as
AS_FLAGS=-g
CFLAGS=-g

src_asm=add32_bit_1.s

default all:flash.bin

add32_bit_1.o:$(src_asm)
	$(AS) $(CPU) $(AS_FLAGS) -o $@ $<

add32_bit_1.elf:add32_bit_1.o 
	$(LD) $< -o $@

flash.bin: add32_bit_1.elf
	$(OBJCOPY) $(OBJCOPY_FLAGS) $< $@

clean:
	-rm -f *.o *.elf *.bin


