;
; int.asm
;
; Contains interrupt procedures, calls into C procedures
;


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