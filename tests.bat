@echo off

echo ------------------------------------------------------------------------------
echo If any command returns something like 'no such command' you have installed something incorrectly...
echo ------------------------------------------------------------------------------
bash -c "ld"
echo ------------------------------------------------------------------------------
bash -c "g++"
echo ------------------------------------------------------------------------------
bash -c "nasm"
echo ------------------------------------------------------------------------------
bash -c "gcc"
echo ------------------------------------------------------------------------------
bash -c "genisoimage"
echo ------------------------------------------------------------------------------
PAUSE