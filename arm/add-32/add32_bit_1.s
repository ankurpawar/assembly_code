	.text

	.globl _start
_start:
	mov	r0, #5		@r0 = 5
	mov	r1, #4		@r1 = 4		
	add	r2, r1, r0	@r2 = r1 + r0
endhere:	
	b endhere		@infinite loop
