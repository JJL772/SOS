@echo off

echo ------------------------------------------------------------------------------
echo Preparing to install packages...
echo ------------------------------------------------------------------------------
bash -c "sudo apt-get install make binutils clang gcc genisoimage nasm"
echo ------------------------------------------------------------------------------
echo Package installation complete! Please run test.bat to verify they have been installed correctly
echo ------------------------------------------------------------------------------
PAUSE
