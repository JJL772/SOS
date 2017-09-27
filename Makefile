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
			
ASM_SRC =	$(wildcard src/kernel/*.asm) \
			$(wildcard src/drivers/*.asm)
			
OBJ_OUT = intermediate/cpp_out.o
		
ASM_OBJ_OUT = 	$(ASM_SRC:.asm=.o)
		
all:
	nasm -f $(NASM_FORMAT) $(ASM_SRC) -o $(ASM_OBJ_OUT)
	g++ -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -Wall -Wextra -nostartfiles -nodefaultlibs $(CPP_SRC) -o $(OBJ_OUT)
	ld -T link.ld -melf_i386  $(LD_PARAMS) $(ASM_OBJ_OUT) $(OBJ_OUT) -o $(KERNEL_OUT)
	cp $(KERNEL_OUT) $(KERNEL_ISO)
	genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -input-charset utf8 -quiet -boot-info-table -o os.iso iso
	
clean:
	rm $(REM_DIR)
	
rebuild:
	rm $(REM_DIR)
	nasm $(ASM_SOURCES) -f $(NASM_FORMAT) -o $(ASM_OUT)
	gcc -c -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -Wall -Wextra -Werror -nostartfiles -nodefaultlibs $(C_SOURCES) -o $(C_OBJ_OUT) -lgcc
	ld -T link.ld -melf_i386 $(LD_PARAMS) $(C_OBJ_OUT) $(ASM_OUT) -o $(KERNEL_OUT)
	cp $(KERNEL_OUT) $(KERNEL_ISO)
	genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -input-charset utf8 -quiet -boot-info-table -o os.iso iso
	
makeiso:
	genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -input-charset utf8 -quiet -boot-info-table -o os.iso iso
	
complete_run:
	nasm $(ASM_SOURCES) -f $(NASM_FORMAT) -o $(ASM_OUT)
	gcc -c -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -Wall -Wextra -Werror -nostartfiles -nodefaultlibs $(C_SOURCES) -o $(C_OBJ_OUT) -lgcc
	ld -T link.ld -melf_i386 $(LD_PARAMS) $(C_OBJ_OUT) $(ASM_OUT) -o $(KERNEL_OUT)
	genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -input-charset utf8 -quiet -boot-info-table -o os.iso iso
	
	