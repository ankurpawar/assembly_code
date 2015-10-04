;----------------------
;A 64 bit assembly program to display its command line arguments
;one per line, on entry rdi will conatin argc and rsi will contain
;argv
; nasm -felf64 command_line_args.asm
; gcc command_line_args.o
; ./a.out
;----------------------

	global main
	extern puts
	section .text
main:
	push 	rdi		;save the registers that puts uses
	push 	rsi
	sub	rsp, 8		;align the stack before call

	mov	rdi, [rsi]	;argv[] as argument for puts
	call	puts

	add	rsp, 8		;restore %rsp to pre-aligned value
	pop	rsi		;restore register puts used
	pop	rdi

	add	rsi, 8		;point to next argument in argv[]
	dec	rdi		;count down
	jnz	main		;if not done continue the printing

	ret
