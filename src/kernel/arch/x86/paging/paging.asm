;
; paging.asm
;
; Paging procs that are better off implemented in assembly
;

global os_flush_tlb

section .text

	os_flush_tlb:
		mov eax, cr0
		mov cr0, eax
		ret
