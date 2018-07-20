//=========================================================================//
// Name: 
// Purpose: 
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//
#include "kernel.h"
#include "main/screen.h"

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
		*Mem = 0x17;
	}

	SetScreenColor(0x17);
	PutChar(1, 1, 'c');

	//Create infinite loop because we have nothing better to do
	while (true)
	{
		//la la la I dont care what you tell me to do!
	}
}

KERNEL void kerror(EKernelError type)
{

}