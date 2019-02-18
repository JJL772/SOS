#=========================================#
# 
# Main makefile for the kernel
#
#=========================================#

#=========================================#
# 
# Command settings
#
#=========================================#
NASM_CMD			=	nasm

CLANG_CMD			=	clang 

LINKER_CMD			=	ld

GEN_ISO_IMAGE_CMD	=	genisoimage

#=========================================#
# 
# Directory settings
#
#=========================================#
INTERMEDIATE_DIR	=	intermediate

OUTPUT_DIR			=	build/i386

DISK_IMAGE_DIR		=	iso

KERNEL_ISO_BIN		=	$(ISO)/boot/$(KERNEL_FILENAME)

ISO_OUTPUT			=	$(OUTPUT_DIR)/

KERNEL_SRC_DIR		=	src/kernel

KERNEL_ARCH_DIR		=	$(KERNEL_SRC_DIR)/arch/x86

#=========================================#
# 
# Filename/output settings
#
#=========================================#
LINKER_SCRIPT		=	scripts/link/kernel_main.ld

KERNEL_OUTPUT_FILE	=	$(OUTPUT_DIR)/kernel.elf

CLANG_OBJ_FILE		=	$(INTERMEDIATE_DIR)/kernel/kernel_c_obj.o

ASM_OBJ_FILE		=	$(INTERMEDIATE_DIR)/kernel/kernel_asm_obj.o

#=========================================#
# 
# General build settings
#
#=========================================#
PREPROCESSOR_DEFS	=	-D_KERNEL_BUILD=1 -DARCH_X86=1 -D_I386=1 -D_X86_

INCLUDE_DIRECTORIES	=	-I $(KERNEL_SRC_DIR) -I $(KERNEL_ARCH_DIR)

#=========================================#
# 
# Flags
#
#=========================================#
GEN_ISO_FLAGS		=	-R -b iso/boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -input-charset-utf8 

NASM_OBJ_FORMAT		=	elf32

NASM_FLAGS			=	-f $(NASM_OBJ_FORMAT)

LINKER_FLAGS		=	-nostdlib -m$(NASM_OBJ_FORMAT) -T $(LINKER_SCRIPT)

CLANG_FLAGS			=	-m32 -fno-stack-protector -w -nostartfiles -nodefaultlibs -mcpu=i386

#=========================================#
# 
# Source files
#
#=========================================#
C_SRC	=	$(wildcard $(KERNEL_ARCH_DIR)/int/*.c)	\
			$(wildcard $(KERNEL_ARCH_DIR)/*.c)

ASM_SRC	=	$(wildcard $(KERNEL_ARCH_DIR)/*.asm)		\
			$(wildcard $(KERNEL_ARCH_DIR)/boot/*.asm)
		
#=========================================#
# 
# Rules
#
#=========================================#

all: $(build)

build:
	$(NASM_CMD) $(NASM_FLAGS) $(ASM_SRC) -o $(ASM_OBJ_FILE)
	
	$(CLANG_CMD) $(CLANG_FLAGS) $(C_SRC) -o $(CLANG_OBJ_FILE)

	$(LINKER_CMD) $(LINKER_FLAGS) $(ASM_OBJ_FILE) $(CLANG_OBJ_FILE) -o $(KERNEL_OUTPUT_FILE)

	$(GEN_ISO_IMAGE_CMD) $(GEN_ISO_FLAGS) -o $(ISO_OUTPUT_FILE) iso


	#cp $(KERNEL_OUT) $(KERNEL_ISO)
	#genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -input-charset utf8 -quiet -boot-info-table -o os.iso iso


clean:
	rm $(ISO_OUTPUT_FILE)
	rm $(KERNEL_OUTPUT_FILE)
	rm $(ASM_OBJ_FILE)
	rm $(CLANG_OBJ_FILE)

rebuild: $(clean) $(build)

$(INTERMEDIATE_DIR):
	mkdir $(INTERMEDIATE_DIR)

$(OUTPUT_DIR):
	mkdir $(OUTPUT_DIR)

$(DISK_IMAGE_DIR):
	mkdir $(DISK_IMAGE_DIR)
