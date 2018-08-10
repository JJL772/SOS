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

//PROC(unsigned EFLAGS, unsigned short CS, unsigned EIP, int ERR_CODE)
typedef void(*interrupt_proc)(unsigned int, unsigned short, unsigned int, int);

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

void AC_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void BP_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void BR_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void DB_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void DE_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void DF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void GP_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void MC_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void MF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void NM_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void OF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void PF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void TS_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void UD_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void VE_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void XM_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SYS_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);

#endif //_INT_H
