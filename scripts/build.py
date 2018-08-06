import os
import subprocess
import settings
import util
import test
import sys

sys.path.append('/build/bootloader/')
sys.path.append('/build/kernel/')

import build.kernel.kernel_build_debug_x86 as kernel_build_debug_x86
import build.kernel.kernel_build_debug_x64 as kernel_build_debug_x64
import build.kernel.kernel_build_release_x86 as kernel_build_release_x86
import build.kernel.kernel_build_release_x64 as kernel_build_release_x64
import build.kernel.kernel_build_debug_arm as kernel_build_debug_arm
import build.kernel.kernel_build_release_arm as kernel_build_release_arm
import build.bootloader.bootloader_build_x86 as bootloader_build_x86
import build.bootloader.bootloader_build_x64 as bootloader_build_x64
import build.bootloader.bootloader_build_arm as bootloader_build_arm

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

#Kernel builds
if build_tgt == "1":
    #x86 builds
    if build_plat == "1":
        #Debug build
        if build_type == "1":
            kernel_build_debug_x86.build()
        #Release build
        elif build_type == "2":
            kernel_build_release_x86.build()
    #x64 builds
    elif build_plat == "2":
        #Debug build
        if build_type == "1":
            kernel_build_debug_x64.build()
        #Release build
        elif build_type == "2":
            kernel_build_release_x64.build()
    #ARM builds
    elif build_plat == "3":
        #Debug build
        if build_type == "1":
            kernel_build_debug_arm.build()
        #release build
        elif build_type == "2":
            kernel_build_release_arm.build()
#Bootloader builds
elif build_tgt == "2":
    #x86 builds
    if build_plat == "1":
        bootloader_build_x86.build()
    #x64 builds
    elif build_plat == "2":
        bootloader_build_x64.build()
    #ARM builds
    elif build_plat == "3":
        bootloader_build_arm.build()
else:
    print("Invalid build target!")
    exit()
