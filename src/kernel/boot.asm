; Starts the kernel

global _start
extern kmain

STACK_SIZE equ 16384

section .bss
	align 4
    stack_bottom:
        resb 16384
    stack_top:

section .data
    clr_scrn:  dd 0
    addr: dd 0xB8000

section .text
    align 4
    dd 0x1BADB002
    dd 0x0
    dd -0x1BADB002

    _start:
        ;Also need to setup the stack and stuff for C
        mov esp, stack_top
        
        ;Call the C kernel
        call kmain

		;test for error 
		;mov dword [0xB8000], 'K'
		;mov dword [0xB8001], 0x07
		;mov dword [0xB8002], 'E'
		;mov dword [0xB8003], 0x07
		;mov dword [0xB8004], 'R'
		;mov dword [0xB8005], 0x07
		;mov dword [0xB8006], 'N'
		;mov dword [0xB8007], 0x07
		;mov dword [0xB8008], 'E'
		;mov dword [0xB8009], 0x07
		;mov dword [0xB800A], 'L'
		;mov dword [0xB800B], 0x07
		;mov dword [0xB800C], ' '
		;mov dword [0xB800D], 0x07
		;mov dword [0xB800E], 'F'
		;mov dword [0xB800F], 0x07
		;mov dword [0xB8010], 'A'
		;mov dword [0xB8011], 0x07
		;mov dword [0xB8012], 'I'
		;mov dword [0xB8013], 0x07
		;mov dword [0xB8014], 'L'
		;mov dword [0xB8015], 0x07


        ;If we somehow exit from the C kernel, we'll just basically shutdown the computer because fuck you right?
        cli
        hlt
