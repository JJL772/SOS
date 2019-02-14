#=========================================#
# 
# Main makefile for the kernel
#
#=========================================#


REM_DIR = intermediate/*.o
NASM_FORMAT = elf32
LD_PARAMS = -nostdlib 
KERNEL_OUT = bin/kernel.elf
KERNEL_ISO = iso/boot/kernel.elf
OBJ_OUT_C = intermediate/kernel.o intermediate/screen.o
OBJ_OUT_ASM = intermediate/boot.o

CPP_SRC =	$(wildcard src/kernel/*.cpp) \
			$(wildcard src/drivers/*.cpp)\
			$(wildcard src/kernel/screen/*.cpp)\
			$(wildcard src/kernel/memory/*.cpp) \
			$(wildcard src/lib/*.cpp) \
			$(wildcard src/kernel/core/*.cpp)\
			$(wildcard src/kernel/main/*.cpp) \
			
ASM_SRC =	$(wildcard src/kernel/*.asm) 
			
OBJ_OUT = intermediate/cpp_out.o
		
ASM_OBJ_OUT = 	$(ASM_SRC:.asm=.o)
		
all:
	clang -m32 -D_KERNEL_BUILD=1 -fno-stack-protector -w -nostartfiles -nodefaultlibs $(C_SRC) -o $(OBJ_OUT)
	nasm -f $(NASM_FORMAT) $(ASM_SRC) -o $(ASM_OBJ_OUT)
	ld -T scripts/link/kernel_main.ld -melf_i386 $(LD_PARAMS) $(ASM_OBJ_OUT) $(OBJ_OUT) -o $(KERNEL_OUT)


	cp $(KERNEL_OUT) $(KERNEL_ISO)
	genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -input-charset utf8 -quiet -boot-info-table -o os.iso iso

mkiso:
	echo Not implemented.
	