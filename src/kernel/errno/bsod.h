/*
 * BSOD.h (Blue Screen Of Death)
 *
 * Does what you think it does - defines a 
 * function for displaying a blue screen of death and shutting down 
 * the computer
 * 
 */
#include "errno.h"

typedef struct
{
	pid procID;
	errid errorID;
	char* message;
} BSODInfo_t;