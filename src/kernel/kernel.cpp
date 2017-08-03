//=========================================================================//
// Name: 
// Purpose: 
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//


#include "kernel.h"
#include "screen/screen.h"

KERNEL void kmain(void)
{
	volatile char* m = (char*)0xB8000;
	*m = 'H';
	volatile char* f = (char*)0xB8001;
	*f = (char)0x07;

    InitializeKernel();
}

void InitializeKernel()
{
    JOS::Screen::SetupScreen();
}