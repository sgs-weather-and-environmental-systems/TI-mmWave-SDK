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

# DSPLIB_INSTALL_DIR   - DSPLIB install directory
export DSPLIB_INSTALL_DIR ?= C:/ti/dsplib_c674x_3_4_0_0/packages

# Common Macros used in make

ifndef RMDIR
export RMDIR = DEL /Q /F /S
endif

ifneq ($(findstring $(SHELL), sh.exe),)
	quote = "
	FIXCCSPJT=
else
	quote = '
	FIXCCSPJT=${XDC_INSTALL_DIR}/xs -f ../../../../DSPLIB_Install/swtools/ti/mas/swtools/fixccspjt.js $(@D)/$(CDTFILE)
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

# Rule to Build Project DSPF_blk_eswap16_674_LE_COFF

#############################################################

.projects: src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_COFF

src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_COFF: src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_COFF/.project

src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_blk_eswap16_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_blk_eswap16_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_COFF_SRCDSPF_BLK_ESWAP16C674/DSPF_blk_eswap16_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_COFF_SRCDSPF_BLK_ESWAP16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap16" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_COFF_SRCDSPF_BLK_ESWAP16C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap16/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_COFF_SRCDSPF_BLK_ESWAP16=../../ >> src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_COFF_SRCDSPF_BLK_ESWAP16C674=.././ >> src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap16_674_LE_COFF"
	-@ echo Project DSPF_blk_eswap16_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap16_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_blk_eswap16_674_LE_ELF

#############################################################

.projects: src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_ELF

src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_ELF: src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_ELF/.project

src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_blk_eswap16_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_blk_eswap16_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_ELF_SRCDSPF_BLK_ESWAP16C674/DSPF_blk_eswap16_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_ELF_SRCDSPF_BLK_ESWAP16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap16" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_ELF_SRCDSPF_BLK_ESWAP16C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap16/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_ELF_SRCDSPF_BLK_ESWAP16=../../ >> src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP16_674_LE_ELF_SRCDSPF_BLK_ESWAP16C674=.././ >> src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap16_674_LE_ELF"
	-@ echo Project DSPF_blk_eswap16_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap16_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_blk_eswap16//c674//DSPF_blk_eswap16_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_blk_eswap32_674_LE_COFF

#############################################################

.projects: src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_COFF

src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_COFF: src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_COFF/.project

src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_blk_eswap32_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_blk_eswap32_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_COFF_SRCDSPF_BLK_ESWAP32C674/DSPF_blk_eswap32_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_COFF_SRCDSPF_BLK_ESWAP32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap32" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_COFF_SRCDSPF_BLK_ESWAP32C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap32/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_COFF_SRCDSPF_BLK_ESWAP32=../../ >> src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_COFF_SRCDSPF_BLK_ESWAP32C674=.././ >> src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap32_674_LE_COFF"
	-@ echo Project DSPF_blk_eswap32_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap32_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_blk_eswap32_674_LE_ELF

#############################################################

.projects: src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_ELF

src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_ELF: src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_ELF/.project

src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_blk_eswap32_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_blk_eswap32_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_ELF_SRCDSPF_BLK_ESWAP32C674/DSPF_blk_eswap32_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_ELF_SRCDSPF_BLK_ESWAP32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap32" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_ELF_SRCDSPF_BLK_ESWAP32C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap32/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_ELF_SRCDSPF_BLK_ESWAP32=../../ >> src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP32_674_LE_ELF_SRCDSPF_BLK_ESWAP32C674=.././ >> src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap32_674_LE_ELF"
	-@ echo Project DSPF_blk_eswap32_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap32_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_blk_eswap32//c674//DSPF_blk_eswap32_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_blk_eswap64_674_LE_COFF

#############################################################

.projects: src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_COFF

src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_COFF: src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_COFF/.project

src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_blk_eswap64_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_blk_eswap64_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_COFF_SRCDSPF_BLK_ESWAP64C674/DSPF_blk_eswap64_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_COFF_SRCDSPF_BLK_ESWAP64 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap64" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_COFF_SRCDSPF_BLK_ESWAP64C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap64/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_COFF_SRCDSPF_BLK_ESWAP64=../../ >> src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_COFF_SRCDSPF_BLK_ESWAP64C674=.././ >> src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap64_674_LE_COFF"
	-@ echo Project DSPF_blk_eswap64_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap64_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_blk_eswap64_674_LE_ELF

#############################################################

.projects: src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_ELF

src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_ELF: src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_ELF/.project

src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_blk_eswap64_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_blk_eswap64_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_ELF_SRCDSPF_BLK_ESWAP64C674/DSPF_blk_eswap64_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_ELF_SRCDSPF_BLK_ESWAP64 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap64" \
 -ccs.definePathVariable EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_ELF_SRCDSPF_BLK_ESWAP64C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_blk_eswap64/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_ELF_SRCDSPF_BLK_ESWAP64=../../ >> src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_BLK_ESWAP64_674_LE_ELF_SRCDSPF_BLK_ESWAP64C674=.././ >> src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap64_674_LE_ELF"
	-@ echo Project DSPF_blk_eswap64_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_blk_eswap64_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_blk_eswap64//c674//DSPF_blk_eswap64_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_fltoq15_674_LE_COFF

#############################################################

.projects: src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_COFF

src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_COFF: src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_COFF/.project

src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_fltoq15_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_fltoq15_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_FLTOQ15_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_FLTOQ15_674_LE_COFF_SRCDSPF_FLTOQ15C674/DSPF_fltoq15_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_FLTOQ15_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_FLTOQ15_674_LE_COFF_SRCDSPF_FLTOQ15 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_fltoq15" \
 -ccs.definePathVariable EXT_ROOT__DSPF_FLTOQ15_674_LE_COFF_SRCDSPF_FLTOQ15C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_fltoq15/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_FLTOQ15_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_FLTOQ15_674_LE_COFF_SRCDSPF_FLTOQ15=../../ >> src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_FLTOQ15_674_LE_COFF_SRCDSPF_FLTOQ15C674=.././ >> src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_fltoq15_674_LE_COFF"
	-@ echo Project DSPF_fltoq15_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_fltoq15_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_fltoq15_674_LE_ELF

#############################################################

.projects: src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_ELF

src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_ELF: src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_ELF/.project

src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_fltoq15_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_fltoq15_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_FLTOQ15_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_FLTOQ15_674_LE_ELF_SRCDSPF_FLTOQ15C674/DSPF_fltoq15_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_FLTOQ15_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_FLTOQ15_674_LE_ELF_SRCDSPF_FLTOQ15 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_fltoq15" \
 -ccs.definePathVariable EXT_ROOT__DSPF_FLTOQ15_674_LE_ELF_SRCDSPF_FLTOQ15C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_fltoq15/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_FLTOQ15_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_FLTOQ15_674_LE_ELF_SRCDSPF_FLTOQ15=../../ >> src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_FLTOQ15_674_LE_ELF_SRCDSPF_FLTOQ15C674=.././ >> src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_fltoq15_674_LE_ELF"
	-@ echo Project DSPF_fltoq15_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_fltoq15_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_fltoq15//c674//DSPF_fltoq15_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_q15tofl_674_LE_COFF

#############################################################

.projects: src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_COFF

src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_COFF: src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_COFF/.project

src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_q15tofl_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_q15tofl_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_Q15TOFL_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_Q15TOFL_674_LE_COFF_SRCDSPF_Q15TOFLC674/DSPF_q15tofl_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_Q15TOFL_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_Q15TOFL_674_LE_COFF_SRCDSPF_Q15TOFL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_q15tofl" \
 -ccs.definePathVariable EXT_ROOT__DSPF_Q15TOFL_674_LE_COFF_SRCDSPF_Q15TOFLC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_q15tofl/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_Q15TOFL_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_Q15TOFL_674_LE_COFF_SRCDSPF_Q15TOFL=../../ >> src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_Q15TOFL_674_LE_COFF_SRCDSPF_Q15TOFLC674=.././ >> src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_q15tofl_674_LE_COFF"
	-@ echo Project DSPF_q15tofl_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_q15tofl_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_q15tofl_674_LE_ELF

#############################################################

.projects: src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_ELF

src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_ELF: src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_ELF/.project

src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_q15tofl_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_q15tofl_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_Q15TOFL_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_Q15TOFL_674_LE_ELF_SRCDSPF_Q15TOFLC674/DSPF_q15tofl_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_Q15TOFL_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_Q15TOFL_674_LE_ELF_SRCDSPF_Q15TOFL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_q15tofl" \
 -ccs.definePathVariable EXT_ROOT__DSPF_Q15TOFL_674_LE_ELF_SRCDSPF_Q15TOFLC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_q15tofl/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_Q15TOFL_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_Q15TOFL_674_LE_ELF_SRCDSPF_Q15TOFL=../../ >> src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_Q15TOFL_674_LE_ELF_SRCDSPF_Q15TOFLC674=.././ >> src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_q15tofl_674_LE_ELF"
	-@ echo Project DSPF_q15tofl_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_q15tofl_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_q15tofl//c674//DSPF_q15tofl_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_autocor_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_COFF

src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_COFF: src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_COFF/.project

src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_autocor_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_autocor_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_COFF_SRCDSPF_SP_AUTOCORC674/DSPF_sp_autocor_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_COFF_SRCDSPF_SP_AUTOCOR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_autocor" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_COFF_SRCDSPF_SP_AUTOCORC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_autocor/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_COFF_SRCDSPF_SP_AUTOCOR=../../ >> src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_COFF_SRCDSPF_SP_AUTOCORC674=.././ >> src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_autocor_674_LE_COFF"
	-@ echo Project DSPF_sp_autocor_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_autocor_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_autocor_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_ELF

src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_ELF: src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_ELF/.project

src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_autocor_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_autocor_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_ELF_SRCDSPF_SP_AUTOCORC674/DSPF_sp_autocor_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_ELF_SRCDSPF_SP_AUTOCOR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_autocor" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_ELF_SRCDSPF_SP_AUTOCORC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_autocor/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_ELF_SRCDSPF_SP_AUTOCOR=../../ >> src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_AUTOCOR_674_LE_ELF_SRCDSPF_SP_AUTOCORC674=.././ >> src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_autocor_674_LE_ELF"
	-@ echo Project DSPF_sp_autocor_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_autocor_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_autocor//c674//DSPF_sp_autocor_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_biquad_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_COFF

src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_COFF: src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_COFF/.project

src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_biquad_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_biquad_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_BIQUAD_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_BIQUAD_674_LE_COFF_SRCDSPF_SP_BIQUADC674/DSPF_sp_biquad_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BIQUAD_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BIQUAD_674_LE_COFF_SRCDSPF_SP_BIQUAD "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_biquad" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BIQUAD_674_LE_COFF_SRCDSPF_SP_BIQUADC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_biquad/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_BIQUAD_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_BIQUAD_674_LE_COFF_SRCDSPF_SP_BIQUAD=../../ >> src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_BIQUAD_674_LE_COFF_SRCDSPF_SP_BIQUADC674=.././ >> src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_biquad_674_LE_COFF"
	-@ echo Project DSPF_sp_biquad_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_biquad_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_biquad_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_ELF

src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_ELF: src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_ELF/.project

src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_biquad_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_biquad_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_BIQUAD_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_BIQUAD_674_LE_ELF_SRCDSPF_SP_BIQUADC674/DSPF_sp_biquad_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BIQUAD_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BIQUAD_674_LE_ELF_SRCDSPF_SP_BIQUAD "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_biquad" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BIQUAD_674_LE_ELF_SRCDSPF_SP_BIQUADC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_biquad/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_BIQUAD_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_BIQUAD_674_LE_ELF_SRCDSPF_SP_BIQUAD=../../ >> src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_BIQUAD_674_LE_ELF_SRCDSPF_SP_BIQUADC674=.././ >> src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_biquad_674_LE_ELF"
	-@ echo Project DSPF_sp_biquad_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_biquad_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_biquad//c674//DSPF_sp_biquad_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_bitrev_cplx_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_COFF

src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_COFF: src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_COFF/.project

src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_bitrev_cplx_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_bitrev_cplx_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_COFF_SRCDSPF_SP_BITREV_CPLXC674/DSPF_sp_bitrev_cplx_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_COFF_SRCDSPF_SP_BITREV_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_bitrev_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_COFF_SRCDSPF_SP_BITREV_CPLXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_bitrev_cplx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_COFF_SRCDSPF_SP_BITREV_CPLX=../../ >> src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_COFF_SRCDSPF_SP_BITREV_CPLXC674=.././ >> src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_bitrev_cplx_674_LE_COFF"
	-@ echo Project DSPF_sp_bitrev_cplx_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_bitrev_cplx_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_bitrev_cplx_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_ELF

src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_ELF: src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_ELF/.project

src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_bitrev_cplx_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_bitrev_cplx_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_ELF_SRCDSPF_SP_BITREV_CPLXC674/DSPF_sp_bitrev_cplx_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_ELF_SRCDSPF_SP_BITREV_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_bitrev_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_ELF_SRCDSPF_SP_BITREV_CPLXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_bitrev_cplx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_ELF_SRCDSPF_SP_BITREV_CPLX=../../ >> src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_BITREV_CPLX_674_LE_ELF_SRCDSPF_SP_BITREV_CPLXC674=.././ >> src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_bitrev_cplx_674_LE_ELF"
	-@ echo Project DSPF_sp_bitrev_cplx_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_bitrev_cplx_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_bitrev_cplx//c674//DSPF_sp_bitrev_cplx_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_blk_move_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_COFF

src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_COFF: src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_COFF/.project

src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_blk_move_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_blk_move_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_COFF_SRCDSPF_SP_BLK_MOVEC674/DSPF_sp_blk_move_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_COFF_SRCDSPF_SP_BLK_MOVE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_blk_move" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_COFF_SRCDSPF_SP_BLK_MOVEC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_blk_move/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_COFF_SRCDSPF_SP_BLK_MOVE=../../ >> src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_COFF_SRCDSPF_SP_BLK_MOVEC674=.././ >> src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_blk_move_674_LE_COFF"
	-@ echo Project DSPF_sp_blk_move_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_blk_move_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_blk_move_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_ELF

src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_ELF: src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_ELF/.project

src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_blk_move_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_blk_move_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_ELF_SRCDSPF_SP_BLK_MOVEC674/DSPF_sp_blk_move_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_ELF_SRCDSPF_SP_BLK_MOVE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_blk_move" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_ELF_SRCDSPF_SP_BLK_MOVEC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_blk_move/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_ELF_SRCDSPF_SP_BLK_MOVE=../../ >> src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_BLK_MOVE_674_LE_ELF_SRCDSPF_SP_BLK_MOVEC674=.././ >> src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_blk_move_674_LE_ELF"
	-@ echo Project DSPF_sp_blk_move_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_blk_move_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_blk_move//c674//DSPF_sp_blk_move_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_cfftr2_dit_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_COFF

src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_COFF: src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_COFF/.project

src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_cfftr2_dit_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_cfftr2_dit_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_COFF_SRCDSPF_SP_CFFTR2_DITC674/DSPF_sp_cfftr2_dit_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_COFF_SRCDSPF_SP_CFFTR2_DIT "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_cfftr2_dit" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_COFF_SRCDSPF_SP_CFFTR2_DITC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_cfftr2_dit/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_COFF_SRCDSPF_SP_CFFTR2_DIT=../../ >> src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_COFF_SRCDSPF_SP_CFFTR2_DITC674=.././ >> src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_cfftr2_dit_674_LE_COFF"
	-@ echo Project DSPF_sp_cfftr2_dit_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_cfftr2_dit_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_cfftr2_dit_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_ELF

src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_ELF: src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_ELF/.project

src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_cfftr2_dit_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_cfftr2_dit_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_ELF_SRCDSPF_SP_CFFTR2_DITC674/DSPF_sp_cfftr2_dit_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_ELF_SRCDSPF_SP_CFFTR2_DIT "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_cfftr2_dit" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_ELF_SRCDSPF_SP_CFFTR2_DITC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_cfftr2_dit/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_ELF_SRCDSPF_SP_CFFTR2_DIT=../../ >> src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR2_DIT_674_LE_ELF_SRCDSPF_SP_CFFTR2_DITC674=.././ >> src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_cfftr2_dit_674_LE_ELF"
	-@ echo Project DSPF_sp_cfftr2_dit_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_cfftr2_dit_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_cfftr2_dit//c674//DSPF_sp_cfftr2_dit_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_cfftr4_dif_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_COFF

src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_COFF: src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_COFF/.project

src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_cfftr4_dif_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_cfftr4_dif_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_COFF_SRCDSPF_SP_CFFTR4_DIFC674/DSPF_sp_cfftr4_dif_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_COFF_SRCDSPF_SP_CFFTR4_DIF "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_cfftr4_dif" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_COFF_SRCDSPF_SP_CFFTR4_DIFC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_cfftr4_dif/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_COFF_SRCDSPF_SP_CFFTR4_DIF=../../ >> src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_COFF_SRCDSPF_SP_CFFTR4_DIFC674=.././ >> src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_cfftr4_dif_674_LE_COFF"
	-@ echo Project DSPF_sp_cfftr4_dif_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_cfftr4_dif_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_cfftr4_dif_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_ELF

src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_ELF: src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_ELF/.project

src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_cfftr4_dif_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_cfftr4_dif_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_ELF_SRCDSPF_SP_CFFTR4_DIFC674/DSPF_sp_cfftr4_dif_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_ELF_SRCDSPF_SP_CFFTR4_DIF "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_cfftr4_dif" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_ELF_SRCDSPF_SP_CFFTR4_DIFC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_cfftr4_dif/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_ELF_SRCDSPF_SP_CFFTR4_DIF=../../ >> src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_CFFTR4_DIF_674_LE_ELF_SRCDSPF_SP_CFFTR4_DIFC674=.././ >> src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_cfftr4_dif_674_LE_ELF"
	-@ echo Project DSPF_sp_cfftr4_dif_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_cfftr4_dif_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_cfftr4_dif//c674//DSPF_sp_cfftr4_dif_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_convol_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_COFF

src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_COFF: src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_COFF/.project

src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_convol_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_convol_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_CONVOL_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_CONVOL_674_LE_COFF_SRCDSPF_SP_CONVOLC674/DSPF_sp_convol_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CONVOL_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CONVOL_674_LE_COFF_SRCDSPF_SP_CONVOL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_convol" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CONVOL_674_LE_COFF_SRCDSPF_SP_CONVOLC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_convol/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_CONVOL_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_CONVOL_674_LE_COFF_SRCDSPF_SP_CONVOL=../../ >> src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_CONVOL_674_LE_COFF_SRCDSPF_SP_CONVOLC674=.././ >> src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_convol_674_LE_COFF"
	-@ echo Project DSPF_sp_convol_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_convol_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_convol_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_ELF

src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_ELF: src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_ELF/.project

src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_convol_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_convol_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_CONVOL_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_CONVOL_674_LE_ELF_SRCDSPF_SP_CONVOLC674/DSPF_sp_convol_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CONVOL_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CONVOL_674_LE_ELF_SRCDSPF_SP_CONVOL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_convol" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_CONVOL_674_LE_ELF_SRCDSPF_SP_CONVOLC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_convol/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_CONVOL_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_CONVOL_674_LE_ELF_SRCDSPF_SP_CONVOL=../../ >> src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_CONVOL_674_LE_ELF_SRCDSPF_SP_CONVOLC674=.././ >> src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_convol_674_LE_ELF"
	-@ echo Project DSPF_sp_convol_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_convol_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_convol//c674//DSPF_sp_convol_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_dotprod_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_COFF

src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_COFF: src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_COFF/.project

src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_dotprod_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_dotprod_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_DOTPROD_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_DOTPROD_674_LE_COFF_SRCDSPF_SP_DOTPRODC674/DSPF_sp_dotprod_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTPROD_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTPROD_674_LE_COFF_SRCDSPF_SP_DOTPROD "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_dotprod" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTPROD_674_LE_COFF_SRCDSPF_SP_DOTPRODC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_dotprod/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTPROD_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTPROD_674_LE_COFF_SRCDSPF_SP_DOTPROD=../../ >> src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTPROD_674_LE_COFF_SRCDSPF_SP_DOTPRODC674=.././ >> src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_dotprod_674_LE_COFF"
	-@ echo Project DSPF_sp_dotprod_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_dotprod_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_dotprod_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_ELF

src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_ELF: src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_ELF/.project

src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_dotprod_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_dotprod_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_DOTPROD_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_DOTPROD_674_LE_ELF_SRCDSPF_SP_DOTPRODC674/DSPF_sp_dotprod_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTPROD_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTPROD_674_LE_ELF_SRCDSPF_SP_DOTPROD "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_dotprod" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTPROD_674_LE_ELF_SRCDSPF_SP_DOTPRODC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_dotprod/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTPROD_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTPROD_674_LE_ELF_SRCDSPF_SP_DOTPROD=../../ >> src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTPROD_674_LE_ELF_SRCDSPF_SP_DOTPRODC674=.././ >> src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_dotprod_674_LE_ELF"
	-@ echo Project DSPF_sp_dotprod_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_dotprod_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_dotprod//c674//DSPF_sp_dotprod_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_dotp_cplx_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_COFF

src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_COFF: src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_COFF/.project

src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_dotp_cplx_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_dotp_cplx_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_COFF_SRCDSPF_SP_DOTP_CPLXC674/DSPF_sp_dotp_cplx_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_COFF_SRCDSPF_SP_DOTP_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_dotp_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_COFF_SRCDSPF_SP_DOTP_CPLXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_dotp_cplx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_COFF_SRCDSPF_SP_DOTP_CPLX=../../ >> src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_COFF_SRCDSPF_SP_DOTP_CPLXC674=.././ >> src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_dotp_cplx_674_LE_COFF"
	-@ echo Project DSPF_sp_dotp_cplx_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_dotp_cplx_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_dotp_cplx_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_ELF

src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_ELF: src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_ELF/.project

src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_dotp_cplx_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_dotp_cplx_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_ELF_SRCDSPF_SP_DOTP_CPLXC674/DSPF_sp_dotp_cplx_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_ELF_SRCDSPF_SP_DOTP_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_dotp_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_ELF_SRCDSPF_SP_DOTP_CPLXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_dotp_cplx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_ELF_SRCDSPF_SP_DOTP_CPLX=../../ >> src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_DOTP_CPLX_674_LE_ELF_SRCDSPF_SP_DOTP_CPLXC674=.././ >> src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_dotp_cplx_674_LE_ELF"
	-@ echo Project DSPF_sp_dotp_cplx_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_dotp_cplx_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_dotp_cplx//c674//DSPF_sp_dotp_cplx_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_fftSPxSP_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_COFF

src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_COFF: src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_COFF/.project

src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_fftSPxSP_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_fftSPxSP_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_COFF_SRCDSPF_SP_FFTSPXSPC674/DSPF_sp_fftSPxSP_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_COFF_SRCDSPF_SP_FFTSPXSP "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fftSPxSP" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_COFF_SRCDSPF_SP_FFTSPXSPC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fftSPxSP/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_COFF_SRCDSPF_SP_FFTSPXSP=../../ >> src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_COFF_SRCDSPF_SP_FFTSPXSPC674=.././ >> src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fftSPxSP_674_LE_COFF"
	-@ echo Project DSPF_sp_fftSPxSP_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fftSPxSP_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_fftSPxSP_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_ELF

src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_ELF: src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_ELF/.project

src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_fftSPxSP_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_fftSPxSP_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_ELF_SRCDSPF_SP_FFTSPXSPC674/DSPF_sp_fftSPxSP_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_ELF_SRCDSPF_SP_FFTSPXSP "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fftSPxSP" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_ELF_SRCDSPF_SP_FFTSPXSPC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fftSPxSP/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_ELF_SRCDSPF_SP_FFTSPXSP=../../ >> src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FFTSPXSP_674_LE_ELF_SRCDSPF_SP_FFTSPXSPC674=.././ >> src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fftSPxSP_674_LE_ELF"
	-@ echo Project DSPF_sp_fftSPxSP_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fftSPxSP_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_fftSPxSP//c674//DSPF_sp_fftSPxSP_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_fircirc_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_COFF

src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_COFF: src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_COFF/.project

src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_fircirc_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_fircirc_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_COFF_SRCDSPF_SP_FIRCIRCC674/DSPF_sp_fircirc_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_COFF_SRCDSPF_SP_FIRCIRC "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fircirc" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_COFF_SRCDSPF_SP_FIRCIRCC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fircirc/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_COFF_SRCDSPF_SP_FIRCIRC=../../ >> src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_COFF_SRCDSPF_SP_FIRCIRCC674=.././ >> src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fircirc_674_LE_COFF"
	-@ echo Project DSPF_sp_fircirc_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fircirc_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_fircirc_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_ELF

src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_ELF: src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_ELF/.project

src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_fircirc_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_fircirc_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_ELF_SRCDSPF_SP_FIRCIRCC674/DSPF_sp_fircirc_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_ELF_SRCDSPF_SP_FIRCIRC "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fircirc" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_ELF_SRCDSPF_SP_FIRCIRCC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fircirc/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_ELF_SRCDSPF_SP_FIRCIRC=../../ >> src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIRCIRC_674_LE_ELF_SRCDSPF_SP_FIRCIRCC674=.././ >> src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fircirc_674_LE_ELF"
	-@ echo Project DSPF_sp_fircirc_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fircirc_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_fircirc//c674//DSPF_sp_fircirc_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_fir_cplx_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_COFF

src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_COFF: src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_COFF/.project

src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_fir_cplx_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_fir_cplx_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_COFF_SRCDSPF_SP_FIR_CPLXC674/DSPF_sp_fir_cplx_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_COFF_SRCDSPF_SP_FIR_CPLXC674/DSPF_sp_fir_cplx_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_COFF_SRCDSPF_SP_FIR_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_COFF_SRCDSPF_SP_FIR_CPLXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_cplx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_COFF_SRCDSPF_SP_FIR_CPLX=../../ >> src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_COFF_SRCDSPF_SP_FIR_CPLXC674=.././ >> src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_cplx_674_LE_COFF"
	-@ echo Project DSPF_sp_fir_cplx_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_cplx_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_fir_cplx_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_ELF

src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_ELF: src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_ELF/.project

src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_fir_cplx_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_fir_cplx_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_ELF_SRCDSPF_SP_FIR_CPLXC674/DSPF_sp_fir_cplx_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_ELF_SRCDSPF_SP_FIR_CPLXC674/DSPF_sp_fir_cplx_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_ELF_SRCDSPF_SP_FIR_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_ELF_SRCDSPF_SP_FIR_CPLXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_cplx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_ELF_SRCDSPF_SP_FIR_CPLX=../../ >> src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_CPLX_674_LE_ELF_SRCDSPF_SP_FIR_CPLXC674=.././ >> src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_cplx_674_LE_ELF"
	-@ echo Project DSPF_sp_fir_cplx_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_cplx_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_fir_cplx//c674//DSPF_sp_fir_cplx_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_fir_gen_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_COFF

src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_COFF: src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_COFF/.project

src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_fir_gen_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_fir_gen_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_COFF_SRCDSPF_SP_FIR_GENC674/DSPF_sp_fir_gen_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_COFF_SRCDSPF_SP_FIR_GEN "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_gen" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_COFF_SRCDSPF_SP_FIR_GENC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_gen/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_COFF_SRCDSPF_SP_FIR_GEN=../../ >> src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_COFF_SRCDSPF_SP_FIR_GENC674=.././ >> src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_gen_674_LE_COFF"
	-@ echo Project DSPF_sp_fir_gen_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_gen_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_fir_gen_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_ELF

src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_ELF: src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_ELF/.project

src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_fir_gen_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_fir_gen_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_ELF_SRCDSPF_SP_FIR_GENC674/DSPF_sp_fir_gen_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_ELF_SRCDSPF_SP_FIR_GEN "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_gen" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_ELF_SRCDSPF_SP_FIR_GENC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_gen/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_ELF_SRCDSPF_SP_FIR_GEN=../../ >> src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_GEN_674_LE_ELF_SRCDSPF_SP_FIR_GENC674=.././ >> src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_gen_674_LE_ELF"
	-@ echo Project DSPF_sp_fir_gen_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_gen_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_fir_gen//c674//DSPF_sp_fir_gen_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_fir_r2_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_COFF

src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_COFF: src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_COFF/.project

src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_fir_r2_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_fir_r2_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_R2_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_R2_674_LE_COFF_SRCDSPF_SP_FIR_R2C674/DSPF_sp_fir_r2_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_R2_674_LE_COFF_SRCDSPF_SP_FIR_R2C674/DSPF_sp_fir_r2_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_R2_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_R2_674_LE_COFF_SRCDSPF_SP_FIR_R2 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_r2" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_R2_674_LE_COFF_SRCDSPF_SP_FIR_R2C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_r2/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_R2_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_R2_674_LE_COFF_SRCDSPF_SP_FIR_R2=../../ >> src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_R2_674_LE_COFF_SRCDSPF_SP_FIR_R2C674=.././ >> src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_r2_674_LE_COFF"
	-@ echo Project DSPF_sp_fir_r2_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_r2_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_fir_r2_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_ELF

src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_ELF: src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_ELF/.project

src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_fir_r2_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_fir_r2_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_R2_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_R2_674_LE_ELF_SRCDSPF_SP_FIR_R2C674/DSPF_sp_fir_r2_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_FIR_R2_674_LE_ELF_SRCDSPF_SP_FIR_R2C674/DSPF_sp_fir_r2_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_R2_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_R2_674_LE_ELF_SRCDSPF_SP_FIR_R2 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_r2" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_FIR_R2_674_LE_ELF_SRCDSPF_SP_FIR_R2C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_fir_r2/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_R2_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_R2_674_LE_ELF_SRCDSPF_SP_FIR_R2=../../ >> src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_FIR_R2_674_LE_ELF_SRCDSPF_SP_FIR_R2C674=.././ >> src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_r2_674_LE_ELF"
	-@ echo Project DSPF_sp_fir_r2_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_fir_r2_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_fir_r2//c674//DSPF_sp_fir_r2_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_icfftr2_dif_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_COFF

src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_COFF: src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_COFF/.project

src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_icfftr2_dif_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_icfftr2_dif_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_COFF_SRCDSPF_SP_ICFFTR2_DIFC674/DSPF_sp_icfftr2_dif_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_COFF_SRCDSPF_SP_ICFFTR2_DIF "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_icfftr2_dif" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_COFF_SRCDSPF_SP_ICFFTR2_DIFC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_icfftr2_dif/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_COFF_SRCDSPF_SP_ICFFTR2_DIF=../../ >> src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_COFF_SRCDSPF_SP_ICFFTR2_DIFC674=.././ >> src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_icfftr2_dif_674_LE_COFF"
	-@ echo Project DSPF_sp_icfftr2_dif_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_icfftr2_dif_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_icfftr2_dif_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_ELF

src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_ELF: src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_ELF/.project

src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_icfftr2_dif_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_icfftr2_dif_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_ELF_SRCDSPF_SP_ICFFTR2_DIFC674/DSPF_sp_icfftr2_dif_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_ELF_SRCDSPF_SP_ICFFTR2_DIF "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_icfftr2_dif" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_ELF_SRCDSPF_SP_ICFFTR2_DIFC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_icfftr2_dif/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_ELF_SRCDSPF_SP_ICFFTR2_DIF=../../ >> src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_ICFFTR2_DIF_674_LE_ELF_SRCDSPF_SP_ICFFTR2_DIFC674=.././ >> src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_icfftr2_dif_674_LE_ELF"
	-@ echo Project DSPF_sp_icfftr2_dif_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_icfftr2_dif_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_icfftr2_dif//c674//DSPF_sp_icfftr2_dif_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_ifftSPxSP_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_COFF

src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_COFF: src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_COFF/.project

src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_ifftSPxSP_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_ifftSPxSP_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_COFF_SRCDSPF_SP_IFFTSPXSPC674/DSPF_sp_ifftSPxSP_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_COFF_SRCDSPF_SP_IFFTSPXSP "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_ifftSPxSP" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_COFF_SRCDSPF_SP_IFFTSPXSPC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_ifftSPxSP/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_COFF_SRCDSPF_SP_IFFTSPXSP=../../ >> src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_COFF_SRCDSPF_SP_IFFTSPXSPC674=.././ >> src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_ifftSPxSP_674_LE_COFF"
	-@ echo Project DSPF_sp_ifftSPxSP_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_ifftSPxSP_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_ifftSPxSP_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_ELF

src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_ELF: src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_ELF/.project

src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_ifftSPxSP_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_ifftSPxSP_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_ELF_SRCDSPF_SP_IFFTSPXSPC674/DSPF_sp_ifftSPxSP_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_ELF_SRCDSPF_SP_IFFTSPXSP "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_ifftSPxSP" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_ELF_SRCDSPF_SP_IFFTSPXSPC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_ifftSPxSP/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_ELF_SRCDSPF_SP_IFFTSPXSP=../../ >> src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_IFFTSPXSP_674_LE_ELF_SRCDSPF_SP_IFFTSPXSPC674=.././ >> src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_ifftSPxSP_674_LE_ELF"
	-@ echo Project DSPF_sp_ifftSPxSP_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_ifftSPxSP_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_ifftSPxSP//c674//DSPF_sp_ifftSPxSP_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_iirlat_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_COFF

src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_COFF: src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_COFF/.project

src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_iirlat_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_iirlat_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_IIRLAT_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_IIRLAT_674_LE_COFF_SRCDSPF_SP_IIRLATC674/DSPF_sp_iirlat_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_IIRLAT_674_LE_COFF_SRCDSPF_SP_IIRLATC674/DSPF_sp_iirlat_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIRLAT_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIRLAT_674_LE_COFF_SRCDSPF_SP_IIRLAT "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_iirlat" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIRLAT_674_LE_COFF_SRCDSPF_SP_IIRLATC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_iirlat/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIRLAT_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIRLAT_674_LE_COFF_SRCDSPF_SP_IIRLAT=../../ >> src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIRLAT_674_LE_COFF_SRCDSPF_SP_IIRLATC674=.././ >> src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_iirlat_674_LE_COFF"
	-@ echo Project DSPF_sp_iirlat_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_iirlat_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_iirlat_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_ELF

src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_ELF: src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_ELF/.project

src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_iirlat_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_iirlat_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_IIRLAT_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_IIRLAT_674_LE_ELF_SRCDSPF_SP_IIRLATC674/DSPF_sp_iirlat_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_IIRLAT_674_LE_ELF_SRCDSPF_SP_IIRLATC674/DSPF_sp_iirlat_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIRLAT_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIRLAT_674_LE_ELF_SRCDSPF_SP_IIRLAT "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_iirlat" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIRLAT_674_LE_ELF_SRCDSPF_SP_IIRLATC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_iirlat/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIRLAT_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIRLAT_674_LE_ELF_SRCDSPF_SP_IIRLAT=../../ >> src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIRLAT_674_LE_ELF_SRCDSPF_SP_IIRLATC674=.././ >> src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_iirlat_674_LE_ELF"
	-@ echo Project DSPF_sp_iirlat_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_iirlat_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_iirlat//c674//DSPF_sp_iirlat_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_iir_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_COFF

src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_COFF: src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_COFF/.project

src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_iir_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_iir_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_IIR_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_IIR_674_LE_COFF_SRCDSPF_SP_IIRC674/DSPF_sp_iir_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_IIR_674_LE_COFF_SRCDSPF_SP_IIRC674/DSPF_sp_iir_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIR_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIR_674_LE_COFF_SRCDSPF_SP_IIR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_iir" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIR_674_LE_COFF_SRCDSPF_SP_IIRC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_iir/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIR_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIR_674_LE_COFF_SRCDSPF_SP_IIR=../../ >> src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIR_674_LE_COFF_SRCDSPF_SP_IIRC674=.././ >> src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_iir_674_LE_COFF"
	-@ echo Project DSPF_sp_iir_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_iir_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_iir_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_ELF

src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_ELF: src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_ELF/.project

src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_iir_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_iir_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_IIR_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_IIR_674_LE_ELF_SRCDSPF_SP_IIRC674/DSPF_sp_iir_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_IIR_674_LE_ELF_SRCDSPF_SP_IIRC674/DSPF_sp_iir_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIR_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIR_674_LE_ELF_SRCDSPF_SP_IIR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_iir" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_IIR_674_LE_ELF_SRCDSPF_SP_IIRC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_iir/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIR_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIR_674_LE_ELF_SRCDSPF_SP_IIR=../../ >> src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_IIR_674_LE_ELF_SRCDSPF_SP_IIRC674=.././ >> src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_iir_674_LE_ELF"
	-@ echo Project DSPF_sp_iir_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_iir_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_iir//c674//DSPF_sp_iir_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_lms_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_COFF

src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_COFF: src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_COFF/.project

src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_lms_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_lms_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_LMS_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_LMS_674_LE_COFF_SRCDSPF_SP_LMSC674/DSPF_sp_lms_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_LMS_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_LMS_674_LE_COFF_SRCDSPF_SP_LMS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_lms" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_LMS_674_LE_COFF_SRCDSPF_SP_LMSC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_lms/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_LMS_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_LMS_674_LE_COFF_SRCDSPF_SP_LMS=../../ >> src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_LMS_674_LE_COFF_SRCDSPF_SP_LMSC674=.././ >> src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_lms_674_LE_COFF"
	-@ echo Project DSPF_sp_lms_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_lms_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_lms_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_ELF

src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_ELF: src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_ELF/.project

src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_lms_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_lms_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_LMS_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_LMS_674_LE_ELF_SRCDSPF_SP_LMSC674/DSPF_sp_lms_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_LMS_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_LMS_674_LE_ELF_SRCDSPF_SP_LMS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_lms" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_LMS_674_LE_ELF_SRCDSPF_SP_LMSC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_lms/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_LMS_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_LMS_674_LE_ELF_SRCDSPF_SP_LMS=../../ >> src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_LMS_674_LE_ELF_SRCDSPF_SP_LMSC674=.././ >> src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_lms_674_LE_ELF"
	-@ echo Project DSPF_sp_lms_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_lms_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_lms//c674//DSPF_sp_lms_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_mat_mul_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_COFF

src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_COFF: src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_COFF/.project

src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_mat_mul_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_mat_mul_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_COFF_SRCDSPF_SP_MAT_MULC674/DSPF_sp_mat_mul_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_COFF_SRCDSPF_SP_MAT_MULC674/DSPF_sp_mat_mul_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_COFF_SRCDSPF_SP_MAT_MUL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_COFF_SRCDSPF_SP_MAT_MULC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_COFF_SRCDSPF_SP_MAT_MUL=../../ >> src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_COFF_SRCDSPF_SP_MAT_MULC674=.././ >> src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_674_LE_COFF"
	-@ echo Project DSPF_sp_mat_mul_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_mat_mul_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_ELF

src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_ELF: src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_ELF/.project

src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_mat_mul_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_mat_mul_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_ELF_SRCDSPF_SP_MAT_MULC674/DSPF_sp_mat_mul_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_ELF_SRCDSPF_SP_MAT_MULC674/DSPF_sp_mat_mul_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_ELF_SRCDSPF_SP_MAT_MUL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_ELF_SRCDSPF_SP_MAT_MULC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_ELF_SRCDSPF_SP_MAT_MUL=../../ >> src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_674_LE_ELF_SRCDSPF_SP_MAT_MULC674=.././ >> src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_674_LE_ELF"
	-@ echo Project DSPF_sp_mat_mul_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_mat_mul//c674//DSPF_sp_mat_mul_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_mat_mul_cplx_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_COFF

src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_COFF: src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_COFF/.project

src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_mat_mul_cplx_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_mat_mul_cplx_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_COFF_SRCDSPF_SP_MAT_MUL_CPLXC674/DSPF_sp_mat_mul_cplx_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_COFF_SRCDSPF_SP_MAT_MUL_CPLXC674/DSPF_sp_mat_mul_cplx_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_COFF_SRCDSPF_SP_MAT_MUL_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_COFF_SRCDSPF_SP_MAT_MUL_CPLXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_cplx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_COFF_SRCDSPF_SP_MAT_MUL_CPLX=../../ >> src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_COFF_SRCDSPF_SP_MAT_MUL_CPLXC674=.././ >> src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_cplx_674_LE_COFF"
	-@ echo Project DSPF_sp_mat_mul_cplx_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_cplx_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_mat_mul_cplx_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_ELF

src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_ELF: src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_ELF/.project

src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_mat_mul_cplx_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_mat_mul_cplx_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_ELF_SRCDSPF_SP_MAT_MUL_CPLXC674/DSPF_sp_mat_mul_cplx_d.c\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_ELF_SRCDSPF_SP_MAT_MUL_CPLXC674/DSPF_sp_mat_mul_cplx_opt.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_ELF_SRCDSPF_SP_MAT_MUL_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_ELF_SRCDSPF_SP_MAT_MUL_CPLXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_cplx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_ELF_SRCDSPF_SP_MAT_MUL_CPLX=../../ >> src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_CPLX_674_LE_ELF_SRCDSPF_SP_MAT_MUL_CPLXC674=.././ >> src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_cplx_674_LE_ELF"
	-@ echo Project DSPF_sp_mat_mul_cplx_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_cplx_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_mat_mul_cplx//c674//DSPF_sp_mat_mul_cplx_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_mat_mul_gemm_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_COFF

src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_COFF: src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_COFF/.project

src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_mat_mul_gemm_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_COFF_SRCDSPF_SP_MAT_MUL_GEMMC674/DSPF_sp_mat_mul_gemm_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_COFF_SRCDSPF_SP_MAT_MUL_GEMM "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_gemm" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_COFF_SRCDSPF_SP_MAT_MUL_GEMMC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_gemm/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_COFF_SRCDSPF_SP_MAT_MUL_GEMM=../../ >> src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_COFF_SRCDSPF_SP_MAT_MUL_GEMMC674=.././ >> src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_674_LE_COFF"
	-@ echo Project DSPF_sp_mat_mul_gemm_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_mat_mul_gemm_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_ELF

src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_ELF: src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_ELF/.project

src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_mat_mul_gemm_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_ELF_SRCDSPF_SP_MAT_MUL_GEMMC674/DSPF_sp_mat_mul_gemm_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_ELF_SRCDSPF_SP_MAT_MUL_GEMM "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_gemm" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_ELF_SRCDSPF_SP_MAT_MUL_GEMMC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_gemm/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_ELF_SRCDSPF_SP_MAT_MUL_GEMM=../../ >> src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_674_LE_ELF_SRCDSPF_SP_MAT_MUL_GEMMC674=.././ >> src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_674_LE_ELF"
	-@ echo Project DSPF_sp_mat_mul_gemm_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_mat_mul_gemm//c674//DSPF_sp_mat_mul_gemm_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF

src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF: src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF/.project

src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_COFF_SRCDSPF_SP_MAT_MUL_GEMM_CPLXC674/DSPF_sp_mat_mul_gemm_cplx_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_COFF_SRCDSPF_SP_MAT_MUL_GEMM_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_gemm_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_COFF_SRCDSPF_SP_MAT_MUL_GEMM_CPLXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_gemm_cplx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_COFF_SRCDSPF_SP_MAT_MUL_GEMM_CPLX=../../ >> src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_COFF_SRCDSPF_SP_MAT_MUL_GEMM_CPLXC674=.././ >> src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF"
	-@ echo Project DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF

src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF: src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF/.project

src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_ELF_SRCDSPF_SP_MAT_MUL_GEMM_CPLXC674/DSPF_sp_mat_mul_gemm_cplx_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_ELF_SRCDSPF_SP_MAT_MUL_GEMM_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_gemm_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_ELF_SRCDSPF_SP_MAT_MUL_GEMM_CPLXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_mul_gemm_cplx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_ELF_SRCDSPF_SP_MAT_MUL_GEMM_CPLX=../../ >> src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_MUL_GEMM_CPLX_674_LE_ELF_SRCDSPF_SP_MAT_MUL_GEMM_CPLXC674=.././ >> src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF"
	-@ echo Project DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_mat_mul_gemm_cplx//c674//DSPF_sp_mat_mul_gemm_cplx_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_mat_trans_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_COFF

src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_COFF: src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_COFF/.project

src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_mat_trans_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_mat_trans_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_COFF_SRCDSPF_SP_MAT_TRANSC674/DSPF_sp_mat_trans_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_COFF_SRCDSPF_SP_MAT_TRANS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_trans" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_COFF_SRCDSPF_SP_MAT_TRANSC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_trans/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_COFF_SRCDSPF_SP_MAT_TRANS=../../ >> src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_COFF_SRCDSPF_SP_MAT_TRANSC674=.././ >> src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_trans_674_LE_COFF"
	-@ echo Project DSPF_sp_mat_trans_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_trans_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_mat_trans_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_ELF

src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_ELF: src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_ELF/.project

src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_mat_trans_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_mat_trans_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_ELF_SRCDSPF_SP_MAT_TRANSC674/DSPF_sp_mat_trans_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_ELF_SRCDSPF_SP_MAT_TRANS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_trans" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_ELF_SRCDSPF_SP_MAT_TRANSC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_mat_trans/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_ELF_SRCDSPF_SP_MAT_TRANS=../../ >> src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAT_TRANS_674_LE_ELF_SRCDSPF_SP_MAT_TRANSC674=.././ >> src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_trans_674_LE_ELF"
	-@ echo Project DSPF_sp_mat_trans_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_mat_trans_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_mat_trans//c674//DSPF_sp_mat_trans_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_maxidx_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_COFF

src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_COFF: src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_COFF/.project

src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_maxidx_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_maxidx_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAXIDX_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAXIDX_674_LE_COFF_SRCDSPF_SP_MAXIDXC674/DSPF_sp_maxidx_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXIDX_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXIDX_674_LE_COFF_SRCDSPF_SP_MAXIDX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_maxidx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXIDX_674_LE_COFF_SRCDSPF_SP_MAXIDXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_maxidx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXIDX_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXIDX_674_LE_COFF_SRCDSPF_SP_MAXIDX=../../ >> src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXIDX_674_LE_COFF_SRCDSPF_SP_MAXIDXC674=.././ >> src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_maxidx_674_LE_COFF"
	-@ echo Project DSPF_sp_maxidx_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_maxidx_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_maxidx_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_ELF

src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_ELF: src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_ELF/.project

src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_maxidx_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_maxidx_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAXIDX_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAXIDX_674_LE_ELF_SRCDSPF_SP_MAXIDXC674/DSPF_sp_maxidx_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXIDX_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXIDX_674_LE_ELF_SRCDSPF_SP_MAXIDX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_maxidx" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXIDX_674_LE_ELF_SRCDSPF_SP_MAXIDXC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_maxidx/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXIDX_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXIDX_674_LE_ELF_SRCDSPF_SP_MAXIDX=../../ >> src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXIDX_674_LE_ELF_SRCDSPF_SP_MAXIDXC674=.././ >> src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_maxidx_674_LE_ELF"
	-@ echo Project DSPF_sp_maxidx_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_maxidx_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_maxidx//c674//DSPF_sp_maxidx_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_maxval_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_COFF

src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_COFF: src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_COFF/.project

src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_maxval_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_maxval_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAXVAL_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAXVAL_674_LE_COFF_SRCDSPF_SP_MAXVALC674/DSPF_sp_maxval_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXVAL_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXVAL_674_LE_COFF_SRCDSPF_SP_MAXVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_maxval" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXVAL_674_LE_COFF_SRCDSPF_SP_MAXVALC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_maxval/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXVAL_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXVAL_674_LE_COFF_SRCDSPF_SP_MAXVAL=../../ >> src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXVAL_674_LE_COFF_SRCDSPF_SP_MAXVALC674=.././ >> src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_maxval_674_LE_COFF"
	-@ echo Project DSPF_sp_maxval_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_maxval_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_maxval_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_ELF

src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_ELF: src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_ELF/.project

src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_maxval_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_maxval_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MAXVAL_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MAXVAL_674_LE_ELF_SRCDSPF_SP_MAXVALC674/DSPF_sp_maxval_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXVAL_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXVAL_674_LE_ELF_SRCDSPF_SP_MAXVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_maxval" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MAXVAL_674_LE_ELF_SRCDSPF_SP_MAXVALC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_maxval/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXVAL_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXVAL_674_LE_ELF_SRCDSPF_SP_MAXVAL=../../ >> src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MAXVAL_674_LE_ELF_SRCDSPF_SP_MAXVALC674=.././ >> src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_maxval_674_LE_ELF"
	-@ echo Project DSPF_sp_maxval_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_maxval_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_maxval//c674//DSPF_sp_maxval_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_minerr_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_COFF

src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_COFF: src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_COFF/.project

src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_minerr_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_minerr_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MINERR_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MINERR_674_LE_COFF_SRCDSPF_SP_MINERRC674/DSPF_sp_minerr_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINERR_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINERR_674_LE_COFF_SRCDSPF_SP_MINERR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_minerr" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINERR_674_LE_COFF_SRCDSPF_SP_MINERRC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_minerr/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINERR_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINERR_674_LE_COFF_SRCDSPF_SP_MINERR=../../ >> src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINERR_674_LE_COFF_SRCDSPF_SP_MINERRC674=.././ >> src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_minerr_674_LE_COFF"
	-@ echo Project DSPF_sp_minerr_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_minerr_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_minerr_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_ELF

src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_ELF: src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_ELF/.project

src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_minerr_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_minerr_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MINERR_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MINERR_674_LE_ELF_SRCDSPF_SP_MINERRC674/DSPF_sp_minerr_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINERR_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINERR_674_LE_ELF_SRCDSPF_SP_MINERR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_minerr" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINERR_674_LE_ELF_SRCDSPF_SP_MINERRC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_minerr/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINERR_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINERR_674_LE_ELF_SRCDSPF_SP_MINERR=../../ >> src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINERR_674_LE_ELF_SRCDSPF_SP_MINERRC674=.././ >> src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_minerr_674_LE_ELF"
	-@ echo Project DSPF_sp_minerr_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_minerr_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_minerr//c674//DSPF_sp_minerr_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_minval_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_COFF

src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_COFF: src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_COFF/.project

src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_minval_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_minval_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MINVAL_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MINVAL_674_LE_COFF_SRCDSPF_SP_MINVALC674/DSPF_sp_minval_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINVAL_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINVAL_674_LE_COFF_SRCDSPF_SP_MINVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_minval" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINVAL_674_LE_COFF_SRCDSPF_SP_MINVALC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_minval/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINVAL_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINVAL_674_LE_COFF_SRCDSPF_SP_MINVAL=../../ >> src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINVAL_674_LE_COFF_SRCDSPF_SP_MINVALC674=.././ >> src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_minval_674_LE_COFF"
	-@ echo Project DSPF_sp_minval_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_minval_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_minval_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_ELF

src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_ELF: src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_ELF/.project

src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_minval_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_minval_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_MINVAL_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_MINVAL_674_LE_ELF_SRCDSPF_SP_MINVALC674/DSPF_sp_minval_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINVAL_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINVAL_674_LE_ELF_SRCDSPF_SP_MINVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_minval" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_MINVAL_674_LE_ELF_SRCDSPF_SP_MINVALC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_minval/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINVAL_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINVAL_674_LE_ELF_SRCDSPF_SP_MINVAL=../../ >> src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_MINVAL_674_LE_ELF_SRCDSPF_SP_MINVALC674=.././ >> src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_minval_674_LE_ELF"
	-@ echo Project DSPF_sp_minval_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_minval_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_minval//c674//DSPF_sp_minval_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_vecmul_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_COFF

src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_COFF: src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_COFF/.project

src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_vecmul_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_vecmul_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_VECMUL_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_VECMUL_674_LE_COFF_SRCDSPF_SP_VECMULC674/DSPF_sp_vecmul_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECMUL_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECMUL_674_LE_COFF_SRCDSPF_SP_VECMUL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecmul" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECMUL_674_LE_COFF_SRCDSPF_SP_VECMULC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecmul/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECMUL_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECMUL_674_LE_COFF_SRCDSPF_SP_VECMUL=../../ >> src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECMUL_674_LE_COFF_SRCDSPF_SP_VECMULC674=.././ >> src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecmul_674_LE_COFF"
	-@ echo Project DSPF_sp_vecmul_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecmul_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_vecmul_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_ELF

src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_ELF: src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_ELF/.project

src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_vecmul_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_vecmul_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_VECMUL_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_VECMUL_674_LE_ELF_SRCDSPF_SP_VECMULC674/DSPF_sp_vecmul_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECMUL_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECMUL_674_LE_ELF_SRCDSPF_SP_VECMUL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecmul" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECMUL_674_LE_ELF_SRCDSPF_SP_VECMULC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecmul/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECMUL_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECMUL_674_LE_ELF_SRCDSPF_SP_VECMUL=../../ >> src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECMUL_674_LE_ELF_SRCDSPF_SP_VECMULC674=.././ >> src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecmul_674_LE_ELF"
	-@ echo Project DSPF_sp_vecmul_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecmul_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_vecmul//c674//DSPF_sp_vecmul_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_vecrecip_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_COFF

src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_COFF: src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_COFF/.project

src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_vecrecip_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_vecrecip_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_VECRECIP_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_VECRECIP_674_LE_COFF_SRCDSPF_SP_VECRECIPC674/DSPF_sp_vecrecip_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECRECIP_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECRECIP_674_LE_COFF_SRCDSPF_SP_VECRECIP "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecrecip" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECRECIP_674_LE_COFF_SRCDSPF_SP_VECRECIPC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecrecip/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECRECIP_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECRECIP_674_LE_COFF_SRCDSPF_SP_VECRECIP=../../ >> src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECRECIP_674_LE_COFF_SRCDSPF_SP_VECRECIPC674=.././ >> src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecrecip_674_LE_COFF"
	-@ echo Project DSPF_sp_vecrecip_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecrecip_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_vecrecip_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_ELF

src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_ELF: src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_ELF/.project

src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_vecrecip_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_vecrecip_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_VECRECIP_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_VECRECIP_674_LE_ELF_SRCDSPF_SP_VECRECIPC674/DSPF_sp_vecrecip_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECRECIP_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECRECIP_674_LE_ELF_SRCDSPF_SP_VECRECIP "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecrecip" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECRECIP_674_LE_ELF_SRCDSPF_SP_VECRECIPC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecrecip/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECRECIP_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECRECIP_674_LE_ELF_SRCDSPF_SP_VECRECIP=../../ >> src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECRECIP_674_LE_ELF_SRCDSPF_SP_VECRECIPC674=.././ >> src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecrecip_674_LE_ELF"
	-@ echo Project DSPF_sp_vecrecip_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecrecip_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_vecrecip//c674//DSPF_sp_vecrecip_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_vecsum_sq_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_COFF

src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_COFF: src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_COFF/.project

src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_vecsum_sq_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_vecsum_sq_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_COFF_SRCDSPF_SP_VECSUM_SQC674/DSPF_sp_vecsum_sq_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_COFF_SRCDSPF_SP_VECSUM_SQ "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecsum_sq" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_COFF_SRCDSPF_SP_VECSUM_SQC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecsum_sq/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_COFF_SRCDSPF_SP_VECSUM_SQ=../../ >> src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_COFF_SRCDSPF_SP_VECSUM_SQC674=.././ >> src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecsum_sq_674_LE_COFF"
	-@ echo Project DSPF_sp_vecsum_sq_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecsum_sq_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_vecsum_sq_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_ELF

src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_ELF: src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_ELF/.project

src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_vecsum_sq_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_vecsum_sq_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_ELF_SRCDSPF_SP_VECSUM_SQC674/DSPF_sp_vecsum_sq_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_ELF_SRCDSPF_SP_VECSUM_SQ "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecsum_sq" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_ELF_SRCDSPF_SP_VECSUM_SQC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_vecsum_sq/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_ELF_SRCDSPF_SP_VECSUM_SQ=../../ >> src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_VECSUM_SQ_674_LE_ELF_SRCDSPF_SP_VECSUM_SQC674=.././ >> src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecsum_sq_674_LE_ELF"
	-@ echo Project DSPF_sp_vecsum_sq_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_vecsum_sq_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_vecsum_sq//c674//DSPF_sp_vecsum_sq_674_LE_ELF"


#############################################################

# Rule to Build Project DSPF_sp_w_vec_674_LE_COFF

#############################################################

.projects: src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_COFF

src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_COFF: src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_COFF/.project

src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_w_vec_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_w_vec_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_W_VEC_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_W_VEC_674_LE_COFF_SRCDSPF_SP_W_VECC674/DSPF_sp_w_vec_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_W_VEC_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_W_VEC_674_LE_COFF_SRCDSPF_SP_W_VEC "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_w_vec" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_W_VEC_674_LE_COFF_SRCDSPF_SP_W_VECC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_w_vec/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_W_VEC_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_W_VEC_674_LE_COFF_SRCDSPF_SP_W_VEC=../../ >> src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSPF_SP_W_VEC_674_LE_COFF_SRCDSPF_SP_W_VECC674=.././ >> src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_w_vec_674_LE_COFF"
	-@ echo Project DSPF_sp_w_vec_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_w_vec_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_COFF"


#############################################################

# Rule to Build Project DSPF_sp_w_vec_674_LE_ELF

#############################################################

.projects: src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_ELF

src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_ELF: src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_ELF/.project

src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSPF_sp_w_vec_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSPF_sp_w_vec_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSPF_SP_W_VEC_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSPF_SP_W_VEC_674_LE_ELF_SRCDSPF_SP_W_VECC674/DSPF_sp_w_vec_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_W_VEC_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_W_VEC_674_LE_ELF_SRCDSPF_SP_W_VEC "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_w_vec" \
 -ccs.definePathVariable EXT_ROOT__DSPF_SP_W_VEC_674_LE_ELF_SRCDSPF_SP_W_VECC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSPF_sp_w_vec/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_W_VEC_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_W_VEC_674_LE_ELF_SRCDSPF_SP_W_VEC=../../ >> src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSPF_SP_W_VEC_674_LE_ELF_SRCDSPF_SP_W_VECC674=.././ >> src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_w_vec_674_LE_ELF"
	-@ echo Project DSPF_sp_w_vec_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSPF_sp_w_vec_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSPF_sp_w_vec//c674//DSPF_sp_w_vec_674_LE_ELF"


#############################################################

# Rule to Build Project DSP_fir_r8_h16_674_LE_COFF

#############################################################

.projects: src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_COFF

src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_COFF: src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_COFF/.project

src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_h16_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_h16_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H16_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H16_674_LE_COFF_SRCDSP_FIR_R8_H16C674/DSP_fir_r8_h16_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H16_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H16_674_LE_COFF_SRCDSP_FIR_R8_H16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h16" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H16_674_LE_COFF_SRCDSP_FIR_R8_H16C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h16/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H16_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H16_674_LE_COFF_SRCDSP_FIR_R8_H16=../../ >> src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H16_674_LE_COFF_SRCDSP_FIR_R8_H16C674=.././ >> src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h16_674_LE_COFF"
	-@ echo Project DSP_fir_r8_h16_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h16_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_COFF"


#############################################################

# Rule to Build Project DSP_fir_r8_h16_674_LE_ELF

#############################################################

.projects: src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_ELF

src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_ELF: src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_ELF/.project

src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_h16_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_h16_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H16_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H16_674_LE_ELF_SRCDSP_FIR_R8_H16C674/DSP_fir_r8_h16_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H16_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H16_674_LE_ELF_SRCDSP_FIR_R8_H16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h16" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H16_674_LE_ELF_SRCDSP_FIR_R8_H16C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h16/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H16_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H16_674_LE_ELF_SRCDSP_FIR_R8_H16=../../ >> src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H16_674_LE_ELF_SRCDSP_FIR_R8_H16C674=.././ >> src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h16_674_LE_ELF"
	-@ echo Project DSP_fir_r8_h16_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h16_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_r8_h16//c674//DSP_fir_r8_h16_674_LE_ELF"


#############################################################

# Rule to Build Project DSP_fir_r8_h24_674_LE_COFF

#############################################################

.projects: src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_COFF

src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_COFF: src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_COFF/.project

src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_h24_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_h24_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H24_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H24_674_LE_COFF_SRCDSP_FIR_R8_H24C674/DSP_fir_r8_h24_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H24_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H24_674_LE_COFF_SRCDSP_FIR_R8_H24 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h24" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H24_674_LE_COFF_SRCDSP_FIR_R8_H24C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h24/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H24_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H24_674_LE_COFF_SRCDSP_FIR_R8_H24=../../ >> src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H24_674_LE_COFF_SRCDSP_FIR_R8_H24C674=.././ >> src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h24_674_LE_COFF"
	-@ echo Project DSP_fir_r8_h24_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h24_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_COFF"


#############################################################

# Rule to Build Project DSP_fir_r8_h24_674_LE_ELF

#############################################################

.projects: src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_ELF

src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_ELF: src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_ELF/.project

src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_h24_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_h24_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H24_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H24_674_LE_ELF_SRCDSP_FIR_R8_H24C674/DSP_fir_r8_h24_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H24_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H24_674_LE_ELF_SRCDSP_FIR_R8_H24 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h24" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H24_674_LE_ELF_SRCDSP_FIR_R8_H24C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h24/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H24_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H24_674_LE_ELF_SRCDSP_FIR_R8_H24=../../ >> src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H24_674_LE_ELF_SRCDSP_FIR_R8_H24C674=.././ >> src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h24_674_LE_ELF"
	-@ echo Project DSP_fir_r8_h24_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h24_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_r8_h24//c674//DSP_fir_r8_h24_674_LE_ELF"


#############################################################

# Rule to Build Project DSP_fir_r8_h8_674_LE_COFF

#############################################################

.projects: src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_COFF

src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_COFF: src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_COFF/.project

src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_h8_674_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_h8_674_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H8_674_LE_COFF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H8_674_LE_COFF_SRCDSP_FIR_R8_H8C674/DSP_fir_r8_h8_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw -Dti_targets_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H8_674_LE_COFF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H8_674_LE_COFF_SRCDSP_FIR_R8_H8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H8_674_LE_COFF_SRCDSP_FIR_R8_H8C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h8/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H8_674_LE_COFF_SRCCOMMONC674=../../../common/c674 >> src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H8_674_LE_COFF_SRCDSP_FIR_R8_H8=../../ >> src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H8_674_LE_COFF_SRCDSP_FIR_R8_H8C674=.././ >> src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h8_674_LE_COFF"
	-@ echo Project DSP_fir_r8_h8_674_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h8_674_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_COFF"


#############################################################

# Rule to Build Project DSP_fir_r8_h8_674_LE_ELF

#############################################################

.projects: src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_ELF

src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_ELF: src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_ELF/.project

src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_h8_674_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_h8_674_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H8_674_LE_ELF_SRCCOMMONC674/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_H8_674_LE_ELF_SRCDSP_FIR_R8_H8C674/DSP_fir_r8_h8_d.c\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv6740 -k -mw --strip_coff_underscore -Dti_targets_elf_C674 --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c674 -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H8_674_LE_ELF_SRCCOMMONC674 "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c674" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H8_674_LE_ELF_SRCDSP_FIR_R8_H8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_H8_674_LE_ELF_SRCDSP_FIR_R8_H8C674 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_h8/c674" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H8_674_LE_ELF_SRCCOMMONC674=../../../common/c674 >> src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H8_674_LE_ELF_SRCDSP_FIR_R8_H8=../../ >> src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_H8_674_LE_ELF_SRCDSP_FIR_R8_H8C674=.././ >> src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h8_674_LE_ELF"
	-@ echo Project DSP_fir_r8_h8_674_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_h8_674_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_r8_h8//c674//DSP_fir_r8_h8_674_LE_ELF"

