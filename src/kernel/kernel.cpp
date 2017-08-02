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
    InitializeKernel();
}

void InitializeKernel()
{
    JOS::Screen::SetupScreen();
}