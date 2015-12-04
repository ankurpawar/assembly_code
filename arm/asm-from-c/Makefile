TOOLCHAIN=arm-none-eabi

CC=$(TOOLCHAIN)-gcc
AS=$(TOOLCHAIN)-as
OBJCOPY=$(TOOLCHAIN)-objcopy
OBJCOPY_FLAGS=-O binary
CFLAGS=-nostdlib

src=sum
asm_src=startup func

default: $(src).bin

all:default bin

startup.o: startup.s
	$(AS) -o $@ $<
 
func.o : func.s
	$(AS) -o $@ $<

sum.o : sum.c
	$(CC) $(CFLAGS) -c $<

$(src).elf : sum.o func.o startup.o
	$(CC) $(CFLAGS) -o $@ -T sum.lds sum.o func.o startup.o

$(src).bin : $(src).elf
	$(OBJCOPY) $(OBJCOPY_FLAGS) $< $@

bin:
	-dd if=/dev/zero of=flash.bin bs=4096 count=4096
	-dd if=sum.bin of=flash.bin bs=4096 conv=notrunc

clean:
	-rm -f *.o *.elf *.bin


