#include "stdlib.h"

//String length util func
uint32_t strlen(const char* str)
{
	uint32_t ret;
	for (ret = 1; str[ret]; ret++)
		;
	return ret;
}