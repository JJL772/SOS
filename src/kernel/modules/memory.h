/*

memory.h

Memory management functions

*/
#ifndef _MEMORY_H_
#define _MEMORY_H_

typedef void*(*fnmalloc_t)(unsigned int);

typedef void*(*fncalloc_t)(unsigned int, unsigned int);

typedef void(*fnfree_t)(void*);

typedef void*(*fnrealloc_t)(void*, unsigned int);

typedef void*(*fnmemcpy_t)(void*, void*, unsigned int);

typedef void*(*fnmemset_t)(void*, int, unsigned int);

fnmalloc_t malloc = 0;

fncalloc_t calloc = 0;

fnfree_t free = 0;

fnrealloc_t realloc = 0;

fnmemcpy_t memcpy = 0;

fnmemset_t memset = 0;

#endif //_MEMORY_H_