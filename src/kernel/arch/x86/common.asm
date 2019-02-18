;
; common.asm
;
; Common macro/util definitions
;
%ifdef _ARCH_X86_

%define EBOOTLOADER_UNSPECIFIED 0
%define EBOOTLOADER_MULTIBOOT	1
%define EBOOTLOADER_UEFI		2

%define CREATE_GDT_SEGMENT_SELECTOR(index, rpl) 	((((index << 3) & 0xFFF8) | (rpl & 0x2)))
%define MAKE_GDT_SEGMENT_SELECTOR(index, rpl) 		((((index << 3) & 0xFFF8) | (rpl & 0x2)))

%define CREATE_LDT_SEGMENT_SELECTOR(index, rpl)		((((index << 3) & 0xFFF8) | (rpl & 0x2)) | 0x4)
%define MAKE_LDT_SEGMENT_SELECTOR(index, rpl)		((((index << 3) & 0xFFF8) | (rpl & 0x2)) | 0x4)

%define KERNEL_DPL      0b00
%define DRIVER_DPL      0b10
%define USER_DPL        0b11

%define KERNEL_DATA_SEGMENT_INDEX	1
%define KERNEL_CODE_SEGMENT_INDEX	2
%define USER_DATA_SEGMENT_INDEX		3
%define USER_CODE_SEGMENT_INDEX		4

%define CR0_PG_MASK					1<<31
%define CR0_CD_MASK					1<<30
%define CR0_NW_MASK					1<<29
%define CR0_AM_MASK					1<<18
%define CR0_WP_MASK					1<<16
%define CR0_NE_MASK					1<<5
%define CR0_ET_MASK					1<<4
%define CR0_TS_MASK					1<<3
%define CR0_EM_MASK					1<<2
%define CR0_MP_MASK					1<<1
%define CR0_PE_MASK					1<<0

%define CR3_PWT_MASK				1<<3
%define CR3_PCD_MASK				1<<4

%define CR4_VME_MASK				1<<0
%define CR4_PVI_MASK				1<<1
%define CR4_TSD_MASK				1<<2
%define CR4_DE_MASK					1<<3
%define CR4_PSE_MASK				1<<4
%define CR4_PAE_MASK				1<<5
%define CR4_MCE_MASK				1<<6
%define CR4_PGE_MASK				1<<7
%define CR4_PCE_MASK				1<<8
%define CR4_OSFXSR_MASK				1<<9
%define CR4_OSXMMEXCPT_MASK			1<<10
%define CR4_UMIP_MASK				1<<11
%define CR4_VMXE_MASK				1<<13
%define CR4_SMXE_MASK				1<<14
%define CR4_FSGSBASE_MASK			1<<16
%define CR4_PCIDE_MASK				1<<17
%define CR4_OSXSAVE_MASK			1<<18
%define CR4_SMEP_MASK				1<<20
%define CR4_SMAP_MASK				1<<21
%define CR4_PKE_MASK				1<<22


struc gdt_info_32_t	
	.limit	resw	1 ;WORD
	.base	resd	1 ;DWORD
endstruc

struc gdt_descriptor_t
	.limitw	resw	1
	.base1	resw	1
	.base2	resb	1
	.misc1	resb	1
	.misc2	resb	1
	.base3	resb	1
endstruc

struc idt_info_32_t	
	.limit	resw	1
	.base	resd	1
endstruc

%endif