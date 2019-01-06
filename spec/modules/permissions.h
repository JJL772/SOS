/*

permissions.h

Permissions API prototypes

WARNING: THIS FILE IS PART OF THE OS SPEC, THIS SHOULD NOT BE USED AS AN ACTUAL OS HEADER

*/

#include "types.h"

#define PERM_NONE		0
#define PERM_READ		1<<1
#define PERM_WRITE		1<<2
#define PERM_ALLACCESS	PERM_READ | PERM_WRITE

typedef uint8 permissions_t;