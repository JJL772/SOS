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
	;cpu_features: resb 28 ;Array of processor features, 28 bytes
	cpu_features: 	resb 	20 	;New array of processor features, 20 bytes
	cpu_vendor:		resb	4	;CPU vendor, 32-bit enum

section .boot
	align 4


	_boot:
		;setup the stack
		mov esp, stack_top

		xor eax, eax

		;///////////////////////////////////
		; BEGIN CPU FEATURES
		;///////////////////////////////////

		;First is EAX = 0
		mov eax, 0 
		cpuid

		mov DWORD [cpu_features], edx
		mov DWORD [cpu_features+4], ecx
		
		mov eax, 7
		mov DWORD [cpu_features+8], ebx
		mov DWORD [cpu_features+12], ecx
		mov DWORD [cpu_features+16], edx
		;///////////////////////////////////
		; END CPU FEATURES
		;///////////////////////////////////

		;Quickly get the basic CPU features (this relative to a specific arch)
		;TODO: FIX FOR AMD PROCESSORS
		;cmp eax, 1736408429
		;cmove eax, 80000001h
		;cmovne eax, 1

		;///////////////////////////////////
		; BEGIN VENDOR NAME STUFF
		;///////////////////////////////////
		;Move enum value, 32-bit, cmove

		;Get vendor name
		mov DWORD [esp-4], ebx
		mov DWORD [esp-8], ecx
		mov DWORD [esp-12], edx

		;Form unique signature for CPU vendors
		or [esp-4], [esp-8]
		or [esp-4], [esp-12]

		;INTEL
		cmp [esp-4], 0x7d6f7f6f
		cmove [cpu_vendor], 0
		je .INTEL
		
		;AMD1
		cmp [esp-4], 0x7d776f77
		je .AMD

		;AMD2
		cmp [esp-4], 0x6d7d7f67
		je .AMD

		;CENTAUR
		cmp [esp-4], 0x7f7e7563
		je .CENTAUR

		;CYRIX
		cmp [esp-4], 0x7f7f7d7f
		je .CYRIX

		;HYGON
		cmp [esp-4], 0x6f6f7f7f
		je .HYGON

		;TRANSMETA
		cmp [esp-4], 0x7f757f77
		je .TRANSMETA

		;TRANSMETA AGAIN
		cmp [esp-4], 0x777f7f6f
		je .TRANSMETA

		;NATIONAL SEMICONDUCTOR
		cmp [esp-4], 0x7f7f6f67
		je .NATIONAL

		;NEXGEN
		cmp [esp-4], 0x7f7d7f6f
		je .NEXGEN

		;RISE 
		cmp [esp-4], 0x65736952
		je .RISE

		;SIS 
		cmp [esp-4], 0x20536953
		je .SIS

		;UMC
		cmp [esp-4], 0x20434d55
		je .UMC

		;VIA
		cmp [esp-4], 0x20414956
		je .VIA

		;Vortex
		cmp [esp-4], 0x777f7f77
		je .VORTEX

		;KVM 
		cmp [esp-4], 0x7f6f7f5f
		je .KVM

		;BHYVE
		cmp [esp-4], 0x7e7f7e7f
		je .BHYVE

		;HYPERV
		cmp [esp-4], 0x766f7b7f
		je .HYPERV

		;PARALLELS
		cmp [esp-4], 0x787b7e65
		je .PARALLELS

		;VMWARE
		cmp [esp-4], 0x6d776d77
		je .VMWARE

		;XEN
		cmp [esp-4], 0x7f7f7f7f
		je .XEN

		mov [cpu_vendor], 19
		jmp .GENERAL_SETUP
		;///////////////////////////////////
		; END VENDOR NAME STUFF
		;///////////////////////////////////

	.INTEL:
		mov DWORD [cpu_vendor], 1
		jmp .GENERAL_SETUP

	.AMD:
		mov DWORD [cpu_vendor], 2
		jmp .GENERAL_SETUP

	.CENTAUR:
		mov DWORD [cpu_vendor], 2
		jmp .GENERAL_SETUP

	.CYRIX:
		mov DWORD [cpu_vendor], 3
		jmp .GENERAL_SETUP

	.HYGON:
		mov DWORD [cpu_vendor], 4
		jmp .GENERAL_SETUP

	.TRANSMETA:
		mov DWORD [cpu_vendor], 5
		jmp .GENERAL_SETUP

	.NATIONAL:
		mov DWORD [cpu_vendor], 6
		jmp .GENERAL_SETUP

	.NEXGEN:
		mov DWORD [cpu_vendor], 7
		jmp .GENERAL_SETUP

	.RISE:
		mov DWORD [cpu_vendor], 8
		jmp .GENERAL_SETUP

	.SIS:
		mov DWORD [cpu_vendor], 9
		jmp .GENERAL_SETUP

	.UMC:
		mov DWORD [cpu_vendor], 10
		jmp .GENERAL_SETUP

	.VIA:
		mov DWORD [cpu_vendor], 11
		jmp .GENERAL_SETUP

	.VORTEX:
		mov DWORD [cpu_vendor], 12
		jmp .GENERAL_SETUP

	.KVM:
		mov DWORD [cpu_vendor], 13
		jmp .GENERAL_SETUP

	.BHYVE:
		mov DWORD [cpu_vendor], 14
		jmp .GENERAL_SETUP

	.HYPERV:
		mov DWORD [cpu_vendor], 15
		jmp .GENERAL_SETUP

	.PARALLELS:
		mov DWORD [cpu_vendor], 16
		jmp .GENERAL_SETUP

	.VMWARE:
		mov DWORD [cpu_vendor], 17
		jmp .GENERAL_SETUP

	.XEN:
		mov DWORD [cpu_vendor], 18
		jmp .GENERAL_SETUP

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
		push DWORD [cpu_vendor]
		push DWORD [cpu_features]
		push DWORD [cpu_features+4]
		push DWORD [cpu_features+8]
		push DWORD [cpu_features+12]
		push DWORD [cpu_features+16]
		call FPU_SETUP

		;Setup Caches
		; CR0.CD = 0, CR0.NW = 0
		mov eax, cr0
		btc eax, 30
		btc eax, 29
		mov cr0, eax

		;Configure TS flag in CR0
		mov eax, cr0		
		xor eax, 0b0110_0000_0000_0000_0000_0000_0000_0000
		test DWORD [cpu_features], 0x1
		cmove cr0, eax

		

	.ENABLE_TASKSW:
		jmp .ENABLE_TASKSW ;dummy

	_EnableAVX512:
		;Nothing

	_EnableSIMD:
		;Nothing
