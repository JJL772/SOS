/*
 * intrin.h
 *
 * Intrinsics for generation of corresponding assembly
 *
 */

#define EAX "%eax"
#define EBX "%ebx"
#define ECX "%ecx"
#define EDX "%edx"
#define EBP "%ebp"
#define ESP "%esp"
#define EIP "%eip"
#define RAX "%rax"
#define RBX "%rbx"
#define RCX "%rcx"
#define EDX "%rdx"
#define RBP "%rbp"
#define RSP "%rsp"
#define RIP "%rip"

/* Converts parameter to a number */
#define _NUM(x)			#x
#define NUM(x)			_NUM(x)

#define MOVL(x,y)		asm("")
#define MOVB(x,y)		asm("")
#define ADD(x,y)		asm("")
#define SUB(x,y)		asm("")
#define MUL(x,y)		asm("")
#define DIV(x,y)		asm("")
#define AND(x,y)		asm("")
#define OR(x,y)			asm("")
#define NOT(x,y)		asm("")
#define LSH(x,y)		asm("")
#define RSH(x,y)		asm("")
#define XOR(x,y)		asm("")