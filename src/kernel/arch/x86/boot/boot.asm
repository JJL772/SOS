;=======================================
; boot.asm
; boots the computer and sets up the
; processor
;=======================================
[BITS 32]

%include "common.asm"

;Entry point
global _boot

;==================================
;External symbols
extern os_setup_fpu
extern os_setup_fpu_em
extern os_bootloader_type
extern os_cpuid_data
extern os_cpuid_vendor
extern os_multiboot_ptr
extern os_select_cs_segment
extern os_select_ds_segment
extern os_setup_gdt
extern os_setup_idt
extern os_init_kernel_stack
;==================================

section .stack

	;16kb stack for simple calls to and from C and other assembly instructions
	stack_bottom:
		resb 16384
	stack_top:

section .bootbss
	cpu_vendor_name: resb 12
	cpu_brand_index: resb 1
	;cpu_features: resb 28 ;Array of processor features, 28 bytes
	cpu_features: 	resb 	20 	;New array of processor features, 20 bytes
	cpu_vendor:		resb	4	;CPU vendor, 32-bit enum

section .boot
	align 4


	_boot:
		cli ;disable all interrupts for crtitical section of boot, should already be disabled

		mov DWORD eax, 0xB8000
		mov WORD [eax], 0xFFAA

		; Save multiboot stuff, ASAP
		cmp eax, 0x2BADB002
		mov BYTE [os_bootloader_type], EBOOTLOADER_UNSPECIFIED
		jne .CONT

		mov DWORD [os_multiboot_ptr], ebx
		mov BYTE [os_bootloader_type], EBOOTLOADER_MULTIBOOT

	.CONT:
		;setup a basic stack for some simple calls
		mov esp, stack_top

		call os_setup_gdt ; Setup gdt

		call os_setup_idt ; setup idt

		; Select active segments
		push DWORD MAKE_GDT_SEGMENT_SELECTOR(KERNEL_DATA_SEGMENT_INDEX, 0)
		call os_select_ds_segment

		push DWORD MAKE_GDT_SEGMENT_SELECTOR(KERNEL_CODE_SEGMENT_INDEX, 0)
		call os_select_cs_segment

	.GENERAL_SETUP:
		mov eax, 1
		cpuid 
	
		test edx, 0
		jz .FPU_EMULATION
		call os_setup_fpu
		jmp .APIC_TEST

	.FPU_EMULATION:
		call os_setup_fpu_em

	.APIC_TEST:
		; test for apic
		test edx, 9
		jnz .APIC_SETUP
		
	.FXSAVE_TEST:
		; test for fxsave/fxrestor
		test edx, 24
		jz .FXSAVE_TEST

		mov eax, CR0_PG_MASK | CR0_NE_MASK
		mov ebx, cr0
		or eax, ebx
		mov cr0, eax

		mov eax, CR4_OSXSAVE_MASK | CR4_UMIP_MASK | CR4_OSXMMEXCPT_MASK | CR4_OSFXSR_MASK | CR4_PCE_MASK | CR4_MCE_MASK
		mov ebx, cr4
		or eax, ebx
		mov cr4, eax

		


	.APIC_SETUP:
	
	.ENABLE_TASKSW:
		jmp .ENABLE_TASKSW ;dummy

