//=========================================================================//
// Name: 
// Purpose: 
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//

#include "screen.h"

//Starting position of the memory 0xB8000
volatile char* memory_pos = (volatile char*)VID_MEM_START;

//TODO: Optimize?
void JOS::Screen::PutChar(uint16_t x, uint16_t y, char c)
{
	uint32_t RealPos = VID_MEM_START + ((x * sizeof(char)) + ((y - 1) * sizeof(char)) - 2);
	volatile char* Mem = (volatile char*)(RealPos);
	*Mem = c;
	Mem = (volatile char*)(RealPos + 1);
	*Mem = (char)0x0;
}

void JOS::Screen::WriteString(const char* String)
{

}