;=======================================
; boot.asm
; boots the computer and sets up the
; processor
;=======================================
[BITS 32]

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
;==================================

section .stack

	;16kb stack for simple calls to and from C and other assembly instructions
	stack_bottom:
		resb 16384
	stack_top:

section .bootbss
	cpu_vendor_name: resb 12
	cpu_brand_index: resb 1
	cpu_features: resb 28 ;Array of processor features, 28 bytes

section .bss
	cpu_features: 	resb 	20 	;New array of processor features, 20 bytes
	cpu_vendor:		resb	4	;CPU vendor, 32-bit enum

section .boot
	align 4


	_boot:
		;setup the stack
		mov esp, stack_top

		xor eax, eax

		;Gather various CPUID info
		mov eax, 0
		cpuid

		;Get vendor name
		mov DWORD [esp-4], ebx
		mov DWORD [esp-8], ecx
		mov DWORD [esp-12], edx

		;Form unique signature for CPU vendors
		or [esp-4], [esp-8]
		or [esp-4], [esp-12]

		;Compare and set cpu_vendor, 32-bit enum

		;INTEL
		cmp [esp-4], 0x7d6f7f6f
		cmove [cpu_vendor], 0
		
		;AMD1
		cmp [esp-4], 0x7d776f77
		cmove [cpu_vendor], 1

		;AMD2
		cmp [esp-4], 0x6d7d7f67
		cmove [cpu_vendor], 1

		;CENTAUR
		cmp [esp-4], 0x7f7e7563
		cmove [cpu_vendor], 2

		;CYRIX
		cmp [esp-4], 0x7f7f7d7f
		cmove [cpu_vendor], 3

		;HYGON
		cmp [esp-4], 0x6f6f7f7f
		cmove [cpu_vendor], 4

		;TRANSMETA
		cmp [esp-4], 0x7f757f77
		cmove [cpu_vendor], 5

		;TRANSMETA AGAIN
		cmp [esp-4], 0x777f7f6f
		cmove [cpu_vendor], 5

		;NATIONAL SEMICONDUCTOR
		cmp [esp-4], 0x7f7f6f67
		cmove [cpu_vendor], 6

		;NEXGEN
		cmp [esp-4], 0x7f7d7f6f
		cmove [cpu_vendor], 7

		;RISE 
		cmp [esp-4], 0x65736952
		cmove [cpu_vendor], 8

		;SIS 
		cmp [esp-4], 0x20536953
		cmove [cpu_vendor], 9

		;Implement later. yea.
		
		mov eax, 7
		mov ecx, 0
		cpuid

		mov DWORD [cpu_features+8], ebx ;extended_features1
		mov DWORD [cpu_features+12], ecx ;extended_features2
		mov DWORD [cpu_feautres+16], edx ;extended_features3

		mov eax, 80000001h
		cpuid

		mov DWORD [cpu_features+20], edx
		mov DWORD [cpu_features+24], ecx

		;Generates a unique value for each vendor
		;Intel = [esp-8] = 1870622589
		;AMD = [esp-8] = 1736408429
		;VMWARE = [esp-8] = 2003662701
		;MS VIRTUAL PC = [esp-8] = 2138795894
		mov eax, [esp-4]
		or eax, [cpu_vendor_name+4]
		or eax, [cpu_vendor_name+8]

		;Quickly get the basic CPU features (this relative to a specific arch)
		cmp eax, 1736408429
		cmove eax, 80000001h
		cmovne eax, 1

		cpuid

		mov [cpu_brand_index], ebx
		mov DWORD [cpu_features], edx ;feature_bits1
		mov DWORD [cpu_features+4], ecx ;feature_bits2

		;Issue jmps to setup areas
		cmp eax, 1870622589 ;Intel
		cmove eax, 1
		je .INTEL

		cmp eax, 1736408429 ;AMD
		cmove eax, 80000001h
		je .AMD

		cmp eax, 2003662701 ;VMWARE
		cmove eax, 1
		je .VMWARE

		cmp eax, 2138795894 ;MSVPC
		cmove eax, 1
		je .MSVPC

		jmp .GENERAL_SETUP

	.INTEL:

	.CANNONLAKE:
		call CANNONLAKE_SETUP
		jmp .GENERAL_SETUP
	.COFFEELAKE:
		call COFFEELAKE_SETUP
		jmp .GENERAL_SETUP
	.KABYLAKE:
		call KABYLAKE_SETUP
		jmp .GENERAL_SETUP
	.SKYLAKE:
		call SKYLAKE_SETUP
		jmp .GENERAL_SETUP
	.BROADWELL:
		call BROADWELL_SETUP
		jmp .GENERAL_SETUP
	.HASWELL:
		call HASWELL_SETUP
		jmp .GENERAL_SETUP
	.IVYBRIDGE:
		call IVYBRIDGE_SETUP
		jmp .GENERAL_SETUP
	.SANDYBRIDGE:
		call SANDYBRIDGE_SETUP
		jmp .GENERAL_SETUP
	.WESTMERE:
		call WESTMERE_SETUP
		jmp .GENERAL_SETUP
	.NEHALEM:
		call NEHALEM_SETUP
		jmp .GENERAL_SETUP
	.PENRYN:
		call PENRYN_SETUP
		jmp .GENERAL_SETUP
	.CORE:
		call CORE_SETUP
		jmp .GENERAL_SETUP
	.MOD_PENTIUMM:
		call MOD_PENTIUMM_SETUP
		jmp .GENERAL_SETUP
	.PENTIUMM:
		call PENTIUMM_SETUP
		jmp .GENERAL_SETUP
	.P6:
		call P6_SETUP
		jmp .GENERAL_SETUP
	I486:
		call I486_SETUP
		jmp .GENERAL_SETUP
	I386:
		call I386_SETUP
		jmp .GENERAL_SETUP


	.AMD:
		jmp .GENERAL_SETUP
	.VMWARE:
		jmp .GENERAL_SETUP
	.MSVPC:
		jmp .GENERAL_SETUP


	.GENERAL_SETUP:
		;Perform all setup tasks here
		;FPU_SETUP(feature_bits1, feature_bits2, extended_features1, extended_features2, extended_features3)
		push [cpu_features]
		push [cpu_features+4]
		push [cpu_features+8]
		push [cpu_features+12]
		push [cpu_features+16]
		call FPU_SETUP



	_EnableAVX512:
		;Nothing

	_EnableSIMD:
		;Nothing
