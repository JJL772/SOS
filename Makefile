#=========================================#
# 
# Main makefile for the kernel
#
#=========================================#

ifeq ($(TGT), i386)
	include Makefile_i386.mak
else ifeq ($(TGT), x64)
	include Makefile_x64.mak
endif
