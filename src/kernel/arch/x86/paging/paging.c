/*

paging.c

Paging functions

*/
#include "paging.h"

/*
Describes a 4kb section of memory inside the page table area
Aligned on 4k boundries
*/
struct page_section_descriptor
{
	void* base;
	int used;
};
