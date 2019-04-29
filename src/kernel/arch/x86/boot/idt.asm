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
extern ivt_ss
extern ivt_np
extern os_idt_base
extern os_idt_limit
extern os_idt_descriptor
;=========================================;

;global os_idt_base
global os_setup_idt

;section .idt
;	os_idt_base:	resb	2048 ;1kb ivt


%define SEGMENT MAKE_GDT_SEGMENT_SELECTOR(KERNEL_CODE_SEGMENT_INDEX, 0)

section .bootbss


section .boot

	; Sets up the IDT
	; Will return false if interrupts are enabled
	

	; QWORD os_create_int_gate(WORD seg_selector, DWORD fnptr)
	os_create_int_gate:
		push ebp
		mov ebp, esp

		mov DWORD ecx, [ebp-4]
		mov WORD dx, [ebp-8]

		mov eax, [ebp-32]
		mov WORD [eax], cx
		mov WORD [eax+2], dx
		mov BYTE [eax+4], 0
		mov BYTE [eax+5], 0b10001110
		mov WORD dx, [ebp-8]
		mov WORD [eax+6], dx
		;movsw WORD [eax+6], [ebp-8]
		mov ecx, eax
		mov DWORD eax, [eax]
		mov DWORD edx, [eax+4]
		
		pop ebp

		retf

	; QWORD os_create_trap_gate(WORD seg_selector, DWORD fnptr)
	os_create_trap_gate:
		push ebp
		mov ebp, esp

		mov DWORD ecx, [ebp-4]
		mov WORD edx, [ebp-8]

		mov eax, [ebp-32]
		mov WORD [eax], cx
		mov WORD [eax+2], dx
		mov BYTE [eax+4], 0
		mov BYTE [eax+5], 0b10001111
		mov WORD dx, [ebp-8]
		mov WORD [eax+6], dx
		;movsw [eax+6], [ebp-8]
		mov ecx, eax
		mov DWORD eax, [eax]
		mov DWORD edx, [eax+4]

		pop ebp
		retf

	os_setup_idt:
		push ebp
		mov ebp, esp

		pushfd
		test DWORD [ebp-4], 0x200
		jnz .ERR
		add ebp, 4 ;Remove flags from stack

		; Create entry for system call
		push DWORD ivt_sys
		push DWORD SEGMENT
		call os_create_trap_gate
		mov DWORD [os_idt_base+640], eax
		mov DWORD [os_idt_base+644], edx

		; Entry for divide error
		push DWORD ivt_de
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base], eax
		mov DWORD [os_idt_base+4], edx

		; Entry for debug exception
		push DWORD ivt_db
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+8], eax
		mov DWORD [os_idt_base+12], edx

		; Entry for Non-maskable interrupts
		push DWORD ivt_nm
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+16], eax
		mov DWORD [os_idt_base+20], edx

		; Entry for breapoiint interrupts
		push DWORD ivt_bp
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+24], eax
		mov DWORD [os_idt_base+28], edx

		; Entry for overflow exceptions
		push DWORD ivt_of
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+32], eax
		mov DWORD [os_idt_base+36], edx

		; Entry for bound exceptions
		push DWORD ivt_br
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+40], eax
		mov DWORD [os_idt_base+44], edx

		; Entry for invalid opcode exceptions
		push DWORD ivt_ud
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+48], eax
		mov DWORD [os_idt_base+52], edx

		; Entry for device not available
		push DWORD ivt_nm
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+56], eax
		mov DWORD [os_idt_base+60], edx

		; Entry for double fault
		push DWORD ivt_df
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+64], eax
		mov DWORD [os_idt_base+68], edx

		; Entry for invalid TSS
		push DWORD ivt_ts
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+80], eax
		mov DWORD [os_idt_base+84], edx

		; Entry for segment not present
		push DWORD ivt_np
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+88], eax
		mov DWORD [os_idt_base+92], edx

		; Entry for stack segment faults
		push DWORD ivt_ss
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+96], eax
		mov DWORD [os_idt_base+100], edx

		; Entry for general protection
		push DWORD ivt_gp
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+104], eax
		mov DWORD [os_idt_base+108], edx

		; Entry for page fault
		push DWORD ivt_pf
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+112], eax
		mov DWORD [os_idt_base+116], edx

		; Entry for math fault
		push DWORD ivt_mf
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+128], eax
		mov DWORD [os_idt_base+132], edx

		; Entry for alignment check
		push DWORD ivt_ac
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+136], eax
		mov DWORD [os_idt_base+140], edx

		; Entry for machine check
		push DWORD ivt_mc
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+144], eax
		mov DWORD [os_idt_base+148], edx

		; Entry for SIMD error
		push DWORD ivt_xm
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+152], eax
		mov DWORD [os_idt_base+156], edx

		; Entry for virtualization error
		push DWORD ivt_ve
		push DWORD SEGMENT
		call os_create_int_gate
		mov DWORD [os_idt_base+160], eax
		mov DWORD [os_idt_base+164], edx

		mov DWORD eax, os_idt_limit
		mov WORD [os_idt_descriptor], ax
		mov DWORD [os_idt_descriptor+2], os_idt_base
		lidt [os_idt_descriptor]

	.ERR:
		pop ebp
		mov eax, 0
		retf

	.END:
		pop ebp
		mov eax, 1
		retf




%undef SEGMENT
