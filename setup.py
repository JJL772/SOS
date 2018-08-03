#Checks if required programs are installed, etc

import sys

#Check for python 3, if not, print an error!
if(sys.version_info[0] < 3):
    print("Python 3 or higher must be installed! If it is already, you may be running this script with the wrong command line.")
    exit()

import subprocess
import errno
import settings
import os
from subprocess import DEVNULL

failed_deps = list()

print("Verifying dependencies...")

def check_command(cmd, package):
    try:
        subprocess.call([cmd], stderr=subprocess.DEVNULL, stdout=subprocess.DEVNULL)
        print(package + "\t\t....OK")
    except OSError as ex:
        print(package + "\t\t....MISSING")
        if package not in failed_deps:
            failed_deps.append(package)
        #else:
        #    print("An unspecified error has ocurred while checking for the presence of the package " + package)

#bin-utils
check_command(settings.ld_command, "bin-utils")

#gcc, gas, g++
check_command(settings.gcc_command, "gcc")
#check_command(settings.gas_command, "gcc")
check_command(settings.gpp_command, "g++")

#NASM
check_command(settings.nasm_command, "nasm")

#genisoimage
check_command(settings.genisoimage_command, "genisoimage")

#QEMU
check_command(settings.qemu_arm_command, "qemu-arm")
check_command(settings.qemu_x64_command, "qemu-x86_64")
check_command(settings.qemu_i386_command, "qemu-i386")
check_command(settings.qemu_mips_command, "qemu-mips")

if len(failed_deps) > 0:
    print("The following dependencies failed to verify:")
    for dep in failed_deps:
        print("\t" + dep)

    if "qemu" in failed_deps:
        print("The package QEMU is not installed or has supplied the incorrect commands.")
        print("QEMU is not required to build the operating system, but it is required to run the OS in a virtual machine.")

    print("If any packages that have not been found are on the list, please install them and check that settings.py contains the proper command definitions.")
else:
    print("All required packages appear to be installed!")
