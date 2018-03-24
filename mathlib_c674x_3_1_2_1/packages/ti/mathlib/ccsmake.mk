#*******************************************************************************
#* FILE PURPOSE: Top level makefile for Creating Kernel CCS Projects
#*******************************************************************************
#* FILE NAME: ccsmake.mk
#*
#* DESCRIPTION: Defines Compiler tools paths, CCS path and rule to create and build CCS projects 
#*
#*
#* This is an auto-generated file             
#*******************************************************************************
#*
# (Mandatory) Specify where various tools are installed.

# CCSCGTVER   - C6x Code Generation version to be used for building CCS project
export CCSCGTVER ?= 7.4.2

# CCS_INSTALL_DIR   - TI Code Composer Studio install directory
export CCSV5_INSTALL_DIR ?= C:/ti/ccsv5

ifneq ($(findstring $(CCSVERSION), CCSV5),)
	export CCS_INSTALL_DIR ?= $(CCSV5_INSTALL_DIR)
	export ECLIPSE_CMD ?= "$(CCS_INSTALL_DIR)/eclipse/eclipsec.exe" -noSplash
	export CDTFILE ?= .cproject
endif

# MATHLIB_INSTALL_DIR   - MATHLIB install directory
export MATHLIB_INSTALL_DIR ?= C:/ti/mathlib_c674x_3_1_2_1/packages

# Common Macros used in make

ifndef RMDIR
export RMDIR = DEL /Q /F /S
endif

ifneq ($(findstring $(SHELL), sh.exe),)
	quote = "
	FIXCCSPJT=
else
	quote = '
	FIXCCSPJT=${XDC_INSTALL_DIR}/xs -f ../mas/swtools/fixccspjt.js $(@D)/$(CDTFILE)
endif

# PHONY Targets
.PHONY: all clean cleanall .projects 

# FORCE Targets
FORCE: 

# all rule
all: .executables
.executables: .projects
.projects:
.xdcenv.mak:
Package.mak:
package.bld:

#############################################################

# Rule to Build Project acosdp_674LE_LE_COFF

#############################################################

.executables: src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out

.projects: src/acosdp//c674//acosdp_674LE_LE_COFF

src/acosdp//c674//acosdp_674LE_LE_COFF: src/acosdp//c674//acosdp_674LE_LE_COFF/.project

src/acosdp//c674//acosdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acosdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name acosdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCACOSDP/acosdp_d.c\
 -ccs.linkFile EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/acosdp//c674//acosdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCACOSDP "C:/nightlybuilds/mathlib/ti/mathlib/src/acosdp" \
 -ccs.definePathVariable EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCACOSDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/acosdp/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/acosdp//c674//acosdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCACOSDP=../../ >> src/acosdp//c674//acosdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCACOSDPC674=.././ >> src/acosdp//c674//acosdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/acosdp//c674//acosdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/acosdp_674LE_LE_COFF"
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/acosdp/acosdp.h
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/acosdp/acosdp_d.c
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/acosdp//c674/acosdp.h
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/acosdp//c674/acosdp_i.h
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/common/drvdp.c
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/common/drvdp.h
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/common/driver.h
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/common/driver.c
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/common/common.h
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/common//c674/common.h
src/acosdp//c674//acosdp_674LE_LE_COFF/Release/acosdp_674LE_LE_COFF.out: src/acosdp//c674//acosdp_674LE_LE_COFF/.project
	-@ echo Importing Project acosdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acosdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects acosdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/acosdp/c674/acosdp_674LE_LE_COFF"
	-@ echo Building Project acosdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acosdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects acosdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project acosdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/acosdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/acosdp//c674//acosdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project acosdp_674LE_LE_ELF

#############################################################

.executables: src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out

.projects: src/acosdp//c674//acosdp_674LE_LE_ELF

src/acosdp//c674//acosdp_674LE_LE_ELF: src/acosdp//c674//acosdp_674LE_LE_ELF/.project

src/acosdp//c674//acosdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acosdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name acosdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCACOSDP/acosdp_d.c\
 -ccs.linkFile EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/acosdp//c674//acosdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCACOSDP "C:/nightlybuilds/mathlib/ti/mathlib/src/acosdp" \
 -ccs.definePathVariable EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCACOSDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/acosdp/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/acosdp//c674//acosdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCACOSDP=../../ >> src/acosdp//c674//acosdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCACOSDPC674=.././ >> src/acosdp//c674//acosdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/acosdp//c674//acosdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/acosdp_674LE_LE_ELF"
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/acosdp/acosdp.h
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/acosdp/acosdp_d.c
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/acosdp//c674/acosdp.h
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/acosdp//c674/acosdp_i.h
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/common/drvdp.c
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/common/drvdp.h
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/common/driver.h
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/common/driver.c
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/common/common.h
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/common//c674/common.h
src/acosdp//c674//acosdp_674LE_LE_ELF/Release/acosdp_674LE_LE_ELF.out: src/acosdp//c674//acosdp_674LE_LE_ELF/.project
	-@ echo Importing Project acosdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acosdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects acosdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/acosdp/c674/acosdp_674LE_LE_ELF"
	-@ echo Building Project acosdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acosdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects acosdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project acosdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/acosdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/acosdp//c674//acosdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project acoshdp_674LE_LE_COFF

#############################################################

.executables: src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out

.projects: src/acoshdp//c674//acoshdp_674LE_LE_COFF

src/acoshdp//c674//acoshdp_674LE_LE_COFF: src/acoshdp//c674//acoshdp_674LE_LE_COFF/.project

src/acoshdp//c674//acoshdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name acoshdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCACOSHDP/acoshdp_d.c\
 -ccs.linkFile EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/acoshdp//c674//acoshdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCACOSHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshdp" \
 -ccs.definePathVariable EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCACOSHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshdp/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/acoshdp//c674//acoshdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCACOSHDP=../../ >> src/acoshdp//c674//acoshdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCACOSHDPC674=.././ >> src/acoshdp//c674//acoshdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSHDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/acoshdp//c674//acoshdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/acoshdp_674LE_LE_COFF"
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/acoshdp/acoshdp.h
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/acoshdp/acoshdp_d.c
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/acoshdp//c674/acoshdp.h
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/acoshdp//c674/acoshdp_i.h
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/common/drvdp.c
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/common/drvdp.h
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/common/driver.h
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/common/driver.c
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/common/common.h
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/common//c674/common.h
src/acoshdp//c674//acoshdp_674LE_LE_COFF/Release/acoshdp_674LE_LE_COFF.out: src/acoshdp//c674//acoshdp_674LE_LE_COFF/.project
	-@ echo Importing Project acoshdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects acoshdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshdp/c674/acoshdp_674LE_LE_COFF"
	-@ echo Building Project acoshdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects acoshdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project acoshdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/acoshdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/acoshdp//c674//acoshdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project acoshdp_674LE_LE_ELF

#############################################################

.executables: src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out

.projects: src/acoshdp//c674//acoshdp_674LE_LE_ELF

src/acoshdp//c674//acoshdp_674LE_LE_ELF: src/acoshdp//c674//acoshdp_674LE_LE_ELF/.project

src/acoshdp//c674//acoshdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name acoshdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCACOSHDP/acoshdp_d.c\
 -ccs.linkFile EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/acoshdp//c674//acoshdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCACOSHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshdp" \
 -ccs.definePathVariable EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCACOSHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshdp/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/acoshdp//c674//acoshdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCACOSHDP=../../ >> src/acoshdp//c674//acoshdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCACOSHDPC674=.././ >> src/acoshdp//c674//acoshdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSHDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/acoshdp//c674//acoshdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/acoshdp_674LE_LE_ELF"
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/acoshdp/acoshdp.h
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/acoshdp/acoshdp_d.c
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/acoshdp//c674/acoshdp.h
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/acoshdp//c674/acoshdp_i.h
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/common/drvdp.c
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/common/drvdp.h
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/common/driver.h
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/common/driver.c
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/common/common.h
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/common//c674/common.h
src/acoshdp//c674//acoshdp_674LE_LE_ELF/Release/acoshdp_674LE_LE_ELF.out: src/acoshdp//c674//acoshdp_674LE_LE_ELF/.project
	-@ echo Importing Project acoshdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects acoshdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshdp/c674/acoshdp_674LE_LE_ELF"
	-@ echo Building Project acoshdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects acoshdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project acoshdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/acoshdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/acoshdp//c674//acoshdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project acoshsp_674LE_LE_COFF

#############################################################

.executables: src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out

.projects: src/acoshsp//c674//acoshsp_674LE_LE_COFF

src/acoshsp//c674//acoshsp_674LE_LE_COFF: src/acoshsp//c674//acoshsp_674LE_LE_COFF/.project

src/acoshsp//c674//acoshsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name acoshsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCACOSHSP/acoshsp_d.c\
 -ccs.linkFile EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/acoshsp//c674//acoshsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCACOSHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshsp" \
 -ccs.definePathVariable EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCACOSHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshsp/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/acoshsp//c674//acoshsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCACOSHSP=../../ >> src/acoshsp//c674//acoshsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCACOSHSPC674=.././ >> src/acoshsp//c674//acoshsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSHSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/acoshsp//c674//acoshsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/acoshsp_674LE_LE_COFF"
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/acoshsp/acoshsp.h
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/acoshsp/acoshsp_d.c
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/acoshsp//c674/acoshsp.h
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/acoshsp//c674/acoshsp_i.h
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/common/drvsp.c
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/common/drvsp.h
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/common/driver.h
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/common/driver.c
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/common/common.h
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/common//c674/common.h
src/acoshsp//c674//acoshsp_674LE_LE_COFF/Release/acoshsp_674LE_LE_COFF.out: src/acoshsp//c674//acoshsp_674LE_LE_COFF/.project
	-@ echo Importing Project acoshsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects acoshsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshsp/c674/acoshsp_674LE_LE_COFF"
	-@ echo Building Project acoshsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects acoshsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project acoshsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/acoshsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/acoshsp//c674//acoshsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project acoshsp_674LE_LE_ELF

#############################################################

.executables: src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out

.projects: src/acoshsp//c674//acoshsp_674LE_LE_ELF

src/acoshsp//c674//acoshsp_674LE_LE_ELF: src/acoshsp//c674//acoshsp_674LE_LE_ELF/.project

src/acoshsp//c674//acoshsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name acoshsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCACOSHSP/acoshsp_d.c\
 -ccs.linkFile EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/acoshsp//c674//acoshsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCACOSHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshsp" \
 -ccs.definePathVariable EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCACOSHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshsp/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/acoshsp//c674//acoshsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCACOSHSP=../../ >> src/acoshsp//c674//acoshsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCACOSHSPC674=.././ >> src/acoshsp//c674//acoshsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSHSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/acoshsp//c674//acoshsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/acoshsp_674LE_LE_ELF"
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/acoshsp/acoshsp.h
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/acoshsp/acoshsp_d.c
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/acoshsp//c674/acoshsp.h
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/acoshsp//c674/acoshsp_i.h
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/common/drvsp.c
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/common/drvsp.h
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/common/driver.h
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/common/driver.c
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/common/common.h
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/common//c674/common.h
src/acoshsp//c674//acoshsp_674LE_LE_ELF/Release/acoshsp_674LE_LE_ELF.out: src/acoshsp//c674//acoshsp_674LE_LE_ELF/.project
	-@ echo Importing Project acoshsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects acoshsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/acoshsp/c674/acoshsp_674LE_LE_ELF"
	-@ echo Building Project acoshsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acoshsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects acoshsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project acoshsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/acoshsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/acoshsp//c674//acoshsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project acossp_674LE_LE_COFF

#############################################################

.executables: src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out

.projects: src/acossp//c674//acossp_674LE_LE_COFF

src/acossp//c674//acossp_674LE_LE_COFF: src/acossp//c674//acossp_674LE_LE_COFF/.project

src/acossp//c674//acossp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acossp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name acossp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCACOSSP/acossp_d.c\
 -ccs.linkFile EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/acossp//c674//acossp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCACOSSP "C:/nightlybuilds/mathlib/ti/mathlib/src/acossp" \
 -ccs.definePathVariable EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCACOSSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/acossp/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/acossp//c674//acossp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCACOSSP=../../ >> src/acossp//c674//acossp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCACOSSPC674=.././ >> src/acossp//c674//acossp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ACOSSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/acossp//c674//acossp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/acossp_674LE_LE_COFF"
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/acossp/acossp.h
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/acossp/acossp_d.c
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/acossp//c674/acossp.h
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/acossp//c674/acossp_i.h
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/common/drvsp.c
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/common/drvsp.h
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/common/driver.h
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/common/driver.c
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/common/common.h
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/common//c674/common.h
src/acossp//c674//acossp_674LE_LE_COFF/Release/acossp_674LE_LE_COFF.out: src/acossp//c674//acossp_674LE_LE_COFF/.project
	-@ echo Importing Project acossp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acossp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects acossp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/acossp/c674/acossp_674LE_LE_COFF"
	-@ echo Building Project acossp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acossp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects acossp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project acossp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/acossp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/acossp//c674//acossp_674LE_LE_COFF"


#############################################################

# Rule to Build Project acossp_674LE_LE_ELF

#############################################################

.executables: src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out

.projects: src/acossp//c674//acossp_674LE_LE_ELF

src/acossp//c674//acossp_674LE_LE_ELF: src/acossp//c674//acossp_674LE_LE_ELF/.project

src/acossp//c674//acossp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acossp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name acossp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCACOSSP/acossp_d.c\
 -ccs.linkFile EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/acossp//c674//acossp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCACOSSP "C:/nightlybuilds/mathlib/ti/mathlib/src/acossp" \
 -ccs.definePathVariable EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCACOSSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/acossp/c674" \
 -ccs.definePathVariable EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/acossp//c674//acossp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCACOSSP=../../ >> src/acossp//c674//acossp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCACOSSPC674=.././ >> src/acossp//c674//acossp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ACOSSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/acossp//c674//acossp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/acossp_674LE_LE_ELF"
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/acossp/acossp.h
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/acossp/acossp_d.c
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/acossp//c674/acossp.h
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/acossp//c674/acossp_i.h
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/common/drvsp.c
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/common/drvsp.h
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/common/driver.h
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/common/driver.c
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/common/common.h
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/common//c674/common.h
src/acossp//c674//acossp_674LE_LE_ELF/Release/acossp_674LE_LE_ELF.out: src/acossp//c674//acossp_674LE_LE_ELF/.project
	-@ echo Importing Project acossp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acossp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects acossp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/acossp/c674/acossp_674LE_LE_ELF"
	-@ echo Building Project acossp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/acossp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects acossp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project acossp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/acossp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/acossp//c674//acossp_674LE_LE_ELF"


#############################################################

# Rule to Build Project asindp_674LE_LE_COFF

#############################################################

.executables: src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out

.projects: src/asindp//c674//asindp_674LE_LE_COFF

src/asindp//c674//asindp_674LE_LE_COFF: src/asindp//c674//asindp_674LE_LE_COFF/.project

src/asindp//c674//asindp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asindp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name asindp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ASINDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ASINDP_674LE_LE_COFF_SRCASINDP/asindp_d.c\
 -ccs.linkFile EXT_ROOT__ASINDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ASINDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/asindp//c674//asindp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ASINDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINDP_674LE_LE_COFF_SRCASINDP "C:/nightlybuilds/mathlib/ti/mathlib/src/asindp" \
 -ccs.definePathVariable EXT_ROOT__ASINDP_674LE_LE_COFF_SRCASINDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/asindp/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ASINDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/asindp//c674//asindp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINDP_674LE_LE_COFF_SRCASINDP=../../ >> src/asindp//c674//asindp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINDP_674LE_LE_COFF_SRCASINDPC674=.././ >> src/asindp//c674//asindp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/asindp//c674//asindp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/asindp_674LE_LE_COFF"
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/asindp/asindp.h
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/asindp/asindp_d.c
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/asindp//c674/asindp.h
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/asindp//c674/asindp_i.h
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/common/drvdp.c
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/common/drvdp.h
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/common/driver.h
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/common/driver.c
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/common/common.h
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/common//c674/common.h
src/asindp//c674//asindp_674LE_LE_COFF/Release/asindp_674LE_LE_COFF.out: src/asindp//c674//asindp_674LE_LE_COFF/.project
	-@ echo Importing Project asindp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asindp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects asindp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/asindp/c674/asindp_674LE_LE_COFF"
	-@ echo Building Project asindp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asindp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects asindp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project asindp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/asindp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/asindp//c674//asindp_674LE_LE_COFF"


#############################################################

# Rule to Build Project asindp_674LE_LE_ELF

#############################################################

.executables: src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out

.projects: src/asindp//c674//asindp_674LE_LE_ELF

src/asindp//c674//asindp_674LE_LE_ELF: src/asindp//c674//asindp_674LE_LE_ELF/.project

src/asindp//c674//asindp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asindp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name asindp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ASINDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ASINDP_674LE_LE_ELF_SRCASINDP/asindp_d.c\
 -ccs.linkFile EXT_ROOT__ASINDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ASINDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/asindp//c674//asindp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ASINDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINDP_674LE_LE_ELF_SRCASINDP "C:/nightlybuilds/mathlib/ti/mathlib/src/asindp" \
 -ccs.definePathVariable EXT_ROOT__ASINDP_674LE_LE_ELF_SRCASINDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/asindp/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ASINDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/asindp//c674//asindp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINDP_674LE_LE_ELF_SRCASINDP=../../ >> src/asindp//c674//asindp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINDP_674LE_LE_ELF_SRCASINDPC674=.././ >> src/asindp//c674//asindp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/asindp//c674//asindp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/asindp_674LE_LE_ELF"
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/asindp/asindp.h
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/asindp/asindp_d.c
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/asindp//c674/asindp.h
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/asindp//c674/asindp_i.h
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/common/drvdp.c
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/common/drvdp.h
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/common/driver.h
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/common/driver.c
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/common/common.h
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/common//c674/common.h
src/asindp//c674//asindp_674LE_LE_ELF/Release/asindp_674LE_LE_ELF.out: src/asindp//c674//asindp_674LE_LE_ELF/.project
	-@ echo Importing Project asindp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asindp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects asindp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/asindp/c674/asindp_674LE_LE_ELF"
	-@ echo Building Project asindp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asindp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects asindp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project asindp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/asindp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/asindp//c674//asindp_674LE_LE_ELF"


#############################################################

# Rule to Build Project asinhdp_674LE_LE_COFF

#############################################################

.executables: src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out

.projects: src/asinhdp//c674//asinhdp_674LE_LE_COFF

src/asinhdp//c674//asinhdp_674LE_LE_COFF: src/asinhdp//c674//asinhdp_674LE_LE_COFF/.project

src/asinhdp//c674//asinhdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name asinhdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCASINHDP/asinhdp_d.c\
 -ccs.linkFile EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/asinhdp//c674//asinhdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCASINHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhdp" \
 -ccs.definePathVariable EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCASINHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhdp/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/asinhdp//c674//asinhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCASINHDP=../../ >> src/asinhdp//c674//asinhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCASINHDPC674=.././ >> src/asinhdp//c674//asinhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINHDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/asinhdp//c674//asinhdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/asinhdp_674LE_LE_COFF"
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/asinhdp/asinhdp.h
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/asinhdp/asinhdp_d.c
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/asinhdp//c674/asinhdp.h
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/asinhdp//c674/asinhdp_i.h
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/common/drvdp.c
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/common/drvdp.h
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/common/driver.h
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/common/driver.c
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/common/common.h
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/common//c674/common.h
src/asinhdp//c674//asinhdp_674LE_LE_COFF/Release/asinhdp_674LE_LE_COFF.out: src/asinhdp//c674//asinhdp_674LE_LE_COFF/.project
	-@ echo Importing Project asinhdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects asinhdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhdp/c674/asinhdp_674LE_LE_COFF"
	-@ echo Building Project asinhdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects asinhdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project asinhdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/asinhdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/asinhdp//c674//asinhdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project asinhdp_674LE_LE_ELF

#############################################################

.executables: src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out

.projects: src/asinhdp//c674//asinhdp_674LE_LE_ELF

src/asinhdp//c674//asinhdp_674LE_LE_ELF: src/asinhdp//c674//asinhdp_674LE_LE_ELF/.project

src/asinhdp//c674//asinhdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name asinhdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCASINHDP/asinhdp_d.c\
 -ccs.linkFile EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/asinhdp//c674//asinhdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCASINHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhdp" \
 -ccs.definePathVariable EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCASINHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhdp/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/asinhdp//c674//asinhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCASINHDP=../../ >> src/asinhdp//c674//asinhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCASINHDPC674=.././ >> src/asinhdp//c674//asinhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINHDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/asinhdp//c674//asinhdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/asinhdp_674LE_LE_ELF"
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/asinhdp/asinhdp.h
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/asinhdp/asinhdp_d.c
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/asinhdp//c674/asinhdp.h
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/asinhdp//c674/asinhdp_i.h
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/common/drvdp.c
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/common/drvdp.h
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/common/driver.h
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/common/driver.c
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/common/common.h
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/common//c674/common.h
src/asinhdp//c674//asinhdp_674LE_LE_ELF/Release/asinhdp_674LE_LE_ELF.out: src/asinhdp//c674//asinhdp_674LE_LE_ELF/.project
	-@ echo Importing Project asinhdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects asinhdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhdp/c674/asinhdp_674LE_LE_ELF"
	-@ echo Building Project asinhdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects asinhdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project asinhdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/asinhdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/asinhdp//c674//asinhdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project asinhsp_674LE_LE_COFF

#############################################################

.executables: src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out

.projects: src/asinhsp//c674//asinhsp_674LE_LE_COFF

src/asinhsp//c674//asinhsp_674LE_LE_COFF: src/asinhsp//c674//asinhsp_674LE_LE_COFF/.project

src/asinhsp//c674//asinhsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name asinhsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCASINHSP/asinhsp_d.c\
 -ccs.linkFile EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/asinhsp//c674//asinhsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCASINHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhsp" \
 -ccs.definePathVariable EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCASINHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhsp/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/asinhsp//c674//asinhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCASINHSP=../../ >> src/asinhsp//c674//asinhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCASINHSPC674=.././ >> src/asinhsp//c674//asinhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINHSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/asinhsp//c674//asinhsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/asinhsp_674LE_LE_COFF"
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/asinhsp/asinhsp.h
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/asinhsp/asinhsp_d.c
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/asinhsp//c674/asinhsp.h
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/asinhsp//c674/asinhsp_i.h
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/common/drvsp.c
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/common/drvsp.h
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/common/driver.h
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/common/driver.c
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/common/common.h
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/common//c674/common.h
src/asinhsp//c674//asinhsp_674LE_LE_COFF/Release/asinhsp_674LE_LE_COFF.out: src/asinhsp//c674//asinhsp_674LE_LE_COFF/.project
	-@ echo Importing Project asinhsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects asinhsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhsp/c674/asinhsp_674LE_LE_COFF"
	-@ echo Building Project asinhsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects asinhsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project asinhsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/asinhsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/asinhsp//c674//asinhsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project asinhsp_674LE_LE_ELF

#############################################################

.executables: src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out

.projects: src/asinhsp//c674//asinhsp_674LE_LE_ELF

src/asinhsp//c674//asinhsp_674LE_LE_ELF: src/asinhsp//c674//asinhsp_674LE_LE_ELF/.project

src/asinhsp//c674//asinhsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name asinhsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCASINHSP/asinhsp_d.c\
 -ccs.linkFile EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/asinhsp//c674//asinhsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCASINHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhsp" \
 -ccs.definePathVariable EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCASINHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhsp/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/asinhsp//c674//asinhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCASINHSP=../../ >> src/asinhsp//c674//asinhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCASINHSPC674=.././ >> src/asinhsp//c674//asinhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINHSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/asinhsp//c674//asinhsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/asinhsp_674LE_LE_ELF"
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/asinhsp/asinhsp.h
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/asinhsp/asinhsp_d.c
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/asinhsp//c674/asinhsp.h
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/asinhsp//c674/asinhsp_i.h
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/common/drvsp.c
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/common/drvsp.h
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/common/driver.h
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/common/driver.c
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/common/common.h
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/common//c674/common.h
src/asinhsp//c674//asinhsp_674LE_LE_ELF/Release/asinhsp_674LE_LE_ELF.out: src/asinhsp//c674//asinhsp_674LE_LE_ELF/.project
	-@ echo Importing Project asinhsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects asinhsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/asinhsp/c674/asinhsp_674LE_LE_ELF"
	-@ echo Building Project asinhsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects asinhsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project asinhsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/asinhsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/asinhsp//c674//asinhsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project asinsp_674LE_LE_COFF

#############################################################

.executables: src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out

.projects: src/asinsp//c674//asinsp_674LE_LE_COFF

src/asinsp//c674//asinsp_674LE_LE_COFF: src/asinsp//c674//asinsp_674LE_LE_COFF/.project

src/asinsp//c674//asinsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name asinsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ASINSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ASINSP_674LE_LE_COFF_SRCASINSP/asinsp_d.c\
 -ccs.linkFile EXT_ROOT__ASINSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ASINSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/asinsp//c674//asinsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ASINSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINSP_674LE_LE_COFF_SRCASINSP "C:/nightlybuilds/mathlib/ti/mathlib/src/asinsp" \
 -ccs.definePathVariable EXT_ROOT__ASINSP_674LE_LE_COFF_SRCASINSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/asinsp/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ASINSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/asinsp//c674//asinsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINSP_674LE_LE_COFF_SRCASINSP=../../ >> src/asinsp//c674//asinsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINSP_674LE_LE_COFF_SRCASINSPC674=.././ >> src/asinsp//c674//asinsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ASINSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/asinsp//c674//asinsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/asinsp_674LE_LE_COFF"
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/asinsp/asinsp.h
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/asinsp/asinsp_d.c
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/asinsp//c674/asinsp.h
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/asinsp//c674/asinsp_i.h
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/common/drvsp.c
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/common/drvsp.h
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/common/driver.h
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/common/driver.c
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/common/common.h
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/common//c674/common.h
src/asinsp//c674//asinsp_674LE_LE_COFF/Release/asinsp_674LE_LE_COFF.out: src/asinsp//c674//asinsp_674LE_LE_COFF/.project
	-@ echo Importing Project asinsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects asinsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/asinsp/c674/asinsp_674LE_LE_COFF"
	-@ echo Building Project asinsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects asinsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project asinsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/asinsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/asinsp//c674//asinsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project asinsp_674LE_LE_ELF

#############################################################

.executables: src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out

.projects: src/asinsp//c674//asinsp_674LE_LE_ELF

src/asinsp//c674//asinsp_674LE_LE_ELF: src/asinsp//c674//asinsp_674LE_LE_ELF/.project

src/asinsp//c674//asinsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name asinsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ASINSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ASINSP_674LE_LE_ELF_SRCASINSP/asinsp_d.c\
 -ccs.linkFile EXT_ROOT__ASINSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ASINSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/asinsp//c674//asinsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ASINSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINSP_674LE_LE_ELF_SRCASINSP "C:/nightlybuilds/mathlib/ti/mathlib/src/asinsp" \
 -ccs.definePathVariable EXT_ROOT__ASINSP_674LE_LE_ELF_SRCASINSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/asinsp/c674" \
 -ccs.definePathVariable EXT_ROOT__ASINSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ASINSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/asinsp//c674//asinsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINSP_674LE_LE_ELF_SRCASINSP=../../ >> src/asinsp//c674//asinsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINSP_674LE_LE_ELF_SRCASINSPC674=.././ >> src/asinsp//c674//asinsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ASINSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/asinsp//c674//asinsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/asinsp_674LE_LE_ELF"
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/asinsp/asinsp.h
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/asinsp/asinsp_d.c
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/asinsp//c674/asinsp.h
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/asinsp//c674/asinsp_i.h
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/common/drvsp.c
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/common/drvsp.h
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/common/driver.h
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/common/driver.c
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/common/common.h
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/common//c674/common.h
src/asinsp//c674//asinsp_674LE_LE_ELF/Release/asinsp_674LE_LE_ELF.out: src/asinsp//c674//asinsp_674LE_LE_ELF/.project
	-@ echo Importing Project asinsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects asinsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/asinsp/c674/asinsp_674LE_LE_ELF"
	-@ echo Building Project asinsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/asinsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects asinsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project asinsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/asinsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/asinsp//c674//asinsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project atan2dp_674LE_LE_COFF

#############################################################

.executables: src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out

.projects: src/atan2dp//c674//atan2dp_674LE_LE_COFF

src/atan2dp//c674//atan2dp_674LE_LE_COFF: src/atan2dp//c674//atan2dp_674LE_LE_COFF/.project

src/atan2dp//c674//atan2dp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atan2dp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCATAN2DP/atan2dp_d.c\
 -ccs.linkFile EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atan2dp//c674//atan2dp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCATAN2DP "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2dp" \
 -ccs.definePathVariable EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCATAN2DPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2dp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/atan2dp//c674//atan2dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCATAN2DP=../../ >> src/atan2dp//c674//atan2dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCATAN2DPC674=.././ >> src/atan2dp//c674//atan2dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATAN2DP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/atan2dp//c674//atan2dp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atan2dp_674LE_LE_COFF"
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/atan2dp/atan2dp.h
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/atan2dp/atan2dp_d.c
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/atan2dp//c674/atan2dp.h
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/atan2dp//c674/atan2dp_i.h
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/common/drvdp.c
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/common/drvdp.h
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/common/driver.h
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/common/driver.c
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/common/common.h
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/common//c674/common.h
src/atan2dp//c674//atan2dp_674LE_LE_COFF/Release/atan2dp_674LE_LE_COFF.out: src/atan2dp//c674//atan2dp_674LE_LE_COFF/.project
	-@ echo Importing Project atan2dp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atan2dp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2dp/c674/atan2dp_674LE_LE_COFF"
	-@ echo Building Project atan2dp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atan2dp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project atan2dp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atan2dp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/atan2dp//c674//atan2dp_674LE_LE_COFF"


#############################################################

# Rule to Build Project atan2dp_674LE_LE_ELF

#############################################################

.executables: src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out

.projects: src/atan2dp//c674//atan2dp_674LE_LE_ELF

src/atan2dp//c674//atan2dp_674LE_LE_ELF: src/atan2dp//c674//atan2dp_674LE_LE_ELF/.project

src/atan2dp//c674//atan2dp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atan2dp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCATAN2DP/atan2dp_d.c\
 -ccs.linkFile EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atan2dp//c674//atan2dp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCATAN2DP "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2dp" \
 -ccs.definePathVariable EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCATAN2DPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2dp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/atan2dp//c674//atan2dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCATAN2DP=../../ >> src/atan2dp//c674//atan2dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCATAN2DPC674=.././ >> src/atan2dp//c674//atan2dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATAN2DP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/atan2dp//c674//atan2dp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atan2dp_674LE_LE_ELF"
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/atan2dp/atan2dp.h
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/atan2dp/atan2dp_d.c
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/atan2dp//c674/atan2dp.h
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/atan2dp//c674/atan2dp_i.h
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/common/drvdp.c
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/common/drvdp.h
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/common/driver.h
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/common/driver.c
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/common/common.h
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/common//c674/common.h
src/atan2dp//c674//atan2dp_674LE_LE_ELF/Release/atan2dp_674LE_LE_ELF.out: src/atan2dp//c674//atan2dp_674LE_LE_ELF/.project
	-@ echo Importing Project atan2dp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atan2dp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2dp/c674/atan2dp_674LE_LE_ELF"
	-@ echo Building Project atan2dp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atan2dp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project atan2dp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atan2dp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/atan2dp//c674//atan2dp_674LE_LE_ELF"


#############################################################

# Rule to Build Project atan2sp_674LE_LE_COFF

#############################################################

.executables: src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out

.projects: src/atan2sp//c674//atan2sp_674LE_LE_COFF

src/atan2sp//c674//atan2sp_674LE_LE_COFF: src/atan2sp//c674//atan2sp_674LE_LE_COFF/.project

src/atan2sp//c674//atan2sp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atan2sp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCATAN2SP/atan2sp_d.c\
 -ccs.linkFile EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atan2sp//c674//atan2sp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCATAN2SP "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2sp" \
 -ccs.definePathVariable EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCATAN2SPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2sp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/atan2sp//c674//atan2sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCATAN2SP=../../ >> src/atan2sp//c674//atan2sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCATAN2SPC674=.././ >> src/atan2sp//c674//atan2sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATAN2SP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/atan2sp//c674//atan2sp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atan2sp_674LE_LE_COFF"
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/atan2sp/atan2sp.h
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/atan2sp/atan2sp_d.c
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/atan2sp//c674/atan2sp.h
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/atan2sp//c674/atan2sp_i.h
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/common/drvsp.c
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/common/drvsp.h
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/common/driver.h
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/common/driver.c
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/common/common.h
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/common//c674/common.h
src/atan2sp//c674//atan2sp_674LE_LE_COFF/Release/atan2sp_674LE_LE_COFF.out: src/atan2sp//c674//atan2sp_674LE_LE_COFF/.project
	-@ echo Importing Project atan2sp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atan2sp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2sp/c674/atan2sp_674LE_LE_COFF"
	-@ echo Building Project atan2sp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atan2sp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project atan2sp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atan2sp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/atan2sp//c674//atan2sp_674LE_LE_COFF"


#############################################################

# Rule to Build Project atan2sp_674LE_LE_ELF

#############################################################

.executables: src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out

.projects: src/atan2sp//c674//atan2sp_674LE_LE_ELF

src/atan2sp//c674//atan2sp_674LE_LE_ELF: src/atan2sp//c674//atan2sp_674LE_LE_ELF/.project

src/atan2sp//c674//atan2sp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atan2sp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCATAN2SP/atan2sp_d.c\
 -ccs.linkFile EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atan2sp//c674//atan2sp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCATAN2SP "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2sp" \
 -ccs.definePathVariable EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCATAN2SPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2sp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/atan2sp//c674//atan2sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCATAN2SP=../../ >> src/atan2sp//c674//atan2sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCATAN2SPC674=.././ >> src/atan2sp//c674//atan2sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATAN2SP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/atan2sp//c674//atan2sp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atan2sp_674LE_LE_ELF"
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/atan2sp/atan2sp.h
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/atan2sp/atan2sp_d.c
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/atan2sp//c674/atan2sp.h
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/atan2sp//c674/atan2sp_i.h
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/common/drvsp.c
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/common/drvsp.h
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/common/driver.h
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/common/driver.c
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/common/common.h
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/common//c674/common.h
src/atan2sp//c674//atan2sp_674LE_LE_ELF/Release/atan2sp_674LE_LE_ELF.out: src/atan2sp//c674//atan2sp_674LE_LE_ELF/.project
	-@ echo Importing Project atan2sp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atan2sp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atan2sp/c674/atan2sp_674LE_LE_ELF"
	-@ echo Building Project atan2sp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atan2sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atan2sp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project atan2sp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atan2sp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/atan2sp//c674//atan2sp_674LE_LE_ELF"


#############################################################

# Rule to Build Project atandp_674LE_LE_COFF

#############################################################

.executables: src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out

.projects: src/atandp//c674//atandp_674LE_LE_COFF

src/atandp//c674//atandp_674LE_LE_COFF: src/atandp//c674//atandp_674LE_LE_COFF/.project

src/atandp//c674//atandp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atandp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atandp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATANDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATANDP_674LE_LE_COFF_SRCATANDP/atandp_d.c\
 -ccs.linkFile EXT_ROOT__ATANDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ATANDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atandp//c674//atandp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ATANDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANDP_674LE_LE_COFF_SRCATANDP "C:/nightlybuilds/mathlib/ti/mathlib/src/atandp" \
 -ccs.definePathVariable EXT_ROOT__ATANDP_674LE_LE_COFF_SRCATANDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atandp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATANDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/atandp//c674//atandp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANDP_674LE_LE_COFF_SRCATANDP=../../ >> src/atandp//c674//atandp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANDP_674LE_LE_COFF_SRCATANDPC674=.././ >> src/atandp//c674//atandp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/atandp//c674//atandp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atandp_674LE_LE_COFF"
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/atandp/atandp.h
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/atandp/atandp_d.c
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/atandp//c674/atandp.h
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/atandp//c674/atandp_i.h
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/common/drvdp.c
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/common/drvdp.h
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/common/driver.h
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/common/driver.c
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/common/common.h
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/common//c674/common.h
src/atandp//c674//atandp_674LE_LE_COFF/Release/atandp_674LE_LE_COFF.out: src/atandp//c674//atandp_674LE_LE_COFF/.project
	-@ echo Importing Project atandp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atandp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atandp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atandp/c674/atandp_674LE_LE_COFF"
	-@ echo Building Project atandp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atandp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atandp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project atandp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atandp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/atandp//c674//atandp_674LE_LE_COFF"


#############################################################

# Rule to Build Project atandp_674LE_LE_ELF

#############################################################

.executables: src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out

.projects: src/atandp//c674//atandp_674LE_LE_ELF

src/atandp//c674//atandp_674LE_LE_ELF: src/atandp//c674//atandp_674LE_LE_ELF/.project

src/atandp//c674//atandp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atandp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atandp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATANDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATANDP_674LE_LE_ELF_SRCATANDP/atandp_d.c\
 -ccs.linkFile EXT_ROOT__ATANDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ATANDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atandp//c674//atandp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ATANDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANDP_674LE_LE_ELF_SRCATANDP "C:/nightlybuilds/mathlib/ti/mathlib/src/atandp" \
 -ccs.definePathVariable EXT_ROOT__ATANDP_674LE_LE_ELF_SRCATANDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atandp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATANDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/atandp//c674//atandp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANDP_674LE_LE_ELF_SRCATANDP=../../ >> src/atandp//c674//atandp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANDP_674LE_LE_ELF_SRCATANDPC674=.././ >> src/atandp//c674//atandp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/atandp//c674//atandp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atandp_674LE_LE_ELF"
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/atandp/atandp.h
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/atandp/atandp_d.c
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/atandp//c674/atandp.h
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/atandp//c674/atandp_i.h
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/common/drvdp.c
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/common/drvdp.h
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/common/driver.h
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/common/driver.c
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/common/common.h
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/common//c674/common.h
src/atandp//c674//atandp_674LE_LE_ELF/Release/atandp_674LE_LE_ELF.out: src/atandp//c674//atandp_674LE_LE_ELF/.project
	-@ echo Importing Project atandp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atandp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atandp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atandp/c674/atandp_674LE_LE_ELF"
	-@ echo Building Project atandp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atandp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atandp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project atandp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atandp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/atandp//c674//atandp_674LE_LE_ELF"


#############################################################

# Rule to Build Project atanhdp_674LE_LE_COFF

#############################################################

.executables: src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out

.projects: src/atanhdp//c674//atanhdp_674LE_LE_COFF

src/atanhdp//c674//atanhdp_674LE_LE_COFF: src/atanhdp//c674//atanhdp_674LE_LE_COFF/.project

src/atanhdp//c674//atanhdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atanhdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCATANHDP/atanhdp_d.c\
 -ccs.linkFile EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atanhdp//c674//atanhdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCATANHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhdp" \
 -ccs.definePathVariable EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCATANHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhdp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/atanhdp//c674//atanhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCATANHDP=../../ >> src/atanhdp//c674//atanhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCATANHDPC674=.././ >> src/atanhdp//c674//atanhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANHDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/atanhdp//c674//atanhdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atanhdp_674LE_LE_COFF"
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/atanhdp/atanhdp.h
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/atanhdp/atanhdp_d.c
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/atanhdp//c674/atanhdp.h
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/atanhdp//c674/atanhdp_i.h
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/common/drvdp.c
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/common/drvdp.h
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/common/driver.h
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/common/driver.c
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/common/common.h
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/common//c674/common.h
src/atanhdp//c674//atanhdp_674LE_LE_COFF/Release/atanhdp_674LE_LE_COFF.out: src/atanhdp//c674//atanhdp_674LE_LE_COFF/.project
	-@ echo Importing Project atanhdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atanhdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhdp/c674/atanhdp_674LE_LE_COFF"
	-@ echo Building Project atanhdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atanhdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project atanhdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atanhdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/atanhdp//c674//atanhdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project atanhdp_674LE_LE_ELF

#############################################################

.executables: src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out

.projects: src/atanhdp//c674//atanhdp_674LE_LE_ELF

src/atanhdp//c674//atanhdp_674LE_LE_ELF: src/atanhdp//c674//atanhdp_674LE_LE_ELF/.project

src/atanhdp//c674//atanhdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atanhdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCATANHDP/atanhdp_d.c\
 -ccs.linkFile EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atanhdp//c674//atanhdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCATANHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhdp" \
 -ccs.definePathVariable EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCATANHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhdp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/atanhdp//c674//atanhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCATANHDP=../../ >> src/atanhdp//c674//atanhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCATANHDPC674=.././ >> src/atanhdp//c674//atanhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANHDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/atanhdp//c674//atanhdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atanhdp_674LE_LE_ELF"
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/atanhdp/atanhdp.h
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/atanhdp/atanhdp_d.c
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/atanhdp//c674/atanhdp.h
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/atanhdp//c674/atanhdp_i.h
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/common/drvdp.c
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/common/drvdp.h
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/common/driver.h
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/common/driver.c
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/common/common.h
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/common//c674/common.h
src/atanhdp//c674//atanhdp_674LE_LE_ELF/Release/atanhdp_674LE_LE_ELF.out: src/atanhdp//c674//atanhdp_674LE_LE_ELF/.project
	-@ echo Importing Project atanhdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atanhdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhdp/c674/atanhdp_674LE_LE_ELF"
	-@ echo Building Project atanhdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atanhdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project atanhdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atanhdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/atanhdp//c674//atanhdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project atanhsp_674LE_LE_COFF

#############################################################

.executables: src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out

.projects: src/atanhsp//c674//atanhsp_674LE_LE_COFF

src/atanhsp//c674//atanhsp_674LE_LE_COFF: src/atanhsp//c674//atanhsp_674LE_LE_COFF/.project

src/atanhsp//c674//atanhsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atanhsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCATANHSP/atanhsp_d.c\
 -ccs.linkFile EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atanhsp//c674//atanhsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCATANHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhsp" \
 -ccs.definePathVariable EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCATANHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhsp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/atanhsp//c674//atanhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCATANHSP=../../ >> src/atanhsp//c674//atanhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCATANHSPC674=.././ >> src/atanhsp//c674//atanhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANHSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/atanhsp//c674//atanhsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atanhsp_674LE_LE_COFF"
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/atanhsp/atanhsp.h
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/atanhsp/atanhsp_d.c
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/atanhsp//c674/atanhsp.h
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/atanhsp//c674/atanhsp_i.h
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/common/drvsp.c
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/common/drvsp.h
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/common/driver.h
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/common/driver.c
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/common/common.h
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/common//c674/common.h
src/atanhsp//c674//atanhsp_674LE_LE_COFF/Release/atanhsp_674LE_LE_COFF.out: src/atanhsp//c674//atanhsp_674LE_LE_COFF/.project
	-@ echo Importing Project atanhsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atanhsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhsp/c674/atanhsp_674LE_LE_COFF"
	-@ echo Building Project atanhsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atanhsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project atanhsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atanhsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/atanhsp//c674//atanhsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project atanhsp_674LE_LE_ELF

#############################################################

.executables: src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out

.projects: src/atanhsp//c674//atanhsp_674LE_LE_ELF

src/atanhsp//c674//atanhsp_674LE_LE_ELF: src/atanhsp//c674//atanhsp_674LE_LE_ELF/.project

src/atanhsp//c674//atanhsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atanhsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCATANHSP/atanhsp_d.c\
 -ccs.linkFile EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atanhsp//c674//atanhsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCATANHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhsp" \
 -ccs.definePathVariable EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCATANHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhsp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/atanhsp//c674//atanhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCATANHSP=../../ >> src/atanhsp//c674//atanhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCATANHSPC674=.././ >> src/atanhsp//c674//atanhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANHSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/atanhsp//c674//atanhsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atanhsp_674LE_LE_ELF"
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/atanhsp/atanhsp.h
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/atanhsp/atanhsp_d.c
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/atanhsp//c674/atanhsp.h
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/atanhsp//c674/atanhsp_i.h
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/common/drvsp.c
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/common/drvsp.h
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/common/driver.h
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/common/driver.c
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/common/common.h
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/common//c674/common.h
src/atanhsp//c674//atanhsp_674LE_LE_ELF/Release/atanhsp_674LE_LE_ELF.out: src/atanhsp//c674//atanhsp_674LE_LE_ELF/.project
	-@ echo Importing Project atanhsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atanhsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atanhsp/c674/atanhsp_674LE_LE_ELF"
	-@ echo Building Project atanhsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atanhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atanhsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project atanhsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atanhsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/atanhsp//c674//atanhsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project atansp_674LE_LE_COFF

#############################################################

.executables: src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out

.projects: src/atansp//c674//atansp_674LE_LE_COFF

src/atansp//c674//atansp_674LE_LE_COFF: src/atansp//c674//atansp_674LE_LE_COFF/.project

src/atansp//c674//atansp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atansp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atansp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATANSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATANSP_674LE_LE_COFF_SRCATANSP/atansp_d.c\
 -ccs.linkFile EXT_ROOT__ATANSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ATANSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atansp//c674//atansp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__ATANSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANSP_674LE_LE_COFF_SRCATANSP "C:/nightlybuilds/mathlib/ti/mathlib/src/atansp" \
 -ccs.definePathVariable EXT_ROOT__ATANSP_674LE_LE_COFF_SRCATANSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atansp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATANSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/atansp//c674//atansp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANSP_674LE_LE_COFF_SRCATANSP=../../ >> src/atansp//c674//atansp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANSP_674LE_LE_COFF_SRCATANSPC674=.././ >> src/atansp//c674//atansp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__ATANSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/atansp//c674//atansp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atansp_674LE_LE_COFF"
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/atansp/atansp.h
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/atansp/atansp_d.c
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/atansp//c674/atansp.h
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/atansp//c674/atansp_i.h
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/common/drvsp.c
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/common/drvsp.h
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/common/driver.h
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/common/driver.c
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/common/common.h
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/common//c674/common.h
src/atansp//c674//atansp_674LE_LE_COFF/Release/atansp_674LE_LE_COFF.out: src/atansp//c674//atansp_674LE_LE_COFF/.project
	-@ echo Importing Project atansp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atansp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atansp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atansp/c674/atansp_674LE_LE_COFF"
	-@ echo Building Project atansp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atansp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atansp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project atansp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atansp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/atansp//c674//atansp_674LE_LE_COFF"


#############################################################

# Rule to Build Project atansp_674LE_LE_ELF

#############################################################

.executables: src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out

.projects: src/atansp//c674//atansp_674LE_LE_ELF

src/atansp//c674//atansp_674LE_LE_ELF: src/atansp//c674//atansp_674LE_LE_ELF/.project

src/atansp//c674//atansp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atansp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name atansp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__ATANSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__ATANSP_674LE_LE_ELF_SRCATANSP/atansp_d.c\
 -ccs.linkFile EXT_ROOT__ATANSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__ATANSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/atansp//c674//atansp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__ATANSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANSP_674LE_LE_ELF_SRCATANSP "C:/nightlybuilds/mathlib/ti/mathlib/src/atansp" \
 -ccs.definePathVariable EXT_ROOT__ATANSP_674LE_LE_ELF_SRCATANSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/atansp/c674" \
 -ccs.definePathVariable EXT_ROOT__ATANSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__ATANSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/atansp//c674//atansp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANSP_674LE_LE_ELF_SRCATANSP=../../ >> src/atansp//c674//atansp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANSP_674LE_LE_ELF_SRCATANSPC674=.././ >> src/atansp//c674//atansp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__ATANSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/atansp//c674//atansp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/atansp_674LE_LE_ELF"
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/atansp/atansp.h
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/atansp/atansp_d.c
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/atansp//c674/atansp.h
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/atansp//c674/atansp_i.h
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/common/drvsp.c
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/common/drvsp.h
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/common/driver.h
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/common/driver.c
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/common/common.h
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/common//c674/common.h
src/atansp//c674//atansp_674LE_LE_ELF/Release/atansp_674LE_LE_ELF.out: src/atansp//c674//atansp_674LE_LE_ELF/.project
	-@ echo Importing Project atansp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atansp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects atansp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/atansp/c674/atansp_674LE_LE_ELF"
	-@ echo Building Project atansp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/atansp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects atansp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project atansp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/atansp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/atansp//c674//atansp_674LE_LE_ELF"


#############################################################

# Rule to Build Project cosdp_674LE_LE_COFF

#############################################################

.executables: src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out

.projects: src/cosdp//c674//cosdp_674LE_LE_COFF

src/cosdp//c674//cosdp_674LE_LE_COFF: src/cosdp//c674//cosdp_674LE_LE_COFF/.project

src/cosdp//c674//cosdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cosdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name cosdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOSDP/cosdp_d.c\
 -ccs.linkFile EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/cosdp//c674//cosdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOSDP "C:/nightlybuilds/mathlib/ti/mathlib/src/cosdp" \
 -ccs.definePathVariable EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOSDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/cosdp/c674" \
 -ccs.definePathVariable EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/cosdp//c674//cosdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOSDP=../../ >> src/cosdp//c674//cosdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOSDPC674=.././ >> src/cosdp//c674//cosdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/cosdp//c674//cosdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/cosdp_674LE_LE_COFF"
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/cosdp/cosdp.h
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/cosdp/cosdp_d.c
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/cosdp//c674/cosdp.h
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/cosdp//c674/cosdp_i.h
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/common/drvdp.c
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/common/drvdp.h
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/common/driver.h
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/common/driver.c
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/common/common.h
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/common//c674/common.h
src/cosdp//c674//cosdp_674LE_LE_COFF/Release/cosdp_674LE_LE_COFF.out: src/cosdp//c674//cosdp_674LE_LE_COFF/.project
	-@ echo Importing Project cosdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cosdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects cosdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/cosdp/c674/cosdp_674LE_LE_COFF"
	-@ echo Building Project cosdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cosdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects cosdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project cosdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/cosdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/cosdp//c674//cosdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project cosdp_674LE_LE_ELF

#############################################################

.executables: src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out

.projects: src/cosdp//c674//cosdp_674LE_LE_ELF

src/cosdp//c674//cosdp_674LE_LE_ELF: src/cosdp//c674//cosdp_674LE_LE_ELF/.project

src/cosdp//c674//cosdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cosdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name cosdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOSDP/cosdp_d.c\
 -ccs.linkFile EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/cosdp//c674//cosdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOSDP "C:/nightlybuilds/mathlib/ti/mathlib/src/cosdp" \
 -ccs.definePathVariable EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOSDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/cosdp/c674" \
 -ccs.definePathVariable EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/cosdp//c674//cosdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOSDP=../../ >> src/cosdp//c674//cosdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOSDPC674=.././ >> src/cosdp//c674//cosdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/cosdp//c674//cosdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/cosdp_674LE_LE_ELF"
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/cosdp/cosdp.h
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/cosdp/cosdp_d.c
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/cosdp//c674/cosdp.h
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/cosdp//c674/cosdp_i.h
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/common/drvdp.c
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/common/drvdp.h
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/common/driver.h
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/common/driver.c
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/common/common.h
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/common//c674/common.h
src/cosdp//c674//cosdp_674LE_LE_ELF/Release/cosdp_674LE_LE_ELF.out: src/cosdp//c674//cosdp_674LE_LE_ELF/.project
	-@ echo Importing Project cosdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cosdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects cosdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/cosdp/c674/cosdp_674LE_LE_ELF"
	-@ echo Building Project cosdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cosdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects cosdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project cosdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/cosdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/cosdp//c674//cosdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project coshdp_674LE_LE_COFF

#############################################################

.executables: src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out

.projects: src/coshdp//c674//coshdp_674LE_LE_COFF

src/coshdp//c674//coshdp_674LE_LE_COFF: src/coshdp//c674//coshdp_674LE_LE_COFF/.project

src/coshdp//c674//coshdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name coshdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOSHDP/coshdp_d.c\
 -ccs.linkFile EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/coshdp//c674//coshdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOSHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/coshdp" \
 -ccs.definePathVariable EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOSHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/coshdp/c674" \
 -ccs.definePathVariable EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/coshdp//c674//coshdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOSHDP=../../ >> src/coshdp//c674//coshdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOSHDPC674=.././ >> src/coshdp//c674//coshdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSHDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/coshdp//c674//coshdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/coshdp_674LE_LE_COFF"
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/coshdp/coshdp.h
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/coshdp/coshdp_d.c
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/coshdp//c674/coshdp.h
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/coshdp//c674/coshdp_i.h
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/common/drvdp.c
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/common/drvdp.h
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/common/driver.h
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/common/driver.c
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/common/common.h
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/common//c674/common.h
src/coshdp//c674//coshdp_674LE_LE_COFF/Release/coshdp_674LE_LE_COFF.out: src/coshdp//c674//coshdp_674LE_LE_COFF/.project
	-@ echo Importing Project coshdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects coshdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/coshdp/c674/coshdp_674LE_LE_COFF"
	-@ echo Building Project coshdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects coshdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project coshdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/coshdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/coshdp//c674//coshdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project coshdp_674LE_LE_ELF

#############################################################

.executables: src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out

.projects: src/coshdp//c674//coshdp_674LE_LE_ELF

src/coshdp//c674//coshdp_674LE_LE_ELF: src/coshdp//c674//coshdp_674LE_LE_ELF/.project

src/coshdp//c674//coshdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name coshdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOSHDP/coshdp_d.c\
 -ccs.linkFile EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/coshdp//c674//coshdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOSHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/coshdp" \
 -ccs.definePathVariable EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOSHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/coshdp/c674" \
 -ccs.definePathVariable EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/coshdp//c674//coshdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOSHDP=../../ >> src/coshdp//c674//coshdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOSHDPC674=.././ >> src/coshdp//c674//coshdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSHDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/coshdp//c674//coshdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/coshdp_674LE_LE_ELF"
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/coshdp/coshdp.h
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/coshdp/coshdp_d.c
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/coshdp//c674/coshdp.h
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/coshdp//c674/coshdp_i.h
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/common/drvdp.c
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/common/drvdp.h
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/common/driver.h
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/common/driver.c
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/common/common.h
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/common//c674/common.h
src/coshdp//c674//coshdp_674LE_LE_ELF/Release/coshdp_674LE_LE_ELF.out: src/coshdp//c674//coshdp_674LE_LE_ELF/.project
	-@ echo Importing Project coshdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects coshdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/coshdp/c674/coshdp_674LE_LE_ELF"
	-@ echo Building Project coshdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects coshdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project coshdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/coshdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/coshdp//c674//coshdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project coshsp_674LE_LE_COFF

#############################################################

.executables: src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out

.projects: src/coshsp//c674//coshsp_674LE_LE_COFF

src/coshsp//c674//coshsp_674LE_LE_COFF: src/coshsp//c674//coshsp_674LE_LE_COFF/.project

src/coshsp//c674//coshsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name coshsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOSHSP/coshsp_d.c\
 -ccs.linkFile EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/coshsp//c674//coshsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOSHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/coshsp" \
 -ccs.definePathVariable EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOSHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/coshsp/c674" \
 -ccs.definePathVariable EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/coshsp//c674//coshsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOSHSP=../../ >> src/coshsp//c674//coshsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOSHSPC674=.././ >> src/coshsp//c674//coshsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSHSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/coshsp//c674//coshsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/coshsp_674LE_LE_COFF"
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/coshsp/coshsp.h
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/coshsp/coshsp_d.c
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/coshsp//c674/coshsp.h
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/coshsp//c674/coshsp_i.h
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/common/drvsp.c
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/common/drvsp.h
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/common/driver.h
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/common/driver.c
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/common/common.h
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/common//c674/common.h
src/coshsp//c674//coshsp_674LE_LE_COFF/Release/coshsp_674LE_LE_COFF.out: src/coshsp//c674//coshsp_674LE_LE_COFF/.project
	-@ echo Importing Project coshsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects coshsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/coshsp/c674/coshsp_674LE_LE_COFF"
	-@ echo Building Project coshsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects coshsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project coshsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/coshsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/coshsp//c674//coshsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project coshsp_674LE_LE_ELF

#############################################################

.executables: src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out

.projects: src/coshsp//c674//coshsp_674LE_LE_ELF

src/coshsp//c674//coshsp_674LE_LE_ELF: src/coshsp//c674//coshsp_674LE_LE_ELF/.project

src/coshsp//c674//coshsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name coshsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOSHSP/coshsp_d.c\
 -ccs.linkFile EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/coshsp//c674//coshsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOSHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/coshsp" \
 -ccs.definePathVariable EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOSHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/coshsp/c674" \
 -ccs.definePathVariable EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/coshsp//c674//coshsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOSHSP=../../ >> src/coshsp//c674//coshsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOSHSPC674=.././ >> src/coshsp//c674//coshsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSHSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/coshsp//c674//coshsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/coshsp_674LE_LE_ELF"
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/coshsp/coshsp.h
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/coshsp/coshsp_d.c
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/coshsp//c674/coshsp.h
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/coshsp//c674/coshsp_i.h
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/common/drvsp.c
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/common/drvsp.h
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/common/driver.h
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/common/driver.c
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/common/common.h
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/common//c674/common.h
src/coshsp//c674//coshsp_674LE_LE_ELF/Release/coshsp_674LE_LE_ELF.out: src/coshsp//c674//coshsp_674LE_LE_ELF/.project
	-@ echo Importing Project coshsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects coshsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/coshsp/c674/coshsp_674LE_LE_ELF"
	-@ echo Building Project coshsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/coshsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects coshsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project coshsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/coshsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/coshsp//c674//coshsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project cossp_674LE_LE_COFF

#############################################################

.executables: src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out

.projects: src/cossp//c674//cossp_674LE_LE_COFF

src/cossp//c674//cossp_674LE_LE_COFF: src/cossp//c674//cossp_674LE_LE_COFF/.project

src/cossp//c674//cossp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cossp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name cossp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOSSP/cossp_d.c\
 -ccs.linkFile EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/cossp//c674//cossp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOSSP "C:/nightlybuilds/mathlib/ti/mathlib/src/cossp" \
 -ccs.definePathVariable EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOSSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/cossp/c674" \
 -ccs.definePathVariable EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/cossp//c674//cossp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOSSP=../../ >> src/cossp//c674//cossp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOSSPC674=.././ >> src/cossp//c674//cossp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__COSSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/cossp//c674//cossp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/cossp_674LE_LE_COFF"
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/cossp/cossp.h
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/cossp/cossp_d.c
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/cossp//c674/cossp.h
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/cossp//c674/cossp_i.h
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/common/drvsp.c
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/common/drvsp.h
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/common/driver.h
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/common/driver.c
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/common/common.h
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/common//c674/common.h
src/cossp//c674//cossp_674LE_LE_COFF/Release/cossp_674LE_LE_COFF.out: src/cossp//c674//cossp_674LE_LE_COFF/.project
	-@ echo Importing Project cossp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cossp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects cossp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/cossp/c674/cossp_674LE_LE_COFF"
	-@ echo Building Project cossp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cossp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects cossp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project cossp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/cossp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/cossp//c674//cossp_674LE_LE_COFF"


#############################################################

# Rule to Build Project cossp_674LE_LE_ELF

#############################################################

.executables: src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out

.projects: src/cossp//c674//cossp_674LE_LE_ELF

src/cossp//c674//cossp_674LE_LE_ELF: src/cossp//c674//cossp_674LE_LE_ELF/.project

src/cossp//c674//cossp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cossp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name cossp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOSSP/cossp_d.c\
 -ccs.linkFile EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/cossp//c674//cossp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOSSP "C:/nightlybuilds/mathlib/ti/mathlib/src/cossp" \
 -ccs.definePathVariable EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOSSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/cossp/c674" \
 -ccs.definePathVariable EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/cossp//c674//cossp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOSSP=../../ >> src/cossp//c674//cossp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOSSPC674=.././ >> src/cossp//c674//cossp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__COSSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/cossp//c674//cossp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/cossp_674LE_LE_ELF"
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/cossp/cossp.h
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/cossp/cossp_d.c
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/cossp//c674/cossp.h
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/cossp//c674/cossp_i.h
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/common/drvsp.c
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/common/drvsp.h
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/common/driver.h
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/common/driver.c
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/common/common.h
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/common//c674/common.h
src/cossp//c674//cossp_674LE_LE_ELF/Release/cossp_674LE_LE_ELF.out: src/cossp//c674//cossp_674LE_LE_ELF/.project
	-@ echo Importing Project cossp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cossp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects cossp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/cossp/c674/cossp_674LE_LE_ELF"
	-@ echo Building Project cossp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/cossp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects cossp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project cossp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/cossp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/cossp//c674//cossp_674LE_LE_ELF"


#############################################################

# Rule to Build Project divdp_674LE_LE_COFF

#############################################################

.executables: src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out

.projects: src/divdp//c674//divdp_674LE_LE_COFF

src/divdp//c674//divdp_674LE_LE_COFF: src/divdp//c674//divdp_674LE_LE_COFF/.project

src/divdp//c674//divdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name divdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DIVDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DIVDP_674LE_LE_COFF_SRCDIVDP/divdp_d.c\
 -ccs.linkFile EXT_ROOT__DIVDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__DIVDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/divdp//c674//divdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__DIVDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DIVDP_674LE_LE_COFF_SRCDIVDP "C:/nightlybuilds/mathlib/ti/mathlib/src/divdp" \
 -ccs.definePathVariable EXT_ROOT__DIVDP_674LE_LE_COFF_SRCDIVDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/divdp/c674" \
 -ccs.definePathVariable EXT_ROOT__DIVDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__DIVDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/divdp//c674//divdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__DIVDP_674LE_LE_COFF_SRCDIVDP=../../ >> src/divdp//c674//divdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__DIVDP_674LE_LE_COFF_SRCDIVDPC674=.././ >> src/divdp//c674//divdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__DIVDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/divdp//c674//divdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/divdp_674LE_LE_COFF"
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/divdp/divdp.h
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/divdp/divdp_d.c
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/divdp//c674/divdp.h
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/divdp//c674/divdp_i.h
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/common/drvdp.c
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/common/drvdp.h
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/common/driver.h
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/common/driver.c
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/common/common.h
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/common//c674/common.h
src/divdp//c674//divdp_674LE_LE_COFF/Release/divdp_674LE_LE_COFF.out: src/divdp//c674//divdp_674LE_LE_COFF/.project
	-@ echo Importing Project divdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects divdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/divdp/c674/divdp_674LE_LE_COFF"
	-@ echo Building Project divdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects divdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project divdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/divdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/divdp//c674//divdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project divdp_674LE_LE_ELF

#############################################################

.executables: src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out

.projects: src/divdp//c674//divdp_674LE_LE_ELF

src/divdp//c674//divdp_674LE_LE_ELF: src/divdp//c674//divdp_674LE_LE_ELF/.project

src/divdp//c674//divdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name divdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DIVDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DIVDP_674LE_LE_ELF_SRCDIVDP/divdp_d.c\
 -ccs.linkFile EXT_ROOT__DIVDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__DIVDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/divdp//c674//divdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__DIVDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DIVDP_674LE_LE_ELF_SRCDIVDP "C:/nightlybuilds/mathlib/ti/mathlib/src/divdp" \
 -ccs.definePathVariable EXT_ROOT__DIVDP_674LE_LE_ELF_SRCDIVDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/divdp/c674" \
 -ccs.definePathVariable EXT_ROOT__DIVDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__DIVDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/divdp//c674//divdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__DIVDP_674LE_LE_ELF_SRCDIVDP=../../ >> src/divdp//c674//divdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__DIVDP_674LE_LE_ELF_SRCDIVDPC674=.././ >> src/divdp//c674//divdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__DIVDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/divdp//c674//divdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/divdp_674LE_LE_ELF"
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/divdp/divdp.h
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/divdp/divdp_d.c
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/divdp//c674/divdp.h
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/divdp//c674/divdp_i.h
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/common/drvdp.c
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/common/drvdp.h
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/common/driver.h
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/common/driver.c
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/common/common.h
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/common//c674/common.h
src/divdp//c674//divdp_674LE_LE_ELF/Release/divdp_674LE_LE_ELF.out: src/divdp//c674//divdp_674LE_LE_ELF/.project
	-@ echo Importing Project divdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects divdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/divdp/c674/divdp_674LE_LE_ELF"
	-@ echo Building Project divdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects divdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project divdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/divdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/divdp//c674//divdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project divsp_674LE_LE_COFF

#############################################################

.executables: src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out

.projects: src/divsp//c674//divsp_674LE_LE_COFF

src/divsp//c674//divsp_674LE_LE_COFF: src/divsp//c674//divsp_674LE_LE_COFF/.project

src/divsp//c674//divsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name divsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DIVSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DIVSP_674LE_LE_COFF_SRCDIVSP/divsp_d.c\
 -ccs.linkFile EXT_ROOT__DIVSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__DIVSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/divsp//c674//divsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__DIVSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DIVSP_674LE_LE_COFF_SRCDIVSP "C:/nightlybuilds/mathlib/ti/mathlib/src/divsp" \
 -ccs.definePathVariable EXT_ROOT__DIVSP_674LE_LE_COFF_SRCDIVSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/divsp/c674" \
 -ccs.definePathVariable EXT_ROOT__DIVSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__DIVSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/divsp//c674//divsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__DIVSP_674LE_LE_COFF_SRCDIVSP=../../ >> src/divsp//c674//divsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__DIVSP_674LE_LE_COFF_SRCDIVSPC674=.././ >> src/divsp//c674//divsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__DIVSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/divsp//c674//divsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/divsp_674LE_LE_COFF"
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/divsp/divsp.h
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/divsp/divsp_d.c
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/divsp//c674/divsp.h
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/divsp//c674/divsp_i.h
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/common/drvsp.c
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/common/drvsp.h
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/common/driver.h
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/common/driver.c
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/common/common.h
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/common//c674/common.h
src/divsp//c674//divsp_674LE_LE_COFF/Release/divsp_674LE_LE_COFF.out: src/divsp//c674//divsp_674LE_LE_COFF/.project
	-@ echo Importing Project divsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects divsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/divsp/c674/divsp_674LE_LE_COFF"
	-@ echo Building Project divsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects divsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project divsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/divsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/divsp//c674//divsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project divsp_674LE_LE_ELF

#############################################################

.executables: src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out

.projects: src/divsp//c674//divsp_674LE_LE_ELF

src/divsp//c674//divsp_674LE_LE_ELF: src/divsp//c674//divsp_674LE_LE_ELF/.project

src/divsp//c674//divsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name divsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DIVSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DIVSP_674LE_LE_ELF_SRCDIVSP/divsp_d.c\
 -ccs.linkFile EXT_ROOT__DIVSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__DIVSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/divsp//c674//divsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__DIVSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DIVSP_674LE_LE_ELF_SRCDIVSP "C:/nightlybuilds/mathlib/ti/mathlib/src/divsp" \
 -ccs.definePathVariable EXT_ROOT__DIVSP_674LE_LE_ELF_SRCDIVSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/divsp/c674" \
 -ccs.definePathVariable EXT_ROOT__DIVSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__DIVSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/divsp//c674//divsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__DIVSP_674LE_LE_ELF_SRCDIVSP=../../ >> src/divsp//c674//divsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__DIVSP_674LE_LE_ELF_SRCDIVSPC674=.././ >> src/divsp//c674//divsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__DIVSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/divsp//c674//divsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/divsp_674LE_LE_ELF"
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/divsp/divsp.h
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/divsp/divsp_d.c
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/divsp//c674/divsp.h
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/divsp//c674/divsp_i.h
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/common/drvsp.c
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/common/drvsp.h
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/common/driver.h
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/common/driver.c
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/common/common.h
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/common//c674/common.h
src/divsp//c674//divsp_674LE_LE_ELF/Release/divsp_674LE_LE_ELF.out: src/divsp//c674//divsp_674LE_LE_ELF/.project
	-@ echo Importing Project divsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects divsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/divsp/c674/divsp_674LE_LE_ELF"
	-@ echo Building Project divsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/divsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects divsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project divsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/divsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/divsp//c674//divsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project exp10dp_674LE_LE_COFF

#############################################################

.executables: src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out

.projects: src/exp10dp//c674//exp10dp_674LE_LE_COFF

src/exp10dp//c674//exp10dp_674LE_LE_COFF: src/exp10dp//c674//exp10dp_674LE_LE_COFF/.project

src/exp10dp//c674//exp10dp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name exp10dp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCEXP10DP/exp10dp_d.c\
 -ccs.linkFile EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/exp10dp//c674//exp10dp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCEXP10DP "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10dp" \
 -ccs.definePathVariable EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCEXP10DPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10dp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/exp10dp//c674//exp10dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCEXP10DP=../../ >> src/exp10dp//c674//exp10dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCEXP10DPC674=.././ >> src/exp10dp//c674//exp10dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP10DP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/exp10dp//c674//exp10dp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/exp10dp_674LE_LE_COFF"
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/exp10dp/exp10dp.h
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/exp10dp/exp10dp_d.c
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/exp10dp//c674/exp10dp.h
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/exp10dp//c674/exp10dp_i.h
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/common/drvdp.c
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/common/drvdp.h
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/common/driver.h
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/common/driver.c
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/common/common.h
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/common//c674/common.h
src/exp10dp//c674//exp10dp_674LE_LE_COFF/Release/exp10dp_674LE_LE_COFF.out: src/exp10dp//c674//exp10dp_674LE_LE_COFF/.project
	-@ echo Importing Project exp10dp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects exp10dp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10dp/c674/exp10dp_674LE_LE_COFF"
	-@ echo Building Project exp10dp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects exp10dp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project exp10dp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/exp10dp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/exp10dp//c674//exp10dp_674LE_LE_COFF"


#############################################################

# Rule to Build Project exp10dp_674LE_LE_ELF

#############################################################

.executables: src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out

.projects: src/exp10dp//c674//exp10dp_674LE_LE_ELF

src/exp10dp//c674//exp10dp_674LE_LE_ELF: src/exp10dp//c674//exp10dp_674LE_LE_ELF/.project

src/exp10dp//c674//exp10dp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name exp10dp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCEXP10DP/exp10dp_d.c\
 -ccs.linkFile EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/exp10dp//c674//exp10dp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCEXP10DP "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10dp" \
 -ccs.definePathVariable EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCEXP10DPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10dp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/exp10dp//c674//exp10dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCEXP10DP=../../ >> src/exp10dp//c674//exp10dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCEXP10DPC674=.././ >> src/exp10dp//c674//exp10dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP10DP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/exp10dp//c674//exp10dp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/exp10dp_674LE_LE_ELF"
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/exp10dp/exp10dp.h
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/exp10dp/exp10dp_d.c
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/exp10dp//c674/exp10dp.h
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/exp10dp//c674/exp10dp_i.h
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/common/drvdp.c
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/common/drvdp.h
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/common/driver.h
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/common/driver.c
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/common/common.h
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/common//c674/common.h
src/exp10dp//c674//exp10dp_674LE_LE_ELF/Release/exp10dp_674LE_LE_ELF.out: src/exp10dp//c674//exp10dp_674LE_LE_ELF/.project
	-@ echo Importing Project exp10dp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects exp10dp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10dp/c674/exp10dp_674LE_LE_ELF"
	-@ echo Building Project exp10dp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects exp10dp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project exp10dp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/exp10dp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/exp10dp//c674//exp10dp_674LE_LE_ELF"


#############################################################

# Rule to Build Project exp10sp_674LE_LE_COFF

#############################################################

.executables: src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out

.projects: src/exp10sp//c674//exp10sp_674LE_LE_COFF

src/exp10sp//c674//exp10sp_674LE_LE_COFF: src/exp10sp//c674//exp10sp_674LE_LE_COFF/.project

src/exp10sp//c674//exp10sp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name exp10sp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCEXP10SP/exp10sp_d.c\
 -ccs.linkFile EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/exp10sp//c674//exp10sp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCEXP10SP "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10sp" \
 -ccs.definePathVariable EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCEXP10SPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10sp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/exp10sp//c674//exp10sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCEXP10SP=../../ >> src/exp10sp//c674//exp10sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCEXP10SPC674=.././ >> src/exp10sp//c674//exp10sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP10SP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/exp10sp//c674//exp10sp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/exp10sp_674LE_LE_COFF"
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/exp10sp/exp10sp.h
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/exp10sp/exp10sp_d.c
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/exp10sp//c674/exp10sp.h
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/exp10sp//c674/exp10sp_i.h
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/common/drvsp.c
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/common/drvsp.h
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/common/driver.h
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/common/driver.c
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/common/common.h
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/common//c674/common.h
src/exp10sp//c674//exp10sp_674LE_LE_COFF/Release/exp10sp_674LE_LE_COFF.out: src/exp10sp//c674//exp10sp_674LE_LE_COFF/.project
	-@ echo Importing Project exp10sp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects exp10sp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10sp/c674/exp10sp_674LE_LE_COFF"
	-@ echo Building Project exp10sp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects exp10sp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project exp10sp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/exp10sp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/exp10sp//c674//exp10sp_674LE_LE_COFF"


#############################################################

# Rule to Build Project exp10sp_674LE_LE_ELF

#############################################################

.executables: src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out

.projects: src/exp10sp//c674//exp10sp_674LE_LE_ELF

src/exp10sp//c674//exp10sp_674LE_LE_ELF: src/exp10sp//c674//exp10sp_674LE_LE_ELF/.project

src/exp10sp//c674//exp10sp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name exp10sp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCEXP10SP/exp10sp_d.c\
 -ccs.linkFile EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/exp10sp//c674//exp10sp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCEXP10SP "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10sp" \
 -ccs.definePathVariable EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCEXP10SPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10sp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/exp10sp//c674//exp10sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCEXP10SP=../../ >> src/exp10sp//c674//exp10sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCEXP10SPC674=.././ >> src/exp10sp//c674//exp10sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP10SP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/exp10sp//c674//exp10sp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/exp10sp_674LE_LE_ELF"
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/exp10sp/exp10sp.h
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/exp10sp/exp10sp_d.c
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/exp10sp//c674/exp10sp.h
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/exp10sp//c674/exp10sp_i.h
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/common/drvsp.c
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/common/drvsp.h
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/common/driver.h
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/common/driver.c
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/common/common.h
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/common//c674/common.h
src/exp10sp//c674//exp10sp_674LE_LE_ELF/Release/exp10sp_674LE_LE_ELF.out: src/exp10sp//c674//exp10sp_674LE_LE_ELF/.project
	-@ echo Importing Project exp10sp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects exp10sp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/exp10sp/c674/exp10sp_674LE_LE_ELF"
	-@ echo Building Project exp10sp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp10sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects exp10sp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project exp10sp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/exp10sp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/exp10sp//c674//exp10sp_674LE_LE_ELF"


#############################################################

# Rule to Build Project exp2dp_674LE_LE_COFF

#############################################################

.executables: src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out

.projects: src/exp2dp//c674//exp2dp_674LE_LE_COFF

src/exp2dp//c674//exp2dp_674LE_LE_COFF: src/exp2dp//c674//exp2dp_674LE_LE_COFF/.project

src/exp2dp//c674//exp2dp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name exp2dp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCEXP2DP/exp2dp_d.c\
 -ccs.linkFile EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/exp2dp//c674//exp2dp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCEXP2DP "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2dp" \
 -ccs.definePathVariable EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCEXP2DPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2dp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/exp2dp//c674//exp2dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCEXP2DP=../../ >> src/exp2dp//c674//exp2dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCEXP2DPC674=.././ >> src/exp2dp//c674//exp2dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP2DP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/exp2dp//c674//exp2dp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/exp2dp_674LE_LE_COFF"
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/exp2dp/exp2dp.h
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/exp2dp/exp2dp_d.c
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/exp2dp//c674/exp2dp.h
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/exp2dp//c674/exp2dp_i.h
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/common/drvdp.c
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/common/drvdp.h
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/common/driver.h
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/common/driver.c
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/common/common.h
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/common//c674/common.h
src/exp2dp//c674//exp2dp_674LE_LE_COFF/Release/exp2dp_674LE_LE_COFF.out: src/exp2dp//c674//exp2dp_674LE_LE_COFF/.project
	-@ echo Importing Project exp2dp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects exp2dp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2dp/c674/exp2dp_674LE_LE_COFF"
	-@ echo Building Project exp2dp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects exp2dp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project exp2dp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/exp2dp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/exp2dp//c674//exp2dp_674LE_LE_COFF"


#############################################################

# Rule to Build Project exp2dp_674LE_LE_ELF

#############################################################

.executables: src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out

.projects: src/exp2dp//c674//exp2dp_674LE_LE_ELF

src/exp2dp//c674//exp2dp_674LE_LE_ELF: src/exp2dp//c674//exp2dp_674LE_LE_ELF/.project

src/exp2dp//c674//exp2dp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name exp2dp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCEXP2DP/exp2dp_d.c\
 -ccs.linkFile EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/exp2dp//c674//exp2dp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCEXP2DP "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2dp" \
 -ccs.definePathVariable EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCEXP2DPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2dp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/exp2dp//c674//exp2dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCEXP2DP=../../ >> src/exp2dp//c674//exp2dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCEXP2DPC674=.././ >> src/exp2dp//c674//exp2dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP2DP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/exp2dp//c674//exp2dp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/exp2dp_674LE_LE_ELF"
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/exp2dp/exp2dp.h
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/exp2dp/exp2dp_d.c
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/exp2dp//c674/exp2dp.h
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/exp2dp//c674/exp2dp_i.h
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/common/drvdp.c
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/common/drvdp.h
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/common/driver.h
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/common/driver.c
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/common/common.h
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/common//c674/common.h
src/exp2dp//c674//exp2dp_674LE_LE_ELF/Release/exp2dp_674LE_LE_ELF.out: src/exp2dp//c674//exp2dp_674LE_LE_ELF/.project
	-@ echo Importing Project exp2dp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects exp2dp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2dp/c674/exp2dp_674LE_LE_ELF"
	-@ echo Building Project exp2dp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects exp2dp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project exp2dp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/exp2dp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/exp2dp//c674//exp2dp_674LE_LE_ELF"


#############################################################

# Rule to Build Project exp2sp_674LE_LE_COFF

#############################################################

.executables: src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out

.projects: src/exp2sp//c674//exp2sp_674LE_LE_COFF

src/exp2sp//c674//exp2sp_674LE_LE_COFF: src/exp2sp//c674//exp2sp_674LE_LE_COFF/.project

src/exp2sp//c674//exp2sp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name exp2sp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCEXP2SP/exp2sp_d.c\
 -ccs.linkFile EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/exp2sp//c674//exp2sp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCEXP2SP "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2sp" \
 -ccs.definePathVariable EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCEXP2SPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2sp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/exp2sp//c674//exp2sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCEXP2SP=../../ >> src/exp2sp//c674//exp2sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCEXP2SPC674=.././ >> src/exp2sp//c674//exp2sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXP2SP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/exp2sp//c674//exp2sp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/exp2sp_674LE_LE_COFF"
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/exp2sp/exp2sp.h
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/exp2sp/exp2sp_d.c
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/exp2sp//c674/exp2sp.h
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/exp2sp//c674/exp2sp_i.h
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/common/drvsp.c
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/common/drvsp.h
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/common/driver.h
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/common/driver.c
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/common/common.h
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/common//c674/common.h
src/exp2sp//c674//exp2sp_674LE_LE_COFF/Release/exp2sp_674LE_LE_COFF.out: src/exp2sp//c674//exp2sp_674LE_LE_COFF/.project
	-@ echo Importing Project exp2sp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects exp2sp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2sp/c674/exp2sp_674LE_LE_COFF"
	-@ echo Building Project exp2sp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects exp2sp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project exp2sp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/exp2sp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/exp2sp//c674//exp2sp_674LE_LE_COFF"


#############################################################

# Rule to Build Project exp2sp_674LE_LE_ELF

#############################################################

.executables: src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out

.projects: src/exp2sp//c674//exp2sp_674LE_LE_ELF

src/exp2sp//c674//exp2sp_674LE_LE_ELF: src/exp2sp//c674//exp2sp_674LE_LE_ELF/.project

src/exp2sp//c674//exp2sp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name exp2sp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCEXP2SP/exp2sp_d.c\
 -ccs.linkFile EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/exp2sp//c674//exp2sp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCEXP2SP "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2sp" \
 -ccs.definePathVariable EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCEXP2SPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2sp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/exp2sp//c674//exp2sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCEXP2SP=../../ >> src/exp2sp//c674//exp2sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCEXP2SPC674=.././ >> src/exp2sp//c674//exp2sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXP2SP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/exp2sp//c674//exp2sp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/exp2sp_674LE_LE_ELF"
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/exp2sp/exp2sp.h
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/exp2sp/exp2sp_d.c
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/exp2sp//c674/exp2sp.h
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/exp2sp//c674/exp2sp_i.h
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/common/drvsp.c
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/common/drvsp.h
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/common/driver.h
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/common/driver.c
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/common/common.h
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/common//c674/common.h
src/exp2sp//c674//exp2sp_674LE_LE_ELF/Release/exp2sp_674LE_LE_ELF.out: src/exp2sp//c674//exp2sp_674LE_LE_ELF/.project
	-@ echo Importing Project exp2sp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects exp2sp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/exp2sp/c674/exp2sp_674LE_LE_ELF"
	-@ echo Building Project exp2sp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/exp2sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects exp2sp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project exp2sp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/exp2sp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/exp2sp//c674//exp2sp_674LE_LE_ELF"


#############################################################

# Rule to Build Project expdp_674LE_LE_COFF

#############################################################

.executables: src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out

.projects: src/expdp//c674//expdp_674LE_LE_COFF

src/expdp//c674//expdp_674LE_LE_COFF: src/expdp//c674//expdp_674LE_LE_COFF/.project

src/expdp//c674//expdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name expdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXPDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXPDP_674LE_LE_COFF_SRCEXPDP/expdp_d.c\
 -ccs.linkFile EXT_ROOT__EXPDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__EXPDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/expdp//c674//expdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__EXPDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXPDP_674LE_LE_COFF_SRCEXPDP "C:/nightlybuilds/mathlib/ti/mathlib/src/expdp" \
 -ccs.definePathVariable EXT_ROOT__EXPDP_674LE_LE_COFF_SRCEXPDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/expdp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXPDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXPDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/expdp//c674//expdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXPDP_674LE_LE_COFF_SRCEXPDP=../../ >> src/expdp//c674//expdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXPDP_674LE_LE_COFF_SRCEXPDPC674=.././ >> src/expdp//c674//expdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXPDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/expdp//c674//expdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/expdp_674LE_LE_COFF"
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/expdp/expdp.h
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/expdp/expdp_d.c
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/expdp//c674/expdp.h
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/expdp//c674/expdp_i.h
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/common/drvdp.c
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/common/drvdp.h
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/common/driver.h
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/common/driver.c
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/common/common.h
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/common//c674/common.h
src/expdp//c674//expdp_674LE_LE_COFF/Release/expdp_674LE_LE_COFF.out: src/expdp//c674//expdp_674LE_LE_COFF/.project
	-@ echo Importing Project expdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects expdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/expdp/c674/expdp_674LE_LE_COFF"
	-@ echo Building Project expdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects expdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project expdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/expdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/expdp//c674//expdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project expdp_674LE_LE_ELF

#############################################################

.executables: src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out

.projects: src/expdp//c674//expdp_674LE_LE_ELF

src/expdp//c674//expdp_674LE_LE_ELF: src/expdp//c674//expdp_674LE_LE_ELF/.project

src/expdp//c674//expdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name expdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXPDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXPDP_674LE_LE_ELF_SRCEXPDP/expdp_d.c\
 -ccs.linkFile EXT_ROOT__EXPDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__EXPDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/expdp//c674//expdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__EXPDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXPDP_674LE_LE_ELF_SRCEXPDP "C:/nightlybuilds/mathlib/ti/mathlib/src/expdp" \
 -ccs.definePathVariable EXT_ROOT__EXPDP_674LE_LE_ELF_SRCEXPDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/expdp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXPDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXPDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/expdp//c674//expdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXPDP_674LE_LE_ELF_SRCEXPDP=../../ >> src/expdp//c674//expdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXPDP_674LE_LE_ELF_SRCEXPDPC674=.././ >> src/expdp//c674//expdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXPDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/expdp//c674//expdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/expdp_674LE_LE_ELF"
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/expdp/expdp.h
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/expdp/expdp_d.c
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/expdp//c674/expdp.h
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/expdp//c674/expdp_i.h
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/common/drvdp.c
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/common/drvdp.h
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/common/driver.h
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/common/driver.c
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/common/common.h
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/common//c674/common.h
src/expdp//c674//expdp_674LE_LE_ELF/Release/expdp_674LE_LE_ELF.out: src/expdp//c674//expdp_674LE_LE_ELF/.project
	-@ echo Importing Project expdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects expdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/expdp/c674/expdp_674LE_LE_ELF"
	-@ echo Building Project expdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects expdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project expdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/expdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/expdp//c674//expdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project expsp_674LE_LE_COFF

#############################################################

.executables: src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out

.projects: src/expsp//c674//expsp_674LE_LE_COFF

src/expsp//c674//expsp_674LE_LE_COFF: src/expsp//c674//expsp_674LE_LE_COFF/.project

src/expsp//c674//expsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name expsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXPSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXPSP_674LE_LE_COFF_SRCEXPSP/expsp_d.c\
 -ccs.linkFile EXT_ROOT__EXPSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__EXPSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/expsp//c674//expsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__EXPSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXPSP_674LE_LE_COFF_SRCEXPSP "C:/nightlybuilds/mathlib/ti/mathlib/src/expsp" \
 -ccs.definePathVariable EXT_ROOT__EXPSP_674LE_LE_COFF_SRCEXPSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/expsp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXPSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXPSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/expsp//c674//expsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXPSP_674LE_LE_COFF_SRCEXPSP=../../ >> src/expsp//c674//expsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXPSP_674LE_LE_COFF_SRCEXPSPC674=.././ >> src/expsp//c674//expsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__EXPSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/expsp//c674//expsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/expsp_674LE_LE_COFF"
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/expsp/expsp.h
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/expsp/expsp_d.c
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/expsp//c674/expsp.h
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/expsp//c674/expsp_i.h
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/common/drvsp.c
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/common/drvsp.h
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/common/driver.h
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/common/driver.c
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/common/common.h
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/common//c674/common.h
src/expsp//c674//expsp_674LE_LE_COFF/Release/expsp_674LE_LE_COFF.out: src/expsp//c674//expsp_674LE_LE_COFF/.project
	-@ echo Importing Project expsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects expsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/expsp/c674/expsp_674LE_LE_COFF"
	-@ echo Building Project expsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects expsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project expsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/expsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/expsp//c674//expsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project expsp_674LE_LE_ELF

#############################################################

.executables: src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out

.projects: src/expsp//c674//expsp_674LE_LE_ELF

src/expsp//c674//expsp_674LE_LE_ELF: src/expsp//c674//expsp_674LE_LE_ELF/.project

src/expsp//c674//expsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name expsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__EXPSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__EXPSP_674LE_LE_ELF_SRCEXPSP/expsp_d.c\
 -ccs.linkFile EXT_ROOT__EXPSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__EXPSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/expsp//c674//expsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__EXPSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__EXPSP_674LE_LE_ELF_SRCEXPSP "C:/nightlybuilds/mathlib/ti/mathlib/src/expsp" \
 -ccs.definePathVariable EXT_ROOT__EXPSP_674LE_LE_ELF_SRCEXPSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/expsp/c674" \
 -ccs.definePathVariable EXT_ROOT__EXPSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__EXPSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/expsp//c674//expsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXPSP_674LE_LE_ELF_SRCEXPSP=../../ >> src/expsp//c674//expsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXPSP_674LE_LE_ELF_SRCEXPSPC674=.././ >> src/expsp//c674//expsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__EXPSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/expsp//c674//expsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/expsp_674LE_LE_ELF"
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/expsp/expsp.h
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/expsp/expsp_d.c
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/expsp//c674/expsp.h
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/expsp//c674/expsp_i.h
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/common/drvsp.c
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/common/drvsp.h
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/common/driver.h
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/common/driver.c
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/common/common.h
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/common//c674/common.h
src/expsp//c674//expsp_674LE_LE_ELF/Release/expsp_674LE_LE_ELF.out: src/expsp//c674//expsp_674LE_LE_ELF/.project
	-@ echo Importing Project expsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects expsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/expsp/c674/expsp_674LE_LE_ELF"
	-@ echo Building Project expsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/expsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects expsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project expsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/expsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/expsp//c674//expsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project log10dp_674LE_LE_COFF

#############################################################

.executables: src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out

.projects: src/log10dp//c674//log10dp_674LE_LE_COFF

src/log10dp//c674//log10dp_674LE_LE_COFF: src/log10dp//c674//log10dp_674LE_LE_COFF/.project

src/log10dp//c674//log10dp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name log10dp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCLOG10DP/log10dp_d.c\
 -ccs.linkFile EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/log10dp//c674//log10dp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCLOG10DP "C:/nightlybuilds/mathlib/ti/mathlib/src/log10dp" \
 -ccs.definePathVariable EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCLOG10DPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/log10dp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/log10dp//c674//log10dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCLOG10DP=../../ >> src/log10dp//c674//log10dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCLOG10DPC674=.././ >> src/log10dp//c674//log10dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG10DP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/log10dp//c674//log10dp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/log10dp_674LE_LE_COFF"
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/log10dp/log10dp.h
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/log10dp/log10dp_d.c
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/log10dp//c674/log10dp.h
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/log10dp//c674/log10dp_i.h
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/common/drvdp.c
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/common/drvdp.h
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/common/driver.h
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/common/driver.c
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/common/common.h
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/common//c674/common.h
src/log10dp//c674//log10dp_674LE_LE_COFF/Release/log10dp_674LE_LE_COFF.out: src/log10dp//c674//log10dp_674LE_LE_COFF/.project
	-@ echo Importing Project log10dp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects log10dp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/log10dp/c674/log10dp_674LE_LE_COFF"
	-@ echo Building Project log10dp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects log10dp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project log10dp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/log10dp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/log10dp//c674//log10dp_674LE_LE_COFF"


#############################################################

# Rule to Build Project log10dp_674LE_LE_ELF

#############################################################

.executables: src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out

.projects: src/log10dp//c674//log10dp_674LE_LE_ELF

src/log10dp//c674//log10dp_674LE_LE_ELF: src/log10dp//c674//log10dp_674LE_LE_ELF/.project

src/log10dp//c674//log10dp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name log10dp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCLOG10DP/log10dp_d.c\
 -ccs.linkFile EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/log10dp//c674//log10dp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCLOG10DP "C:/nightlybuilds/mathlib/ti/mathlib/src/log10dp" \
 -ccs.definePathVariable EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCLOG10DPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/log10dp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/log10dp//c674//log10dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCLOG10DP=../../ >> src/log10dp//c674//log10dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCLOG10DPC674=.././ >> src/log10dp//c674//log10dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG10DP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/log10dp//c674//log10dp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/log10dp_674LE_LE_ELF"
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/log10dp/log10dp.h
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/log10dp/log10dp_d.c
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/log10dp//c674/log10dp.h
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/log10dp//c674/log10dp_i.h
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/common/drvdp.c
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/common/drvdp.h
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/common/driver.h
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/common/driver.c
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/common/common.h
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/common//c674/common.h
src/log10dp//c674//log10dp_674LE_LE_ELF/Release/log10dp_674LE_LE_ELF.out: src/log10dp//c674//log10dp_674LE_LE_ELF/.project
	-@ echo Importing Project log10dp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects log10dp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/log10dp/c674/log10dp_674LE_LE_ELF"
	-@ echo Building Project log10dp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects log10dp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project log10dp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/log10dp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/log10dp//c674//log10dp_674LE_LE_ELF"


#############################################################

# Rule to Build Project log10sp_674LE_LE_COFF

#############################################################

.executables: src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out

.projects: src/log10sp//c674//log10sp_674LE_LE_COFF

src/log10sp//c674//log10sp_674LE_LE_COFF: src/log10sp//c674//log10sp_674LE_LE_COFF/.project

src/log10sp//c674//log10sp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name log10sp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCLOG10SP/log10sp_d.c\
 -ccs.linkFile EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/log10sp//c674//log10sp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCLOG10SP "C:/nightlybuilds/mathlib/ti/mathlib/src/log10sp" \
 -ccs.definePathVariable EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCLOG10SPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/log10sp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/log10sp//c674//log10sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCLOG10SP=../../ >> src/log10sp//c674//log10sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCLOG10SPC674=.././ >> src/log10sp//c674//log10sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG10SP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/log10sp//c674//log10sp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/log10sp_674LE_LE_COFF"
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/log10sp/log10sp.h
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/log10sp/log10sp_d.c
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/log10sp//c674/log10sp.h
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/log10sp//c674/log10sp_i.h
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/common/drvsp.c
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/common/drvsp.h
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/common/driver.h
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/common/driver.c
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/common/common.h
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/common//c674/common.h
src/log10sp//c674//log10sp_674LE_LE_COFF/Release/log10sp_674LE_LE_COFF.out: src/log10sp//c674//log10sp_674LE_LE_COFF/.project
	-@ echo Importing Project log10sp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects log10sp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/log10sp/c674/log10sp_674LE_LE_COFF"
	-@ echo Building Project log10sp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects log10sp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project log10sp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/log10sp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/log10sp//c674//log10sp_674LE_LE_COFF"


#############################################################

# Rule to Build Project log10sp_674LE_LE_ELF

#############################################################

.executables: src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out

.projects: src/log10sp//c674//log10sp_674LE_LE_ELF

src/log10sp//c674//log10sp_674LE_LE_ELF: src/log10sp//c674//log10sp_674LE_LE_ELF/.project

src/log10sp//c674//log10sp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name log10sp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCLOG10SP/log10sp_d.c\
 -ccs.linkFile EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/log10sp//c674//log10sp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCLOG10SP "C:/nightlybuilds/mathlib/ti/mathlib/src/log10sp" \
 -ccs.definePathVariable EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCLOG10SPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/log10sp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/log10sp//c674//log10sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCLOG10SP=../../ >> src/log10sp//c674//log10sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCLOG10SPC674=.././ >> src/log10sp//c674//log10sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG10SP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/log10sp//c674//log10sp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/log10sp_674LE_LE_ELF"
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/log10sp/log10sp.h
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/log10sp/log10sp_d.c
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/log10sp//c674/log10sp.h
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/log10sp//c674/log10sp_i.h
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/common/drvsp.c
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/common/drvsp.h
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/common/driver.h
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/common/driver.c
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/common/common.h
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/common//c674/common.h
src/log10sp//c674//log10sp_674LE_LE_ELF/Release/log10sp_674LE_LE_ELF.out: src/log10sp//c674//log10sp_674LE_LE_ELF/.project
	-@ echo Importing Project log10sp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects log10sp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/log10sp/c674/log10sp_674LE_LE_ELF"
	-@ echo Building Project log10sp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log10sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects log10sp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project log10sp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/log10sp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/log10sp//c674//log10sp_674LE_LE_ELF"


#############################################################

# Rule to Build Project log2dp_674LE_LE_COFF

#############################################################

.executables: src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out

.projects: src/log2dp//c674//log2dp_674LE_LE_COFF

src/log2dp//c674//log2dp_674LE_LE_COFF: src/log2dp//c674//log2dp_674LE_LE_COFF/.project

src/log2dp//c674//log2dp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name log2dp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCLOG2DP/log2dp_d.c\
 -ccs.linkFile EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/log2dp//c674//log2dp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCLOG2DP "C:/nightlybuilds/mathlib/ti/mathlib/src/log2dp" \
 -ccs.definePathVariable EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCLOG2DPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/log2dp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/log2dp//c674//log2dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCLOG2DP=../../ >> src/log2dp//c674//log2dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCLOG2DPC674=.././ >> src/log2dp//c674//log2dp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG2DP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/log2dp//c674//log2dp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/log2dp_674LE_LE_COFF"
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/log2dp/log2dp.h
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/log2dp/log2dp_d.c
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/log2dp//c674/log2dp.h
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/log2dp//c674/log2dp_i.h
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/common/drvdp.c
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/common/drvdp.h
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/common/driver.h
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/common/driver.c
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/common/common.h
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/common//c674/common.h
src/log2dp//c674//log2dp_674LE_LE_COFF/Release/log2dp_674LE_LE_COFF.out: src/log2dp//c674//log2dp_674LE_LE_COFF/.project
	-@ echo Importing Project log2dp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects log2dp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/log2dp/c674/log2dp_674LE_LE_COFF"
	-@ echo Building Project log2dp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2dp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects log2dp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project log2dp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/log2dp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/log2dp//c674//log2dp_674LE_LE_COFF"


#############################################################

# Rule to Build Project log2dp_674LE_LE_ELF

#############################################################

.executables: src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out

.projects: src/log2dp//c674//log2dp_674LE_LE_ELF

src/log2dp//c674//log2dp_674LE_LE_ELF: src/log2dp//c674//log2dp_674LE_LE_ELF/.project

src/log2dp//c674//log2dp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name log2dp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCLOG2DP/log2dp_d.c\
 -ccs.linkFile EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/log2dp//c674//log2dp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCLOG2DP "C:/nightlybuilds/mathlib/ti/mathlib/src/log2dp" \
 -ccs.definePathVariable EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCLOG2DPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/log2dp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/log2dp//c674//log2dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCLOG2DP=../../ >> src/log2dp//c674//log2dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCLOG2DPC674=.././ >> src/log2dp//c674//log2dp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG2DP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/log2dp//c674//log2dp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/log2dp_674LE_LE_ELF"
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/log2dp/log2dp.h
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/log2dp/log2dp_d.c
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/log2dp//c674/log2dp.h
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/log2dp//c674/log2dp_i.h
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/common/drvdp.c
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/common/drvdp.h
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/common/driver.h
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/common/driver.c
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/common/common.h
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/common//c674/common.h
src/log2dp//c674//log2dp_674LE_LE_ELF/Release/log2dp_674LE_LE_ELF.out: src/log2dp//c674//log2dp_674LE_LE_ELF/.project
	-@ echo Importing Project log2dp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects log2dp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/log2dp/c674/log2dp_674LE_LE_ELF"
	-@ echo Building Project log2dp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2dp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects log2dp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project log2dp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/log2dp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/log2dp//c674//log2dp_674LE_LE_ELF"


#############################################################

# Rule to Build Project log2sp_674LE_LE_COFF

#############################################################

.executables: src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out

.projects: src/log2sp//c674//log2sp_674LE_LE_COFF

src/log2sp//c674//log2sp_674LE_LE_COFF: src/log2sp//c674//log2sp_674LE_LE_COFF/.project

src/log2sp//c674//log2sp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name log2sp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCLOG2SP/log2sp_d.c\
 -ccs.linkFile EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/log2sp//c674//log2sp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCLOG2SP "C:/nightlybuilds/mathlib/ti/mathlib/src/log2sp" \
 -ccs.definePathVariable EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCLOG2SPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/log2sp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/log2sp//c674//log2sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCLOG2SP=../../ >> src/log2sp//c674//log2sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCLOG2SPC674=.././ >> src/log2sp//c674//log2sp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOG2SP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/log2sp//c674//log2sp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/log2sp_674LE_LE_COFF"
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/log2sp/log2sp.h
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/log2sp/log2sp_d.c
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/log2sp//c674/log2sp.h
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/log2sp//c674/log2sp_i.h
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/common/drvsp.c
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/common/drvsp.h
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/common/driver.h
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/common/driver.c
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/common/common.h
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/common//c674/common.h
src/log2sp//c674//log2sp_674LE_LE_COFF/Release/log2sp_674LE_LE_COFF.out: src/log2sp//c674//log2sp_674LE_LE_COFF/.project
	-@ echo Importing Project log2sp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects log2sp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/log2sp/c674/log2sp_674LE_LE_COFF"
	-@ echo Building Project log2sp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2sp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects log2sp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project log2sp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/log2sp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/log2sp//c674//log2sp_674LE_LE_COFF"


#############################################################

# Rule to Build Project log2sp_674LE_LE_ELF

#############################################################

.executables: src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out

.projects: src/log2sp//c674//log2sp_674LE_LE_ELF

src/log2sp//c674//log2sp_674LE_LE_ELF: src/log2sp//c674//log2sp_674LE_LE_ELF/.project

src/log2sp//c674//log2sp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name log2sp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCLOG2SP/log2sp_d.c\
 -ccs.linkFile EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/log2sp//c674//log2sp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCLOG2SP "C:/nightlybuilds/mathlib/ti/mathlib/src/log2sp" \
 -ccs.definePathVariable EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCLOG2SPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/log2sp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/log2sp//c674//log2sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCLOG2SP=../../ >> src/log2sp//c674//log2sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCLOG2SPC674=.././ >> src/log2sp//c674//log2sp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOG2SP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/log2sp//c674//log2sp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/log2sp_674LE_LE_ELF"
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/log2sp/log2sp.h
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/log2sp/log2sp_d.c
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/log2sp//c674/log2sp.h
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/log2sp//c674/log2sp_i.h
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/common/drvsp.c
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/common/drvsp.h
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/common/driver.h
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/common/driver.c
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/common/common.h
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/common//c674/common.h
src/log2sp//c674//log2sp_674LE_LE_ELF/Release/log2sp_674LE_LE_ELF.out: src/log2sp//c674//log2sp_674LE_LE_ELF/.project
	-@ echo Importing Project log2sp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects log2sp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/log2sp/c674/log2sp_674LE_LE_ELF"
	-@ echo Building Project log2sp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/log2sp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects log2sp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project log2sp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/log2sp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/log2sp//c674//log2sp_674LE_LE_ELF"


#############################################################

# Rule to Build Project logdp_674LE_LE_COFF

#############################################################

.executables: src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out

.projects: src/logdp//c674//logdp_674LE_LE_COFF

src/logdp//c674//logdp_674LE_LE_COFF: src/logdp//c674//logdp_674LE_LE_COFF/.project

src/logdp//c674//logdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name logdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOGDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOGDP_674LE_LE_COFF_SRCLOGDP/logdp_d.c\
 -ccs.linkFile EXT_ROOT__LOGDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__LOGDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/logdp//c674//logdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__LOGDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOGDP_674LE_LE_COFF_SRCLOGDP "C:/nightlybuilds/mathlib/ti/mathlib/src/logdp" \
 -ccs.definePathVariable EXT_ROOT__LOGDP_674LE_LE_COFF_SRCLOGDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/logdp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOGDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOGDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/logdp//c674//logdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOGDP_674LE_LE_COFF_SRCLOGDP=../../ >> src/logdp//c674//logdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOGDP_674LE_LE_COFF_SRCLOGDPC674=.././ >> src/logdp//c674//logdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOGDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/logdp//c674//logdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/logdp_674LE_LE_COFF"
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/logdp/logdp.h
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/logdp/logdp_d.c
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/logdp//c674/logdp.h
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/logdp//c674/logdp_i.h
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/common/drvdp.c
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/common/drvdp.h
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/common/driver.h
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/common/driver.c
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/common/common.h
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/common//c674/common.h
src/logdp//c674//logdp_674LE_LE_COFF/Release/logdp_674LE_LE_COFF.out: src/logdp//c674//logdp_674LE_LE_COFF/.project
	-@ echo Importing Project logdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects logdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/logdp/c674/logdp_674LE_LE_COFF"
	-@ echo Building Project logdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects logdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project logdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/logdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/logdp//c674//logdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project logdp_674LE_LE_ELF

#############################################################

.executables: src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out

.projects: src/logdp//c674//logdp_674LE_LE_ELF

src/logdp//c674//logdp_674LE_LE_ELF: src/logdp//c674//logdp_674LE_LE_ELF/.project

src/logdp//c674//logdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name logdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOGDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOGDP_674LE_LE_ELF_SRCLOGDP/logdp_d.c\
 -ccs.linkFile EXT_ROOT__LOGDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__LOGDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/logdp//c674//logdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__LOGDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOGDP_674LE_LE_ELF_SRCLOGDP "C:/nightlybuilds/mathlib/ti/mathlib/src/logdp" \
 -ccs.definePathVariable EXT_ROOT__LOGDP_674LE_LE_ELF_SRCLOGDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/logdp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOGDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOGDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/logdp//c674//logdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOGDP_674LE_LE_ELF_SRCLOGDP=../../ >> src/logdp//c674//logdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOGDP_674LE_LE_ELF_SRCLOGDPC674=.././ >> src/logdp//c674//logdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOGDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/logdp//c674//logdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/logdp_674LE_LE_ELF"
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/logdp/logdp.h
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/logdp/logdp_d.c
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/logdp//c674/logdp.h
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/logdp//c674/logdp_i.h
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/common/drvdp.c
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/common/drvdp.h
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/common/driver.h
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/common/driver.c
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/common/common.h
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/common//c674/common.h
src/logdp//c674//logdp_674LE_LE_ELF/Release/logdp_674LE_LE_ELF.out: src/logdp//c674//logdp_674LE_LE_ELF/.project
	-@ echo Importing Project logdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects logdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/logdp/c674/logdp_674LE_LE_ELF"
	-@ echo Building Project logdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects logdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project logdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/logdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/logdp//c674//logdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project logsp_674LE_LE_COFF

#############################################################

.executables: src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out

.projects: src/logsp//c674//logsp_674LE_LE_COFF

src/logsp//c674//logsp_674LE_LE_COFF: src/logsp//c674//logsp_674LE_LE_COFF/.project

src/logsp//c674//logsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name logsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOGSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOGSP_674LE_LE_COFF_SRCLOGSP/logsp_d.c\
 -ccs.linkFile EXT_ROOT__LOGSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__LOGSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/logsp//c674//logsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__LOGSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOGSP_674LE_LE_COFF_SRCLOGSP "C:/nightlybuilds/mathlib/ti/mathlib/src/logsp" \
 -ccs.definePathVariable EXT_ROOT__LOGSP_674LE_LE_COFF_SRCLOGSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/logsp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOGSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOGSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/logsp//c674//logsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOGSP_674LE_LE_COFF_SRCLOGSP=../../ >> src/logsp//c674//logsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOGSP_674LE_LE_COFF_SRCLOGSPC674=.././ >> src/logsp//c674//logsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__LOGSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/logsp//c674//logsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/logsp_674LE_LE_COFF"
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/logsp/logsp.h
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/logsp/logsp_d.c
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/logsp//c674/logsp.h
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/logsp//c674/logsp_i.h
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/common/drvsp.c
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/common/drvsp.h
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/common/driver.h
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/common/driver.c
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/common/common.h
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/common//c674/common.h
src/logsp//c674//logsp_674LE_LE_COFF/Release/logsp_674LE_LE_COFF.out: src/logsp//c674//logsp_674LE_LE_COFF/.project
	-@ echo Importing Project logsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects logsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/logsp/c674/logsp_674LE_LE_COFF"
	-@ echo Building Project logsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects logsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project logsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/logsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/logsp//c674//logsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project logsp_674LE_LE_ELF

#############################################################

.executables: src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out

.projects: src/logsp//c674//logsp_674LE_LE_ELF

src/logsp//c674//logsp_674LE_LE_ELF: src/logsp//c674//logsp_674LE_LE_ELF/.project

src/logsp//c674//logsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name logsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__LOGSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__LOGSP_674LE_LE_ELF_SRCLOGSP/logsp_d.c\
 -ccs.linkFile EXT_ROOT__LOGSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__LOGSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/logsp//c674//logsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__LOGSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__LOGSP_674LE_LE_ELF_SRCLOGSP "C:/nightlybuilds/mathlib/ti/mathlib/src/logsp" \
 -ccs.definePathVariable EXT_ROOT__LOGSP_674LE_LE_ELF_SRCLOGSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/logsp/c674" \
 -ccs.definePathVariable EXT_ROOT__LOGSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__LOGSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/logsp//c674//logsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOGSP_674LE_LE_ELF_SRCLOGSP=../../ >> src/logsp//c674//logsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOGSP_674LE_LE_ELF_SRCLOGSPC674=.././ >> src/logsp//c674//logsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__LOGSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/logsp//c674//logsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/logsp_674LE_LE_ELF"
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/logsp/logsp.h
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/logsp/logsp_d.c
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/logsp//c674/logsp.h
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/logsp//c674/logsp_i.h
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/common/drvsp.c
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/common/drvsp.h
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/common/driver.h
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/common/driver.c
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/common/common.h
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/common//c674/common.h
src/logsp//c674//logsp_674LE_LE_ELF/Release/logsp_674LE_LE_ELF.out: src/logsp//c674//logsp_674LE_LE_ELF/.project
	-@ echo Importing Project logsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects logsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/logsp/c674/logsp_674LE_LE_ELF"
	-@ echo Building Project logsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/logsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects logsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project logsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/logsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/logsp//c674//logsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project powdp_674LE_LE_COFF

#############################################################

.executables: src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out

.projects: src/powdp//c674//powdp_674LE_LE_COFF

src/powdp//c674//powdp_674LE_LE_COFF: src/powdp//c674//powdp_674LE_LE_COFF/.project

src/powdp//c674//powdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name powdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__POWDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__POWDP_674LE_LE_COFF_SRCPOWDP/powdp_d.c\
 -ccs.linkFile EXT_ROOT__POWDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__POWDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/powdp//c674//powdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__POWDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__POWDP_674LE_LE_COFF_SRCPOWDP "C:/nightlybuilds/mathlib/ti/mathlib/src/powdp" \
 -ccs.definePathVariable EXT_ROOT__POWDP_674LE_LE_COFF_SRCPOWDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/powdp/c674" \
 -ccs.definePathVariable EXT_ROOT__POWDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__POWDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/powdp//c674//powdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__POWDP_674LE_LE_COFF_SRCPOWDP=../../ >> src/powdp//c674//powdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__POWDP_674LE_LE_COFF_SRCPOWDPC674=.././ >> src/powdp//c674//powdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__POWDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/powdp//c674//powdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/powdp_674LE_LE_COFF"
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/powdp/powdp.h
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/powdp/powdp_d.c
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/powdp//c674/powdp.h
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/powdp//c674/powdp_i.h
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/common/drvdp.c
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/common/drvdp.h
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/common/driver.h
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/common/driver.c
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/common/common.h
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/common//c674/common.h
src/powdp//c674//powdp_674LE_LE_COFF/Release/powdp_674LE_LE_COFF.out: src/powdp//c674//powdp_674LE_LE_COFF/.project
	-@ echo Importing Project powdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects powdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/powdp/c674/powdp_674LE_LE_COFF"
	-@ echo Building Project powdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects powdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project powdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/powdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/powdp//c674//powdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project powdp_674LE_LE_ELF

#############################################################

.executables: src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out

.projects: src/powdp//c674//powdp_674LE_LE_ELF

src/powdp//c674//powdp_674LE_LE_ELF: src/powdp//c674//powdp_674LE_LE_ELF/.project

src/powdp//c674//powdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name powdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__POWDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__POWDP_674LE_LE_ELF_SRCPOWDP/powdp_d.c\
 -ccs.linkFile EXT_ROOT__POWDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__POWDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/powdp//c674//powdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__POWDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__POWDP_674LE_LE_ELF_SRCPOWDP "C:/nightlybuilds/mathlib/ti/mathlib/src/powdp" \
 -ccs.definePathVariable EXT_ROOT__POWDP_674LE_LE_ELF_SRCPOWDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/powdp/c674" \
 -ccs.definePathVariable EXT_ROOT__POWDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__POWDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/powdp//c674//powdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__POWDP_674LE_LE_ELF_SRCPOWDP=../../ >> src/powdp//c674//powdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__POWDP_674LE_LE_ELF_SRCPOWDPC674=.././ >> src/powdp//c674//powdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__POWDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/powdp//c674//powdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/powdp_674LE_LE_ELF"
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/powdp/powdp.h
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/powdp/powdp_d.c
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/powdp//c674/powdp.h
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/powdp//c674/powdp_i.h
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/common/drvdp.c
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/common/drvdp.h
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/common/driver.h
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/common/driver.c
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/common/common.h
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/common//c674/common.h
src/powdp//c674//powdp_674LE_LE_ELF/Release/powdp_674LE_LE_ELF.out: src/powdp//c674//powdp_674LE_LE_ELF/.project
	-@ echo Importing Project powdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects powdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/powdp/c674/powdp_674LE_LE_ELF"
	-@ echo Building Project powdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects powdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project powdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/powdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/powdp//c674//powdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project powsp_674LE_LE_COFF

#############################################################

.executables: src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out

.projects: src/powsp//c674//powsp_674LE_LE_COFF

src/powsp//c674//powsp_674LE_LE_COFF: src/powsp//c674//powsp_674LE_LE_COFF/.project

src/powsp//c674//powsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name powsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__POWSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__POWSP_674LE_LE_COFF_SRCPOWSP/powsp_d.c\
 -ccs.linkFile EXT_ROOT__POWSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__POWSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/powsp//c674//powsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__POWSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__POWSP_674LE_LE_COFF_SRCPOWSP "C:/nightlybuilds/mathlib/ti/mathlib/src/powsp" \
 -ccs.definePathVariable EXT_ROOT__POWSP_674LE_LE_COFF_SRCPOWSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/powsp/c674" \
 -ccs.definePathVariable EXT_ROOT__POWSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__POWSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/powsp//c674//powsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__POWSP_674LE_LE_COFF_SRCPOWSP=../../ >> src/powsp//c674//powsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__POWSP_674LE_LE_COFF_SRCPOWSPC674=.././ >> src/powsp//c674//powsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__POWSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/powsp//c674//powsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/powsp_674LE_LE_COFF"
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/powsp/powsp.h
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/powsp/powsp_d.c
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/powsp//c674/powsp.h
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/powsp//c674/powsp_i.h
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/common/drvsp.c
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/common/drvsp.h
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/common/driver.h
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/common/driver.c
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/common/common.h
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/common//c674/common.h
src/powsp//c674//powsp_674LE_LE_COFF/Release/powsp_674LE_LE_COFF.out: src/powsp//c674//powsp_674LE_LE_COFF/.project
	-@ echo Importing Project powsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects powsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/powsp/c674/powsp_674LE_LE_COFF"
	-@ echo Building Project powsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects powsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project powsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/powsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/powsp//c674//powsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project powsp_674LE_LE_ELF

#############################################################

.executables: src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out

.projects: src/powsp//c674//powsp_674LE_LE_ELF

src/powsp//c674//powsp_674LE_LE_ELF: src/powsp//c674//powsp_674LE_LE_ELF/.project

src/powsp//c674//powsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name powsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__POWSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__POWSP_674LE_LE_ELF_SRCPOWSP/powsp_d.c\
 -ccs.linkFile EXT_ROOT__POWSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__POWSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/powsp//c674//powsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__POWSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__POWSP_674LE_LE_ELF_SRCPOWSP "C:/nightlybuilds/mathlib/ti/mathlib/src/powsp" \
 -ccs.definePathVariable EXT_ROOT__POWSP_674LE_LE_ELF_SRCPOWSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/powsp/c674" \
 -ccs.definePathVariable EXT_ROOT__POWSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__POWSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/powsp//c674//powsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__POWSP_674LE_LE_ELF_SRCPOWSP=../../ >> src/powsp//c674//powsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__POWSP_674LE_LE_ELF_SRCPOWSPC674=.././ >> src/powsp//c674//powsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__POWSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/powsp//c674//powsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/powsp_674LE_LE_ELF"
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/powsp/powsp.h
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/powsp/powsp_d.c
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/powsp//c674/powsp.h
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/powsp//c674/powsp_i.h
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/common/drvsp.c
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/common/drvsp.h
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/common/driver.h
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/common/driver.c
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/common/common.h
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/common//c674/common.h
src/powsp//c674//powsp_674LE_LE_ELF/Release/powsp_674LE_LE_ELF.out: src/powsp//c674//powsp_674LE_LE_ELF/.project
	-@ echo Importing Project powsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects powsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/powsp/c674/powsp_674LE_LE_ELF"
	-@ echo Building Project powsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/powsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects powsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project powsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/powsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/powsp//c674//powsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project recipdp_674LE_LE_COFF

#############################################################

.executables: src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out

.projects: src/recipdp//c674//recipdp_674LE_LE_COFF

src/recipdp//c674//recipdp_674LE_LE_COFF: src/recipdp//c674//recipdp_674LE_LE_COFF/.project

src/recipdp//c674//recipdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name recipdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCRECIPDP/recipdp_d.c\
 -ccs.linkFile EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/recipdp//c674//recipdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCRECIPDP "C:/nightlybuilds/mathlib/ti/mathlib/src/recipdp" \
 -ccs.definePathVariable EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCRECIPDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/recipdp/c674" \
 -ccs.definePathVariable EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/recipdp//c674//recipdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCRECIPDP=../../ >> src/recipdp//c674//recipdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCRECIPDPC674=.././ >> src/recipdp//c674//recipdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RECIPDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/recipdp//c674//recipdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/recipdp_674LE_LE_COFF"
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/recipdp/recipdp.h
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/recipdp/recipdp_d.c
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/recipdp//c674/recipdp.h
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/recipdp//c674/recipdp_i.h
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/common/drvdp.c
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/common/drvdp.h
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/common/driver.h
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/common/driver.c
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/common/common.h
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/common//c674/common.h
src/recipdp//c674//recipdp_674LE_LE_COFF/Release/recipdp_674LE_LE_COFF.out: src/recipdp//c674//recipdp_674LE_LE_COFF/.project
	-@ echo Importing Project recipdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects recipdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/recipdp/c674/recipdp_674LE_LE_COFF"
	-@ echo Building Project recipdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects recipdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project recipdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/recipdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/recipdp//c674//recipdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project recipdp_674LE_LE_ELF

#############################################################

.executables: src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out

.projects: src/recipdp//c674//recipdp_674LE_LE_ELF

src/recipdp//c674//recipdp_674LE_LE_ELF: src/recipdp//c674//recipdp_674LE_LE_ELF/.project

src/recipdp//c674//recipdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name recipdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCRECIPDP/recipdp_d.c\
 -ccs.linkFile EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/recipdp//c674//recipdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCRECIPDP "C:/nightlybuilds/mathlib/ti/mathlib/src/recipdp" \
 -ccs.definePathVariable EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCRECIPDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/recipdp/c674" \
 -ccs.definePathVariable EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/recipdp//c674//recipdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCRECIPDP=../../ >> src/recipdp//c674//recipdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCRECIPDPC674=.././ >> src/recipdp//c674//recipdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RECIPDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/recipdp//c674//recipdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/recipdp_674LE_LE_ELF"
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/recipdp/recipdp.h
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/recipdp/recipdp_d.c
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/recipdp//c674/recipdp.h
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/recipdp//c674/recipdp_i.h
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/common/drvdp.c
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/common/drvdp.h
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/common/driver.h
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/common/driver.c
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/common/common.h
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/common//c674/common.h
src/recipdp//c674//recipdp_674LE_LE_ELF/Release/recipdp_674LE_LE_ELF.out: src/recipdp//c674//recipdp_674LE_LE_ELF/.project
	-@ echo Importing Project recipdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects recipdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/recipdp/c674/recipdp_674LE_LE_ELF"
	-@ echo Building Project recipdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects recipdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project recipdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/recipdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/recipdp//c674//recipdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project recipsp_674LE_LE_COFF

#############################################################

.executables: src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out

.projects: src/recipsp//c674//recipsp_674LE_LE_COFF

src/recipsp//c674//recipsp_674LE_LE_COFF: src/recipsp//c674//recipsp_674LE_LE_COFF/.project

src/recipsp//c674//recipsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name recipsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCRECIPSP/recipsp_d.c\
 -ccs.linkFile EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/recipsp//c674//recipsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCRECIPSP "C:/nightlybuilds/mathlib/ti/mathlib/src/recipsp" \
 -ccs.definePathVariable EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCRECIPSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/recipsp/c674" \
 -ccs.definePathVariable EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/recipsp//c674//recipsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCRECIPSP=../../ >> src/recipsp//c674//recipsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCRECIPSPC674=.././ >> src/recipsp//c674//recipsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RECIPSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/recipsp//c674//recipsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/recipsp_674LE_LE_COFF"
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/recipsp/recipsp.h
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/recipsp/recipsp_d.c
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/recipsp//c674/recipsp.h
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/recipsp//c674/recipsp_i.h
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/common/drvsp.c
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/common/drvsp.h
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/common/driver.h
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/common/driver.c
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/common/common.h
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/common//c674/common.h
src/recipsp//c674//recipsp_674LE_LE_COFF/Release/recipsp_674LE_LE_COFF.out: src/recipsp//c674//recipsp_674LE_LE_COFF/.project
	-@ echo Importing Project recipsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects recipsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/recipsp/c674/recipsp_674LE_LE_COFF"
	-@ echo Building Project recipsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects recipsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project recipsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/recipsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/recipsp//c674//recipsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project recipsp_674LE_LE_ELF

#############################################################

.executables: src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out

.projects: src/recipsp//c674//recipsp_674LE_LE_ELF

src/recipsp//c674//recipsp_674LE_LE_ELF: src/recipsp//c674//recipsp_674LE_LE_ELF/.project

src/recipsp//c674//recipsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name recipsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCRECIPSP/recipsp_d.c\
 -ccs.linkFile EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/recipsp//c674//recipsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCRECIPSP "C:/nightlybuilds/mathlib/ti/mathlib/src/recipsp" \
 -ccs.definePathVariable EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCRECIPSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/recipsp/c674" \
 -ccs.definePathVariable EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/recipsp//c674//recipsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCRECIPSP=../../ >> src/recipsp//c674//recipsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCRECIPSPC674=.././ >> src/recipsp//c674//recipsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RECIPSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/recipsp//c674//recipsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/recipsp_674LE_LE_ELF"
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/recipsp/recipsp.h
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/recipsp/recipsp_d.c
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/recipsp//c674/recipsp.h
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/recipsp//c674/recipsp_i.h
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/common/drvsp.c
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/common/drvsp.h
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/common/driver.h
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/common/driver.c
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/common/common.h
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/common//c674/common.h
src/recipsp//c674//recipsp_674LE_LE_ELF/Release/recipsp_674LE_LE_ELF.out: src/recipsp//c674//recipsp_674LE_LE_ELF/.project
	-@ echo Importing Project recipsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects recipsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/recipsp/c674/recipsp_674LE_LE_ELF"
	-@ echo Building Project recipsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/recipsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects recipsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project recipsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/recipsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/recipsp//c674//recipsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project rsqrtdp_674LE_LE_COFF

#############################################################

.executables: src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out

.projects: src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF

src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF: src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/.project

src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name rsqrtdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCRSQRTDP/rsqrtdp_d.c\
 -ccs.linkFile EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCRSQRTDP "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtdp" \
 -ccs.definePathVariable EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCRSQRTDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtdp/c674" \
 -ccs.definePathVariable EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCRSQRTDP=../../ >> src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCRSQRTDPC674=.././ >> src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RSQRTDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/rsqrtdp_674LE_LE_COFF"
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/rsqrtdp/rsqrtdp.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/rsqrtdp/rsqrtdp_d.c
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/rsqrtdp//c674/rsqrtdp.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/rsqrtdp//c674/rsqrtdp_i.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/common/drvdp.c
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/common/drvdp.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/common/driver.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/common/driver.c
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/common/common.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/common//c674/common.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/Release/rsqrtdp_674LE_LE_COFF.out: src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF/.project
	-@ echo Importing Project rsqrtdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects rsqrtdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtdp/c674/rsqrtdp_674LE_LE_COFF"
	-@ echo Building Project rsqrtdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects rsqrtdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project rsqrtdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/rsqrtdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/rsqrtdp//c674//rsqrtdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project rsqrtdp_674LE_LE_ELF

#############################################################

.executables: src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out

.projects: src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF

src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF: src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/.project

src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name rsqrtdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCRSQRTDP/rsqrtdp_d.c\
 -ccs.linkFile EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCRSQRTDP "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtdp" \
 -ccs.definePathVariable EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCRSQRTDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtdp/c674" \
 -ccs.definePathVariable EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCRSQRTDP=../../ >> src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCRSQRTDPC674=.././ >> src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RSQRTDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/rsqrtdp_674LE_LE_ELF"
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/rsqrtdp/rsqrtdp.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/rsqrtdp/rsqrtdp_d.c
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/rsqrtdp//c674/rsqrtdp.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/rsqrtdp//c674/rsqrtdp_i.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/common/drvdp.c
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/common/drvdp.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/common/driver.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/common/driver.c
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/common/common.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/common//c674/common.h
src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/Release/rsqrtdp_674LE_LE_ELF.out: src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF/.project
	-@ echo Importing Project rsqrtdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects rsqrtdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtdp/c674/rsqrtdp_674LE_LE_ELF"
	-@ echo Building Project rsqrtdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects rsqrtdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project rsqrtdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/rsqrtdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/rsqrtdp//c674//rsqrtdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project rsqrtsp_674LE_LE_COFF

#############################################################

.executables: src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out

.projects: src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF

src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF: src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/.project

src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name rsqrtsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCRSQRTSP/rsqrtsp_d.c\
 -ccs.linkFile EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCRSQRTSP "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtsp" \
 -ccs.definePathVariable EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCRSQRTSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtsp/c674" \
 -ccs.definePathVariable EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCRSQRTSP=../../ >> src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCRSQRTSPC674=.././ >> src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__RSQRTSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/rsqrtsp_674LE_LE_COFF"
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/rsqrtsp/rsqrtsp.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/rsqrtsp/rsqrtsp_d.c
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/rsqrtsp//c674/rsqrtsp.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/rsqrtsp//c674/rsqrtsp_i.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/common/drvsp.c
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/common/drvsp.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/common/driver.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/common/driver.c
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/common/common.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/common//c674/common.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/Release/rsqrtsp_674LE_LE_COFF.out: src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF/.project
	-@ echo Importing Project rsqrtsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects rsqrtsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtsp/c674/rsqrtsp_674LE_LE_COFF"
	-@ echo Building Project rsqrtsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects rsqrtsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project rsqrtsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/rsqrtsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/rsqrtsp//c674//rsqrtsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project rsqrtsp_674LE_LE_ELF

#############################################################

.executables: src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out

.projects: src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF

src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF: src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/.project

src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name rsqrtsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCRSQRTSP/rsqrtsp_d.c\
 -ccs.linkFile EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCRSQRTSP "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtsp" \
 -ccs.definePathVariable EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCRSQRTSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtsp/c674" \
 -ccs.definePathVariable EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCRSQRTSP=../../ >> src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCRSQRTSPC674=.././ >> src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__RSQRTSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/rsqrtsp_674LE_LE_ELF"
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/rsqrtsp/rsqrtsp.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/rsqrtsp/rsqrtsp_d.c
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/rsqrtsp//c674/rsqrtsp.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/rsqrtsp//c674/rsqrtsp_i.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/common/drvsp.c
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/common/drvsp.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/common/driver.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/common/driver.c
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/common/common.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/common//c674/common.h
src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/Release/rsqrtsp_674LE_LE_ELF.out: src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF/.project
	-@ echo Importing Project rsqrtsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects rsqrtsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtsp/c674/rsqrtsp_674LE_LE_ELF"
	-@ echo Building Project rsqrtsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/rsqrtsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects rsqrtsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project rsqrtsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/rsqrtsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/rsqrtsp//c674//rsqrtsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project sindp_674LE_LE_COFF

#############################################################

.executables: src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out

.projects: src/sindp//c674//sindp_674LE_LE_COFF

src/sindp//c674//sindp_674LE_LE_COFF: src/sindp//c674//sindp_674LE_LE_COFF/.project

src/sindp//c674//sindp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sindp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sindp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SINDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SINDP_674LE_LE_COFF_SRCSINDP/sindp_d.c\
 -ccs.linkFile EXT_ROOT__SINDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__SINDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sindp//c674//sindp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__SINDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SINDP_674LE_LE_COFF_SRCSINDP "C:/nightlybuilds/mathlib/ti/mathlib/src/sindp" \
 -ccs.definePathVariable EXT_ROOT__SINDP_674LE_LE_COFF_SRCSINDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sindp/c674" \
 -ccs.definePathVariable EXT_ROOT__SINDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SINDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/sindp//c674//sindp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINDP_674LE_LE_COFF_SRCSINDP=../../ >> src/sindp//c674//sindp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINDP_674LE_LE_COFF_SRCSINDPC674=.././ >> src/sindp//c674//sindp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/sindp//c674//sindp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sindp_674LE_LE_COFF"
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/sindp/sindp.h
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/sindp/sindp_d.c
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/sindp//c674/sindp.h
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/sindp//c674/sindp_i.h
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/common/drvdp.c
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/common/drvdp.h
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/common/driver.h
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/common/driver.c
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/common/common.h
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/common//c674/common.h
src/sindp//c674//sindp_674LE_LE_COFF/Release/sindp_674LE_LE_COFF.out: src/sindp//c674//sindp_674LE_LE_COFF/.project
	-@ echo Importing Project sindp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sindp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sindp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sindp/c674/sindp_674LE_LE_COFF"
	-@ echo Building Project sindp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sindp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sindp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project sindp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sindp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/sindp//c674//sindp_674LE_LE_COFF"


#############################################################

# Rule to Build Project sindp_674LE_LE_ELF

#############################################################

.executables: src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out

.projects: src/sindp//c674//sindp_674LE_LE_ELF

src/sindp//c674//sindp_674LE_LE_ELF: src/sindp//c674//sindp_674LE_LE_ELF/.project

src/sindp//c674//sindp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sindp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sindp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SINDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SINDP_674LE_LE_ELF_SRCSINDP/sindp_d.c\
 -ccs.linkFile EXT_ROOT__SINDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__SINDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sindp//c674//sindp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__SINDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SINDP_674LE_LE_ELF_SRCSINDP "C:/nightlybuilds/mathlib/ti/mathlib/src/sindp" \
 -ccs.definePathVariable EXT_ROOT__SINDP_674LE_LE_ELF_SRCSINDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sindp/c674" \
 -ccs.definePathVariable EXT_ROOT__SINDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SINDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/sindp//c674//sindp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINDP_674LE_LE_ELF_SRCSINDP=../../ >> src/sindp//c674//sindp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINDP_674LE_LE_ELF_SRCSINDPC674=.././ >> src/sindp//c674//sindp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/sindp//c674//sindp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sindp_674LE_LE_ELF"
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/sindp/sindp.h
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/sindp/sindp_d.c
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/sindp//c674/sindp.h
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/sindp//c674/sindp_i.h
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/common/drvdp.c
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/common/drvdp.h
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/common/driver.h
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/common/driver.c
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/common/common.h
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/common//c674/common.h
src/sindp//c674//sindp_674LE_LE_ELF/Release/sindp_674LE_LE_ELF.out: src/sindp//c674//sindp_674LE_LE_ELF/.project
	-@ echo Importing Project sindp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sindp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sindp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sindp/c674/sindp_674LE_LE_ELF"
	-@ echo Building Project sindp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sindp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sindp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project sindp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sindp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/sindp//c674//sindp_674LE_LE_ELF"


#############################################################

# Rule to Build Project sinhdp_674LE_LE_COFF

#############################################################

.executables: src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out

.projects: src/sinhdp//c674//sinhdp_674LE_LE_COFF

src/sinhdp//c674//sinhdp_674LE_LE_COFF: src/sinhdp//c674//sinhdp_674LE_LE_COFF/.project

src/sinhdp//c674//sinhdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sinhdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SINHDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SINHDP_674LE_LE_COFF_SRCSINHDP/sinhdp_d.c\
 -ccs.linkFile EXT_ROOT__SINHDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__SINHDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sinhdp//c674//sinhdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__SINHDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SINHDP_674LE_LE_COFF_SRCSINHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhdp" \
 -ccs.definePathVariable EXT_ROOT__SINHDP_674LE_LE_COFF_SRCSINHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhdp/c674" \
 -ccs.definePathVariable EXT_ROOT__SINHDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SINHDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/sinhdp//c674//sinhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINHDP_674LE_LE_COFF_SRCSINHDP=../../ >> src/sinhdp//c674//sinhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINHDP_674LE_LE_COFF_SRCSINHDPC674=.././ >> src/sinhdp//c674//sinhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINHDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/sinhdp//c674//sinhdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sinhdp_674LE_LE_COFF"
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/sinhdp/sinhdp.h
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/sinhdp/sinhdp_d.c
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/sinhdp//c674/sinhdp.h
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/sinhdp//c674/sinhdp_i.h
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/common/drvdp.c
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/common/drvdp.h
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/common/driver.h
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/common/driver.c
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/common/common.h
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/common//c674/common.h
src/sinhdp//c674//sinhdp_674LE_LE_COFF/Release/sinhdp_674LE_LE_COFF.out: src/sinhdp//c674//sinhdp_674LE_LE_COFF/.project
	-@ echo Importing Project sinhdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sinhdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhdp/c674/sinhdp_674LE_LE_COFF"
	-@ echo Building Project sinhdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sinhdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project sinhdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sinhdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/sinhdp//c674//sinhdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project sinhdp_674LE_LE_ELF

#############################################################

.executables: src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out

.projects: src/sinhdp//c674//sinhdp_674LE_LE_ELF

src/sinhdp//c674//sinhdp_674LE_LE_ELF: src/sinhdp//c674//sinhdp_674LE_LE_ELF/.project

src/sinhdp//c674//sinhdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sinhdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SINHDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SINHDP_674LE_LE_ELF_SRCSINHDP/sinhdp_d.c\
 -ccs.linkFile EXT_ROOT__SINHDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__SINHDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sinhdp//c674//sinhdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__SINHDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SINHDP_674LE_LE_ELF_SRCSINHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhdp" \
 -ccs.definePathVariable EXT_ROOT__SINHDP_674LE_LE_ELF_SRCSINHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhdp/c674" \
 -ccs.definePathVariable EXT_ROOT__SINHDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SINHDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/sinhdp//c674//sinhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINHDP_674LE_LE_ELF_SRCSINHDP=../../ >> src/sinhdp//c674//sinhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINHDP_674LE_LE_ELF_SRCSINHDPC674=.././ >> src/sinhdp//c674//sinhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINHDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/sinhdp//c674//sinhdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sinhdp_674LE_LE_ELF"
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/sinhdp/sinhdp.h
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/sinhdp/sinhdp_d.c
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/sinhdp//c674/sinhdp.h
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/sinhdp//c674/sinhdp_i.h
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/common/drvdp.c
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/common/drvdp.h
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/common/driver.h
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/common/driver.c
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/common/common.h
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/common//c674/common.h
src/sinhdp//c674//sinhdp_674LE_LE_ELF/Release/sinhdp_674LE_LE_ELF.out: src/sinhdp//c674//sinhdp_674LE_LE_ELF/.project
	-@ echo Importing Project sinhdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sinhdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhdp/c674/sinhdp_674LE_LE_ELF"
	-@ echo Building Project sinhdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sinhdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project sinhdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sinhdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/sinhdp//c674//sinhdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project sinhsp_674LE_LE_COFF

#############################################################

.executables: src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out

.projects: src/sinhsp//c674//sinhsp_674LE_LE_COFF

src/sinhsp//c674//sinhsp_674LE_LE_COFF: src/sinhsp//c674//sinhsp_674LE_LE_COFF/.project

src/sinhsp//c674//sinhsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sinhsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SINHSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SINHSP_674LE_LE_COFF_SRCSINHSP/sinhsp_d.c\
 -ccs.linkFile EXT_ROOT__SINHSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__SINHSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sinhsp//c674//sinhsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__SINHSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SINHSP_674LE_LE_COFF_SRCSINHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhsp" \
 -ccs.definePathVariable EXT_ROOT__SINHSP_674LE_LE_COFF_SRCSINHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhsp/c674" \
 -ccs.definePathVariable EXT_ROOT__SINHSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SINHSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/sinhsp//c674//sinhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINHSP_674LE_LE_COFF_SRCSINHSP=../../ >> src/sinhsp//c674//sinhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINHSP_674LE_LE_COFF_SRCSINHSPC674=.././ >> src/sinhsp//c674//sinhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINHSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/sinhsp//c674//sinhsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sinhsp_674LE_LE_COFF"
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/sinhsp/sinhsp.h
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/sinhsp/sinhsp_d.c
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/sinhsp//c674/sinhsp.h
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/sinhsp//c674/sinhsp_i.h
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/common/drvsp.c
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/common/drvsp.h
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/common/driver.h
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/common/driver.c
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/common/common.h
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/common//c674/common.h
src/sinhsp//c674//sinhsp_674LE_LE_COFF/Release/sinhsp_674LE_LE_COFF.out: src/sinhsp//c674//sinhsp_674LE_LE_COFF/.project
	-@ echo Importing Project sinhsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sinhsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhsp/c674/sinhsp_674LE_LE_COFF"
	-@ echo Building Project sinhsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sinhsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project sinhsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sinhsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/sinhsp//c674//sinhsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project sinhsp_674LE_LE_ELF

#############################################################

.executables: src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out

.projects: src/sinhsp//c674//sinhsp_674LE_LE_ELF

src/sinhsp//c674//sinhsp_674LE_LE_ELF: src/sinhsp//c674//sinhsp_674LE_LE_ELF/.project

src/sinhsp//c674//sinhsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sinhsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SINHSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SINHSP_674LE_LE_ELF_SRCSINHSP/sinhsp_d.c\
 -ccs.linkFile EXT_ROOT__SINHSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__SINHSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sinhsp//c674//sinhsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__SINHSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SINHSP_674LE_LE_ELF_SRCSINHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhsp" \
 -ccs.definePathVariable EXT_ROOT__SINHSP_674LE_LE_ELF_SRCSINHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhsp/c674" \
 -ccs.definePathVariable EXT_ROOT__SINHSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SINHSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/sinhsp//c674//sinhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINHSP_674LE_LE_ELF_SRCSINHSP=../../ >> src/sinhsp//c674//sinhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINHSP_674LE_LE_ELF_SRCSINHSPC674=.././ >> src/sinhsp//c674//sinhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINHSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/sinhsp//c674//sinhsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sinhsp_674LE_LE_ELF"
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/sinhsp/sinhsp.h
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/sinhsp/sinhsp_d.c
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/sinhsp//c674/sinhsp.h
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/sinhsp//c674/sinhsp_i.h
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/common/drvsp.c
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/common/drvsp.h
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/common/driver.h
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/common/driver.c
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/common/common.h
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/common//c674/common.h
src/sinhsp//c674//sinhsp_674LE_LE_ELF/Release/sinhsp_674LE_LE_ELF.out: src/sinhsp//c674//sinhsp_674LE_LE_ELF/.project
	-@ echo Importing Project sinhsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sinhsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sinhsp/c674/sinhsp_674LE_LE_ELF"
	-@ echo Building Project sinhsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sinhsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project sinhsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sinhsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/sinhsp//c674//sinhsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project sinsp_674LE_LE_COFF

#############################################################

.executables: src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out

.projects: src/sinsp//c674//sinsp_674LE_LE_COFF

src/sinsp//c674//sinsp_674LE_LE_COFF: src/sinsp//c674//sinsp_674LE_LE_COFF/.project

src/sinsp//c674//sinsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sinsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SINSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SINSP_674LE_LE_COFF_SRCSINSP/sinsp_d.c\
 -ccs.linkFile EXT_ROOT__SINSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__SINSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sinsp//c674//sinsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__SINSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SINSP_674LE_LE_COFF_SRCSINSP "C:/nightlybuilds/mathlib/ti/mathlib/src/sinsp" \
 -ccs.definePathVariable EXT_ROOT__SINSP_674LE_LE_COFF_SRCSINSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sinsp/c674" \
 -ccs.definePathVariable EXT_ROOT__SINSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SINSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/sinsp//c674//sinsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINSP_674LE_LE_COFF_SRCSINSP=../../ >> src/sinsp//c674//sinsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINSP_674LE_LE_COFF_SRCSINSPC674=.././ >> src/sinsp//c674//sinsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SINSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/sinsp//c674//sinsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sinsp_674LE_LE_COFF"
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/sinsp/sinsp.h
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/sinsp/sinsp_d.c
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/sinsp//c674/sinsp.h
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/sinsp//c674/sinsp_i.h
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/common/drvsp.c
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/common/drvsp.h
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/common/driver.h
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/common/driver.c
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/common/common.h
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/common//c674/common.h
src/sinsp//c674//sinsp_674LE_LE_COFF/Release/sinsp_674LE_LE_COFF.out: src/sinsp//c674//sinsp_674LE_LE_COFF/.project
	-@ echo Importing Project sinsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sinsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sinsp/c674/sinsp_674LE_LE_COFF"
	-@ echo Building Project sinsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sinsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project sinsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sinsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/sinsp//c674//sinsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project sinsp_674LE_LE_ELF

#############################################################

.executables: src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out

.projects: src/sinsp//c674//sinsp_674LE_LE_ELF

src/sinsp//c674//sinsp_674LE_LE_ELF: src/sinsp//c674//sinsp_674LE_LE_ELF/.project

src/sinsp//c674//sinsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sinsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SINSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SINSP_674LE_LE_ELF_SRCSINSP/sinsp_d.c\
 -ccs.linkFile EXT_ROOT__SINSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__SINSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sinsp//c674//sinsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__SINSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SINSP_674LE_LE_ELF_SRCSINSP "C:/nightlybuilds/mathlib/ti/mathlib/src/sinsp" \
 -ccs.definePathVariable EXT_ROOT__SINSP_674LE_LE_ELF_SRCSINSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sinsp/c674" \
 -ccs.definePathVariable EXT_ROOT__SINSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SINSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/sinsp//c674//sinsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINSP_674LE_LE_ELF_SRCSINSP=../../ >> src/sinsp//c674//sinsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINSP_674LE_LE_ELF_SRCSINSPC674=.././ >> src/sinsp//c674//sinsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SINSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/sinsp//c674//sinsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sinsp_674LE_LE_ELF"
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/sinsp/sinsp.h
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/sinsp/sinsp_d.c
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/sinsp//c674/sinsp.h
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/sinsp//c674/sinsp_i.h
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/common/drvsp.c
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/common/drvsp.h
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/common/driver.h
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/common/driver.c
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/common/common.h
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/common//c674/common.h
src/sinsp//c674//sinsp_674LE_LE_ELF/Release/sinsp_674LE_LE_ELF.out: src/sinsp//c674//sinsp_674LE_LE_ELF/.project
	-@ echo Importing Project sinsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sinsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sinsp/c674/sinsp_674LE_LE_ELF"
	-@ echo Building Project sinsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sinsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sinsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project sinsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sinsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/sinsp//c674//sinsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project sqrtdp_674LE_LE_COFF

#############################################################

.executables: src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out

.projects: src/sqrtdp//c674//sqrtdp_674LE_LE_COFF

src/sqrtdp//c674//sqrtdp_674LE_LE_COFF: src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/.project

src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sqrtdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCSQRTDP/sqrtdp_d.c\
 -ccs.linkFile EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sqrtdp//c674//sqrtdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCSQRTDP "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtdp" \
 -ccs.definePathVariable EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCSQRTDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtdp/c674" \
 -ccs.definePathVariable EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCSQRTDP=../../ >> src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCSQRTDPC674=.././ >> src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SQRTDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sqrtdp_674LE_LE_COFF"
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/sqrtdp/sqrtdp.h
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/sqrtdp/sqrtdp_d.c
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/sqrtdp//c674/sqrtdp.h
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/sqrtdp//c674/sqrtdp_i.h
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/common/drvdp.c
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/common/drvdp.h
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/common/driver.h
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/common/driver.c
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/common/common.h
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/common//c674/common.h
src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/Release/sqrtdp_674LE_LE_COFF.out: src/sqrtdp//c674//sqrtdp_674LE_LE_COFF/.project
	-@ echo Importing Project sqrtdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sqrtdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtdp/c674/sqrtdp_674LE_LE_COFF"
	-@ echo Building Project sqrtdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sqrtdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project sqrtdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sqrtdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/sqrtdp//c674//sqrtdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project sqrtdp_674LE_LE_ELF

#############################################################

.executables: src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out

.projects: src/sqrtdp//c674//sqrtdp_674LE_LE_ELF

src/sqrtdp//c674//sqrtdp_674LE_LE_ELF: src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/.project

src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sqrtdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCSQRTDP/sqrtdp_d.c\
 -ccs.linkFile EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sqrtdp//c674//sqrtdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCSQRTDP "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtdp" \
 -ccs.definePathVariable EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCSQRTDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtdp/c674" \
 -ccs.definePathVariable EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCSQRTDP=../../ >> src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCSQRTDPC674=.././ >> src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SQRTDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sqrtdp_674LE_LE_ELF"
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/sqrtdp/sqrtdp.h
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/sqrtdp/sqrtdp_d.c
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/sqrtdp//c674/sqrtdp.h
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/sqrtdp//c674/sqrtdp_i.h
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/common/drvdp.c
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/common/drvdp.h
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/common/driver.h
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/common/driver.c
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/common/common.h
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/common//c674/common.h
src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/Release/sqrtdp_674LE_LE_ELF.out: src/sqrtdp//c674//sqrtdp_674LE_LE_ELF/.project
	-@ echo Importing Project sqrtdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sqrtdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtdp/c674/sqrtdp_674LE_LE_ELF"
	-@ echo Building Project sqrtdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sqrtdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project sqrtdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sqrtdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/sqrtdp//c674//sqrtdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project sqrtsp_674LE_LE_COFF

#############################################################

.executables: src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out

.projects: src/sqrtsp//c674//sqrtsp_674LE_LE_COFF

src/sqrtsp//c674//sqrtsp_674LE_LE_COFF: src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/.project

src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sqrtsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCSQRTSP/sqrtsp_d.c\
 -ccs.linkFile EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sqrtsp//c674//sqrtsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCSQRTSP "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtsp" \
 -ccs.definePathVariable EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCSQRTSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtsp/c674" \
 -ccs.definePathVariable EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCSQRTSP=../../ >> src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCSQRTSPC674=.././ >> src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__SQRTSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sqrtsp_674LE_LE_COFF"
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/sqrtsp/sqrtsp.h
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/sqrtsp/sqrtsp_d.c
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/sqrtsp//c674/sqrtsp.h
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/sqrtsp//c674/sqrtsp_i.h
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/common/drvsp.c
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/common/drvsp.h
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/common/driver.h
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/common/driver.c
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/common/common.h
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/common//c674/common.h
src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/Release/sqrtsp_674LE_LE_COFF.out: src/sqrtsp//c674//sqrtsp_674LE_LE_COFF/.project
	-@ echo Importing Project sqrtsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sqrtsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtsp/c674/sqrtsp_674LE_LE_COFF"
	-@ echo Building Project sqrtsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sqrtsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project sqrtsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sqrtsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/sqrtsp//c674//sqrtsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project sqrtsp_674LE_LE_ELF

#############################################################

.executables: src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out

.projects: src/sqrtsp//c674//sqrtsp_674LE_LE_ELF

src/sqrtsp//c674//sqrtsp_674LE_LE_ELF: src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/.project

src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name sqrtsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCSQRTSP/sqrtsp_d.c\
 -ccs.linkFile EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/sqrtsp//c674//sqrtsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCSQRTSP "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtsp" \
 -ccs.definePathVariable EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCSQRTSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtsp/c674" \
 -ccs.definePathVariable EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCSQRTSP=../../ >> src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCSQRTSPC674=.././ >> src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__SQRTSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/sqrtsp_674LE_LE_ELF"
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/sqrtsp/sqrtsp.h
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/sqrtsp/sqrtsp_d.c
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/sqrtsp//c674/sqrtsp.h
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/sqrtsp//c674/sqrtsp_i.h
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/common/drvsp.c
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/common/drvsp.h
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/common/driver.h
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/common/driver.c
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/common/common.h
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/common//c674/common.h
src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/Release/sqrtsp_674LE_LE_ELF.out: src/sqrtsp//c674//sqrtsp_674LE_LE_ELF/.project
	-@ echo Importing Project sqrtsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects sqrtsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtsp/c674/sqrtsp_674LE_LE_ELF"
	-@ echo Building Project sqrtsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/sqrtsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects sqrtsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project sqrtsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/sqrtsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/sqrtsp//c674//sqrtsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project tandp_674LE_LE_COFF

#############################################################

.executables: src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out

.projects: src/tandp//c674//tandp_674LE_LE_COFF

src/tandp//c674//tandp_674LE_LE_COFF: src/tandp//c674//tandp_674LE_LE_COFF/.project

src/tandp//c674//tandp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tandp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name tandp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__TANDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__TANDP_674LE_LE_COFF_SRCTANDP/tandp_d.c\
 -ccs.linkFile EXT_ROOT__TANDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__TANDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/tandp//c674//tandp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__TANDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__TANDP_674LE_LE_COFF_SRCTANDP "C:/nightlybuilds/mathlib/ti/mathlib/src/tandp" \
 -ccs.definePathVariable EXT_ROOT__TANDP_674LE_LE_COFF_SRCTANDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/tandp/c674" \
 -ccs.definePathVariable EXT_ROOT__TANDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__TANDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/tandp//c674//tandp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANDP_674LE_LE_COFF_SRCTANDP=../../ >> src/tandp//c674//tandp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANDP_674LE_LE_COFF_SRCTANDPC674=.././ >> src/tandp//c674//tandp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/tandp//c674//tandp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/tandp_674LE_LE_COFF"
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/tandp/tandp.h
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/tandp/tandp_d.c
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/tandp//c674/tandp.h
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/tandp//c674/tandp_i.h
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/common/drvdp.c
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/common/drvdp.h
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/common/driver.h
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/common/driver.c
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/common/common.h
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/common//c674/common.h
src/tandp//c674//tandp_674LE_LE_COFF/Release/tandp_674LE_LE_COFF.out: src/tandp//c674//tandp_674LE_LE_COFF/.project
	-@ echo Importing Project tandp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tandp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects tandp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/tandp/c674/tandp_674LE_LE_COFF"
	-@ echo Building Project tandp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tandp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects tandp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project tandp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/tandp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/tandp//c674//tandp_674LE_LE_COFF"


#############################################################

# Rule to Build Project tandp_674LE_LE_ELF

#############################################################

.executables: src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out

.projects: src/tandp//c674//tandp_674LE_LE_ELF

src/tandp//c674//tandp_674LE_LE_ELF: src/tandp//c674//tandp_674LE_LE_ELF/.project

src/tandp//c674//tandp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tandp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name tandp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__TANDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__TANDP_674LE_LE_ELF_SRCTANDP/tandp_d.c\
 -ccs.linkFile EXT_ROOT__TANDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__TANDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/tandp//c674//tandp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__TANDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__TANDP_674LE_LE_ELF_SRCTANDP "C:/nightlybuilds/mathlib/ti/mathlib/src/tandp" \
 -ccs.definePathVariable EXT_ROOT__TANDP_674LE_LE_ELF_SRCTANDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/tandp/c674" \
 -ccs.definePathVariable EXT_ROOT__TANDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__TANDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/tandp//c674//tandp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANDP_674LE_LE_ELF_SRCTANDP=../../ >> src/tandp//c674//tandp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANDP_674LE_LE_ELF_SRCTANDPC674=.././ >> src/tandp//c674//tandp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/tandp//c674//tandp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/tandp_674LE_LE_ELF"
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/tandp/tandp.h
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/tandp/tandp_d.c
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/tandp//c674/tandp.h
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/tandp//c674/tandp_i.h
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/common/drvdp.c
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/common/drvdp.h
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/common/driver.h
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/common/driver.c
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/common/common.h
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/common//c674/common.h
src/tandp//c674//tandp_674LE_LE_ELF/Release/tandp_674LE_LE_ELF.out: src/tandp//c674//tandp_674LE_LE_ELF/.project
	-@ echo Importing Project tandp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tandp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects tandp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/tandp/c674/tandp_674LE_LE_ELF"
	-@ echo Building Project tandp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tandp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects tandp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project tandp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/tandp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/tandp//c674//tandp_674LE_LE_ELF"


#############################################################

# Rule to Build Project tanhdp_674LE_LE_COFF

#############################################################

.executables: src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out

.projects: src/tanhdp//c674//tanhdp_674LE_LE_COFF

src/tanhdp//c674//tanhdp_674LE_LE_COFF: src/tanhdp//c674//tanhdp_674LE_LE_COFF/.project

src/tanhdp//c674//tanhdp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name tanhdp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__TANHDP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__TANHDP_674LE_LE_COFF_SRCTANHDP/tanhdp_d.c\
 -ccs.linkFile EXT_ROOT__TANHDP_674LE_LE_COFF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__TANHDP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/tanhdp//c674//tanhdp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__TANHDP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__TANHDP_674LE_LE_COFF_SRCTANHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhdp" \
 -ccs.definePathVariable EXT_ROOT__TANHDP_674LE_LE_COFF_SRCTANHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhdp/c674" \
 -ccs.definePathVariable EXT_ROOT__TANHDP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__TANHDP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/tanhdp//c674//tanhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANHDP_674LE_LE_COFF_SRCTANHDP=../../ >> src/tanhdp//c674//tanhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANHDP_674LE_LE_COFF_SRCTANHDPC674=.././ >> src/tanhdp//c674//tanhdp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANHDP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/tanhdp//c674//tanhdp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/tanhdp_674LE_LE_COFF"
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/tanhdp/tanhdp.h
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/tanhdp/tanhdp_d.c
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/tanhdp//c674/tanhdp.h
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/tanhdp//c674/tanhdp_i.h
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/common/drvdp.c
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/common/drvdp.h
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/common/driver.h
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/common/driver.c
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/common/common.h
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/common//c674/common.h
src/tanhdp//c674//tanhdp_674LE_LE_COFF/Release/tanhdp_674LE_LE_COFF.out: src/tanhdp//c674//tanhdp_674LE_LE_COFF/.project
	-@ echo Importing Project tanhdp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects tanhdp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhdp/c674/tanhdp_674LE_LE_COFF"
	-@ echo Building Project tanhdp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhdp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects tanhdp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project tanhdp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/tanhdp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/tanhdp//c674//tanhdp_674LE_LE_COFF"


#############################################################

# Rule to Build Project tanhdp_674LE_LE_ELF

#############################################################

.executables: src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out

.projects: src/tanhdp//c674//tanhdp_674LE_LE_ELF

src/tanhdp//c674//tanhdp_674LE_LE_ELF: src/tanhdp//c674//tanhdp_674LE_LE_ELF/.project

src/tanhdp//c674//tanhdp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name tanhdp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__TANHDP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__TANHDP_674LE_LE_ELF_SRCTANHDP/tanhdp_d.c\
 -ccs.linkFile EXT_ROOT__TANHDP_674LE_LE_ELF_SRCCOMMON/drvdp.c\
 -ccs.linkFile EXT_ROOT__TANHDP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/tanhdp//c674//tanhdp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__TANHDP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__TANHDP_674LE_LE_ELF_SRCTANHDP "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhdp" \
 -ccs.definePathVariable EXT_ROOT__TANHDP_674LE_LE_ELF_SRCTANHDPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhdp/c674" \
 -ccs.definePathVariable EXT_ROOT__TANHDP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__TANHDP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/tanhdp//c674//tanhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANHDP_674LE_LE_ELF_SRCTANHDP=../../ >> src/tanhdp//c674//tanhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANHDP_674LE_LE_ELF_SRCTANHDPC674=.././ >> src/tanhdp//c674//tanhdp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANHDP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/tanhdp//c674//tanhdp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/tanhdp_674LE_LE_ELF"
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/tanhdp/tanhdp.h
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/tanhdp/tanhdp_d.c
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/tanhdp//c674/tanhdp.h
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/tanhdp//c674/tanhdp_i.h
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/common/drvdp.c
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/common/drvdp.h
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/common/driver.h
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/common/driver.c
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/common/common.h
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/common//c674/common.h
src/tanhdp//c674//tanhdp_674LE_LE_ELF/Release/tanhdp_674LE_LE_ELF.out: src/tanhdp//c674//tanhdp_674LE_LE_ELF/.project
	-@ echo Importing Project tanhdp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects tanhdp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhdp/c674/tanhdp_674LE_LE_ELF"
	-@ echo Building Project tanhdp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhdp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects tanhdp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project tanhdp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/tanhdp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/tanhdp//c674//tanhdp_674LE_LE_ELF"


#############################################################

# Rule to Build Project tanhsp_674LE_LE_COFF

#############################################################

.executables: src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out

.projects: src/tanhsp//c674//tanhsp_674LE_LE_COFF

src/tanhsp//c674//tanhsp_674LE_LE_COFF: src/tanhsp//c674//tanhsp_674LE_LE_COFF/.project

src/tanhsp//c674//tanhsp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name tanhsp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__TANHSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__TANHSP_674LE_LE_COFF_SRCTANHSP/tanhsp_d.c\
 -ccs.linkFile EXT_ROOT__TANHSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__TANHSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/tanhsp//c674//tanhsp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__TANHSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__TANHSP_674LE_LE_COFF_SRCTANHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhsp" \
 -ccs.definePathVariable EXT_ROOT__TANHSP_674LE_LE_COFF_SRCTANHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhsp/c674" \
 -ccs.definePathVariable EXT_ROOT__TANHSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__TANHSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/tanhsp//c674//tanhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANHSP_674LE_LE_COFF_SRCTANHSP=../../ >> src/tanhsp//c674//tanhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANHSP_674LE_LE_COFF_SRCTANHSPC674=.././ >> src/tanhsp//c674//tanhsp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANHSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/tanhsp//c674//tanhsp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/tanhsp_674LE_LE_COFF"
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/tanhsp/tanhsp.h
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/tanhsp/tanhsp_d.c
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/tanhsp//c674/tanhsp.h
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/tanhsp//c674/tanhsp_i.h
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/common/drvsp.c
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/common/drvsp.h
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/common/driver.h
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/common/driver.c
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/common/common.h
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/common//c674/common.h
src/tanhsp//c674//tanhsp_674LE_LE_COFF/Release/tanhsp_674LE_LE_COFF.out: src/tanhsp//c674//tanhsp_674LE_LE_COFF/.project
	-@ echo Importing Project tanhsp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects tanhsp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhsp/c674/tanhsp_674LE_LE_COFF"
	-@ echo Building Project tanhsp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhsp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects tanhsp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project tanhsp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/tanhsp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/tanhsp//c674//tanhsp_674LE_LE_COFF"


#############################################################

# Rule to Build Project tanhsp_674LE_LE_ELF

#############################################################

.executables: src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out

.projects: src/tanhsp//c674//tanhsp_674LE_LE_ELF

src/tanhsp//c674//tanhsp_674LE_LE_ELF: src/tanhsp//c674//tanhsp_674LE_LE_ELF/.project

src/tanhsp//c674//tanhsp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name tanhsp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__TANHSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__TANHSP_674LE_LE_ELF_SRCTANHSP/tanhsp_d.c\
 -ccs.linkFile EXT_ROOT__TANHSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__TANHSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/tanhsp//c674//tanhsp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__TANHSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__TANHSP_674LE_LE_ELF_SRCTANHSP "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhsp" \
 -ccs.definePathVariable EXT_ROOT__TANHSP_674LE_LE_ELF_SRCTANHSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhsp/c674" \
 -ccs.definePathVariable EXT_ROOT__TANHSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__TANHSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/tanhsp//c674//tanhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANHSP_674LE_LE_ELF_SRCTANHSP=../../ >> src/tanhsp//c674//tanhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANHSP_674LE_LE_ELF_SRCTANHSPC674=.././ >> src/tanhsp//c674//tanhsp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANHSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/tanhsp//c674//tanhsp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/tanhsp_674LE_LE_ELF"
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/tanhsp/tanhsp.h
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/tanhsp/tanhsp_d.c
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/tanhsp//c674/tanhsp.h
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/tanhsp//c674/tanhsp_i.h
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/common/drvsp.c
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/common/drvsp.h
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/common/driver.h
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/common/driver.c
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/common/common.h
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/common//c674/common.h
src/tanhsp//c674//tanhsp_674LE_LE_ELF/Release/tanhsp_674LE_LE_ELF.out: src/tanhsp//c674//tanhsp_674LE_LE_ELF/.project
	-@ echo Importing Project tanhsp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects tanhsp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/tanhsp/c674/tanhsp_674LE_LE_ELF"
	-@ echo Building Project tanhsp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tanhsp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects tanhsp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project tanhsp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/tanhsp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/tanhsp//c674//tanhsp_674LE_LE_ELF"


#############################################################

# Rule to Build Project tansp_674LE_LE_COFF

#############################################################

.executables: src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out

.projects: src/tansp//c674//tansp_674LE_LE_COFF

src/tansp//c674//tansp_674LE_LE_COFF: src/tansp//c674//tansp_674LE_LE_COFF/.project

src/tansp//c674//tansp_674LE_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tansp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name tansp_674LE_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__TANSP_674LE_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__TANSP_674LE_LE_COFF_SRCTANSP/tansp_d.c\
 -ccs.linkFile EXT_ROOT__TANSP_674LE_LE_COFF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__TANSP_674LE_LE_COFF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/tansp//c674//tansp_674LE_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable EXT_ROOT__TANSP_674LE_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__TANSP_674LE_LE_COFF_SRCTANSP "C:/nightlybuilds/mathlib/ti/mathlib/src/tansp" \
 -ccs.definePathVariable EXT_ROOT__TANSP_674LE_LE_COFF_SRCTANSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/tansp/c674" \
 -ccs.definePathVariable EXT_ROOT__TANSP_674LE_LE_COFF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__TANSP_674LE_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/tansp//c674//tansp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANSP_674LE_LE_COFF_SRCTANSP=../../ >> src/tansp//c674//tansp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANSP_674LE_LE_COFF_SRCTANSPC674=.././ >> src/tansp//c674//tansp_674LE_LE_COFF/macros.ini
	echo EXT_ROOT__TANSP_674LE_LE_COFF_SRCCOMMON=../../../common >> src/tansp//c674//tansp_674LE_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/tansp_674LE_LE_COFF"
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/common//c674/lnk.cmd
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/tansp/tansp.h
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/tansp/tansp_d.c
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/tansp//c674/tansp.h
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/tansp//c674/tansp_i.h
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/common/drvsp.c
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/common/drvsp.h
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/common/driver.h
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/common/driver.c
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/common/common.h
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/common//c674/common.h
src/tansp//c674//tansp_674LE_LE_COFF/Release/tansp_674LE_LE_COFF.out: src/tansp//c674//tansp_674LE_LE_COFF/.project
	-@ echo Importing Project tansp_674LE_LE_COFF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tansp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectImport -ccs.projects tansp_674LE_LE_COFF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/tansp/c674/tansp_674LE_LE_COFF"
	-@ echo Building Project tansp_674LE_LE_COFF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tansp_674LE_LE_COFF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects tansp_674LE_LE_COFF -ccs.configuration Release
	-@ echo Project tansp_674LE_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/tansp_674LE_LE_COFF"

clean::
	-$(RMDIR) "src/tansp//c674//tansp_674LE_LE_COFF"


#############################################################

# Rule to Build Project tansp_674LE_LE_ELF

#############################################################

.executables: src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out

.projects: src/tansp//c674//tansp_674LE_LE_ELF

src/tansp//c674//tansp_674LE_LE_ELF: src/tansp//c674//tansp_674LE_LE_ELF/.project

src/tansp//c674//tansp_674LE_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tansp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name tansp_674LE_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__TANSP_674LE_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__TANSP_674LE_LE_ELF_SRCTANSP/tansp_d.c\
 -ccs.linkFile EXT_ROOT__TANSP_674LE_LE_ELF_SRCCOMMON/drvsp.c\
 -ccs.linkFile EXT_ROOT__TANSP_674LE_LE_ELF_SRCCOMMON/driver.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Debug -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i../../../../common/c674 -i../../../ -i../../ -i../../../../common" @configurations Release -ccs.location src/tansp//c674//tansp_674LE_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable EXT_ROOT__TANSP_674LE_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__TANSP_674LE_LE_ELF_SRCTANSP "C:/nightlybuilds/mathlib/ti/mathlib/src/tansp" \
 -ccs.definePathVariable EXT_ROOT__TANSP_674LE_LE_ELF_SRCTANSPC674 "C:/nightlybuilds/mathlib/ti/mathlib/src/tansp/c674" \
 -ccs.definePathVariable EXT_ROOT__TANSP_674LE_LE_ELF_SRCCOMMON "C:/nightlybuilds/mathlib/ti/mathlib/src/common" \

	echo EXT_ROOT__TANSP_674LE_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/tansp//c674//tansp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANSP_674LE_LE_ELF_SRCTANSP=../../ >> src/tansp//c674//tansp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANSP_674LE_LE_ELF_SRCTANSPC674=.././ >> src/tansp//c674//tansp_674LE_LE_ELF/macros.ini
	echo EXT_ROOT__TANSP_674LE_LE_ELF_SRCCOMMON=../../../common >> src/tansp//c674//tansp_674LE_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/tansp_674LE_LE_ELF"
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/common//c674/lnk.cmd
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/tansp/tansp.h
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/tansp/tansp_d.c
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/tansp//c674/tansp.h
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/tansp//c674/tansp_i.h
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/common/drvsp.c
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/common/drvsp.h
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/common/driver.h
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/common/driver.c
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/common/common.h
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/common//c674/common.h
src/tansp//c674//tansp_674LE_LE_ELF/Release/tansp_674LE_LE_ELF.out: src/tansp//c674//tansp_674LE_LE_ELF/.project
	-@ echo Importing Project tansp_674LE_LE_ELF into workspace ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tansp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectImport -ccs.projects tansp_674LE_LE_ELF -ccs.location "C:/nightlybuilds/mathlib/ti/mathlib/src/tansp/c674/tansp_674LE_LE_ELF"
	-@ echo Building Project tansp_674LE_LE_ELF ...
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/tansp_674LE_LE_ELF" -application com.ti.ccstudio.apps.projectBuild -ccs.projects tansp_674LE_LE_ELF -ccs.configuration Release
	-@ echo Project tansp_674LE_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/tansp_674LE_LE_ELF"

clean::
	-$(RMDIR) "src/tansp//c674//tansp_674LE_LE_ELF"

