;=======================================
; boot.asm
; boots the computer and sets up the 
; processor
;=======================================

global _start

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

		;Generates a unique value for each vendor
		;Intel = [esp-8] = 1870622589
		;AMD = [esp-8] = 1736408429
		;VMWARE = [esp-8] = 2003662701
		;MS VIRTUAL PC = [esp-8] = 2138795894
		or [esp-4], [cpu_vendor_name+4]
		or [esp-4], [cpu_vendor_name+8]
		cmp [esp-4], 1870622589
		je .INTEL
		cmp [esp-4], 1736408429
		je .AMD
		cmp [esp-4], 2003662701
		je .VMWARE
		cmp [esp-4], 2138795894
		je .MSVPC
		jmp .GENERAL_SETUP

	.INTEL:
		
	.IVYBRIDGE

	.SANDYBRIDGE

	.WESTMERE

	.NEHALEM


	.AMD:
		
	.VMWARE:
		
	.MSVPC:
		



		
	_EnableAVX512:
		;Nothing

	_EnableSIMD:
		;Nothing