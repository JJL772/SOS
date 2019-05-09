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
CC					=	gcc
LINKER_CMD			=	ld
LD					=	ld
AS					=	nasm
GENISOIMAGE			=	genisoimage

#=========================================#
# 
# Directory settings
#
#=========================================#
INTERMEDIATE_DIR	=	obj
I386_BUILD_DIR		=	build/i386
OUTPUT_DIR			=	$(I386_BUILD_DIR)
DISK_IMAGE_DIR		=	iso/
KERNEL_ISO_BIN		=	iso/boot/$(KERNEL_FILENAME)
ISO_OUTPUT			=	$(OUTPUT_DIR)/sos.iso
KERNEL_SRC_DIR		=	src/kernel
KERNEL_ARCH_DIR		=	$(KERNEL_SRC_DIR)/arch/x86
SRC_DIR			=	src
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
PREPROCESSOR_DEFS_I386	=	-D_KERNEL_BUILD=1 -DARCH_X86=1 -D_I386=1 -D_X86_=1 -D_ARCH_X86_=1

INCLUDE_DIRECTORIES_I386	=	-I$(SRC_DIR)/common -I$(KERNEL_SRC_DIR)/ -I$(KERNEL_ARCH_DIR)/ -I$(KERNEL_ARCH_DIR)/int/ -I$(KERNEL_ARCH_DIR)/boot/ -I$(KERNEL_ARCH_DIR)/paging/

#=========================================#
# 
# Flags
#
#=========================================#
GEN_ISO_FLAGS		=	-R -b boot/grub/stage2_eltorito -V SOS -boot-info-table -no-emul-boot -boot-load-size 4 -A os 
NASM_OBJ_FORMAT_I386		=	elf32
NASM_OBJ_FORMAT_AMD64		=	amd64
NASM_FLAGS			=	-f $(NASM_OBJ_FORMAT)
LINKER_FLAGS_I386		=	-nostdlib -melf_i386 -T $(LINKER_SCRIPT) -x
CC_FLAGS			=	-m32 -fno-stack-protector -w -nostartfiles -nodefaultlibs

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

all: $(ISO_OUTPUT)
	@echo ==================================
	@echo Build finished!
	@echo ==================================

build: $(KERNEL_OUTPUT_FILE)

%.o: %.asm
	@echo
	@echo =========== Building $@ ============
	@mkdir -p $(dir $(INTERMEDIATE_DIR)/$@)
	@$(AS) $(PREPROCESSOR_DEFS_I386) $(INCLUDE_DIRECTORIES_I386) -f $(NASM_OBJ_FORMAT_I386) -o $(INTERMEDIATE_DIR)/$@ $^

%.o: %.c
	@echo
	@echo =========== Building $@ ============
	@mkdir -p $(dir $(INTERMEDIATE_DIR)/$@)
	@$(CC) $(PREPROCESSOR_DEFS_I386) $(INCLUDE_DIRECTORIES_I386) -c $(CC_FLAGS) -o $(INTERMEDIATE_DIR)/$@ $^

%.elf: %.o
	@echo
	@echo =========== Linking $@ ============
	@mkdir -p $(I386_BUILD_DIR)
	@$(LD) $(LINKER_FLAGS_I386) $^
	
$(KERNEL_OUTPUT_FILE): $(OBJECTS)
	@echo
	@echo =========== Linking $@ ============
	@mkdir -p $(I386_BUILD_DIR)
	@$(LD) $(LINKER_FLAGS_I386) -o $@ $(addprefix $(INTERMEDIATE_DIR)/, $^)
	@echo Copying to $(dir $(KERNEL_ISO_BIN))
	@mkdir -p $(dir $(KERNEL_ISO_BIN))
	@cp $(KERNEL_OUTPUT_FILE) $(KERNEL_ISO_BIN)
	@echo Wrote $@

$(ISO_OUTPUT): $(KERNEL_OUTPUT_FILE)
	@echo 
	@echo =========== Generating ISO $@ ============
	@$(GENISOIMAGE) $(GEN_ISO_FLAGS) -o $(ISO_OUTPUT) $(DISK_IMAGE_DIR)
	@echo Wrote $@

mkiso: $(ISO_OUTPUT)

.PHONY: clean
clean:
	@echo Cleaing $(INTERMEDIATE_DIR)
	@rm -rf $(INTERMEDIATE_DIR)
	@echo Cleaning $(I386_BUILD_DIR)
	@rm -rf $(I386_BUILD_DIR)
	@echo Done!

rebuild: $(clean) $(KERNEL_OUTPUT_FILE)
