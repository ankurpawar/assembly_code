;----
;Writes hello world to the console using only system call
;Linux 64 bit only
;to assemble nasm -felf hello.asm 
; to link ld hello.o
;to run ./a.out
;---

	global _start

	section .text
_start:
	;write(1, message, 13)
	mov	rax, 1		;system call 1 is write
	mov	rdi, 1		;file handle 1 is stdout
	mov	rsi, message	;address of string to output
	mov	rdx, 13		;number of bytes
	syscall			;invoking os to do write

	; exit(0)
	mov	eax, 60		;system call 60 is exit
	xor	rdi, rdi	;exit code 0
	syscall			;invoke os to exit
message:
	db	"Hello world",10	;newline at the end
