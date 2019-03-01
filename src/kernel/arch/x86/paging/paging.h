/*

paging.h

Paging functions

*/
#ifndef _PAGING_H_
#define _PAGING_H_

#include "../common.h"

/* Masks for page flags */
#define PAGE_FLAG_P		0
#define PAGE_FLAG_RW	1
#define PAGE_FLAG_US	2
#define PAGE_FLAG_PWT	3
#define PAGE_FLAG_PCD	4
#define PAGE_FLAG_A		5
#define PAGE_FLAG_D		6
#define PAGE_FLAG_PAT	7
#define PAGE_FLAG_G		8

/* Masks for page table flags */
#define PAGE_TABLE_FLAG_P		0
#define PAGE_TABLE_FLAG_RW		1
#define PAGE_TABLE_FLAG_US		2
#define PAGE_TABLE_FLAG_PWT		3
#define PAGE_TABLE_FLAG_PCD		4
#define PAGE_TABLE_FLAG_A		5
#define PAGE_TABLE_FLAG_PS		7

/*
os_load_page_directory(void* addr)

Loads the specified page directory into CR3
*/
void os_load_page_directory(void* addr);

/*
os_create_page_table_4k(void* page_directory)

Allocates a new page table structure, creates a new entry in the specified page directory for the page table 
and then returns a pointer to the new page table.
*/
void* os_create_page_table_4k(void* page_directory);

/*
os_load_page_table_4k(void* page_directory, void* page_table)

Loads the specified page table structure into the page directory.
Note: page tables must be within the first 1M of memory. Errors will be thrown if it is not
*/
void os_load_page_table_4k(void* page_directory, void* page_table);

/*
os_map_page_4k(void* page_table, void* start_addr)

Maps a 4k page to the starting address specified. This will create a new entry in the page table.
*/
void* os_map_page_4k(void* page_table, void* start_addr);

/*
os_set_page_attributes_4k(void* page_table, unsigned short entry, unsigned short flags)

Sets flags on the specified page
*/
void os_set_page_attributes_4k(void* page_table, uint16 entry, uint16 flags);

/*
os_set_page_table_attributes_4k(void* page_directory, uint16 page_directory_entry, uint16 flags)

Sets attributes on the specified page table
*/
void os_set_page_table_attributes_4k(void* page_directory, uint16 page_directory_entry, uint16 flags);

/*
os_flush_tbl()

Induces a TLB flush by modifying CR3
*/
extern void __attribute__((cdecl)) os_flush_tlb();

#endif //_PAGING_H_