#*******************************************************************************
#* FILE PURPOSE: Top level makefile for Creating Component Libraries
#*******************************************************************************
#* FILE NAME: makefile
#*
#* DESCRIPTION: Defines Compiler tools paths, libraries , Build Options 
#*
#*
#* This is an auto-generated file          
#*******************************************************************************
#*
# (Mandatory) Specify where various tools are installed.

# C6X_GEN_INSTALL_DIR   - C6x Code gen tools install directory
export C6X_GEN_INSTALL_DIR ?= c:/DSPLIB_Tools/CCSV5_4_0/ccsv5/tools/compiler/c6000_7.4.2

# PATH TO  MATHLIB INSTALL DIR
export MATHLIB_INSTALL_DIR     ?= c:/ti/mathlib_c66x_3_1_0_0

# PATH TO  DSPLIB INSTALL DIR
export DSPLIB_INSTALL_DIR     ?= c:/nightlybuilds/dsplib

# ROOT Directory
export ROOTDIR := ../..

# INCLUDE Directory
export INCDIR := $(DSPLIB_INSTALL_DIR);$(MATHLIB_INSTALL_DIR)/packages;$(ROOTDIR)

# Common Macros used in make

ifndef RM
export RM = rm -f
endif

ifndef CP
export CP = cp -p
endif

export MKDIR = mkdir -p

ifndef RMDIR
export RMDIR = rm -rf
endif

ifndef SED
export SED = sed
endif

ifndef MAKE
export MAKE = make
endif

# PHONY Targets
.PHONY: all clean cleanall 

# FORCE Targets
FORCE: 

# all rule
all: .executables
.executables: .projects
.projects: .libraries
.libraries:

# Clean Rule
clean:: clean_package
# Clean Top Level Object Directory 
clean_package :
	$(RMDIR) package/lib
	$(RMDIR) package/cfg


# Make rule to create lib/dsplib.a674 library
.libraries: lib/dsplib.a674
lib/dsplib.a674: FORCE
	$(MAKE) -f lib/dsplib.a674.mk $@ 
# Rule to clean lib/dsplib.a674 library
clean ::
	$(RM) lib/dsplib.a674


# Make rule to create lib/dsplib.ae674 library
.libraries: lib/dsplib.ae674
lib/dsplib.ae674: FORCE
	$(MAKE) -f lib/dsplib.ae674.mk $@ 
# Rule to clean lib/dsplib.ae674 library
clean ::
	$(RM) lib/dsplib.ae674


# Make rule to create lib/dsplib_cn.a674 library
.libraries: lib/dsplib_cn.a674
lib/dsplib_cn.a674: FORCE
	$(MAKE) -f lib/dsplib_cn.a674.mk $@ 
# Rule to clean lib/dsplib_cn.a674 library
clean ::
	$(RM) lib/dsplib_cn.a674


# Make rule to create lib/dsplib_cn.ae674 library
.libraries: lib/dsplib_cn.ae674
lib/dsplib_cn.ae674: FORCE
	$(MAKE) -f lib/dsplib_cn.ae674.mk $@ 
# Rule to clean lib/dsplib_cn.ae674 library
clean ::
	$(RM) lib/dsplib_cn.ae674
