/*

x86.h

Defines low-level code that can be used in C and stuff

*/

#ifndef _x86_H
#define _x86_H


void LoadCR0(CR0_t cr0);
void LoadCR1(CR1_t cr1);
void LoadCR2(CR2_t cr2);
void LoadCR3(CR3_t cr3);
void LoadCR4(CR4_t cr4);

typedef struct CR0
{
	int PE : 1;
	int MP : 1;
	int EM : 1;
	int TS : 1;
	int ET : 1;
	int NE : 1;
	int _r1 : 9;
	int WP : 1;
	int _r2 : 1;
	int AM : 1;
	int _r3 : 11;
	int NW : 1;
	int CD : 1;
	int PG : 1;
} CR0_t;

typedef struct CR1
{
	int _r1 : 32;
} CR1_t;

typedef struct CR2
{
	int PFLA : 32;
} CR2_t;

typedef struct CR3
{
	int _r1 : 3;
	int PWT : 1;
	int PCD : 1;
	int _r2 : 7;
	int PDB : 20;
} CR3_t;

typedef struct CR4
{
	int VME : 1;
	int PVI : 1;
	int TSD : 1;
	int DE : 1;
	int PSE : 1;
	int PAE : 1;
	int MCE : 1;
	int PGE : 1;
	int PCE : 1;
	int OSFXSR : 1;
	int OSXMMEXCPT : 1;
	int _r1 : 21;
} CR4_t;

typedef struct CR5_7
{
	int _r1 : 32;
};

typedef CR5_7 CR5_t;
typedef CR5_7 CR6_t;
typedef CR5_7 CR7_t;






#endif //_x86_H