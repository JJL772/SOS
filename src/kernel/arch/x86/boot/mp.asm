;
;
; Multiprocessor initialization routines
;
;

section .text

	;
	; Initializes the other processors
	;
	mp_init:
		mov eax, 1
		cpuid
		
		test edx, 28
		jz .NOMP

	.NOMP:	
		ret		
