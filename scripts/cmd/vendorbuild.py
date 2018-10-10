#Constructs special vendor IDs from strings
import os
import math

vendor = input("Enter vendor name...")

vendor = list(vendor)

low1 = ord(vendor[0])
low1 |= ord(vendor[1]) << 8
low1 |= ord(vendor[2]) << 16
low1 |= ord(vendor[3]) << 24

med1 = ord(vendor[4])
med1 |= ord(vendor[5]) << 8
med1 |= ord(vendor[6]) << 16
med1 |= ord(vendor[7]) << 24

hi1 = ord(vendor[8])
hi1 |= ord(vendor[9]) << 8
hi1 |= ord(vendor[10]) << 16
hi1 |= ord(vendor[11]) << 24

res = low1 | med1
res |= hi1

print(hex(res))