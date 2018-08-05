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

#Appends a block of text to the beginning of a file
def append_to_file(file, text, quiet):
    fpath = Path(file)
    if not fpath.exists():
        return None
    try:
        fs = open(file, mod='rw')

        if fs.seekable():
            fs.seek(0)
        else:
            buf = fs.read()
            text += buf

        fs.write(text)
        fs.flush()
        fs.close()
    except:
        raise OSError()
    if fs == None:
        return None

#Returns all the files in a directory, includes dub-dirs
def list_files(dir):
    ret = list()
    if not Path(dir).exists() or not Path(dir).is_dir():
        return ret
    for file in os.listdir(dir):
        if Path(file).is_file():
            ret.append(file)
        elif Path(file).is_dir():
            ret.extend(str(dir)+"/"+file)
    return ret

def read_all_lines(file):
    try:
        fs = open(file, 'r')
        buf = fs.read()
        fs.close()
    except:
        return ""
