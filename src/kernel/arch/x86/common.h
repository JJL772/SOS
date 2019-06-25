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

#define FPU_FEATURE_MASK		1<<1
#define VME_FEATURE_MASK		1<<2
#define DE_FEATURE_MASK			1<<3
#define PSE_FEATURE_MASK		1<<4
#define PAE_FEATURE_MASK		1<<5
#define APIC_FEATURE_MASK		1<<6
#define MTRR_FEATURE_MASK		1<<7
#define PGE_FEATURE_MASK		1<<8
#define MCA_FEATURE_MASK		1<<9
#define PAT_FEATURE_MASK		1<<10
#define PSE36_FEATURE_MASK		1<<11
#define ACPI_FEATURE_MASK		1<<12
#define MMX_FEATURE_MASK		1<<13
#define FXSR_FEATURE_MASK		1<<14
#define SSE_FEATURE_MASK		1<<15
#define SSE2_FEATURE_MASK		1<<16
#define HTT_FEATURE_MASK		1<<17
#define SSE3_FEATURE_MASK		1<<18
#define VMX_FEATURE_MASK		1<<19
#define SSSE3_FEATURE_MASK		1<<20
#define PCID_FEATURE_MASK		1<<21
#define DCA_FEATURE_MASK		1<<22
#define SSE41_FEATURE_MASK		1<<23
#define SSE42_FEATURE_MASK		1<<24
#define X2ACPI_FEATURE_MASK		1<<25
#define AES_FEATURE_MASK		1<<26


#endif

#endif
