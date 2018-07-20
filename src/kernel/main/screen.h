//=========================================================================//
// Name: 
// Purpose: Basic interface for writing characters to the screen
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//
#pragma once

#include "..//kernel.h"
#include "..//..//lib/stddef.h"
#include "memory.h"

#define SCREEN_WIDTH 80
#define SCREEN_HEIGHT 25
#define VID_MEM_START 0xB8000
#define BACKGROUND_COLOR 0x0107
 
/* Stores screen contents. Requires 4kb of memory */
typedef struct ScreenPage_t
{
	unsigned short ScreenContents[80*25];
} ScreenPage_t;

enum EScreenCenterType
{
	SCREEN_CENTER_DEFAULT = 0,
	SCREEN_CENTER_LEFT,
	SCREEN_CENTER_MIDDLE,
	SCREEN_CENTER_RIGHT,
};

/* Parameters for the screen */
static unsigned short ScreenPositionX = 1;
static unsigned short ScreenPositionY = 1;
static unsigned char ScreenColor = 0x17;
static ScreenPage_t* ActivePage;
static ScreenPage_t ScreenPages[5];

void UpdateScreen();
void PutChar(uint16_t x, uint16_t y, char c);
void WriteString(const char* String, EScreenCenterType CenterType = SCREEN_CENTER_LEFT);
void SetScreenColor(uint8_t color);
void SetCursorPos(uint16_t x, uint16_t y);
void GetCursorPos(uint16_t& x, uint16_t& y);
void ScrollLines(uint16_t lines);
void ClearScreen();