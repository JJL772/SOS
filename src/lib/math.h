//=========================================================================//
// Name: math.h
// Purpose: Defines various math-related functions and utilities
// Authors: Jeremy L.
// Version: 0.0.1-alpha
// License:
//=========================================================================//
#pragma once

#define PI
#define E

/*
//later..

float sinTable[360] = {
	0.0f,
	0.0174524064f,
	0.0348994967f,
	0.0523359562f,
	0.0697564737f,
};

float cosTable[360] = {

};

float tanTable[360] = {

};
*/

float _sin_fast(int deg);
float _cos_fast(int deg);
float _tan_fast(int deg);
int _arcsin_fast(float num);
int _arccos_fast(float num);
int _arctan_fast(float num);

float sin(float ang);
float cos(float ang);
float tan(float ang);
float arcsin(float ang);
float arccos(float ang);
float arctan(float ang);