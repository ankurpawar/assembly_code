TOOLCHAIN=arm-none-eabi

CC=$(TOOLCHAIN)-gcc
LD=$(TOOLCHAIN)-ld
OBJCOPY=$(TOOLCHAIN)-objcopy
OBJCOPY_FLAGS=-O binary
AS=$(TOOLCHAIN)-as
AS_FLAGS=-g
CFLAGS=-g

src=add32

default all:$(src).bin

$(src).o:$(src).s
	$(AS) $(CPU) $(AS_FLAGS) -o $@ $<

$(src).elf:$(src).o 
	$(LD) -T $(src).lds -o $@ $<

$(src).bin: $(src).elf
	$(OBJCOPY) $(OBJCOPY_FLAGS) $< $@

clean:
	-rm -f *.o *.elf *.bin


