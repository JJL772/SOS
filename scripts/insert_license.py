#Inserts a license/header into all source files, won't update existing licenses, however

import os
import sys
import util
import settings

print("Which projects would you like to insert licenses into?")
print("1. kernel")
print("2. bootloader")

inp = input()

if inp == "1":
    exit()
elif inp == "2":
    exit()
else:
    print("That is not a project!")
    exit()
