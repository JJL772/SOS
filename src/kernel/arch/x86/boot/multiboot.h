/*

multiboot.h

Definitions for the multiboot spec

*/
#ifndef _MULTIBOOT_H_
#define _MULTIBOOT_H_

#include "../common.h"

#define MULTIBOOT_MAGIC_HEADER	0x1BADB002

typedef struct multiboot_header
{
	DWORD magic;
	DWORD flags;
	DWORD checksum;
	DWORD header_addr;
	DWORD load_addr;
	DWORD load_end_addr;
	DWORD bss_end_addr;
	DWORD entry_addr;
	DWORD mode_type;
	DWORD width;
	DWORD height;
	DWORD depth;
} multiboot_header_t;

typedef struct multiboot_info
{
	DWORD flags;
	DWORD mem_lower;
	DWORD mem_upper;
	DWORD boot_device;
	DWORD cmd_line;
	DWORD mods_count;
	DWORD mods_addr;
	DWORD syms[3];
	DWORD mmap_length;
	DWORD mmap_addr;
	DWORD drives_length;
	DWORD drives_addr;
	DWORD config_table;
	DWORD bootloader_name;
	DWORD apm_table;
	DWORD vbe_control_info;
	DWORD vbe_mode_info;
	WORD vbe_mode;
	WORD vbe_interface_seg;
	WORD vbe_interface_off;
	WORD vbe_interface_len;
	QWORD framebuffer_addr;
	DWORD framebuffer_pitch;
	DWORD framebuffer_width;
	DWORD framebuffer_height;
	BYTE framebuffer_bpp;
	BYTE framebuffer_type;
	BYTE color_info[5];
} multiboot_info_t;

typedef struct multiboot_module
{
	DWORD module_start;
	DWORD module_end;
	DWORD string;
} multiboot_module_t;

typedef struct multiboot_sym_tbl
{

} multiboot_sym_tbl_t;

typedef struct multiboot_elf_tbl
{


} multiboot_elf_tbl_t;

typedef struct multiboot_mmap
{
	DWORD size;
	QWORD base_addr;
	QWORD length;
	DWORD type;
} multiboot_mmap_t;

typedef struct multiboot_drive
{
	DWORD size;
	DWORD drive_num;
	BYTE  drive_mode;
	WORD drive_cylinders;
	BYTE drive_heads;
	BYTE drive_sectors;
} multiboot_drive_t;

#endif