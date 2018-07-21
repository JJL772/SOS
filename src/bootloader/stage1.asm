;==================================================
; stage1.asm
; First stage of the bootloader
; basically just loads the rest of the bootloader
;==================================================

[BITS 16]

_start:
    ;Stage 1 part 2 will be written in the range 0x100000 to 0x00EFFFFF

    ;==================================
    ; GDT setup and insertion of segment
    ;==================================
    ;Create entry in the GDT for the segment where our buffer will be located
    ;GDT start addr = 0x500
    mov WORD ax, 0x500

    ;First "real" entry to the table at [ax+8]
    ;Upper
    ;        v-------v v-------v v-------v v-------v
    ;0x900 : 0000_0000_0000_0000_0000_1001_0000_0000
    ;limit = 64k
    mov BYTE [ax+8],  0b00000000 ;First portion of base is empty
    mov BYTE [ax+9], 0b11010000 ;G=1, B=1, AVL=1, limit firt 4 bits are empty
    mov BYTE [ax+10], 0b10010011 ;P=1, DPL=0, E=0, W=1, A=1
    mov BYTE [ax+11], 0b00000000 ;Base still empty
    mov BYTE [ax+12], 0b00001001 ;Base again
    mov BYTE [ax+13], 0b00000000 ;last part of base
    mov BYTE [ax+14], 0b11111111 ;mid part of limit
    mov BYTE [ax+15], 0b11111111 ;last part of limit

    ;Load the GDT
    lgdt ax

    ;Select the segment with a gdt selector
    ;First 13 bits are the index of the table
    ;next bit is the table index
    ;final 2 bits are the requested privalege level
    mov ds, 0b0000000000001011
    ;We now have access to the segment

    ;Use bios disk interrupts (0x13) to get disk info
    mov ah, 08
    mov dl, 80h
    int 13h

    ;random location in the selected memory heh
    mov ah, 0x900
    mov BYTE [ah], ch
    mov BYTE [ah], cl


    ;Enable 32 bit protected mode

    ;Issue jmp to start of the stage 2 loader
