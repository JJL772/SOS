@echo off

echo ------------------------------------------------------------------------------
echo Preparing to install packages...
echo ------------------------------------------------------------------------------
bash -c "sudo apt-get install make"
echo ------------------------------------------------------------------------------
bash -c "sudo apt-get install binutils"
echo ------------------------------------------------------------------------------
bash -c "sudo apt-get install gcc"
echo ------------------------------------------------------------------------------
bash -c "sudo apt-get install genisoimage"
echo ------------------------------------------------------------------------------
bash -c "sudo apt-get install nasm"
echo ------------------------------------------------------------------------------
echo Package installation complete! Please run test.bat to verify they have been installed correctly
echo ------------------------------------------------------------------------------
PAUSE
