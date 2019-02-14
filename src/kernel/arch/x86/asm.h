/*

asm.h

Extern definitions for assembly functions/vars

*/
#ifndef _ASM_H_
#ifndef _HIGH_KERNEL_

//Typedefs
typedef struct { char data[32]; } os_cpuid_data_t;
typedef struct { char data[112]; } os_multiboot_data_t;

extern short 					os_cpuid_vendor;
extern char 					os_bootloader_type;
extern os_cpuid_data_t 			os_cpuid_data;
extern os_multiboot_data_t 		os_multiboot_data;

extern void __attribute__((stdcall)) os_setup_idt();

#endif
#endif