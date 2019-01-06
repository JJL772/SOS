/*

fs.h

Type definitions

WARNING: THIS FILE IS PART OF THE OS SPEC, THIS SHOULD NOT BE USED AS AN ACTUAL OS HEADER
*/

typedef unsigned char uint8;
typedef char int8;
typedef unsigned short uint16;
typedef short int16;
typedef unsigned int uint32;
typedef int int32;
typedef unsigned long long uint64;
typedef long long int64;
typedef char byte;
typedef short word;
typedef int dword;
typedef long long qword;

#define BYTE byte
#define WORD word
#define DWORD dword
#define QWORD qword
#define BOOL int