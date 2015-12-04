	.global func
	.text
	.type func, #function
func:
	push	{r7}		@ (str r7, [sp, #-4]!)
	sub	sp, sp, #8
	mov	r7, sp
	str	r0, [r7, #8]
	str	r1, [r7, #4]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	add	r2, r2, r3
	mov	r0, r2
	add	r7, r7, #8
	mov	sp, r7
	pop	{r7}		@ (ldr r7, [sp], #4)
	bx	lr
