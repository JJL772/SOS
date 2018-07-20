;=========================================================
; Name: cpuid.asm
; Purpose: Implements a CPUID function
; Author: Jeremy L.
;=========================================================

section .data

section .text

	ASM_LoadGDT:
		;Pops our single parameter into the data register
		pop edx

		;Loads the GDT into the input parameter
		lgdt DWORD [edx]

		ret