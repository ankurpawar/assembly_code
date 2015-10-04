;----
; http://cs.lmu.edu/~ray/notes/nasmtutorial/
; A 64 bit linux application that writes the first 90 fibonacci number 
; nasm -felf464 fib.asm
; gcc fb.o
; ./a.out
;----

	global main
	extern printf

main:
	push 	rbx		; we have to save it since we use it
	
	mov	ecx, 90		; ecx will count down to 0
	xor	rax, rax	; rax will hold the current number
	xor	rbx, rbx	; rbx will hold the next number
	inc 	rbx		; rbx is originally 1

print:
	; we need to call printf, but we are using rax, rbx, and rcx
	; printf may destroy rax and rcx so we will save these before
	; the call and restore them afterwards.

	push	rax		; caller-save register
	push	rcx		; caller-save register
	
	mov	rdi, format	; set 1st parameter
	mov	rsi, rax	; set 2nd parameter
	xor	rax, rax	; because printf is varargs

	;stack is already aligned because we pushed three 8 byte regiters
	call 	printf		; printf(format, current_number)
	
	pop	rcx		; restore caller-save register
	pop	rax		; restore caller-save register
	
	mov	rdx, rax	; save the current number
	mov	rax, rbx	; get the new number
	add	rbx, rdx	; get the next number
	dec	ecx		; count down
	jnz	print		; if not done counting, do some more

	pop	rbx		; restore rbx before returning
	ret
format:
	db	"%20ld", 10, 0	; newline and null at the end of format string
