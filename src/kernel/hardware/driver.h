#pragma once

#include "../kernel.h"
#include "../../lib/stdlib.h"

struct IDriver;

KERNEL void LoadDriver(const char* sDevice, IDriver* pDriver);
KERNEL void LoadDriver(const char* sDevice, const char* sPath);
KERNEL void UnloadDriver(const char* sDevice);

////////////////////////
//SOUND DRIVER FUNCTIONS
typedef void(*SndDriver_Beep_Ptr)(uint32_t, uint32_t);
typedef void(*SndDriver_PlaySound_Ptr)(uint32_t*, uint32_t, uint32_t);
typedef void(*SndDriver_StopSound_Ptr)();
////////////////////////

////////////////////////
//VIDEO DRIVER FUNCTIONS
typedef void(*VidDriver_PutChar_Ptr)(uint32_t, uint32_t, uint16_t, char);
typedef char(*VidDriver_GetChar_Ptr)(uint32_t, uint32_t);
typedef uint16_t(*VidDriver_GetColor_Ptr)(uint32_t, uint32_t);
typedef void(*VidDriver_PrintString_Ptr)(const char*, uint32_t, uint16_t);
typedef void(*VidDriver_PutPixel_Ptr)(uint32_t, uint32_t, uint16_t, uint16_t, uint16_t);
////////////////////////


/*
Driver and stuff
*/
struct IDriver
{
public:
	const char* sName;
	const char* sVersion;
	const char* sDescription;
	const char* sDevice;
	const char* sAuthor;
	void* pDriver;
};

struct ISoundDriver : IDriver
{
public:
	SndDriver_Beep_Ptr Beep = nullptr;
	SndDriver_PlaySound_Ptr PlaySound = nullptr;
	SndDriver_StopSound_Ptr StopSound = nullptr;
};

struct IVideoDriver : IDriver
{
public:
	VidDriver_PutPixel_Ptr PutPixel = nullptr;
	VidDriver_GetChar_Ptr GetChar = nullptr;
	VidDriver_GetColor_Ptr GetColor = nullptr;
	VidDriver_PrintString_Ptr PutString = nullptr;
	VidDriver_PutPixel_Ptr PutPixel = nullptr;
};

struct IPeripheralDriver : IDriver
{

};