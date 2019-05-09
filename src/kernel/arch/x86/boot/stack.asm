;
;
; stack.asm
; Stack setup routines
;
;
[BITS 32]

global os_init_kernel_stack

section .text
	
	;
	; eax - stack bottom
	; ebx - stack size
	;
	os_init_kernel_stack:
		retf
		
