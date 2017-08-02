//=========================================================================//
// Name: 
// Purpose: 
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//


#pragma once

#define NULL 0
#define NULL_SAFE nullptr

#ifdef _64BITS_
typedef unsigned long long size_t;
#else
typedef unsigned int size_t;
#endif

typedef char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned int uint32_t;

#ifdef _64BITS_
typedef long long int64_t;
typedef unsigned long long uint64_t;
#else
typedef int int64_t;
typedef unsigned int uint64_t;
#endif

//Non-standard type definitions
typedef char Int8;
typedef unsigned char UInt8;
typedef char int8;
typedef unsigned char uint8;
typedef short Int16;
typedef unsigned short UInt16;
typedef short int16;
typedef unsigned short uint16;
typedef int Int32;
typedef unsigned int UInt32;
typedef int int32;
typedef unsigned int uint32;

#ifdef _64BITS_
typedef long long Int64;
typedef unsigned long long UInt64;
typedef long long int64;
typedef unsigned long long uint64;
#else
typedef int Int64;
typedef unsigned int UInt64;
typedef int int64;
typedef unsigned int uint64;
#endif
