//=========================================================================//
// Name: kernel.h
// Purpose: Defines base methods for use in the kernel 
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License: None
//=========================================================================//
#pragma once

#define KERNEL extern "C"
#define NULL 0

/*
Defines how the kernel failed
*/
typedef enum EKernelError
{
	KERNEL_FAIL_GENERIC = 0x0,
	KERNEL_PROCESS_DIED = 0x1,
} EKernelError;

KERNEL void kmain(void);
KERNEL void kerror(EKernelError type);