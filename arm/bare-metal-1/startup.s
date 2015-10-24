	.section INTERRUPT_VECTOR, "x" @ x for executable code
	.global _Reset
_Reset:
	B Reset_Handler	@ reset
	B .		@ undefined
	B .		@ SWI
	B .		@ Prefetch abort
	B .		@ Data abort
	B .		@ reserved
	B .		@ IRQ
	B .		@ FIQ
Reset_Handler:
	LDR sp, =stack_top
	BL  start
	B   .
