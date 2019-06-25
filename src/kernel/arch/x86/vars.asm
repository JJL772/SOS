;
; vars.asm
;
; Variable defs
;

global os_bootloader_type
global os_cpuid_vendor
global os_cpuid_data
global os_multiboot_data
global os_multiboot_ptr
global os_idt_descriptor

;Boot data
section .bootbss
	os_bootloader_type:		resb	1	; Type of bootloader used to load OS
	os_cpuid_vendor:		resb	2	; Vendor of the processor
	os_cpuid_data:			resb	32  ; All CPUID data
	os_multiboot_data:		resb	116 ; Multiboot data
	os_multiboot_ptr:		resd	1	; Pointer to multiboot data
	os_idt_descriptor:		resb	6 	; Descriptor to be loaded into IDTR
	os_enabled_features:	resd	1	; Enabled features by the OS
