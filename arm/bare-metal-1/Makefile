TOOLCHAIN=arm-none-eabi

CC=$(TOOLCHAIN)-gcc
LD=$(TOOLCHAIN)-ld
OBJCOPY=$(TOOLCHAIN)-objcopy
OBJCOPY_FLAGS=-O binary
AS=$(TOOLCHAIN)-as
AS_FLAGS=-g
CC=$(TOOLCHAIN)-gcc
CFLAGS=-g

CPU=-mcpu=arm926ej-s

src_asm=startup
src=test

default all:test.bin

startup.o: startup.s
	$(AS) $(CPU) $(AS_FLAGS) -o $@ $<

test.o: test.c
	$(CC) -c $(CPU) $(CFLAGS) -o $@ $<

test.elf: test.o startup.o
	$(LD) -T test.ld $< -o $@

test.bin: test.elf
	$(OBJCOPY) $(OBJCOPY_FLAGS) $< $@

clean:
	-rm -f startup.o test.o test.elf test.bin


