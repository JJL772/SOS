/*


types.h

Type definitions for use in the kernel


*/
#ifndef _TYPES_H_
#define _TYPES_H_

typedef char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
typedef unsigned long long uint64_t;

typedef char BYTE;
typedef unsigned char UBYTE;
typedef short WORD;
typedef unsigned short UWORD;
typedef int DWORD;
typedef unsigned int UDWORD;
typedef long long QWORD;
typedef unsigned long long UQWORD;

//Process ids
typedef unsigned int pid_t;

//Process Handles
typedef void* handle_t;

#endif
