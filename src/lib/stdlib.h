//=========================================================================//
// Name: stdlib.h
// Purpose: Includes and definitions of the standard library
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License: None!
//=========================================================================//
#pragma once

#include "stddef.h"
#include "stdcolor.h"
#include "math.h"

#ifdef _KERNEL_BUILD_
#include "../kernel/kernel.h"
#endif

#ifdef _KERNEL_BUILD_
#define STDLIB KERNEL 
#define STDLIB_CPP KERNEL
#else
#define STDLIB
#define STDLIB_CPP
#endif

//String length util func
STDLIB uint32_t strlen(const char* str);