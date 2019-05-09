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

	os_setup_fpu:
		push ebp
		mov esp, ebp

		;Obtain processor details
		mov eax, 1
		cpuid

		;Test and see if the processor has an onboard FPU
		test DWORD edx, 0x1
		jz .NOFPU
		jmp .FPU

	.FPU:
		;Enable FPU if applicable.
		; MP = 0, NE = 0, EM = 0
		mov eax, cr0
		btc eax, 1
		btc eax, 2
		btc eax, 5
		mov cr0, eax
		jmp .END
		
	.NOFPU:
		;Set EM=1, NE=1, MP=0
		mov eax, cr0
		btc eax, 1
		bts eax, 2
		bts eax, 5
		mov cr0, eax
		;Emulation is now enabled
		jmp .END

	.END:
		;Retore & return
		pop ebp
		ret

	os_setup_fpu_em:
		ret
