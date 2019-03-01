/*

Notes:

* Code segment sizes may need to be increased later on to allow for more code, blah

* Stack size may need to be adjusted, as with the data sections

*/

ENTRY(_boot)

SECTIONS {
	. = 0x80000

	/*

	Kernel page table

	*/
	os_kernel_page_directory = .;
	.bss BLOCK(4k) : ALIGN(4k)
	{
		*(.pgtbl)
	}
	os_kernel_page_directory_end = .;



	. = 1M;

	/*

	Descriptor table sections

	*/
	/* Base of IDT */
	os_idt_base = .;
	.bss BLOCK(4k) : ALIGN(4k)
	{
		*(.idt)
	} = 0x0;
	/* Limit of IDT */
	os_idt_limit = .;

	/* Base of GDT */
	os_gdt_base = .;
	.bss BLOCK(4k) : ALIGN(4k)
	{
		*(.gdt)
	} = 0x0; /* Fill remaining with */
	/* Limit of GDT */
	os_gdt_limit = . - os_gdt_base;

	/*

	Stack

	*/
	/* Base addr of stack, aka the lowest addr of the stack */
	os_stack_base = .;
	.bss BLOCK(16k) : ALIGN(8k)
	{
		*(.stack)
	} = 0x0;
	/* Top of stack, grows downwards */
	os_stack_top = .;

	/* 8kb of boot code */
	.text BLOCK(8K) : ALIGN(8K)
	{
		*(.boot)
	} = 0x90 /* Fill remaining space with NOP instructions (Opcode = 0x6690) */

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
	} = 0x90 /* Fill remaining space with NOP instructions (Opcode = 0x6690) */

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
		*(.intdata)
		*(COMMON)
		*(.bss)
		*(.kernelbss)
	} = 0x0 /* Unused area zeroed out */

	/* 64 kb */

	/* Rest of the kernel code will go here, 64kb section (for now) */
	.text BLOCK(64K) : ALIGN(64K)
	{
		*(.text)
		*(.kernel)
	} = 0x90 /* Fill remaining space with NOP instructions (Opcode = 0x6690) */

	/* 128 kb */
}
