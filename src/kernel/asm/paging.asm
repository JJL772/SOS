;Notes on paging first
;IF CR0.PG = 1 AND CR4.PAE = 1 AND IA32_EFER = 0 THEN PAE PAGING ENABLED
;PAE paging translates 32 bit linear addresses into 52 bit physical addresses 

;Some basic notes:
; - Logical processor maintains set of 4 PDPTE registers
; - PDPTE registers loaded from address stored in CR3
; - Linear addresses translated using 4 hirearchies of paging structures
; - Each one of these paging structures is located with a PDPTE register

;PDPTE REGISTERS:
; - CR3 references the base of a 32-byte page-directory-pointer-table (PDPT)
; Contents of CR3:
; | BIT POS |								Contents									|
; | 4:0		| Ignored																	|
; | 31:5	| Physical addr. of 32-byte aligned talbe for linear address translation	|
; | 63:32	| Ignored (only on 64 bit)													|

;The above table comprises 4 64 bit entries called PDPTEs
; - Each PDPTE controls access to 1 gigabye reigon of linear address space
; - The logical processor maintains a set of 4 internal PDPTE registers: PDPTE0, PDPTE1, PDPTE2, PDPTE3
; - These registers are updated only when certain operations occur
;  - If paging is enabled after a MOV to CR0 or CR4, PDPTEs loaded from CR3
;  - If MOV to CR3, PDPTEs loaded from new addr in CR3
;  - If task switch changes the value of CR3, then PDPTEs loaded from new CR3

;Structure of PDPTE register:
; | BIT POS |												Contents												|
; | 0 (P)	| Present; must be 1 to reference page directory														|
; | 2:1		| Reserved, must be 0																					|
; | 3 (PWT)	| Page-level write-through; det. memory type used to access the page dir referenced by this entry		|
; | 4 (PCD)	| Page-level cache disable; det. memory type used to access the page dir referenced by this entry		|	
; | 8:5		| Reserved, must be 0																					|
; | 11:9	| Ignored																								|
; |(M-1):12	| Physical address of 4-kilobyte aligned page directory referenced by this entry						|
; |63:M		| Reserved, must be 0																					|



;4 LEVEL PAGING STUFF
;IF CR0.PG = 1 AND CR4.PAE = 1 AND IA32_EFER.LME = 1 THEN 4 LEVEL PAGING IS USED
;4-Level paging translates 48-bit linear addresses to 52-bit physical addresses

;Basic notes:
; - Uses hirearchy of paging structures to produce a translation for a linear address
; - CR3 is used to locate the first paging structure, the PML4 table
; - Use of CR3 is determined by CR4.PCIDE
;  - PCIDE is a process context identifier 

;Use of CR3 with CR4.PCIDE = 1
; | Bit Pos |		Contents									|
; | 2:0		| Ignored											|
; | 3 (PWT) | Page write through, det. memory type indirectly	|
; | 4 (PCD) | Page chache disable, det. memory type indirectly	|
; | 11:5	| Ignored											|
; | M-1:12	| Physical addr. of 4kb aligned PML4 page table		|
; | 63:M	| Reserved											|

;Use of CR3 with CR4.PCCIDE = 0
; | Bit Pos	|		Contents								|
; | 11:0	| PCID											|
; | M-1:12	| Physical addr. of 4kb aligned PML4 page table	|
; | 63:M	| Reserved										|

;If CR4.PKE = 1, a protection key is associated with each linear address
;