;------------------
;A 64 bit assembly function that return maximum of three 64 bit integer
; function protoype is int64_t maxofthree(int64_t x, int64_t y, int64_t z)
; parameters are placed in rdi, rsi and rdx 
; return value in rax
; nasm -felf64 maxofthree.asm
; gcc main.c maxofthree.o
; ./a.out
;-------------------

	global	maxofthree
	section	.text
maxofthree:
	mov 	rax, rdi
	cmp	rax, rsi
	cmovl	rax, rsi
	cmp	rax, rdx
	cmovl	rax, rdx
	ret 
