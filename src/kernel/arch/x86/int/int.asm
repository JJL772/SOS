;
; int.asm
;
; Contains interrupt procedures, calls into C procedures
;


global ivt_gp
global ivt_ac
global ivt_bp
global ivt_br
global ivt_db
global ivt_de
global ivt_df
global ivt_mc
global ivt_mf
global ivt_nm
global ivt_of
global ivt_pf
global ivt_sys
global ivt_ts
global ivt_ud
global ivt_ve
global ivt_xm
global ivt_ss

extern 

section .inthandler

	ivt_gp:
		iret

	ivt_ac:
		iret

	ivt_bp:
		iret

	ivt_br:
		iret

	ivt_db:
		iret

	ivt_de:
		iret

	ivt_df:
		iret

	ivt_mc:
		iret

	ivt_mf:
		iret

	ivt_nm:
		iret

	ivt_of:
		iret

	ivt_pf:
		iret

	ivt_sys:
		iret

	ivt_ts:
		iret

	ivt_ud:
		iret

	ivt_ve:
		iret

	ivt_xm:
		iret

	ivt_ss:
		iret