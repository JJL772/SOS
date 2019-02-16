;
; gdt.asm
;
; Routines for modifying the GDT
;

%include "common.asm"

; Globals
global os_select_segment
global os_setup_gdt
;global os_gdt_base
extern os_gdt_base
extern os_gdt_limit

;section .gdt
;	os_gdt_base:	resb	40

section .bootbss
	gdt_info:		resb	gdt_info_32_t_size

section .boot

	; Sets up the 
	os_setup_gdt:
		push ebp
		mov ebp, esp

		; First descriptor should be 0
		mov QWORD [os_gdt_base], 0

		mov eax, os_gdt_base

		; Set up kernel data segment
		mov WORD [eax+8], 	0xFFFF
		mov WORD [eax+12], 	0x0
		mov BYTE [eax+16], 	0x0
		mov BYTE [eax+17], 	0b10010010
		mov BYTE [eax+18], 	0b11001111
		mov BYTE [eax+19],	0x0

		mov DWORD eax, [eax+20]

		; Set up kernel code segment
		mov WORD [eax+8], 	0xFFFF
		mov WORD [eax+12], 	0x0
		mov BYTE [eax+16], 	0x0
		mov BYTE [eax+17], 	0b10011010
		mov BYTE [eax+18], 	0b11001111
		mov BYTE [eax+19],	0x0

		mov DWORD eax, [eax+20]

		; Set up user data segment
		mov WORD [eax+8], 	0xFFFF
		mov WORD [eax+12], 	0x0
		mov BYTE [eax+16], 	0x0
		mov BYTE [eax+17], 	0b11110010
		mov BYTE [eax+18], 	0b11001111
		mov BYTE [eax+19],	0x0

		mov DWORD eax, [eax+20]

		; Set up user code segment
		mov WORD [eax+8], 	0xFFFF
		mov WORD [eax+12], 	0x0
		mov BYTE [eax+16], 	0x0
		mov BYTE [eax+17], 	0b11111010
		mov BYTE [eax+18], 	0b11001111
		mov BYTE [eax+19],	0x0

		; Configure the info structure
		push DWORD os_gdt_base
		pop	 DWORD [gdt_info + gdt_info_32_t.base]

		; 40 bytes is max size of gdt
		push WORD 40
		pop	 WORD [gdt_info + gdt_info_32_t.limit]

		lgdt [gdt_info]

		pop ebp

		retf

	; SS = 0b0000_0001
	; DS = 0b0000_0010
	; CS = 0b0000_0100
	; void os_select_segment(BYTE segreg, WORD descriptor)
	os_select_segment:
		push ebp
		mov ebp, esp

		test BYTE [ebp], 0x1
		jnz .SS
		test BYTE [ebp], 0x2
		jnz .DS
		test BYTE [ebp], 0x3
		jnz .CS
		jmp .END

	.DS
		mov WORD ds, [ebp-1]
		jmp .END

	.CS
		mov WORD cs, [ebp-1]
		jmp .END
	
	.SS
		mov WORD ss, [ebp-1]
		jmp .END

	.END
		pop ebp

		retf