/*
 *
 * int.h
 * 
 * Defines interrupt procedures to be added to the IDT
 *
 */


typedef void(*interrupt_proc)(unsigned int, unsigned short, unsigned int, int);

//Interrupt procedures
interrupt_proc AC_INT;
interrupt_proc BP_INT;
interrupt_proc BR_INT;
interrupt_proc DB_INT;
interrupt_proc DE_INT;
interrupt_proc DF_INT;
interrupt_proc GP_INT;
interrupt_proc MC_INT;
interrupt_proc MF_INT;
interrupt_proc NM_INT;
interrupt_proc OF_INT;
interrupt_proc PF_INT;
interrupt_proc TS_INT;
interrupt_proc UD_INT;
interrupt_proc VE_INT;
interrupt_proc XM_INT;
