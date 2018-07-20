import os
import subprocess
import time
import datetime
import sys
from time import strftime, localtime

#Change this if the command is different on your system
genisoimage_cmd = "genisoimage"

output_path = "build/iso/"
output_name = output_path + strftime("%d-%m-%Y-%I:%M:%S%p-os.iso", localtime())

params = [
    "-R ",
    "-b boot/grub/stage2_eltorito ",
    "-no-emul-boot ",
    "-boot-load-size 4 ",
    "-A os ",
    "-input-charset utf8 ",
    "-quiet ",
    "-boot-info-table ",
    "-o ",
    output_name,
    " iso",
]

print("Generating ISO disk image...")

try:
    if sys.platform.startswith("win"):
        params.append('"')
        st = ''.join(params)
        os.system('bash -c "genisoimage ' + st)
    else:
        st = ''.join(params)
        os.system(genisoimage_cmd + st)
except:
    print("An error ocurred while generating the ISO")
    print("Please make sure you have genisoimage properly installed on your system")
    input("Press any key to continue...")
    exit(1)

print("Generated ISO " + output_name)

input("Press any key to continue...")
