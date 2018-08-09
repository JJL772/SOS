/*

Notes:

* Code segment sizes may need to be increased later on to allow for more code, blah

* Stack size may need to be adjusted, as with the data sections

*/

ENTRY(_boot)

SECTIONS {
	. = 1M;

	/* 8kb of boot code */
	.text BLOCK(8K) : ALIGN(8K)
	{
		*(.boot)
	} = 0x6690 /* Fill remaining space with NOP instructions (Opcode = 0x6690) */

	/* Boot data block, 4kb */
	.data BLOCK(4k) : ALIGN(4K)
	{
		*(.bootdata)
	} = 0x0 /* Unused area zeroed out */

	/* Boot initialized data block, 4kb */
	.bss BLOCK(4K) : ALIGN(4K)
	{
		*(.bootbss)
	} = 0x0 /* Unused area zeroed out */

	/* 16 kb */

	/* Interrupt handler will be in its own section, referenced by task descriptor */
	.text BLOCK(16k) : ALIGN(16k)
	{
		*(.inthandler)
	} = 0x6690 /* Fill remaining space with NOP instructions (Opcode = 0x6690) */

	/* 32 kb */

	/* Main kernel data section, 16kb */
	.data BLOCK(16K) : ALIGN(16K)
	{
		*(.data)
	} = 0x0 /* Unused area zeroed out */

	/* 48 kb */

	/* Main kernel initialized data section, 16kb */
	.bss BLOCK(16K) : ALIGN(16K)
	{
		*(COMMON)
		*(.bss)
	} = 0x0 /* Unused area zeroed out */

	/* 64 kb */

	/* Rest of the kernel code will go here, 64kb section (for now) */
	.text BLOCK(64K) : ALIGN(64K)
	{
		*(.text)
		*(.kernel)
	} = 0x6690 /* Fill remaining space with NOP instructions (Opcode = 0x6690) */

	/* 128 kb */

	/* Kernel stack, 16kb */
	.bss BLOCK(16K) : ALIGN(16K)
	{
		*(.stack)
	} = 0x0 /* Unused area zeroed out */

	/* Move data sections here in the future?
	.data BLOCK(64K) : ALIGN(64K)
	{
		*(.data)
	}

	.bss BLOCK(64K) : ALIGN(64K)
	{
		*(.bss)
	} = 0x0
	*/

}
