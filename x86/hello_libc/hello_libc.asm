;----
;write hola, mundo  to the consoel using c library.
;runs on linux and any other system that does not use under
;score for the symbols in its c library.
;nasm -felf46 hello_clib.asm
;gcc hello_clib.o
;./a.out
;----

	global main
	extern puts

	section .text
main: 				;this is called by c lib startup code
	mov 	rdi, message	;first integer or pointer argument in rdi
	call 	puts		;puts(message)
	ret			;return back to c lib wrapper
message:
	db	"Hola, mundo", 0 ;terminate string with 0 in C
