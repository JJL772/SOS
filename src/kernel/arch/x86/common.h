/*

common.h

Common definitions

THIS FILE SHOULD HAVE NO DEPENDENCIES ON ANY OTHER FILES

*/
#ifndef _COMMON_H_
#define _COMMON_H_
#if defined(_ARCH_X86_) && !defined(_HIGH_KERNEL_)

#define SECTION_BOOT_CODE 				__attribute__((section(".boot")))
#define SECTION_BOOT_DATA 				__attribute__((section(".bootdata")))
#define SECTION_BOOT_BSS 				__attribute__((section(".bootbss")))
#define SECTION_KERNEL_CODE 			__attribute__((section(".kernel")))
#define SECTION_KERNEL_DATA 			__attribute__((section(".data")))
#define SECTION_KERNEL_BSS 				__attribute__((section(".kernelbss")))
#define SECTION_INTERRUPT_VECTOR_CODE 	__attribute__((section(".inthandler")))
#define SECTION_INTERRUPT_DATA 			__attribute__((section(".intdata")))
#define SECTION_IDT						__attribute__((section(".idt")))
#define SECTION_GDT						__attribute__((section(".gdt")))
#define SECTION_STACK					__attribute__((section(".stack")))

#define CDECL	__attribute__((cdecl))


typedef unsigned char uint8;
typedef char int8;
typedef unsigned short uint16;
typedef short int16;
typedef unsigned int uint32;
typedef int int32;
typedef long long int64;
typedef unsigned long long uint64;

#define BYTE char
#define WORD short
#define DWORD int
#define QWORD long long

#define bool int
#define true 1
#define false 0

#endif
#endif