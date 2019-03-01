/*

asm.h

Extern definitions for assembly functions/vars

*/
#ifndef _ASM_H_
#ifndef _HIGH_KERNEL_

//Typedefs
typedef struct { char data[32]; } os_cpuid_data_t;
typedef struct { char data[112]; } os_multiboot_data_t;
typedef struct { char data[40]; } os_gdt_t;
typedef struct { char data[2048]; } os_idt_t;

extern short 					os_cpuid_vendor;
extern char 					os_bootloader_type;
extern os_cpuid_data_t  		os_cpuid_data;
extern os_multiboot_data_t      os_multiboot_data;
extern os_gdt_t					os_gdt_base;
extern os_idt_t                 os_idt_base;
extern int						os_kernel_page_directory_end;
extern int						os_kernel_page_directory;

extern bool __attribute__((stdcall)) os_setup_idt();
extern void __attribute__((stdcall)) os_setup_gdt();
extern void __attribute__((stdcall)) os_select_segment(char segment_reg, short descriptor);

#endif
#endif