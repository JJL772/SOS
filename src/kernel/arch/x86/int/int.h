/*
 *
 * int.h
 *
 * Defines interrupt procedures to be added to the IDT
 *
 */


#ifndef _INT_H
#define _INT_H

#include "../x86.h"
#include "../common.h"

//PROC(unsigned EFLAGS, unsigned short CS, unsigned EIP, int ERR_CODE)
//typedef void(*interrupt_proc)(unsigned int, unsigned short, unsigned int, int);

/*
//Interrupt procedures
interrupt_proc AC_INT INTERRUPT_DATA;
interrupt_proc BP_INT INTERRUPT_DATA;
interrupt_proc BR_INT INTERRUPT_DATA;
interrupt_proc DB_INT INTERRUPT_DATA;
interrupt_proc DE_INT INTERRUPT_DATA;
interrupt_proc DF_INT INTERRUPT_DATA;
interrupt_proc GP_INT INTERRUPT_DATA;
interrupt_proc MC_INT INTERRUPT_DATA;
interrupt_proc MF_INT INTERRUPT_DATA;
interrupt_proc NM_INT INTERRUPT_DATA;
interrupt_proc OF_INT INTERRUPT_DATA;
interrupt_proc PF_INT INTERRUPT_DATA;
interrupt_proc TS_INT INTERRUPT_DATA;
interrupt_proc UD_INT INTERRUPT_DATA;
interrupt_proc VE_INT INTERRUPT_DATA;
interrupt_proc XM_INT INTERRUPT_DATA;
interrupt_proc SYS_INT INTERRUPT_DATA;
*/

void SECTION_INTERRUPT_VECTOR_CODE AC_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE BP_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE BR_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE DB_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE DE_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE DF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE GP_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE MC_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE MF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE NM_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE OF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE PF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE TS_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE UD_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE VE_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE XM_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE SS_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODE SYS_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);

#endif //_INT_H
