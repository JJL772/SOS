;
; idt.asm
;
; Setup for Interrupt vector table IVT or IDT
;

%include "common.asm"

;=========================================;
; External ivt procs
extern ivt_gp
extern ivt_ac
extern ivt_bp
extern ivt_br
extern ivt_db
extern ivt_de
extern ivt_df
extern ivt_mc
extern ivt_mf
extern ivt_nm
extern ivt_of
extern ivt_pf
extern ivt_sys
extern ivt_ts
extern ivt_ud
extern ivt_ve
extern ivt_xm
extern os_idt_base
extern os_idt_limit
;=========================================;

;global os_idt_base
global os_setup_idt

;section .idt
;	os_idt_base:	resb	2048 ;1kb ivt


section .boot

	; Sets up the IDT
	; Will return false if interrupts are enabled
	os_setup_idt:
		push ebp
		mov ebp, esp

		test eflags, 0x200
		jnz .ERR

		
	.ERR:
		pop ebp
		push 0x0
		retf

	.END:
		pop ebp
		push 0x1
		retf

	; QWORD os_create_int_gate(WORD seg_selector, DWORD fnptr)
	os_create_int_gate:
		push ebp
		mov ebp, esp

		mov DWORD ecx, [ebp-4]
		mov WORD edx, [ebp-8]

		mov eax, [ebp-32]
		mov WORD [eax], cx
		mov WORD [eax+2], edx
		mov BYTE [eax+4], 0
		mov BYTE [eax+5], 0b10001110
		mov WORD [eax+6], [ebp-8]

		pop ebp
		mov ecx, eax
		mov DWORD eax, [eax]
		mov DWORD edx, [eax+4]
		retf

	; QWORD os_create_trap_gate(WORD seg_selector, DWORD fnptr)
	os_create_trap_gate:
		push ebp
		mov ebp, esp


		pop ebp
		retf
