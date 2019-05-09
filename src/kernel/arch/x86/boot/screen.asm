;
;
; Low level routines for interacting with VGA memory
;
;
[BITS 32]

global os_vga_set_mode
global os_vga_write

section .text
	
	;
	; Sets the vga mode
	; eax = 1 = text mode 80x25
	; eax = 2 = text mode 40x25
	; eax = 3 = text mode 80x43
	;
	os_vga_set_mode:
	

	;
	; Writes directly to vga memory
	; eax - Base addr of vga mem
	; ebx - bytes per pixel,
	; 
	os_vga_write:
		
