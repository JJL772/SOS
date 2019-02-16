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



		
	.ERR
		pop ebp
		push 0x0
		retf

	.END
		pop ebp
		push 0x1
		retf