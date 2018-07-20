;=========================================================
; Name: math32.asm
; Purpose: Implements numerous math functions
; Author: Jeremy L.
; Date of Creation: <Unknown>
;=========================================================

section .data:

section .text:
	
	;==================================================
	; float _sin(float val)
	; Returns the sine of the provided value, in rad
	;==================================================
	_sin:
		push ebp
		mov ebp, esp

		fld dword [ebp-4]
		fsin st0

		mov eax, st0

		pop ebp
		ret

	;==================================================
	; float _cos(float val)
	; Returns cosine of the provided value, in rad
	;==================================================
	_cos:
		push ebp
		mov ebp, esp

		fld dword [ebp-4]
		fcos st0

		mov eax, st0

		pop ebp 
		ret

	;==================================================
	; float _tan(float val)
	; Returns the tangent of the provided value, in rad
	;==================================================
	_tan:
		push ebp
		mov ebp, esp

		fld dword [ebp-4]
		fptan st0

		mov [ebp+4], st0
		mov eax, [ebp+4]

		pop ebp
		ret


	;==================================================
	; float _sqrt(float val)
	; Returns the square root of the provided value
	;==================================================
	_sqrt:
		push ebp
		mov ebp, esp

		fld dword [ebp-4]
		fsqrt st0

		mov eax, st0

		pop ebp
		ret