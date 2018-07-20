;=========================================================
; Name: cpuid.asm
; Purpose: Implements a CPUID function
; Author: Jeremy L.
; Date of Creation: <Unknown>
;=========================================================

section .data:

section .text:

    ;C
    ; void ASM_GetCPUIDParams(int& str1, int& str2, int& str3, int& info1, int& info2, int& features1, int& features2,
    ; int& features3, int& features4, int& features5, int& features6)
	;go fuck urself :)
    ASM_GetCPUIDParams:
        push rbp
        mov rbp, rsp

        mov eax, 0
        cpuid

        mov DWORD [rsp-4], ebx
        mov DWORD [rsp-8], edx
        mov DWORD [rsp-12], ecx

        mov eax, 1
        cpuid

        mov DWORD [rsp-16], eax
        mov DWORD [rsp-20], ebx
        mov DWORD [rsp-24], edx
        mov DWORD [rsp-28], ecx

        mov eax, 7
        cpuid

        mov DWORD [rsp-32], ebx
        mov DWORD [rsp-36], ecx

        mov eax, 80000001h
        cpuid

        mov DWORD [rsp-40], edx
        mov DWORD [rsp-44], ecx

        pop rbp
        ret
