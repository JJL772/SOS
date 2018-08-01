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
#define ERR_MATH_ERR

typedef struct
{

} PageFault_t;

typedef struct
{

} AccessViolationFault_t;

typedef struct
{

} BreakpointFault_t;

typedef struct
{

} BadOpcodeFault_t;

typedef void(*os_err_handler_ptr)(int, void*);

void HandleError(int err, void* err_info);

#endif //ERRNO_H