#Runs the OS in a VM

import util

util.check_python_version()

import sys
import os
import settings

print("Please choose what you would like to run:")
print("1. QEMU-i386 (SOS-x86)")
print("2. QEMU-x86_64 (SOS x64)")
print("3. QEMU-arm (SOS ARM)")
print("4. QEMU-mips (SOS MIPS)")
print("5. NONE! GET ME OUT OF HERE!")

inp = input()
cmd = "qemu-i386"

if inp == "1":
    inp = util.DIST_X86
    cmd = settings.qemu_i386_command
elif inp == "2":
    inp = util.DIST_X64
    cmd = settings.qemu_x64_command
elif inp == "3":
    inp = util.DIST_ARM
    cmd = settings.qemu_arm_command
elif inp == "4":
    inp = util.DIST_MIPS
    cmd = settings.qemu_mips_command
else:
    print("Invalid platform.")
    exit()

print("Choose a type of build:")
print("1. debug")
print("2. release")

typ = input()

if typ == "1":
    typ = util.DIST_DEBUG
else:
    typ = util.DIST_RELEASE

distros = util.get_distros(util.DIST_X86, typ)

if len(distros) <= 0:
    print("No builds fitting the parameters found.")
    print("You should try to build the OS! :)")
    exit()

print("Please select a build to use:")
i = 0
for dis in distros:
    i += 1
    print(str(i) + ". " + dis)

inp = input()
inp = int(inp)

subprocess.call([cmd, "-boot d", "-cdrom", distros[inp]])
