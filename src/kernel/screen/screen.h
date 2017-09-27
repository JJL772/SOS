//=========================================================================//
// Name: 
// Purpose: 
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//

#pragma once

#include "..//..//lib/stddef.h"
#include "..//memory/memory.h"

#define SCREEN_WIDTH 80
#define SCREEN_HEIGHT 25
#define VID_MEM_START 0xB8000
#define BACKGROUND_COLOR 0x0107

namespace JOS
{
    namespace Screen
    {
		static uint16_t ScreenPosX = 0;
		static uint16_t ScreenPosY = 0;
		static uint16_t ScreenColor = 0x0;
        void SetupScreen();
        void PutChar(uint16_t x, uint16_t y, char c);
        void WriteString(const char* str);
        void SetScreenColor(uint16_t color);
        void SetCursorPos(uint16_t x, uint16_t y);
        void GetCursorPos(uint16_t& x, uint16_t& y);
        void ClearScreen();
    }
}