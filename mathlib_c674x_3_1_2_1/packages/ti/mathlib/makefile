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
export C6X_GEN_INSTALL_DIR ?= C:/MATHLIB_Tools/CCSV5_5_0/ccsv5/tools/compiler/c6000_7.4.2

# PATH TO  XDC INSTALL DIR
export XDC_INSTALL_DIR     ?= C:/MATHLIB_Tools/xdctools_3_25_00_48

# PATH TO  EPI INSTALL DIR
export EPI_INSTALL_DIR     ?= C:/MATHLIB_Tools

# PATH TO  MATHLIB INSTALL DIR
export MATHLIB_INSTALL_DIR     ?= c:/nightlybuilds/mathlib

# ROOT Directory
export ROOTDIR := ../..

# INCLUDE Directory
export INCDIR := $(EPI_INSTALL_DIR)/CCSV5_5_0/ccsv5/packages;$(EPI_INSTALL_DIR)/xdc_eclipse_plugin_gen/20091203;$(XDC_INSTALL_DIR)/packages;$(MATHLIB_INSTALL_DIR);$(ROOTDIR)

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


# Make rule to create lib/mathlib.a674 library
.libraries: lib/mathlib.a674
lib/mathlib.a674: FORCE
	$(MAKE) -f lib/mathlib.a674.mk $@
# Rule to clean lib/mathlib.a674 library
clean ::
	$(RM) lib/mathlib.a674


# Make rule to create lib/mathlib.ae674 library
.libraries: lib/mathlib.ae674
lib/mathlib.ae674: FORCE
	$(MAKE) -f lib/mathlib.ae674.mk $@
# Rule to clean lib/mathlib.ae674 library
clean ::
	$(RM) lib/mathlib.ae674
