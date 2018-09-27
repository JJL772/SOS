/*

x86.h

Defines low-level code that can be used in C and stuff

*/

#ifndef _x86_H
#define _x86_H

//Included from high kernel
#include "../../lib/types.h"

//High kernel wont be able to use these structures
#ifndef _HIGH_KERNEL_

#define BOOT_PROC 			__attribute__((section(".boot")))
#define BOOT_DATA 			__attribute__((section(".bootdata")))
#define BOOT_BSS 			__attribute__((section(".bootbss")))
#define KERNEL 				__attribute__((section(".kernel")))
#define KERNEL_DATA 		__attribute__((section(".data")))
#define KERNEL_BSS 			__attribute__((section(".kernelbss")))
#define INTERRUPT_VECTOR 	__attribute__((section(".inthandler")))
#define INTERRUPT_DATA 		__attribute__((section(".intdata")))

/* Macros for loading stuff */
#define X86_LOAD_CR0(cr0)
#define X86_LOAD_CR1(cr1)
#define X86_LOAD_CR2(cr2)
#define X86_LOAD_CR3(cr3)
#define X86_LOAD_CR4(cr4)

struct CR0_t
{
	int PE : 1;
	int MP : 1;
	int EM : 1;
	int TS : 1;
	int ET : 1;
	int NE : 1;
	int _r1 : 9;
	int WP : 1;
	int _r2 : 1;
	int AM : 1;
	int _r3 : 11;
	int NW : 1;
	int CD : 1;
	int PG : 1;
};

struct CR1_t
{
	int _r1 : 32;
};

struct CR2_t
{
	int PFLA : 32;
};

struct CR3_t
{
	int _r1 : 3;
	int PWT : 1;
	int PCD : 1;
	int _r2 : 7;
	int PDB : 20;
};

struct CR4_t
{
	int VME : 1;
	int PVI : 1;
	int TSD : 1;
	int DE : 1;
	int PSE : 1;
	int PAE : 1;
	int MCE : 1;
	int PGE : 1;
	int PCE : 1;
	int OSFXSR : 1;
	int OSXMMEXCPT : 1;
	int _r1 : 21;
};

struct CR5_7_t
{
	int _r1 : 32;
};

struct task_descriptor_t
{

};

struct BYTE_REG
{
	uint8_t contents;
};

struct WORD_REG
{
	struct BYTE_REG Low;
	struct BYTE_REG High;
};

struct DWORD_REG
{
	struct WORD_REG Low;
	struct WORD_REG High;
};

struct QWORD_REG
{
	struct DWORD_REG Low;
	struct DWORD_REG High;
};

struct DQWORD_REG
{
	struct QWORD_REG Low;
	struct QWORD_REG High;
};

struct FPU_REG
{
	struct QWORD_REG Low;
	struct WORD_REG High;
};

struct FPU_POINTER_REG
{
	struct DWORD_REG Low;
	struct WORD_REG High;
};

typedef DQWORD_REG XMM_REG;

struct YMM_REG
{
	struct DQWORD_REG Low;
	struct DQWORD_REG High;
};

typedef CR5_7_t CR5_t;
typedef CR5_7_t CR6_t;
typedef CR5_7_t CR7_t;

typedef unsigned char AL_t;
typedef unsigned char AH_t;
typedef unsigned char BL_t;
typedef unsigned char BH_t;
typedef unsigned char CL_t;
typedef unsigned char CH_t;
typedef unsigned char DL_t;
typedef unsigned char DH_t;
typedef unsigned char BPL_t;
typedef unsigned char SIL_t;
typedef unsigned char DIL_t;
typedef unsigned char SPL_t;
typedef unsigned int EAX_t;
typedef unsigned int EBX_t;
typedef unsigned int ECX_t;
typedef unsigned int EDX_t;
typedef unsigned int ESP_t;
typedef unsigned int EDI_t;
typedef unsigned int EIP_t;
typedef unsigned int EBP_t;
typedef unsigned short CS_t;
typedef unsigned short DS_t;
typedef unsigned short ES_t;
typedef unsigned short FS_t;
typedef unsigned short GS_t;

struct EFLAGS_t
{
	uint8_t		CF	:	1;
	uint8_t		_r1	:	1;
	uint8_t		PF 	:	1;
	uint8_t		_r2	:	1;
	uint8_t		AF	:	1;
	uint8_t		_r3	:	1;
	uint8_t		ZF	:	1;
	uint8_t		SF 	:	1;
	uint8_t		TF 	:	1;
	uint8_t		IF	:	1;
	uint8_t		DF 	:	1;
	uint8_t		OF 	:	1;
	uint8_t		IOPL:	2;
	uint8_t		NT	:	1;
	uint8_t		_r4	:	1;
	uint8_t		RF 	:	1;
	uint8_t		VM	:	1;
	uint8_t		AC	:	1;
	uint8_t		VIF :	1;
	uint8_t		VIP :	1;
	uint8_t		ID	:	2;
	uint8_t		VAD :	9;
};

struct idt_error_t
{
	int EXT : 1;
	int IDT : 1;
	int TI : 1;
	int SELECTOR : 29;
};

struct idt_task_gate_t
{
	int _r1 : 16;
	int TSS_SELECTOR : 16;
	int _r2 : 8;
	int _r3 : 5;
	int DPL : 2;
	int P : 1;
	int _r4 : 16;
};

struct idt_interrupt_gate_t
{
	int OFFSET1 : 16;
	int SEG_SELECTOR : 16;
	int _r1 : 4;
	int _r2 : 3;
	int _r3 : 3;
	int D : 1;
	int _r4 : 1;
	int DPL : 2;
	int P : 1;
	int OFFSET2 : 16;
};

struct idt_trap_gate_t
{
	int OFFSET1 : 16;
	int SEG_SELECTOR : 16;
	int _r1 : 4;
	int _r2 : 3;
	int _r3 : 3;
	int D : 1;
	int _r4 : 1;
	int DPL : 2;
	int P : 1;
	int OFFSET2 : 16;
};

void LoadCR0(CR0_t cr0);
void LoadCR1(CR1_t cr1);
void LoadCR2(CR2_t cr2);
void LoadCR3(CR3_t cr3);
void LoadCR4(CR4_t cr4);

typedef enum
{
	VENDOR_INTEL = 0,
	VENDOR_AMD,
	VENDOR_CENTAUR,
	VENDOR_CYRIX,
	VENDOR_HYGON,
	VENDOR_TRANSMETA,
	VENDOR_NATIONALSEMI,
	VENDOR_NEXGEN,
	VENDOR_RISE,
	VENDOR_SIS,
	VENDOR_UMC,
	VENDOR_VIA,
	VENDOR_VORTEX,
	VENDOR_KVM,
	VENDOR_BHYVE,
	VENDOR_HYPERV,
	VENDOR_PARALLELS,
	VENDOR_VMWARE,
	VENDOR_XEN,
	VENDOR_UNSPECIFIED,
	VENDOR_SIZE,
} CPUID_VENDOR_t;

//used to store info about the CPU identification
struct CPUID_t
{
	uint16_t /*CPUID_VENDOR_t*/ 	vendor;
	uint8_t 		fpu			:	1; 		//EAX = 1, EDX bit 0
	uint8_t			vme			:	1;
	uint8_t			de			:	1;
	uint8_t			pse			:	1;
	uint8_t			tsc			:	1;
	uint8_t			msr			:	1;
	uint8_t			pae			:	1;
	uint8_t			mce			:	1;
	uint8_t			cx8			:	1;
	uint8_t			apic		:	1;
	uint8_t			_r1			:	1;
	uint8_t 		sep 		:	1;
	uint8_t			mtrr		:	1;
	uint8_t			pge 		:	1;
	uint8_t			mca			:	1;
	uint8_t			cmov		:	1;
	uint8_t			pat 		:	1;
	uint8_t			pse_36		:	1;
	uint8_t 		psn			:	1;
	uint8_t			clfsh		:	1;
	uint8_t			_r2			:	1;
	uint8_t			ds			:	1;
	uint8_t			acpi		:	1;
	uint8_t			mmx 		:	1;
	uint8_t			fxsr 		:	1;
	uint8_t			sse 		:	1;
	uint8_t 		sse2 		:	1;
	uint8_t			ss 			:	1;
	uint8_t			htt 		:	1;
	uint8_t			tm 			:	1;
	uint8_t			ia64		:	1;
	uint8_t			pbe 		:	1; 			//EAX = 1, EDX bit 31
	uint8_t			sse3		:	1; 			//EAX = 1, ECX bit 0
	uint8_t			pclmulqdq 	:	1;
	uint8_t			dtes64		:	1;
	uint8_t			monitor		:	1;
	uint8_t			dl_cpl		:	1;
	uint8_t			vmx			:	1;
	uint8_t			smx 		: 	1;
	uint8_t			est 		:	1;
	uint8_t			tm2			:	1;
	uint8_t			ssse3		:	1;
	uint8_t			cnxt_id		:	1;
	uint8_t			sdbg		:	1;
	uint8_t			fma 		:	1;
	uint8_t			cx16		:	1;
	uint8_t			xtpr 		:	1;
	uint8_t			pdcm		:	1;
	uint8_t			_r3			:	1;
	uint8_t			pcid		:	1;
	uint8_t			dca 		:	1;
	uint8_t			sse41		:	1;
	uint8_t			sse42		:	1;
	uint8_t			x2apic	 	:	1;
	uint8_t			movbe		:	1;
	uint8_t			popcnt		:	1;
	uint8_t			tsc_dl		:	1;
	uint8_t			aes 		:	1;
	uint8_t			xsave		:	1;
	uint8_t			osxsave		:	1;
	uint8_t			avx			:	1;
	uint8_t			f16c		:	1;
	uint8_t			rdrnd		:	1;
	uint8_t			hypervisor	:	1;		//EAX = 1, ECX bit 31
	uint8_t			fsgsbase 	:	1;			//EAX = 7, EBX bit 0
	uint8_t			IA32_TSC_ADJ: 	1;
	uint8_t			sgx 		:	1;
	uint8_t			bmi1		:	1;
	uint8_t			hle			:	1;
	uint8_t			avx2		:	1;
	uint8_t			_r4			:	1;
	uint8_t			smep		:	1;
	uint8_t			bmi2		:	1;
	uint8_t			erms		:	1;
	uint8_t			invpcid		:	1;
	uint8_t			rtm 		:	1;
	uint8_t			pqm			:	1;
	uint8_t			fpu_dep		:	1;
	uint8_t			mpx			:	1;
	uint8_t			pqe 		:	1;
	uint8_t			avx512f		:	1;
	uint8_t			avx512dq	:	1;
	uint8_t			rdseed		:	1;
	uint8_t			adx			:	1;
	uint8_t			smap		:	1;
	uint8_t			avx512ifma	:	1;
	uint8_t			pcommit		:	1;
	uint8_t			clflushopt	:	1;
	uint8_t			clwb		:	1;
	uint8_t			intel_pt	:	1;
	uint8_t			avx512pf	:	1;
	uint8_t			avx512er	:	1;
	uint8_t			avx512cd	:	1;
	uint8_t			sha			:	1;
	uint8_t			avx512bw	:	1;
	uint8_t			avx512vl	:	1; 		//EAX = 7, EBX bit 31
	uint8_t			prfetwt1	:	1;		//EAX = 7, ECX bit 0
	uint8_t			avx512vbmi	:	1;
	uint8_t			umip		:	1;
	uint8_t			pku			:	1;
	uint8_t			ospke		:	1;
	uint8_t			_r5			:	1;
	uint8_t			avx512vbmi2	:	1;
	uint8_t			_r6			:	1;
	uint8_t			gfni		:	1;
	uint8_t			vaes 		:	1;
	uint8_t			vpclmulqdq	:	1;
	uint8_t			avx512vnni 	:	1;
	uint8_t			avx512bitalg:	1;
	uint8_t			_r7			:	1;
	uint8_t			avx512vpop 	:	1;
	uint8_t			_r8			:	2;
	uint8_t			mawau		:	5;
	uint8_t			rdpid		:	1;
	uint8_t			_r9			:	7;
	uint8_t			sgx_lc		:	1;
	uint8_t			_r10		:	1;		//EAX = 7, ECX bit 31
	uint8_t			_r11		:	2;		//EAX = 7, EDX bit 0
	uint8_t			avx5124vnniw:	1;
	uint8_t			avx5124fmaps:	1;
	uint8_t			_r12		:  14;
	uint8_t			pconfig 	:	1;
	uint8_t			_r13		:	7;
	uint8_t			spec_ctrl	:	1;
	uint8_t			ibc 		:	1;
	uint8_t			_r14		:	1;
	uint8_t			arch_capab	:	1;				//IA32_ARCH_CAPABILITIES
	uint8_t			_r15		:	1;
	uint8_t			ssbd		:	1;		//EAX = 7, EDX bit 31
};



#endif //_HIGH_KERNEL_

#endif //_x86_H
