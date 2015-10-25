	.section "vectors"
reset:	b	start
undef:	b	undef
swi:	b	swi
pabt:	b	pabt
dabt:	b	dabt
	nop
irq:	b	irq
fiq:	b	fiq

	.text
	@ copy data to ram
start:
	ldr	r0, =flash_data
	ldr	r1, =ram_sdata
	ldr	r2, =data_size

	@ handle data_size == 0, if data section has nothing jump to bss init
	cmp	r2, #0
	beq	init_bss
copy:
	ldrb	r4, [r0], #1
	strb	r4, [r1], #1
	subs	r2, r2, #1
	bne	copy

	@ initialize .bss
init_bss:
	ldr	r0, =sbss
	ldr	r1, =ebss
	ldr	r2, =bss_size

	@ if bss section has nothing then jump to stack init
	cmp	r2, #0
	beq	init_stack

	mov	r4, #0
zero:
	strb	r4, [r0], #1
	subs	r2, r2, #1
	bne	zero

	@ initialize stack pointer
init_stack:
	ldr	sp, =0xA4000000

	bl main
stop:	b	stop
