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

void JOS::Screen::SetupScreen()
{
    //*memory_pos = (char)0x01;
    //*memory_pos + 1 = (char)0x07;
    for(uint64_t i = 0; i < SCREEN_HEIGHT * SCREEN_WIDTH; i++)
    {
        *memory_pos++ = 0x01;
        *memory_pos++ = 0x07;
    }
}
