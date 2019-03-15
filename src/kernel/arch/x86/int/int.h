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

void SECTION_INTERRUPT_VECTOR_CODEAC_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE);
void SECTION_INTERRUPT_VECTOR_CODEBP_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEBR_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEDB_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEDE_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEDF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEGP_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEMC_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEMF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODENM_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEOF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEPF_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODETS_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEUD_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEVE_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODEXM_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;
void SECTION_INTERRUPT_VECTOR_CODESS_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE)	;
void SECTION_INTERRUPT_VECTOR_CODESYS_INT(uint32_t EFLAGS, uint16_t CS, uint32_t EIP, int32_t ERR_CODE) 	;

#endif //_INT_H
