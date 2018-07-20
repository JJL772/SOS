#pragma once

typedef enum class ESystemErrorType
{
	ERROR_UNKNOWN = 0x0,
	ERROR_KERNELFAIL = 0x1,
	ERROR_STACKOVERFLOW = 0x2,
	ERROR_STACKUNDERFLOW = 0x3,
	ERROR_MATHERROR = 0x4,
	ERROR_MEMORYACCESSVIOLATION = 0x5,
	ERROR_IOFAIL = 0x6,
} ESystemErrorType;

struct ISystemError
{
private:
	ISystemError();
public:
	const char* Message;
	ESystemErrorType ErrorType;
};

//KERNEL void Error(const char* msg, ESystemErrorType ErrorType);
//KERNEL void Error(ISystemError* error);