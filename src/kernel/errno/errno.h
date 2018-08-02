/*
 * errno.h
 *
 * Error handler for the OS
 *
 */

#ifndef ERRNO_H
#define ERRNO_H

#define ERR_UNDEFINED -1
#define ERR_GENERIC 0
#define ERR_PAGE_ERROR 1
#define ERR_ACCESS_VIOLATION 2
#define ERR_BREAKPOINT 3
#define ERR_BAD_OPCODE 4
#define ERR_STACK_OVERFLOW 5
#define ERR_MATH_ERR 6
#define ERR_SEG_FAULT 7
#define ERR_PRIV_LEVEL 8

/* Process ID of the kernel */
#define KERNEL_PID 0

typedef unsigned int pid;
typedef int errid;

typedef void(*os_err_handler_ptr)(int, void*);

/*
 * OS Error Handler in user-mode applications
 */
void HandleError(int err, void* err_info);
//..

typedef struct
{
	pid procID;
	const errid id;
} PageFault_t;

typedef struct
{
	pid procID;
	const errid id;
} AccessViolationFault_t;

typedef struct
{
	pid procID;
	const errid id;
} BreakpointFault_t;

typedef struct
{
	pid procID;
	const errid id;
} BadOpcodeFault_t;

typedef struct
{
	pid procID;
	const errid id;
} SegmentationFault_t;

typedef struct
{
	pid procID;
	const errid id;
} OutofMemoryFault_t;

typedef struct
{
	pid procID;
	const errid id;
} MathFault_t;


PageFault_t* new_pagefault_err();
AccessViolationFault_t* new_accessviolation_err();
BreakpointFault_t* new_breakpoint_err();
BadOpcodeFault_t* new_badopcode_err();
SegmentationFault_t* new_segfault_err();
OutofMemoryFault_t* new_outofmem_err();
MathFault_t* new_mathfault_err();

#endif //ERRNO_H