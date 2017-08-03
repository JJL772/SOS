Hello, world!



================================================================================================================================================================================
INSTALLATION:

-The first step is to grab the latest version of the OS. Download it from: https://gitlab.com/JJL772/JOS/repository/archive.zip?ref=master

-You will need to install the linux-windows toolchain, which allows you to execute linux software from windows, it also provides
linux package management. Follow this link for a tutorial how to install it:
https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/

-After you've installed it, open windows CMD (Shift rightclick somewhere and select 'open command window here' from the drop-down) and type bash
to verify it's working. If it is, it will ask you to create a new bash user, create a new user, and DONT forget your password.

-If its working, now you need to install a bunch of packages to allow you to build and run the OS

-First you need to install QEMU, which is a VM you can run the OS on. This you will have to install via windows installer. To install,
go to https://qemu.weilnetz.de/w64/2017/qemu-w64-setup-20170420.exe This will download a QEMU installer onto your computer. Once downloaded,
run the installer. Please take note of the install directory of QEMU, we will need this later (its easy to find late anyways)

-Now that that's all working good (hopefully), we just have to change some things quickly. Open the file 'run_iso.bat' with a text editor, 
do this by right clicking on the file and selecting 'edit' from the drop-down menu. Once its open in notepad, replace the line "D:\Programs\QEMU\qemu-system-i386.exe" with
your path of installation, if you didn't change QEMU's install path when running the setup, simply type "C:\Program Files\qemu\qemu-system-i386.exe" in its place.

-Now you're all done!

-To build the OS run build.bat, and to run the OS, run run_iso.bat

-To open the source in visual studio, right click on the folder with the OS inside, and select open with visual studio on the drop-down menu.

================================================================================================================================================================================
EXTRA INFO:

Some notes about the OS:

-This is written in a mixture of Assembly, C and C++

-This OS is NOT finished at all, its basically just a shell, no keyboard drivers yet, nor any advanced functions

-This OS doesn't FULLY support C++, you can still write code in C++, but there are some limitations:

	-You can't use 'new' or 'delete' to instantiate classes, because malloc hasn't been implemented yet

	-There is no standard library for C or C++, just the code you write, you will get crashes if you try to use the standard library (ie. no strings, no cout, no printf, etc.)

-Some extra notes about the OS

	-This is build for 32-bit system, so no long int's or doubles.

	-Crashes are very difficult to detect, because there is no exception handler, meaning if the OS crashes, it will just freeze.

	-Most things will require the direct manipulation of memory, which can be tricky and difficult

	-Learn C++ and Assembly if you want to understand this OS

================================================================================================================================================================================