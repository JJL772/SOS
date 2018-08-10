;================================
; fpu_setup.asm
;
; Desc: Handles the setup of the
; x87 FPU
;================================
[BITS 32]

;Exported functions
global FPU_SETUP

section .boot

	;FPU_SETUP(feature_bits1, feature_bits2, extended_features1, extended_features2, extended_features3)
	FPU_SETUP:
		test feature_bits1, 0x1
		call EMULATION

	EMULATION:
		;Setup FPU emulation
		push ebp
		mov esp, ebp

		;Set EM=1, NE=1, MP=0
		mov eax, cr0
		btr eax, 0x1
		or eax, 0b0000_0000_0000_0000_0000_0000_0010_0100
		mov cr0, eax
		;Emulation is now enabled, FPU exceptions will be thrown when FPU instructions are executed,

		pop ebp
		ret
