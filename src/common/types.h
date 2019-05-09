//===============================================//
// Name: types.h
// Purpose: Fixed-width types
// Author: Jeremy Lorelli jeremy.lorelli.1337@gmail.com
//===============================================//
#ifndef _TYPES_H_
#define _TYPES_H_

#ifdef _PLATFORM_16BITS

/* Pointer types, 16bits on this */
typedef short intptr;
typedef unsigned short uintptr;

typedef char int8;
typedef unsigned char uint8;
typedef short int16;
typedef unsigned short uint16;
typedef long int int32;
typedef unsigned long uint32;
typedef long long int64;
typedef unsigned long long uint64;

typedef int8 BYTE;
typedef int8 byte;
typedef int16 WORD;
typedef int16 word;
typedef int32 DWORD;
typedef int32 dword;
typedef int64 QWORD;
typedef int64 qword;

#elif defined(_PLATFORM_32BITS)

/* Pointer types, 32bits on this */
typedef int intptr;
typedef unsigned int uintptr;

typedef char int8;
typedef unsigned char uint8;
typedef short int16;
typedef unsigned short uint16;
typedef long int int32;
typedef unsigned long uint32;
typedef long long int64;
typedef unsigned long long uint64;

/* Maintained for backwards compat on x86/x64 */
typedef int8 BYTE;
typedef int8 byte;
typedef int16 WORD;
typedef int16 word;
typedef int32 DWORD;
typedef int32 dword;
typedef int64 QWORD;
typedef int64 qword;

#elif defined(_PLATFORM_64BITS)

/* Pointer types, 64bits on this */
typedef long long intptr;
typedef unsigned long long uintptr;

typedef char int8;
typedef unsigned char uint8;
typedef short int16;
typedef unsigned short uint16;
typedef int int32;
typedef unsigned int uint32;
typedef long long int64;
typedef unsigned long long uint64;

/* Maintained for backwards compat on x86/x64 */
typedef int8 BYTE;
typedef int8 byte;
typedef int16 WORD;
typedef int16 word;
typedef int32 DWORD;
typedef int32 dword;
typedef int64 QWORD;
typedef int64 qword;

#endif

/* Float sizes same for all platforms */
typedef float f32;
typedef double f64;
typedef long double f80;

/* Some aliases for quick typing and stuff */
typedef uint8 u8;
typedef uint16 u16;
typedef uint32 u32;
typedef uint64 u64;
typedef int8 i8;
typedef int16 i16;
typedef int32 i32;
typedef int64 i64;

#endif //_TYPES_H_
