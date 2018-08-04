#Some utilities for stuff!

import sys
import os
import io
import pathlib
import settings

from pathlib import Path

python_version_major = 3
python_version_minor = 0

#Checks if we are running in the required python version
def check_python_version():
    if sys.version_info[0] < python_version_major or sys.version_info[1] < python_version_minor:
        print("Please install the proper version of python. You have: " + str(sys.version_info[0]) + "." + str(sys.version_info[1]) + "but you need: " + python_version_major + "." + python_version_minor)

#Distros
DIST_X86 = "x86"
DIST_X64 = "x86-64"
DIST_ARM = "arm"
DIST_MIPS = "mips"
DIST_RELEASE = "release"
DIST_DEBUG = "debug"

#Returns a distro of the OS
def get_distros(dist, type):
    path = "build/" + dist + "/" + type + "/"
    if not os.path.exists(path):
        return list()

    ls = os.listdir(path)
    ret = list()
    for dir in ls:
        if Path(path + dir + "/iso/os.iso").exists():
            ret.append(dir)

    return ret

def create_folders(quiet=False):
    for dir in settings.required_dirs:
        if not os.path.exists(dir):
            if not quiet:
                print("Creating folder " + dir + "...")
            os.mkdir(dir)
