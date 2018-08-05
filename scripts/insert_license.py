#Inserts a license/header into all source files, won't update existing licenses, however

import os
import sys
import util
import settings
import pathlib
import datetime
from datetime import date, datetime
from pathlib import Path

print("Which projects would you like to insert licenses into?")
print("1. kernel")
print("2. bootloader")

inp = input()

#Python file license thing
python_file_thing = util.read_all_lines("license_python.txt")
#C/C++ file thing
c_file_thing = util.read_all_lines("license_c.txt")
#Assembly thing
asm_file_thing = util.read_all_lines("license_asm.txt")

if inp == "1":
    print("inserting headers...")
    files = util.list_files(settings.kernel_source_dir)
    for file in files:
        print(file)
        append_license(file)
elif inp == "2":
    print("inserting headers...")
    files = util.list_files(settings.bootloader_source_dir)
    for file in files:
        append_license(file)
else:
    print("That is not a valid operation!")
    exit()

print("Finished inserting license headers!")

#Internal function, assumes file exists
def append_license(file):
    fs = open("file", 'r')
    stri = fs.read(2)

    if "//" in stri or "/*" in stri or ";" in stri or "#" in stri:
        return None
        
    fpath = Path(file)
    if fpath.suffix == ".py":
        fcopy = python_file_thing
    elif fpath.suffix == ".c" or fpath.suffix == ".h" or fpath.suffix == ".cpp" or fpath.suffix == ".hpp":
        fcopy = c_file_thing
    elif fpath.suffix == ".asm" or fpath.suffix == ".S" or fpath.suffix == ".s":
        fcopy = asm_file_thing
    else:
        return None

    tdate = datetime.now()

    fcopy.replace("%NAME%", fpath.name)
    fcopy.replace("%DAY%", tdate.day)
    fcopy.replace("%MONTH%", tdate.month)
    fcopy.replace("%YEAR%", tdate.year)
    fcopy.replace("%HOUR%", tdate.hour)
    fcopy.replace("%MINUTE%", tdate.minute)
    fcopy.replace("%SECOND%", tdate.second)

    util.append_to_file(file, fcopy)
