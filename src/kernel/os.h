//=========================================================================//
// Name: os.h
// Purpose: Defines a number of OS globals
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//
#pragma once

#include "kernel.h"
#include "memory/memory.h"
#include "structs.h"

namespace JOS
{
	//Array of all allocated memory segments
	MemoryBlock_t MemorySegments[MAX_MALLOC_SEGMENTS];
}