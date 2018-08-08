#Settings for command-line jazz
#you may need to tweak stuff in here to match your setup

#Shell command for python
python_command = "python3"

#ld command
ld_command = "ld"

#g++ command
gpp_command = "g++"

#gcc command
gcc_command = "gcc"

#NASM command
nasm_command = "nasm"

#GAS command
gas_command = "gas"

#genisoimage command
genisoimage_command = "genisoimage"

#
# QEMU COMMANDS
# Only required if you plan on running the kernel in a VM
#

#QEMU-i386 command
qemu_i386_command = "qemu-i386"

#QEMU-arm command
qemu_arm_command = "qemu-arm"

#QEMU-mips command
qemu_mips_command = "qemu-mips"

#QEMU-x86-64 command
qemu_x64_command = "qemu-x86_64"

#Directories to be created during setup
required_dirs = [
    "build/",
    "build/x86/",
    "build/x86/debug/",
    "build/x86/release/",
    "build/x86-64/",
    "build/x86-64/debug/",
    "build/x86-64/release/",
    "build/arm/",
    "build/arm/debug/",
    "build/arm/release",
    "intermediate/",
    "intermediate/x86/",
    "intermediate/x86-64/",
    "intermediate/arm/",
]

kernel_link_script = "scripts/link/kernel/kernel.ld"

kernel_source_dir = "src/kernel/"

bootloader_source_dir = "src/bootloader/"

#
#Kernel settings
#

kernel_include_dirs = [
	"src/kernel/",
	"src/kernel/lib",
]
