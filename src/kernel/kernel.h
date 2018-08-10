//=========================================================================//
// Name: kernel.h
// Purpose:
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License: None
//=========================================================================//
#ifndef _KERNEL_H
#define _KERNEL_H

#ifndef _HIGH_KERNEL_
#define _HIGH_KERNEL_
#endif

#ifdef _x86_
#include "arch/x86/x86.h"
#elif defined(_x64_)
#include "arch/x64/x64.h"
#elif defined(_arm_)
#include "arch/arm/arm.h"
#elif defined(_mips_)
#include "arch/mips/mips.h"
#endif //Stuff

#endif //_KERNEL_H
