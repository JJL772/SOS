#pragma once 

#include "../kernel.h"
#include "driver.h"

struct IDevice;
struct IDriver;
struct IVideoDriver;
struct ISoundDriver;
struct IVideoHardwareDevice;
struct IAudioHardwareDevice;
struct IVideoDevice;
struct IAudioDevice;

KERNEL IVideoHardwareDevice* GetHardwareVideoDevices();
KERNEL IAudioHardwareDevice* GetHardwareAudioDevices();
KERNEL IVideoDevice* CreateVideoDevice(IVideoHardwareDevice* pDevice);
KERNEL IAudioDevice* CreateAudioDevice(IAudioHardwareDevice* pDevice);
KERNEL bool SetActiveVideoDevice(IVideoDevice* pDevice);
KERNEL bool SetActiveAudioDevice(IAudioDevice* pDevice);

struct IVideoHardwareDevice
{

};

struct IAudioHardwareDevice
{

};

struct IDevice
{
	const char* sDeviceName;
	const char* sManufacturer;
	virtual bool IsValid();
};

struct ISoundDevice : public IDevice
{
private:
	ISoundDriver* pDriver;

public:
	void LoadDriver(ISoundDriver* pDriver);
	void UnloadDriver();
	virtual bool IsValid();
};

struct IVideoDevice : public IDevice
{
private:
	IVideoDriver* pDriver;

public:
	void LoadDriver(IVideoDriver* pDriver);
	void UnloadDriver();
	virtual bool IsValid();
};