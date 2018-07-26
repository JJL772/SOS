;Setup for numerous intel chips

global IVYBRIDGE_SETUP
global CANNONLAKE_SETUP
global COFFEELAKE_SETUP
global KABYLAKE_SETUP
global SKYLAKE_SETUP
global BROADWELL_SETUP
global HASWELL_SETUP
global SANDYBRIDGE_SETUP
global WESTMERE_SETUP
global NEHALEM_SETUP
global PENRYN_SETUP
global CORE_SETUP
global MOD_PENTIUMM_SETUP
global PENTIUMM_SETUP
global P6_SETUP
global I486_SETUP
global I386_SETUP

section .text

	IVYBRIDGE_SETUP:
		push ebp
		mov esp, ebp
		;Ivybridge setup code here
		pop ebp
		ret

	CANNONLAKE_SETUP:
		push ebp
		mov esp, ebp
		;Cannonlake setup code here
		pop ebp
		ret

	COFFEELAKE_SETUP:
		push ebp
		mov esp, ebp
		;Coffeelake setup code here
		pop ebp
		ret

	KABYLIKE_SETUP:
		push ebp
		mov esp, ebp
		;Kabylake setup code here
		pop ebp
		ret

	SKYLAKE_SETUP:
		push ebp
		mov esp, ebp
		;Skylake setup code here
		pop ebp
		ret

	BROADWELL_SETUP:
		push ebp
		mov esp, ebp
		;Broadwell setup code here
		pop ebp
		ret

	HASWELL_SETUP:
		push ebp
		mov esp, ebp
		;Haswell setup code here
		pop ebp
		ret

	SANDYBRIDGE_SETUP:
		push ebp
		mov esp, ebp
		;Sandybridge setup code here
		pop ebp
		ret

	WESTMERE_SETUP:
		push ebp
		mov esp, ebp
		;Westmere setup code here
		pop ebp
		ret

	NEHALEM_SETUP:
		push ebp
		mov esp, ebp
		;Nehalem setup code here
		pop ebp
		ret

	PENRYN_SETUP:
		push ebp
		mov esp, ebp
		;Penryn setup code here
		pop ebp
		ret

	;NOTE: this means the intel core arch
	CORE_SETUP:
		push ebp
		mov esp, ebp
		;Core setup code
		pop ebp
		ret

	MOD_PENTIUMM_SETUP:
		push ebp
		mov esp, ebp
		;Modified pentium M setup code here
		pop ebp
		ret

	PENTIUMM_SETUP:
		push ebp
		mov esp, ebp
		;Pentium M setup code here
		pop ebp
		ret

	P6_SETUP:
		push ebp
		mov esp, ebp
		;P6 setup code here
		pop ebp
		ret

	I486_SETUP:
		push ebp
		mov esp, ebp
		;i486 setup code here
		pop ebp
		ret

	I386_SETUP:
		push ebp
		mov esp, ebp
		;i386 setup code here
		pop ebp
		ret