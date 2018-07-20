//=========================================================================//
// Name: memory.h
// Purpose: Defines memory management utils
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//
#pragma once

#include "../../lib/stdlib.h"
#include "../../lib/stddef.h"

#define WRITE_MEMORY(addr, type, val) *(type*)addr = val

//Sits at 16384 currently. Each entry in the list requires 2 bytes of memory
#define MAX_MALLOC_SEGMENTS 16384



/*
Pointers to where the heap starts, and to where the first open memory block is.
*/
//static MemoryPointer_t HeapStart;
//static MemoryBlock_t 
static void InitializeMemory();

/*
Allocates the specified ammount of memory for usage, returns a pointer to the starting
address of the memory block
Params:
size - Number of bytes to allocate
*/
STDLIB void* malloc(size_t size);

/*
Re-allocates the specified block of memory so it fits the specified size
Params:
block - the block of memory to re-allocate
size - the number of bytes to allocate
*/
STDLIB void* realloc(void* block, size_t size);

/*
Frees a block of memory, which allows it to be used by another program
Params:
block - the block of memory to re-allocate
*/
STDLIB void free(void* block);

