;
; idt.asm
;
; Setup for Interrupt vector table IVT or IDT
;

section .

section .boot

	; Sets up the IDT
	; Note: Leaves interrupts disabled
	os_setup_idt:
		push ebp
		mov ebp, esp

		cli ;halt interrupts

		

		pop ebp

		retf