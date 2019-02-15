;
; protection.asm
;
; Configures memory protection
;

[BITS 32]

global EnablePaging

section .boot

	os_setup_protection:
		push ebp
		mov ebp, esp

		

		pop ebp
