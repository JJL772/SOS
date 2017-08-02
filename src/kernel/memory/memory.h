//=========================================================================//
// Name: memory.h
// Purpose: Defines memory management utils
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//

#pragma once

#define WRITE_MEMORY(addr, type, val) *(type*)addr = val
