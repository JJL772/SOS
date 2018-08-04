import os
import subprocess
import settings
import util

#Shhhh keep it quiet!
util.create_folders(quiet=True)


def build_kernel_x86():
    print("Building kernel...")

def build_kernel_x86_64():
    print("Building kernel...")

print("Please enter what you would like to build:")
print("1. Kernel")
print("2. Bootloader")

print("Please enter the target platform:")
print("1. x86")
print("2. x86-64")
print("3. arm")
print("4. mips")

print("Please enter the build type:")
print("1. debug")
print("2. release")
