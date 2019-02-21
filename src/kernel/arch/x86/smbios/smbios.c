/*

smbios.c

Implements some SMBIOS functions, most notably os_smbios_init

*/
#include "smbios.h"

#ifdef _ARCH_X86_

void os_smbios_init()
{
	// SMBIOS byte string = _SM_
	for(char* i = (char*)0xF0000; i <= 0xFFFFF; i+=16)
	{
		if(*i == '_' && *(i+1) == 'S' && *(i+2) == 'M' && *(i+3) == '_')
		{
			os_smbios_entry = (struct smbios_entrypoint*)i;
			break;
		}
	}
}

#endif