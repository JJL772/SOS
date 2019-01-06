# Intro
Specification stuff is here!
The modules/ folder containers sample os headers, but they may be slightly different in the actual os, as they just define the basic signatures of structures, etc.

# Concepts

# Rationale
The thought behind this operating system is that GUIs are overrated and that the user is god.
It might seem cheesy, but the user should be considered all-powerful unlike other operating systems that limit the user's abilities to protect the computer. (I'm looking at you, windows.)
The main interface of the computer is the command line, aka CLI (command line interface), as anything fancier is overrated and unnessessary.
Some little GUIs might be included later, but nothing super fancy.

## Permissions
Permissions can be applied to files and folders, plus applications can be launched with specific permissions.

## Parallelism/Multitasking
Multiple programs can be run at the same time, there is no limit, however, one can be set using environment variables.

## File system
The file system behaves similar to the linux file system. However, symbolic links aren't enabled.
OS should support FAT32, FAT16, FAT8, exFAT, NTFS and EXT4

### File system paths:
#### /
Acts as the root of all files/folders.

#### /users/
User accounts will be in here.
Ex: /users/jeremy/

#### /cli/
Programs that the cli can launched.

#### /programs/
Installed programs go here.

#### /sys/
All system files and folders.

#### /include/
OS include files

#### /lib/
Link library files

#### /bin/
OS dynamic libraries and other things

## Command line
The command like will behave similar to linux bash.
The SOS CLI will have numerous built-in functions, such as if, while, for, etc.
Files inside of /cli/ will can be executed on the commandline. In addition, things can be added to the PATH environment variable, which will add a folder to the search path of the cli.

## Programs
Programs may be supplied in ELF or raw binary formats.
With ELF formats, a _main must be specified. Conversely, in raw binary format, the program is loaded into memory as-is. The address 0x1 in the programs address space is the starting address.
When loading raw binary files, the code and bss sections overlap. Each section goes from 0x1 to END_OF_PROG_SPACE.
ELF files are loaded into memory as they should be (using the sections specified in the file).

## Environment Variables
Environment variables are implemented in a similar fashion as linux.
Environment variables provide a method of controlling the computer during runtime without needing some special settings application to control stuff.

## Networking
Basic networking functionality is provided by drivers and the sockets api.