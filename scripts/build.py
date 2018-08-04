import os
import subprocess
import settings
import util
import test

import kernel_build_debug_x86
import kernel_build_debug_x64
import kernel_build_release_x86
import kernel_build_release_x64

#Shhhh keep it quiet!
util.create_folders(quiet=True)

print("Please enter what you would like to build:")
print("1. Kernel")
print("2. Bootloader")

build_tgt = input()

print("Please enter the target platform:")
print("1. x86")
print("2. x86-64")
print("3. arm")
print("4. mips")

build_plat = input()

print("Please enter the build type:")
print("1. debug")
print("2. release")

build_type = input()
