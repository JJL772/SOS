;
; vars.asm
;
; Variable defs
;

;Boot data
section .bootbss
	os_bootloader_type:		resb	1	; Type of bootloader used to load OS
	os_cpuid_vendor:		resb	2	; Vendor of the processor
	os_cpuid_data:			resb	32  ; All CPUID data
	os_multiboot_data:		resb	116 ; Multiboot data
	