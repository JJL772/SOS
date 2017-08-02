//=========================================================================//
// Name: kernel.h
// Purpose: Defines base methods for use in the kernel 
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License: None
//=========================================================================//
#pragma once

#define KERNEL extern "C"

KERNEL void kmain(void);

void InitializeKernel();