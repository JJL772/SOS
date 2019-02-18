;
; Paging.asm
;
; Paging utility procedures, mainly used during initialization
;
%include "common.asm"

;===============================
; Externals
extern os_kernel_pagetbl
;===============================

section .boot

	os_setup_paging:
		push ebp
		mov ebp, esp

		

		pop ebp
		retf