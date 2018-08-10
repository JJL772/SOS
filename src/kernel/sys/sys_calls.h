/*

sys_calls.h

Handles system calls


*/

#ifndef _SYS_CALLS_H
#define _SYS_CALLS_H

#include "../lib/types.h"

#define SYS_CALL_NOP 0
#define SYS_CALL_EXIT 1
#define SYS_CALL_WRITE 2
#define SYS_CALL_READ 3

//
// fire_system_call(uint32_t call_code, pid_t pid, void* call_info)
// call_code: System call code
// pid: Calling process ID
// call_info: parameters for the system call
void fire_system_call(uint32_t call_code, pid_t pid, void* call_info)
{

}

#endif //_SYS_CALLS_H
