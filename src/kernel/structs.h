//=========================================================================//
// Name: structs.h
// Purpose: A dumb idea to define all kernel structures and
// typedefs in one common place
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//
#pragma once

extern "C"
{
#ifndef _OS64
	typedef unsigned int MemoryPointer_t;
#else
	typedef unsigned long MemoryPointer_t;
#endif

	/*
	Represents a block of memory. The memory management module keeps an array of these to keep track of
	allocated memory
	*/
	typedef struct MemoryBlock
	{
		MemoryPointer_t StartAddress;
		MemoryPointer_t EndAddress;
	} MemoryBlock_t;

	/*
	A CPU info struct, which holds some info about the supported instruction sets,
	CPU families, etc.
	*/
	typedef struct CPUInfo
	{
		char VendorID[13];
		uint32_t ProcessorInfo1;
		uint32_t ProcessorInfo2;
		uint32_t Stepping		: 3;
		uint32_t Model			: 3;
		uint32_t Family			: 3;
		uint32_t ProcessorType	: 1;
		uint32_t ExtendedModel	: 3;
		uint32_t ExtendFamily	: 7;
		uint32_t BrandIndex		: 7;
		uint32_t CFLUSHSize		: 7;
		uint32_t MaxAddress		: 7;
		uint32_t APICID			: 7;
		bool bSIMD		: 1;
		bool bSSE		: 1;
		bool bSSE2		: 1;
		bool bAVX		: 1;
		bool bSSE3		: 1;
		bool bSSE4_1	: 1;
		bool bSSE4_2	: 1;
		bool bMMX		: 1;
		bool bAVX2		: 1;
		bool bCMOV		: 1;
	} CPUInfo_t;

	/*
	An experimental datatype for a 128 bit floating point number
	Structure:
	bits: 127: Sign
	bits: 64-126: Exponent
	bits: 0-63: Fraction
	*/
	typedef union Float128
	{
		uint8_t Sign : 1;
		uint64_t Exponent : 63;
		uint64_t Fraction;
	} Float128_t;

	/*
	Implements a 'nibble' or a 4 bit int
	*/
	typedef union Int4
	{
		int8_t Int1 : 4;
		int8_t Int2 : 4;
	} Int4_t;

	typedef union UInt4
	{
		uint8_t Int1 : 4;
		uint8_t Int2 : 4;
	};


}