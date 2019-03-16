#!/bin/bash

# Prompt for target
echo Select a build target:
echo 1. i386 build
echo 2. amd64-uefi build
echo 3. i386 rebuild
echo 4. amd64-uefi rebuild
echo 5. i386 clean
echo 6. amd64-uefi clean
echo 7. install dependencies

read input

if ["$input" == "1"]; then
	echo Building i386
	make build BUILD_TYPE=i386
elif ["$input" == "2"]; then
	echo Building amd64-uefi
	make build BUILD_TYPE=amd64
elif ["$input" == "3"]; then
	echo Rebuilding i386
	make rebuild BUILD_TYPE=i386
elif ["$input" == "4"]; then
	echo Rebuilding amd64-uefi
	make rebuild BUILD_TYPE=amd64
elif ["$input" == "5"]; then
	echo Cleaning i386
	make clean BUILD_TYPE=i386
elif ["$input" == "6"];	then
	echo Cleaning amd64-uefi
	make clean BUILD_TYPE=amd64
elif ["$input" == "7"]; then
	echo Installing dependencies
	sudo sh InstallDeps.sh
fi