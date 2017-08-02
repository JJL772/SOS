; Starts the kernel up

global _start
extern kmain

STACK_SIZE equ 16384

section .bss
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

        ;If we somehow exit from the C kernel, we'll just basically shutdown the computer because fuck you right?
        cli
        hlt
