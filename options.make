# Compile using clang, allows for cross compilation
#
# Clang options:
#	* -I <dir> 			Adds dir to include search path
# 	* -L <dir>			Adds dir to lib search path
#	* -D m=v			Defines a macro m and sets its value to v
#	* -fshort-enums		Enums will only be allocated for the range of required values
#	* -fvectorize		Enable vectorization of loops
#	* -isysroot			Sets the system root
#	* -o <file>			Write output to file
# 	* -std=<std>		The standard to compile for
# 	* --target=<tgt>	Compile for specified target
# 	* -w				Supress all warnings
#	* -shared			Output shared lib
#	* -c				Compile, but don't run linker
#	* -fpic				Position-independent-code, required for shared libraries
#
#	Registered Targets:
#    aarch64    - AArch64 (little endian)
#    aarch64_be - AArch64 (big endian)
#    amdgcn     - AMD GCN GPUs
#    arm        - ARM
#    arm64      - ARM64 (little endian)
#    armeb      - ARM (big endian)
#    bpf        - BPF (host endian)
#    bpfeb      - BPF (big endian)
#    bpfel      - BPF (little endian)
#    hexagon    - Hexagon
#    lanai      - Lanai
#    mips       - Mips
#    mips64     - Mips64 [experimental]
#    mips64el   - Mips64el [experimental]
#    mipsel     - Mipsel
#    msp430     - MSP430 [experimental]
#    nvptx      - NVIDIA PTX 32-bit
#    nvptx64    - NVIDIA PTX 64-bit
#    ppc32      - PowerPC 32
#    ppc64      - PowerPC 64
#    ppc64le    - PowerPC 64 LE
#    r600       - AMD GPUs HD2XXX-HD6XXX
#    sparc      - Sparc
#    sparcel    - Sparc LE
#    sparcv9    - Sparc V9
#    systemz    - SystemZ
#    thumb      - Thumb
#    thumbeb    - Thumb (big endian)
#    x86        - 32-bit X86: Pentium-Pro and above
#    x86-64     - 64-bit X86: EM64T and AMD64
#    xcore      - XCore

#
# x86 Debug Configurations
#

#Source directories
src_x86_debug = $(wildcard src/kernel/*.c	\
					src/kernel/lib/*.c		\
					src/kernel/errno/*.c	\
					src/kernel/sys/*.c		\
					src/kernel/arch/x86/*.c		\
					src/kernel/arch/x86/task/*.c	\
					src/kernel/arch/x86/int/*.c		\
					src/kernel/arch/x86/boot/*.c	\
					)

#Assembler source dirs
src_x86_debug_asm = $(wildcard src/kernel/*.asm		\
						src/kernel/arch/x86/*.asm	\
						src/kernel/arch/x86/boot/*.asm	\
						src/kernel/arch/x86/task/*.asm	\
						src/kernel/arch/x86/int/*.asm	\
						)


#Intermediate file output, .o, .obj, etc.
int_x86_debug = $(build/x86/debug/intermediate)

#Log directory
log_x86_debug = $(build/x86/debug/logs)

#Preprocessor definitions
preprocessor_x86_debug = $(-D DEBUG=1 -D X86=1)

#Include dirs
include_dirs_x86_debug = 

#Compiler options
compiler_opt_x86_debug = $(--target=x86 $(preprocessor_x86_debug) )

