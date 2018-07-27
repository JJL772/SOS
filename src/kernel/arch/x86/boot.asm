;=======================================
; boot.asm
; boots the computer and sets up the 
; processor
;=======================================

global _start

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

section .bss

	;4kb stack for simple calls to and from C and other assembly instructions
	stack_bottom:
		resb 4096
	stack_top:

	cpu_vendor_name: resb 12
	cpu_brand_index: resb 1
	cpu_features: resb 28 ;Array of processor features, 28 bytes

section .data

section .text
	align 4


	_start:
		;setup the stack
		mov esp, stack_top
	
		;Gather various CPUID info
		mov eax, 0
		cpuid

		mov DWORD [esp-4], ebx
		mov DWORD [cpu_vendor_name], ebx
		mov DWORD [cpu_vendor_name+4], ecx
		mov DWORD [cpu_vendor_name+8], edx

		mov eax, 1
		cpuid
		
		mov DWORD [cpu_brand_index], ebx
		mov DWORD [cpu_features], ecx
		mov DWORD [cpu_features+4], edx
		
		mov eax, 7
		mov ecx, 0
		cpuid

		mov DWORD [cpu_features+8], ebx
		mov DWORD [cpu_features+12], ecx
		mov DWORD [cpu_feautres+16], edx

		mov eax, 80000001h
		cpuid

		mov DWORD [cpu_features+20], ecx
		mov DWORD [cpu_features+24], edx

		;Generates a unique value for each vendor
		;Intel = [esp-8] = 1870622589
		;AMD = [esp-8] = 1736408429
		;VMWARE = [esp-8] = 2003662701
		;MS VIRTUAL PC = [esp-8] = 2138795894
		mov eax, [esp-4]
		or eax, [cpu_vendor_name+4]
		or eax, [cpu_vendor_name+8]
		cmp eax, 1870622589
		je .INTEL
		cmp eax, 1736408429
		je .AMD
		cmp eax, 2003662701
		je .VMWARE
		cmp eax, 2138795894
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



		
	_EnableAVX512:
		;Nothing

	_EnableSIMD:
		;Nothing