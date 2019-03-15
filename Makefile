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

CC				=	clang

LINKER_CMD			=	ld

LD				=	ld

AS				=	nasm

GEN_ISO_IMAGE_CMD	=	genisoimage

#=========================================#
# 
# Directory settings
#
#=========================================#
INTERMEDIATE_DIR	=	obj

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
LINKER_SCRIPT		=	scripts/link/kernel/kernel_main.ld

KERNEL_OUTPUT_FILE	=	$(OUTPUT_DIR)/kernel.elf

CLANG_OBJ_FILE		=	$(INTERMEDIATE_DIR)/kernel/kernel_c_obj.o

ASM_OBJ_FILE		=	$(INTERMEDIATE_DIR)/kernel/kernel_asm_obj.o

#=========================================#
# 
# General build settings
#
#=========================================#
PREPROCESSOR_DEFS	=	-D_KERNEL_BUILD=1 -DARCH_X86=1 -D_I386=1 -D_X86_=1 -D_ARCH_X86_=1

INCLUDE_DIRECTORIES	=	-I$(KERNEL_SRC_DIR)/ -I$(KERNEL_ARCH_DIR)/ -I$(KERNEL_ARCH_DIR)/int/ -I$(KERNEL_ARCH_DIR)/boot/ -I$(KERNEL_ARCH_DIR)/paging/

#=========================================#
# 
# Flags
#
#=========================================#
GEN_ISO_FLAGS		=	-R -b iso/boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -input-charset-utf8 

NASM_OBJ_FORMAT		=	elf32

NASM_FLAGS			=	-f $(NASM_OBJ_FORMAT)

LINKER_FLAGS		=	-nostdlib -melf_i386 -T $(LINKER_SCRIPT)

CLANG_FLAGS			=	-m32 -fno-stack-protector -w -nostartfiles -nodefaultlibs -mcpu=i386

#=========================================#
# 
# Source files
#
#=========================================#
C_SRC	=	$(wildcard $(KERNEL_ARCH_DIR)/int/*.c)	\
			$(wildcard $(KERNEL_ARCH_DIR)/*.c)		\
			$(wildcard $(KERNEL_ARCH_DIR)/boot/*.c)	\
			$(wildcard $(KERNEL_ARCH_DIR)/task/*.c)	\
			$(wildcard $(KERNEL_ARCH_DIR)/int/*.c)	\
			$(wildcard $(KERNEL_ARCH_DIR)/smbios/*.c)	\
			$(wildcard $(KERNEL_ARCH_DIR)/paging/*.c)

ASM_SRC	=	$(wildcard $(KERNEL_ARCH_DIR)/*.asm)		\
			$(wildcard $(KERNEL_ARCH_DIR)/boot/*.asm)	\
			$(wildcard $(KERNEL_ARCH_DIR)/paging/*.asm)	\
			$(wildcard $(KERNEL_ARCH_DIR)/int/*.asm)
		
OBJECTS =	$(ASM_SRC:.asm=.o) $(C_SRC:.c=.o)
#=========================================#
# 
# Rules
#
#=========================================#

all: $(KERNEL_OUTPUT_FILE)

build: $(KERNEL_OUTPUT_FILE)

%.o: %.asm
	@echo
	@echo Building $@
	@mkdir -p $(dir $(INTERMEDIATE_DIR)/$@)
	$(AS) $(PREPROCESSOR_DEFS) -I$(KERNEL_ARCH_DIR)/ -I$(KERNEL_ARCH_DIR)/int/ -I$(KERNEL_ARCH_DIR)/paging/ -f $(NASM_OBJ_FORMAT) -o $(INTERMEDIATE_DIR)/$@ $^

%.o: %.c
	@echo
	@echo Building $@
	@mkdir -p $(dir $(INTERMEDIATE_DIR)/$@)
	$(CC) $(PREPROCESSOR_DEFS) $(INCLUDE_DIRECTORIES) $(CLANG_FLAGS) -o $(INTERMEDIATE_DIR)/$@ $^

%.elf: %.o
	@echo
	@echo Linking $@
	@mkdir -p $(OUTPUT_DIR)
	$(LD) $(LINKER_FLAGS) $^
	
$(KERNEL_OUTPUT_FILE): $(OBJECTS)
	@echo
	@echo Linking $@
	@mkdir -p $(OUTPUT_DIR)
	$(LD) $(LINKER_FLAGS) -o $@ $(addprefix $(INTERMEDIATE_DIR)/, $^)
	

.PHONY: clean
clean:
	@echo Cleaing...
	rm -rf $(INTERMEDIATE_DIR)

rebuild: $(clean) $(KERNEL_OUTPUT_FILE)
