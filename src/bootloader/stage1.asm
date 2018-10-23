;==================================================
; stage1.asm
; First stage of the bootloader
; basically just loads the rest of the bootloader
; Compiled as a flatform binary file, no segments
;==================================================

[BITS 16]

;Stage 1 part 2 will be written in the range 0x100000 to 0x00EFFFFF

org 0x7c00

jmp _start

DataStart: dd 0x500

_start:
    ;mov DWORD [DataStart], eax
    ;mov DWORD [DataStart+4], edx

    mov BYTE [DataStart], dl

    mov ah, 0x8
    mov es, 0x0
    mov di, 0x0

    int 0x13

    mov ss, 0x104FF


