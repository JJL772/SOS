//=========================================================================//
// Name: 
// Purpose: 
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//
#include "screen.h"

void UpdateScreen()
{
	if (ActivePage != NULL && ActivePage->ScreenContents != NULL)
	{
		volatile char* MemStart = (volatile char*)VID_MEM_START;
		for (; (uint32_t)MemStart < VID_MEM_START+ (80 * 25); MemStart += 2)
		{
			if (&ActivePage->ScreenContents[(uint32_t)MemStart] != NULL)
			{
				*(MemStart + 1) = ActivePage->ScreenContents[(uint32_t)MemStart] & 0xFF00;
				*MemStart = ActivePage->ScreenContents[(uint32_t)MemStart] & 0xFF;
			}
		}
	}
}

//NOTE: x and y are not zero indexed
void PutChar(uint16_t x, uint16_t y, char c)
{
	volatile char* MemPos = (volatile char*)(VID_MEM_START + (((x- 1) * 80 * sizeof(char))*((y - 1) * 25 * sizeof(char))));
	*(MemPos+1) = ScreenColor;
	*(MemPos) = c;
}

void WriteString(const char* String, EScreenCenterType CenterType)
{

}

void SetScreenColor(uint8_t color)
{
	ScreenColor = color;
}