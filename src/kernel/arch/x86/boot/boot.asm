;=======================================
; boot.asm
; boots the computer and sets up the
; processor
;=======================================
[BITS 32]

%include "common.asm"

;Entry point
global _start

;==================================
;External symbols
extern IVYBRIDGE_SETUP
extern CANNONLAKE_SETUP
extern COFFEELAKE_SETUP
extern KABYLAKE_SETUP
extern SKYLAKE_SETUP
extern BROADWELL_SETUP
extern HASWELL_SETUP
extern SANDYBRIDGE_SETUP
extern WESTMERE_SETUP
extern NEHALEM_SETUP
extern PENRYN_SETUP
extern CORE_SETUP
extern MOD_PENTIUMM_SETUP
extern PENTIUMM_SETUP
extern P6_SETUP
extern I486_SETUP
extern I386_SETUP
extern FPU_SETUP
extern os_bootloader_type
extern os_cpuid_data
extern os_cpuid_vendor
extern os_multiboot_ptr
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

		; Save multiboot stuff, ASAP
		cmp eax, 0x2BADB002
		je .MULTIBOOT
		jmp .CONT
		mov BYTE [os_bootloader_type], EBOOTLOADER_UNSPECIFIED

	.MULTIBOOT:
		mov DWORD [os_multiboot_ptr], ebx
		mov BYTE [os_bootloader_type], EBOOTLOADER_MULTIBOOT

	.CONT:

		;setup the stack
		mov esp, stack_top

		xor eax, eax

		call os_setup_gdt ; Setup gdt

		call os_setup_idt ; setup idt

		; Select active segments
		push DWORD MAKE_GDT_SEGMENT_SELECTOR(KERNEL_DATA_SEGMENT_INDEX, 0)
		call os_select_ds_segment

		push DWORD MAKE_GDT_SEGMENT_SELECTOR(KERNEL_CODE_SEGMENT_INDEX, 0)
		call os_select_cs_segment

	.GENERAL_SETUP:
		;Perform FPU setup tasks
		call FPU_SETUP

		;		   CR0.PG: Enables paging
		;		   |							   CR0.NE: Enables native method of FPU error reporting (the good method)
		;		   |							   |  | 
		;		   |							   |  | 
		;		   v							   v  v 
		;mov eax, 0b1000_0000_0000_0000_0000_0000_0010_0000

		mov eax, CR0_PG_MASK | CR0_NE_MASK
		mov ebx, cr0
		or eax, ebx
		mov cr0, eax

		;
		;						   CR4.OSXSAVE: Enables XSAVE/XRESTOR instructions
		;						   |		CR4.UMIP: Disables use of certain instructions like SGDT in usermode
		;						   |		|CR4.OSXMMEXCPT: Enables exception handling for SIMD extensions
		;						   |        ||CR4.OSFXSR: Enables the use of FXSAVE and FXRESTOR
		;						   |        |||CR4.PCE: Enables the use of RDPMC instruction
		;						   |        |||| CR4.PGE: Sets frequently used pages as global for all users
		;						   |		|||| |CR4.MCE: Enables machine-check features
		;						   |        |||| ||CR4.PAE: Enables physical address extensions
		;						   |		|||| |||     CR4.VME: Enables virtual-8086-mode extensions
		;						   |        |||| |||	 |
		;						   v 		vvvv vvv	 v
		;mov eax, 0b0000_0000_0000_0100_0000_1111_1110_0001

		mov eax, CR4_OSXSAVE_MASK | CR4_UMIP_MASK | CR4_OSXMMEXCPT_MASK | CR4_OSFXR_MASK | CR4_PCE_MASK | CR4_MCE_MASK
		mov ebx, cr4
		or eax, ebx
		mov cr4, eax

		


		

	.ENABLE_TASKSW:
		jmp .ENABLE_TASKSW ;dummy

	_EnableAVX512:
		;Nothing

	_EnableSIMD:
		;Nothing
