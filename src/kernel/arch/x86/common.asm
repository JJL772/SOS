;
; common.asm
;
; Common macro/util definitions
;
%ifdef _ARCH_X64_

%define CREATE_GDT_SEGMENT_SELECTOR(index, rpl) 	((((index << 3) & 0xFFF8) | (rpl & 0x2)))

%define CREATE_LDT_SEGMENT_SELECTOR(index, rpl)		((((index << 3) & 0xFFF8) | (rpl & 0x2)) | 0x4)

%define KERNEL_DATA_SEGMENT_INDEX	1
%define KERNEL_CODE_SEGMENT_INDEX	2
%define USER_DATA_SEGMENT_INDEX		3
%define USER_CODE_SEGMENT_INDEX		4

%endif