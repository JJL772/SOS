;==================================================
; stage1.asm
; First stage of the bootloader
; basically just loads the rest of the bootloader
;==================================================

[BITS 16]

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
	;We are just going to open up all our memory within the 20-bit address space

	;Data segment, limit will be base+limit of 64k
	; Base =	0000_0000_0000_0000_0111_1110_0000_0000
	; Limit =	0000_0000_0000_0001_0111_1000_0000_0000
    mov WORD [ax+8],  0b0000_0000_0001_0001 ;First portion of base is empty
    mov WORD [ax+10], 0b1001_0011_0000_0000 ;P=1, DPL=0, E=0, W=1, A=1
    mov WORD [ax+12], 0b0111_1110_0000_0000 ;Base again
    mov WORD [ax+14], 0b0111_1000_0000_0000 ;mid part of limit

	;Code segment now
	; Base =	0000_0000_0000_0001_1000_0110_1010_0000
	; Limit =	0000_0000_0000_|0010_1000_0000_1010_0000
	mov WORD [ax+16], 0b0000_0000_0001_0010
	mov WORD [ax+18], 0b1001_0000_0000_0001
	mov WORD [ax+20], 0b1000_0110_1010_0000
	mov WORD [ax+22], 0b1000_0000_1010_0000

    ;Load the GDT
    lgdt ax

	;Select the segments here
    mov ds, 0b0000000000010011
	mov es, 0b0000000000010011
	mov fs, 0b0000000000010011
	mov fs, 0b0000000000010011
	mov gs, 0b0000000000010011
	;put stack here for now
	mov ss, 0b0000000000010011
	;select code segment
	mov cs, 0b0000000000011011



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
