//=========================================================================//
// Name: kernel.h
// Purpose: Defines base methods for use in the kernel 
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License: None
//=========================================================================//
#pragma once

#define KERNEL extern "C"

/*
Base namespace of the kernel. This will contain various global variables such as a lookup
table for allocated memory blocks, among other things
*/
namespace JOS
{

}

KERNEL void kmain(void);