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
	/*
	Clears the screen
	*/
	for (uint32_t pos = 0; pos < (80 * 25 * 2); pos += 2)
	{
		volatile char* Mem = (volatile char*)(0xB8000 + (pos));
		*Mem = ' ';
		Mem = (volatile char*)(0xB8000 + (pos - 1));
		*Mem = 0x0;
	}

	//JOS::Screen::PutChar(1, 1, 'H');

	//Create infinite loop because we have nothing better to do
	while (true)
	{

	}
}