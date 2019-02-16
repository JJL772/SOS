;
; common.asm
;
; Common macro/util definitions
;
%ifdef _ARCH_X64_

%define CREATE_GDT_SEGMENT_SELECTOR(index, rpl) 	((((index << 3) & 0xFFF8) | (rpl & 0x2)))

%define CREATE_LDT_SEGMENT_SELECTOR(index, rpl)		((((index << 3) & 0xFFF8) | (rpl & 0x2)) | 0x4)

%define KERNEL_DPL      0b00
%define DRIVER_DPL      0b10
%define USER_DPL        0b11

%define KERNEL_DATA_SEGMENT_INDEX	1
%define KERNEL_CODE_SEGMENT_INDEX	2
%define USER_DATA_SEGMENT_INDEX		3
%define USER_CODE_SEGMENT_INDEX		4


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