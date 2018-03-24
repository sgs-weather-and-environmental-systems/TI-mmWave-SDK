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
export DSPLIB_INSTALL_DIR ?= C:/ti/dsplib_c64Px_3_4_0_0/packages

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

# Rule to Build Project DSP_add16_64P_LE_COFF

#############################################################

.projects: src/DSP_add16//c64P//DSP_add16_64P_LE_COFF

src/DSP_add16//c64P//DSP_add16_64P_LE_COFF: src/DSP_add16//c64P//DSP_add16_64P_LE_COFF/.project

src/DSP_add16//c64P//DSP_add16_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_add16_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_add16_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_ADD16_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_ADD16_64P_LE_COFF_SRCDSP_ADD16C64P/DSP_add16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_add16//c64P//DSP_add16_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_LE_COFF_SRCDSP_ADD16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add16" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_LE_COFF_SRCDSP_ADD16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_add16//c64P//DSP_add16_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_add16//c64P//DSP_add16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_add16//c64P//DSP_add16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_LE_COFF_SRCDSP_ADD16=../../ >> src/DSP_add16//c64P//DSP_add16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_LE_COFF_SRCDSP_ADD16C64P=.././ >> src/DSP_add16//c64P//DSP_add16_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_add16_64P_LE_COFF"
	-@ echo Project DSP_add16_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_add16_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_add16//c64P//DSP_add16_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_add16_64P_BE_COFF

#############################################################

.projects: src/DSP_add16//c64P//DSP_add16_64P_BE_COFF

src/DSP_add16//c64P//DSP_add16_64P_BE_COFF: src/DSP_add16//c64P//DSP_add16_64P_BE_COFF/.project

src/DSP_add16//c64P//DSP_add16_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_add16_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_add16_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_ADD16_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_ADD16_64P_BE_COFF_SRCDSP_ADD16C64P/DSP_add16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_add16//c64P//DSP_add16_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_BE_COFF_SRCDSP_ADD16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add16" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_BE_COFF_SRCDSP_ADD16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_add16//c64P//DSP_add16_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_add16//c64P//DSP_add16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_add16//c64P//DSP_add16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_BE_COFF_SRCDSP_ADD16=../../ >> src/DSP_add16//c64P//DSP_add16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_BE_COFF_SRCDSP_ADD16C64P=.././ >> src/DSP_add16//c64P//DSP_add16_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_add16_64P_BE_COFF"
	-@ echo Project DSP_add16_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_add16_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_add16//c64P//DSP_add16_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_add16_64P_LE_ELF

#############################################################

.projects: src/DSP_add16//c64P//DSP_add16_64P_LE_ELF

src/DSP_add16//c64P//DSP_add16_64P_LE_ELF: src/DSP_add16//c64P//DSP_add16_64P_LE_ELF/.project

src/DSP_add16//c64P//DSP_add16_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_add16_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_add16_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_ADD16_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_ADD16_64P_LE_ELF_SRCDSP_ADD16C64P/DSP_add16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_add16//c64P//DSP_add16_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_LE_ELF_SRCDSP_ADD16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add16" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_LE_ELF_SRCDSP_ADD16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_add16//c64P//DSP_add16_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_add16//c64P//DSP_add16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_add16//c64P//DSP_add16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_LE_ELF_SRCDSP_ADD16=../../ >> src/DSP_add16//c64P//DSP_add16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_LE_ELF_SRCDSP_ADD16C64P=.././ >> src/DSP_add16//c64P//DSP_add16_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_add16_64P_LE_ELF"
	-@ echo Project DSP_add16_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_add16_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_add16//c64P//DSP_add16_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_add16_64P_BE_ELF

#############################################################

.projects: src/DSP_add16//c64P//DSP_add16_64P_BE_ELF

src/DSP_add16//c64P//DSP_add16_64P_BE_ELF: src/DSP_add16//c64P//DSP_add16_64P_BE_ELF/.project

src/DSP_add16//c64P//DSP_add16_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_add16_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_add16_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_ADD16_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_ADD16_64P_BE_ELF_SRCDSP_ADD16C64P/DSP_add16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_add16//c64P//DSP_add16_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_BE_ELF_SRCDSP_ADD16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add16" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD16_64P_BE_ELF_SRCDSP_ADD16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_add16//c64P//DSP_add16_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_add16//c64P//DSP_add16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_add16//c64P//DSP_add16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_BE_ELF_SRCDSP_ADD16=../../ >> src/DSP_add16//c64P//DSP_add16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD16_64P_BE_ELF_SRCDSP_ADD16C64P=.././ >> src/DSP_add16//c64P//DSP_add16_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_add16_64P_BE_ELF"
	-@ echo Project DSP_add16_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_add16_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_add16//c64P//DSP_add16_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_add32_64P_LE_COFF

#############################################################

.projects: src/DSP_add32//c64P//DSP_add32_64P_LE_COFF

src/DSP_add32//c64P//DSP_add32_64P_LE_COFF: src/DSP_add32//c64P//DSP_add32_64P_LE_COFF/.project

src/DSP_add32//c64P//DSP_add32_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_add32_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_add32_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_ADD32_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_ADD32_64P_LE_COFF_SRCDSP_ADD32C64P/DSP_add32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_add32//c64P//DSP_add32_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_LE_COFF_SRCDSP_ADD32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add32" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_LE_COFF_SRCDSP_ADD32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_add32//c64P//DSP_add32_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_add32//c64P//DSP_add32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_add32//c64P//DSP_add32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_LE_COFF_SRCDSP_ADD32=../../ >> src/DSP_add32//c64P//DSP_add32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_LE_COFF_SRCDSP_ADD32C64P=.././ >> src/DSP_add32//c64P//DSP_add32_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_add32_64P_LE_COFF"
	-@ echo Project DSP_add32_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_add32_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_add32//c64P//DSP_add32_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_add32_64P_BE_COFF

#############################################################

.projects: src/DSP_add32//c64P//DSP_add32_64P_BE_COFF

src/DSP_add32//c64P//DSP_add32_64P_BE_COFF: src/DSP_add32//c64P//DSP_add32_64P_BE_COFF/.project

src/DSP_add32//c64P//DSP_add32_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_add32_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_add32_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_ADD32_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_ADD32_64P_BE_COFF_SRCDSP_ADD32C64P/DSP_add32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_add32//c64P//DSP_add32_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_BE_COFF_SRCDSP_ADD32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add32" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_BE_COFF_SRCDSP_ADD32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_add32//c64P//DSP_add32_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_add32//c64P//DSP_add32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_add32//c64P//DSP_add32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_BE_COFF_SRCDSP_ADD32=../../ >> src/DSP_add32//c64P//DSP_add32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_BE_COFF_SRCDSP_ADD32C64P=.././ >> src/DSP_add32//c64P//DSP_add32_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_add32_64P_BE_COFF"
	-@ echo Project DSP_add32_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_add32_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_add32//c64P//DSP_add32_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_add32_64P_LE_ELF

#############################################################

.projects: src/DSP_add32//c64P//DSP_add32_64P_LE_ELF

src/DSP_add32//c64P//DSP_add32_64P_LE_ELF: src/DSP_add32//c64P//DSP_add32_64P_LE_ELF/.project

src/DSP_add32//c64P//DSP_add32_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_add32_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_add32_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_ADD32_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_ADD32_64P_LE_ELF_SRCDSP_ADD32C64P/DSP_add32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_add32//c64P//DSP_add32_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_LE_ELF_SRCDSP_ADD32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add32" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_LE_ELF_SRCDSP_ADD32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_add32//c64P//DSP_add32_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_add32//c64P//DSP_add32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_add32//c64P//DSP_add32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_LE_ELF_SRCDSP_ADD32=../../ >> src/DSP_add32//c64P//DSP_add32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_LE_ELF_SRCDSP_ADD32C64P=.././ >> src/DSP_add32//c64P//DSP_add32_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_add32_64P_LE_ELF"
	-@ echo Project DSP_add32_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_add32_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_add32//c64P//DSP_add32_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_add32_64P_BE_ELF

#############################################################

.projects: src/DSP_add32//c64P//DSP_add32_64P_BE_ELF

src/DSP_add32//c64P//DSP_add32_64P_BE_ELF: src/DSP_add32//c64P//DSP_add32_64P_BE_ELF/.project

src/DSP_add32//c64P//DSP_add32_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_add32_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_add32_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_ADD32_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_ADD32_64P_BE_ELF_SRCDSP_ADD32C64P/DSP_add32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_add32//c64P//DSP_add32_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_BE_ELF_SRCDSP_ADD32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add32" \
 -ccs.definePathVariable EXT_ROOT__DSP_ADD32_64P_BE_ELF_SRCDSP_ADD32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_add32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_add32//c64P//DSP_add32_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_add32//c64P//DSP_add32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_add32//c64P//DSP_add32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_BE_ELF_SRCDSP_ADD32=../../ >> src/DSP_add32//c64P//DSP_add32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_ADD32_64P_BE_ELF_SRCDSP_ADD32C64P=.././ >> src/DSP_add32//c64P//DSP_add32_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_add32_64P_BE_ELF"
	-@ echo Project DSP_add32_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_add32_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_add32//c64P//DSP_add32_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_autocor_64P_LE_COFF

#############################################################

.projects: src/DSP_autocor//c64P//DSP_autocor_64P_LE_COFF

src/DSP_autocor//c64P//DSP_autocor_64P_LE_COFF: src/DSP_autocor//c64P//DSP_autocor_64P_LE_COFF/.project

src/DSP_autocor//c64P//DSP_autocor_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_autocor_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_autocor_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_AUTOCOR_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_AUTOCOR_64P_LE_COFF_SRCDSP_AUTOCORC64P/DSP_autocor_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_autocor//c64P//DSP_autocor_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_LE_COFF_SRCDSP_AUTOCOR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_autocor" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_LE_COFF_SRCDSP_AUTOCORC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_autocor/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_autocor//c64P//DSP_autocor_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_autocor//c64P//DSP_autocor_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_autocor//c64P//DSP_autocor_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_LE_COFF_SRCDSP_AUTOCOR=../../ >> src/DSP_autocor//c64P//DSP_autocor_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_LE_COFF_SRCDSP_AUTOCORC64P=.././ >> src/DSP_autocor//c64P//DSP_autocor_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_autocor_64P_LE_COFF"
	-@ echo Project DSP_autocor_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_autocor_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_autocor//c64P//DSP_autocor_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_autocor_64P_BE_COFF

#############################################################

.projects: src/DSP_autocor//c64P//DSP_autocor_64P_BE_COFF

src/DSP_autocor//c64P//DSP_autocor_64P_BE_COFF: src/DSP_autocor//c64P//DSP_autocor_64P_BE_COFF/.project

src/DSP_autocor//c64P//DSP_autocor_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_autocor_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_autocor_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_AUTOCOR_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_AUTOCOR_64P_BE_COFF_SRCDSP_AUTOCORC64P/DSP_autocor_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_autocor//c64P//DSP_autocor_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_BE_COFF_SRCDSP_AUTOCOR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_autocor" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_BE_COFF_SRCDSP_AUTOCORC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_autocor/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_autocor//c64P//DSP_autocor_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_autocor//c64P//DSP_autocor_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_autocor//c64P//DSP_autocor_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_BE_COFF_SRCDSP_AUTOCOR=../../ >> src/DSP_autocor//c64P//DSP_autocor_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_BE_COFF_SRCDSP_AUTOCORC64P=.././ >> src/DSP_autocor//c64P//DSP_autocor_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_autocor_64P_BE_COFF"
	-@ echo Project DSP_autocor_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_autocor_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_autocor//c64P//DSP_autocor_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_autocor_64P_LE_ELF

#############################################################

.projects: src/DSP_autocor//c64P//DSP_autocor_64P_LE_ELF

src/DSP_autocor//c64P//DSP_autocor_64P_LE_ELF: src/DSP_autocor//c64P//DSP_autocor_64P_LE_ELF/.project

src/DSP_autocor//c64P//DSP_autocor_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_autocor_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_autocor_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_AUTOCOR_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_AUTOCOR_64P_LE_ELF_SRCDSP_AUTOCORC64P/DSP_autocor_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_autocor//c64P//DSP_autocor_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_LE_ELF_SRCDSP_AUTOCOR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_autocor" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_LE_ELF_SRCDSP_AUTOCORC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_autocor/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_autocor//c64P//DSP_autocor_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_autocor//c64P//DSP_autocor_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_autocor//c64P//DSP_autocor_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_LE_ELF_SRCDSP_AUTOCOR=../../ >> src/DSP_autocor//c64P//DSP_autocor_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_LE_ELF_SRCDSP_AUTOCORC64P=.././ >> src/DSP_autocor//c64P//DSP_autocor_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_autocor_64P_LE_ELF"
	-@ echo Project DSP_autocor_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_autocor_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_autocor//c64P//DSP_autocor_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_autocor_64P_BE_ELF

#############################################################

.projects: src/DSP_autocor//c64P//DSP_autocor_64P_BE_ELF

src/DSP_autocor//c64P//DSP_autocor_64P_BE_ELF: src/DSP_autocor//c64P//DSP_autocor_64P_BE_ELF/.project

src/DSP_autocor//c64P//DSP_autocor_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_autocor_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_autocor_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_AUTOCOR_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_AUTOCOR_64P_BE_ELF_SRCDSP_AUTOCORC64P/DSP_autocor_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_autocor//c64P//DSP_autocor_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_BE_ELF_SRCDSP_AUTOCOR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_autocor" \
 -ccs.definePathVariable EXT_ROOT__DSP_AUTOCOR_64P_BE_ELF_SRCDSP_AUTOCORC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_autocor/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_autocor//c64P//DSP_autocor_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_autocor//c64P//DSP_autocor_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_autocor//c64P//DSP_autocor_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_BE_ELF_SRCDSP_AUTOCOR=../../ >> src/DSP_autocor//c64P//DSP_autocor_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_AUTOCOR_64P_BE_ELF_SRCDSP_AUTOCORC64P=.././ >> src/DSP_autocor//c64P//DSP_autocor_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_autocor_64P_BE_ELF"
	-@ echo Project DSP_autocor_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_autocor_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_autocor//c64P//DSP_autocor_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_bexp_64P_LE_COFF

#############################################################

.projects: src/DSP_bexp//c64P//DSP_bexp_64P_LE_COFF

src/DSP_bexp//c64P//DSP_bexp_64P_LE_COFF: src/DSP_bexp//c64P//DSP_bexp_64P_LE_COFF/.project

src/DSP_bexp//c64P//DSP_bexp_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_bexp_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_bexp_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BEXP_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BEXP_64P_LE_COFF_SRCDSP_BEXPC64P/DSP_bexp_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_bexp//c64P//DSP_bexp_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_LE_COFF_SRCDSP_BEXP "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_bexp" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_LE_COFF_SRCDSP_BEXPC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_bexp/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_bexp//c64P//DSP_bexp_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_bexp//c64P//DSP_bexp_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_bexp//c64P//DSP_bexp_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_LE_COFF_SRCDSP_BEXP=../../ >> src/DSP_bexp//c64P//DSP_bexp_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_LE_COFF_SRCDSP_BEXPC64P=.././ >> src/DSP_bexp//c64P//DSP_bexp_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_bexp_64P_LE_COFF"
	-@ echo Project DSP_bexp_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_bexp_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_bexp//c64P//DSP_bexp_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_bexp_64P_BE_COFF

#############################################################

.projects: src/DSP_bexp//c64P//DSP_bexp_64P_BE_COFF

src/DSP_bexp//c64P//DSP_bexp_64P_BE_COFF: src/DSP_bexp//c64P//DSP_bexp_64P_BE_COFF/.project

src/DSP_bexp//c64P//DSP_bexp_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_bexp_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_bexp_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BEXP_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BEXP_64P_BE_COFF_SRCDSP_BEXPC64P/DSP_bexp_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_bexp//c64P//DSP_bexp_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_BE_COFF_SRCDSP_BEXP "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_bexp" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_BE_COFF_SRCDSP_BEXPC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_bexp/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_bexp//c64P//DSP_bexp_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_bexp//c64P//DSP_bexp_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_bexp//c64P//DSP_bexp_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_BE_COFF_SRCDSP_BEXP=../../ >> src/DSP_bexp//c64P//DSP_bexp_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_BE_COFF_SRCDSP_BEXPC64P=.././ >> src/DSP_bexp//c64P//DSP_bexp_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_bexp_64P_BE_COFF"
	-@ echo Project DSP_bexp_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_bexp_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_bexp//c64P//DSP_bexp_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_bexp_64P_LE_ELF

#############################################################

.projects: src/DSP_bexp//c64P//DSP_bexp_64P_LE_ELF

src/DSP_bexp//c64P//DSP_bexp_64P_LE_ELF: src/DSP_bexp//c64P//DSP_bexp_64P_LE_ELF/.project

src/DSP_bexp//c64P//DSP_bexp_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_bexp_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_bexp_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BEXP_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BEXP_64P_LE_ELF_SRCDSP_BEXPC64P/DSP_bexp_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_bexp//c64P//DSP_bexp_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_LE_ELF_SRCDSP_BEXP "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_bexp" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_LE_ELF_SRCDSP_BEXPC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_bexp/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_bexp//c64P//DSP_bexp_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_bexp//c64P//DSP_bexp_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_bexp//c64P//DSP_bexp_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_LE_ELF_SRCDSP_BEXP=../../ >> src/DSP_bexp//c64P//DSP_bexp_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_LE_ELF_SRCDSP_BEXPC64P=.././ >> src/DSP_bexp//c64P//DSP_bexp_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_bexp_64P_LE_ELF"
	-@ echo Project DSP_bexp_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_bexp_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_bexp//c64P//DSP_bexp_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_bexp_64P_BE_ELF

#############################################################

.projects: src/DSP_bexp//c64P//DSP_bexp_64P_BE_ELF

src/DSP_bexp//c64P//DSP_bexp_64P_BE_ELF: src/DSP_bexp//c64P//DSP_bexp_64P_BE_ELF/.project

src/DSP_bexp//c64P//DSP_bexp_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_bexp_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_bexp_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BEXP_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BEXP_64P_BE_ELF_SRCDSP_BEXPC64P/DSP_bexp_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_bexp//c64P//DSP_bexp_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_BE_ELF_SRCDSP_BEXP "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_bexp" \
 -ccs.definePathVariable EXT_ROOT__DSP_BEXP_64P_BE_ELF_SRCDSP_BEXPC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_bexp/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_bexp//c64P//DSP_bexp_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_bexp//c64P//DSP_bexp_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_bexp//c64P//DSP_bexp_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_BE_ELF_SRCDSP_BEXP=../../ >> src/DSP_bexp//c64P//DSP_bexp_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BEXP_64P_BE_ELF_SRCDSP_BEXPC64P=.././ >> src/DSP_bexp//c64P//DSP_bexp_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_bexp_64P_BE_ELF"
	-@ echo Project DSP_bexp_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_bexp_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_bexp//c64P//DSP_bexp_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_blk_eswap16_64P_LE_COFF

#############################################################

.projects: src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_COFF

src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_COFF: src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_COFF/.project

src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap16_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap16_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_COFF_SRCDSP_BLK_ESWAP16C64P/DSP_blk_eswap16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_COFF_SRCDSP_BLK_ESWAP16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap16" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_COFF_SRCDSP_BLK_ESWAP16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_COFF_SRCDSP_BLK_ESWAP16=../../ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_COFF_SRCDSP_BLK_ESWAP16C64P=.././ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap16_64P_LE_COFF"
	-@ echo Project DSP_blk_eswap16_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap16_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_blk_eswap16_64P_BE_COFF

#############################################################

.projects: src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_COFF

src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_COFF: src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_COFF/.project

src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap16_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap16_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_COFF_SRCDSP_BLK_ESWAP16C64P/DSP_blk_eswap16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_COFF_SRCDSP_BLK_ESWAP16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap16" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_COFF_SRCDSP_BLK_ESWAP16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_COFF_SRCDSP_BLK_ESWAP16=../../ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_COFF_SRCDSP_BLK_ESWAP16C64P=.././ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap16_64P_BE_COFF"
	-@ echo Project DSP_blk_eswap16_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap16_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_blk_eswap16_64P_LE_ELF

#############################################################

.projects: src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_ELF

src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_ELF: src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_ELF/.project

src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap16_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap16_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_ELF_SRCDSP_BLK_ESWAP16C64P/DSP_blk_eswap16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_ELF_SRCDSP_BLK_ESWAP16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap16" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_ELF_SRCDSP_BLK_ESWAP16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_ELF_SRCDSP_BLK_ESWAP16=../../ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_LE_ELF_SRCDSP_BLK_ESWAP16C64P=.././ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap16_64P_LE_ELF"
	-@ echo Project DSP_blk_eswap16_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap16_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_blk_eswap16_64P_BE_ELF

#############################################################

.projects: src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_ELF

src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_ELF: src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_ELF/.project

src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap16_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap16_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_ELF_SRCDSP_BLK_ESWAP16C64P/DSP_blk_eswap16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_ELF_SRCDSP_BLK_ESWAP16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap16" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_ELF_SRCDSP_BLK_ESWAP16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_ELF_SRCDSP_BLK_ESWAP16=../../ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP16_64P_BE_ELF_SRCDSP_BLK_ESWAP16C64P=.././ >> src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap16_64P_BE_ELF"
	-@ echo Project DSP_blk_eswap16_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap16_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap16//c64P//DSP_blk_eswap16_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_blk_eswap32_64P_LE_COFF

#############################################################

.projects: src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_COFF

src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_COFF: src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_COFF/.project

src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap32_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap32_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_COFF_SRCDSP_BLK_ESWAP32C64P/DSP_blk_eswap32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_COFF_SRCDSP_BLK_ESWAP32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap32" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_COFF_SRCDSP_BLK_ESWAP32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_COFF_SRCDSP_BLK_ESWAP32=../../ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_COFF_SRCDSP_BLK_ESWAP32C64P=.././ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap32_64P_LE_COFF"
	-@ echo Project DSP_blk_eswap32_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap32_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_blk_eswap32_64P_BE_COFF

#############################################################

.projects: src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_COFF

src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_COFF: src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_COFF/.project

src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap32_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap32_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_COFF_SRCDSP_BLK_ESWAP32C64P/DSP_blk_eswap32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_COFF_SRCDSP_BLK_ESWAP32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap32" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_COFF_SRCDSP_BLK_ESWAP32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_COFF_SRCDSP_BLK_ESWAP32=../../ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_COFF_SRCDSP_BLK_ESWAP32C64P=.././ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap32_64P_BE_COFF"
	-@ echo Project DSP_blk_eswap32_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap32_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_blk_eswap32_64P_LE_ELF

#############################################################

.projects: src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_ELF

src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_ELF: src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_ELF/.project

src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap32_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap32_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_ELF_SRCDSP_BLK_ESWAP32C64P/DSP_blk_eswap32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_ELF_SRCDSP_BLK_ESWAP32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap32" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_ELF_SRCDSP_BLK_ESWAP32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_ELF_SRCDSP_BLK_ESWAP32=../../ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_LE_ELF_SRCDSP_BLK_ESWAP32C64P=.././ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap32_64P_LE_ELF"
	-@ echo Project DSP_blk_eswap32_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap32_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_blk_eswap32_64P_BE_ELF

#############################################################

.projects: src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_ELF

src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_ELF: src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_ELF/.project

src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap32_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap32_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_ELF_SRCDSP_BLK_ESWAP32C64P/DSP_blk_eswap32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_ELF_SRCDSP_BLK_ESWAP32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap32" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_ELF_SRCDSP_BLK_ESWAP32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_ELF_SRCDSP_BLK_ESWAP32=../../ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP32_64P_BE_ELF_SRCDSP_BLK_ESWAP32C64P=.././ >> src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap32_64P_BE_ELF"
	-@ echo Project DSP_blk_eswap32_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap32_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap32//c64P//DSP_blk_eswap32_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_blk_eswap64_64P_LE_COFF

#############################################################

.projects: src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_COFF

src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_COFF: src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_COFF/.project

src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap64_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap64_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_COFF_SRCDSP_BLK_ESWAP64C64P/DSP_blk_eswap64_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_COFF_SRCDSP_BLK_ESWAP64 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap64" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_COFF_SRCDSP_BLK_ESWAP64C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap64/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_COFF_SRCDSP_BLK_ESWAP64=../../ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_COFF_SRCDSP_BLK_ESWAP64C64P=.././ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap64_64P_LE_COFF"
	-@ echo Project DSP_blk_eswap64_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap64_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_blk_eswap64_64P_BE_COFF

#############################################################

.projects: src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_COFF

src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_COFF: src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_COFF/.project

src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap64_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap64_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_COFF_SRCDSP_BLK_ESWAP64C64P/DSP_blk_eswap64_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_COFF_SRCDSP_BLK_ESWAP64 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap64" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_COFF_SRCDSP_BLK_ESWAP64C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap64/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_COFF_SRCDSP_BLK_ESWAP64=../../ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_COFF_SRCDSP_BLK_ESWAP64C64P=.././ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap64_64P_BE_COFF"
	-@ echo Project DSP_blk_eswap64_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap64_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_blk_eswap64_64P_LE_ELF

#############################################################

.projects: src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_ELF

src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_ELF: src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_ELF/.project

src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap64_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap64_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_ELF_SRCDSP_BLK_ESWAP64C64P/DSP_blk_eswap64_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_ELF_SRCDSP_BLK_ESWAP64 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap64" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_ELF_SRCDSP_BLK_ESWAP64C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap64/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_ELF_SRCDSP_BLK_ESWAP64=../../ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_LE_ELF_SRCDSP_BLK_ESWAP64C64P=.././ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap64_64P_LE_ELF"
	-@ echo Project DSP_blk_eswap64_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap64_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_blk_eswap64_64P_BE_ELF

#############################################################

.projects: src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_ELF

src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_ELF: src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_ELF/.project

src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_eswap64_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_eswap64_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_ELF_SRCDSP_BLK_ESWAP64C64P/DSP_blk_eswap64_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_ELF_SRCDSP_BLK_ESWAP64 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap64" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_ELF_SRCDSP_BLK_ESWAP64C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_eswap64/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_ELF_SRCDSP_BLK_ESWAP64=../../ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_ESWAP64_64P_BE_ELF_SRCDSP_BLK_ESWAP64C64P=.././ >> src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap64_64P_BE_ELF"
	-@ echo Project DSP_blk_eswap64_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_eswap64_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_blk_eswap64//c64P//DSP_blk_eswap64_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_blk_move_64P_LE_COFF

#############################################################

.projects: src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_COFF

src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_COFF: src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_COFF/.project

src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_move_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_move_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_MOVE_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_MOVE_64P_LE_COFF_SRCDSP_BLK_MOVEC64P/DSP_blk_move_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_LE_COFF_SRCDSP_BLK_MOVE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_move" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_LE_COFF_SRCDSP_BLK_MOVEC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_move/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_LE_COFF_SRCDSP_BLK_MOVE=../../ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_LE_COFF_SRCDSP_BLK_MOVEC64P=.././ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_move_64P_LE_COFF"
	-@ echo Project DSP_blk_move_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_move_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_blk_move_64P_BE_COFF

#############################################################

.projects: src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_COFF

src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_COFF: src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_COFF/.project

src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_move_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_move_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_MOVE_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_MOVE_64P_BE_COFF_SRCDSP_BLK_MOVEC64P/DSP_blk_move_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_BE_COFF_SRCDSP_BLK_MOVE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_move" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_BE_COFF_SRCDSP_BLK_MOVEC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_move/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_BE_COFF_SRCDSP_BLK_MOVE=../../ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_BE_COFF_SRCDSP_BLK_MOVEC64P=.././ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_move_64P_BE_COFF"
	-@ echo Project DSP_blk_move_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_move_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_blk_move_64P_LE_ELF

#############################################################

.projects: src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_ELF

src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_ELF: src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_ELF/.project

src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_move_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_move_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_MOVE_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_MOVE_64P_LE_ELF_SRCDSP_BLK_MOVEC64P/DSP_blk_move_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_LE_ELF_SRCDSP_BLK_MOVE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_move" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_LE_ELF_SRCDSP_BLK_MOVEC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_move/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_LE_ELF_SRCDSP_BLK_MOVE=../../ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_LE_ELF_SRCDSP_BLK_MOVEC64P=.././ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_move_64P_LE_ELF"
	-@ echo Project DSP_blk_move_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_move_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_blk_move//c64P//DSP_blk_move_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_blk_move_64P_BE_ELF

#############################################################

.projects: src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_ELF

src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_ELF: src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_ELF/.project

src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_blk_move_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_blk_move_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_BLK_MOVE_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_BLK_MOVE_64P_BE_ELF_SRCDSP_BLK_MOVEC64P/DSP_blk_move_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_BE_ELF_SRCDSP_BLK_MOVE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_move" \
 -ccs.definePathVariable EXT_ROOT__DSP_BLK_MOVE_64P_BE_ELF_SRCDSP_BLK_MOVEC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_blk_move/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_BE_ELF_SRCDSP_BLK_MOVE=../../ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_BLK_MOVE_64P_BE_ELF_SRCDSP_BLK_MOVEC64P=.././ >> src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_move_64P_BE_ELF"
	-@ echo Project DSP_blk_move_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_blk_move_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_blk_move//c64P//DSP_blk_move_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_dotprod_64P_LE_COFF

#############################################################

.projects: src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_COFF

src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_COFF: src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_COFF/.project

src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_dotprod_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_dotprod_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_DOTPROD_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_DOTPROD_64P_LE_COFF_SRCDSP_DOTPRODC64P/DSP_dotprod_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_LE_COFF_SRCDSP_DOTPROD "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotprod" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_LE_COFF_SRCDSP_DOTPRODC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotprod/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_LE_COFF_SRCDSP_DOTPROD=../../ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_LE_COFF_SRCDSP_DOTPRODC64P=.././ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_dotprod_64P_LE_COFF"
	-@ echo Project DSP_dotprod_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_dotprod_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_dotprod_64P_BE_COFF

#############################################################

.projects: src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_COFF

src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_COFF: src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_COFF/.project

src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_dotprod_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_dotprod_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_DOTPROD_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_DOTPROD_64P_BE_COFF_SRCDSP_DOTPRODC64P/DSP_dotprod_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_BE_COFF_SRCDSP_DOTPROD "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotprod" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_BE_COFF_SRCDSP_DOTPRODC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotprod/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_BE_COFF_SRCDSP_DOTPROD=../../ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_BE_COFF_SRCDSP_DOTPRODC64P=.././ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_dotprod_64P_BE_COFF"
	-@ echo Project DSP_dotprod_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_dotprod_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_dotprod_64P_LE_ELF

#############################################################

.projects: src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_ELF

src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_ELF: src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_ELF/.project

src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_dotprod_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_dotprod_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_DOTPROD_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_DOTPROD_64P_LE_ELF_SRCDSP_DOTPRODC64P/DSP_dotprod_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_LE_ELF_SRCDSP_DOTPROD "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotprod" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_LE_ELF_SRCDSP_DOTPRODC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotprod/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_LE_ELF_SRCDSP_DOTPROD=../../ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_LE_ELF_SRCDSP_DOTPRODC64P=.././ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_dotprod_64P_LE_ELF"
	-@ echo Project DSP_dotprod_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_dotprod_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_dotprod//c64P//DSP_dotprod_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_dotprod_64P_BE_ELF

#############################################################

.projects: src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_ELF

src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_ELF: src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_ELF/.project

src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_dotprod_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_dotprod_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_DOTPROD_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_DOTPROD_64P_BE_ELF_SRCDSP_DOTPRODC64P/DSP_dotprod_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_BE_ELF_SRCDSP_DOTPROD "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotprod" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTPROD_64P_BE_ELF_SRCDSP_DOTPRODC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotprod/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_BE_ELF_SRCDSP_DOTPROD=../../ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTPROD_64P_BE_ELF_SRCDSP_DOTPRODC64P=.././ >> src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_dotprod_64P_BE_ELF"
	-@ echo Project DSP_dotprod_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_dotprod_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_dotprod//c64P//DSP_dotprod_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_dotp_sqr_64P_LE_COFF

#############################################################

.projects: src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_COFF

src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_COFF: src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_COFF/.project

src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_dotp_sqr_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_dotp_sqr_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_DOTP_SQR_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_DOTP_SQR_64P_LE_COFF_SRCDSP_DOTP_SQRC64P/DSP_dotp_sqr_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_LE_COFF_SRCDSP_DOTP_SQR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotp_sqr" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_LE_COFF_SRCDSP_DOTP_SQRC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotp_sqr/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_LE_COFF_SRCDSP_DOTP_SQR=../../ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_LE_COFF_SRCDSP_DOTP_SQRC64P=.././ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_dotp_sqr_64P_LE_COFF"
	-@ echo Project DSP_dotp_sqr_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_dotp_sqr_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_dotp_sqr_64P_BE_COFF

#############################################################

.projects: src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_COFF

src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_COFF: src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_COFF/.project

src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_dotp_sqr_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_dotp_sqr_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_DOTP_SQR_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_DOTP_SQR_64P_BE_COFF_SRCDSP_DOTP_SQRC64P/DSP_dotp_sqr_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_BE_COFF_SRCDSP_DOTP_SQR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotp_sqr" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_BE_COFF_SRCDSP_DOTP_SQRC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotp_sqr/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_BE_COFF_SRCDSP_DOTP_SQR=../../ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_BE_COFF_SRCDSP_DOTP_SQRC64P=.././ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_dotp_sqr_64P_BE_COFF"
	-@ echo Project DSP_dotp_sqr_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_dotp_sqr_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_dotp_sqr_64P_LE_ELF

#############################################################

.projects: src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_ELF

src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_ELF: src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_ELF/.project

src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_dotp_sqr_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_dotp_sqr_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_DOTP_SQR_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_DOTP_SQR_64P_LE_ELF_SRCDSP_DOTP_SQRC64P/DSP_dotp_sqr_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_LE_ELF_SRCDSP_DOTP_SQR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotp_sqr" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_LE_ELF_SRCDSP_DOTP_SQRC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotp_sqr/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_LE_ELF_SRCDSP_DOTP_SQR=../../ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_LE_ELF_SRCDSP_DOTP_SQRC64P=.././ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_dotp_sqr_64P_LE_ELF"
	-@ echo Project DSP_dotp_sqr_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_dotp_sqr_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_dotp_sqr_64P_BE_ELF

#############################################################

.projects: src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_ELF

src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_ELF: src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_ELF/.project

src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_dotp_sqr_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_dotp_sqr_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_DOTP_SQR_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_DOTP_SQR_64P_BE_ELF_SRCDSP_DOTP_SQRC64P/DSP_dotp_sqr_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_BE_ELF_SRCDSP_DOTP_SQR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotp_sqr" \
 -ccs.definePathVariable EXT_ROOT__DSP_DOTP_SQR_64P_BE_ELF_SRCDSP_DOTP_SQRC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_dotp_sqr/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_BE_ELF_SRCDSP_DOTP_SQR=../../ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_DOTP_SQR_64P_BE_ELF_SRCDSP_DOTP_SQRC64P=.././ >> src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_dotp_sqr_64P_BE_ELF"
	-@ echo Project DSP_dotp_sqr_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_dotp_sqr_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_dotp_sqr//c64P//DSP_dotp_sqr_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fft16x16r_64P_LE_COFF

#############################################################

.projects: src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_COFF

src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_COFF: src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_COFF/.project

src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16r_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16r_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_LE_COFF_SRCDSP_FFT16X16RC64P/DSP_fft16x16r_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_LE_COFF_SRCDSP_FFT16X16RC64P/gen_twiddle_fft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_LE_COFF_SRCDSP_FFT16X16R "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16r" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_LE_COFF_SRCDSP_FFT16X16RC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16r/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_LE_COFF_SRCDSP_FFT16X16R=../../ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_LE_COFF_SRCDSP_FFT16X16RC64P=.././ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16r_64P_LE_COFF"
	-@ echo Project DSP_fft16x16r_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16r_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fft16x16r_64P_BE_COFF

#############################################################

.projects: src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_COFF

src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_COFF: src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_COFF/.project

src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16r_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16r_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_BE_COFF_SRCDSP_FFT16X16RC64P/DSP_fft16x16r_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_BE_COFF_SRCDSP_FFT16X16RC64P/gen_twiddle_fft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_BE_COFF_SRCDSP_FFT16X16R "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16r" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_BE_COFF_SRCDSP_FFT16X16RC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16r/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_BE_COFF_SRCDSP_FFT16X16R=../../ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_BE_COFF_SRCDSP_FFT16X16RC64P=.././ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16r_64P_BE_COFF"
	-@ echo Project DSP_fft16x16r_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16r_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fft16x16r_64P_LE_ELF

#############################################################

.projects: src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_ELF

src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_ELF: src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_ELF/.project

src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16r_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16r_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_LE_ELF_SRCDSP_FFT16X16RC64P/DSP_fft16x16r_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_LE_ELF_SRCDSP_FFT16X16RC64P/gen_twiddle_fft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_LE_ELF_SRCDSP_FFT16X16R "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16r" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_LE_ELF_SRCDSP_FFT16X16RC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16r/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_LE_ELF_SRCDSP_FFT16X16R=../../ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_LE_ELF_SRCDSP_FFT16X16RC64P=.././ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16r_64P_LE_ELF"
	-@ echo Project DSP_fft16x16r_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16r_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fft16x16r_64P_BE_ELF

#############################################################

.projects: src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_ELF

src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_ELF: src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_ELF/.project

src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16r_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16r_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_BE_ELF_SRCDSP_FFT16X16RC64P/DSP_fft16x16r_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16R_64P_BE_ELF_SRCDSP_FFT16X16RC64P/gen_twiddle_fft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_BE_ELF_SRCDSP_FFT16X16R "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16r" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16R_64P_BE_ELF_SRCDSP_FFT16X16RC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16r/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_BE_ELF_SRCDSP_FFT16X16R=../../ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16R_64P_BE_ELF_SRCDSP_FFT16X16RC64P=.././ >> src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16r_64P_BE_ELF"
	-@ echo Project DSP_fft16x16r_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16r_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft16x16r//c64P//DSP_fft16x16r_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fft16x16_64P_LE_COFF

#############################################################

.projects: src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_COFF

src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_COFF: src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_COFF/.project

src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_LE_COFF_SRCDSP_FFT16X16C64P/DSP_fft16x16_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_LE_COFF_SRCDSP_FFT16X16C64P/gen_twiddle_fft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_LE_COFF_SRCDSP_FFT16X16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_LE_COFF_SRCDSP_FFT16X16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_LE_COFF_SRCDSP_FFT16X16=../../ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_LE_COFF_SRCDSP_FFT16X16C64P=.././ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_64P_LE_COFF"
	-@ echo Project DSP_fft16x16_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fft16x16_64P_BE_COFF

#############################################################

.projects: src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_COFF

src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_COFF: src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_COFF/.project

src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_BE_COFF_SRCDSP_FFT16X16C64P/DSP_fft16x16_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_BE_COFF_SRCDSP_FFT16X16C64P/gen_twiddle_fft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_BE_COFF_SRCDSP_FFT16X16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_BE_COFF_SRCDSP_FFT16X16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_BE_COFF_SRCDSP_FFT16X16=../../ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_BE_COFF_SRCDSP_FFT16X16C64P=.././ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_64P_BE_COFF"
	-@ echo Project DSP_fft16x16_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fft16x16_64P_LE_ELF

#############################################################

.projects: src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_ELF

src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_ELF: src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_ELF/.project

src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_LE_ELF_SRCDSP_FFT16X16C64P/DSP_fft16x16_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_LE_ELF_SRCDSP_FFT16X16C64P/gen_twiddle_fft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_LE_ELF_SRCDSP_FFT16X16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_LE_ELF_SRCDSP_FFT16X16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_LE_ELF_SRCDSP_FFT16X16=../../ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_LE_ELF_SRCDSP_FFT16X16C64P=.././ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_64P_LE_ELF"
	-@ echo Project DSP_fft16x16_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft16x16//c64P//DSP_fft16x16_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fft16x16_64P_BE_ELF

#############################################################

.projects: src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_ELF

src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_ELF: src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_ELF/.project

src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_BE_ELF_SRCDSP_FFT16X16C64P/DSP_fft16x16_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_64P_BE_ELF_SRCDSP_FFT16X16C64P/gen_twiddle_fft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_BE_ELF_SRCDSP_FFT16X16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_64P_BE_ELF_SRCDSP_FFT16X16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_BE_ELF_SRCDSP_FFT16X16=../../ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_64P_BE_ELF_SRCDSP_FFT16X16C64P=.././ >> src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_64P_BE_ELF"
	-@ echo Project DSP_fft16x16_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft16x16//c64P//DSP_fft16x16_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fft16x16_imre_64P_LE_COFF

#############################################################

.projects: src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_COFF

src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_COFF: src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_COFF/.project

src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16_imre_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16_imre_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_COFF_SRCDSP_FFT16X16_IMREC64P/DSP_fft16x16_imre_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_COFF_SRCDSP_FFT16X16_IMREC64P/gen_twiddle_fft16x16_imre.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_COFF_SRCDSP_FFT16X16_IMRE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16_imre" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_COFF_SRCDSP_FFT16X16_IMREC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16_imre/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_COFF_SRCDSP_FFT16X16_IMRE=../../ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_COFF_SRCDSP_FFT16X16_IMREC64P=.././ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_imre_64P_LE_COFF"
	-@ echo Project DSP_fft16x16_imre_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_imre_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fft16x16_imre_64P_BE_COFF

#############################################################

.projects: src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_COFF

src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_COFF: src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_COFF/.project

src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16_imre_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16_imre_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_COFF_SRCDSP_FFT16X16_IMREC64P/DSP_fft16x16_imre_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_COFF_SRCDSP_FFT16X16_IMREC64P/gen_twiddle_fft16x16_imre.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_COFF_SRCDSP_FFT16X16_IMRE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16_imre" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_COFF_SRCDSP_FFT16X16_IMREC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16_imre/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_COFF_SRCDSP_FFT16X16_IMRE=../../ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_COFF_SRCDSP_FFT16X16_IMREC64P=.././ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_imre_64P_BE_COFF"
	-@ echo Project DSP_fft16x16_imre_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_imre_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fft16x16_imre_64P_LE_ELF

#############################################################

.projects: src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_ELF

src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_ELF: src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_ELF/.project

src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16_imre_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16_imre_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_ELF_SRCDSP_FFT16X16_IMREC64P/DSP_fft16x16_imre_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_ELF_SRCDSP_FFT16X16_IMREC64P/gen_twiddle_fft16x16_imre.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_ELF_SRCDSP_FFT16X16_IMRE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16_imre" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_ELF_SRCDSP_FFT16X16_IMREC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16_imre/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_ELF_SRCDSP_FFT16X16_IMRE=../../ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_LE_ELF_SRCDSP_FFT16X16_IMREC64P=.././ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_imre_64P_LE_ELF"
	-@ echo Project DSP_fft16x16_imre_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_imre_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fft16x16_imre_64P_BE_ELF

#############################################################

.projects: src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_ELF

src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_ELF: src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_ELF/.project

src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x16_imre_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x16_imre_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_ELF_SRCDSP_FFT16X16_IMREC64P/DSP_fft16x16_imre_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_ELF_SRCDSP_FFT16X16_IMREC64P/gen_twiddle_fft16x16_imre.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_ELF_SRCDSP_FFT16X16_IMRE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16_imre" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_ELF_SRCDSP_FFT16X16_IMREC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x16_imre/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_ELF_SRCDSP_FFT16X16_IMRE=../../ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X16_IMRE_64P_BE_ELF_SRCDSP_FFT16X16_IMREC64P=.././ >> src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_imre_64P_BE_ELF"
	-@ echo Project DSP_fft16x16_imre_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x16_imre_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft16x16_imre//c64P//DSP_fft16x16_imre_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fft16x32_64P_LE_COFF

#############################################################

.projects: src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_COFF

src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_COFF: src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_COFF/.project

src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x32_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x32_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_LE_COFF_SRCDSP_FFT16X32C64P/DSP_fft16x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_LE_COFF_SRCDSP_FFT16X32C64P/gen_twiddle_fft16x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_LE_COFF_SRCDSP_FFT16X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_LE_COFF_SRCDSP_FFT16X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_LE_COFF_SRCDSP_FFT16X32=../../ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_LE_COFF_SRCDSP_FFT16X32C64P=.././ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x32_64P_LE_COFF"
	-@ echo Project DSP_fft16x32_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x32_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fft16x32_64P_BE_COFF

#############################################################

.projects: src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_COFF

src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_COFF: src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_COFF/.project

src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x32_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x32_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_BE_COFF_SRCDSP_FFT16X32C64P/DSP_fft16x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_BE_COFF_SRCDSP_FFT16X32C64P/gen_twiddle_fft16x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_BE_COFF_SRCDSP_FFT16X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_BE_COFF_SRCDSP_FFT16X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_BE_COFF_SRCDSP_FFT16X32=../../ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_BE_COFF_SRCDSP_FFT16X32C64P=.././ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x32_64P_BE_COFF"
	-@ echo Project DSP_fft16x32_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x32_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fft16x32_64P_LE_ELF

#############################################################

.projects: src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_ELF

src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_ELF: src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_ELF/.project

src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x32_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x32_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_LE_ELF_SRCDSP_FFT16X32C64P/DSP_fft16x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_LE_ELF_SRCDSP_FFT16X32C64P/gen_twiddle_fft16x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_LE_ELF_SRCDSP_FFT16X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_LE_ELF_SRCDSP_FFT16X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_LE_ELF_SRCDSP_FFT16X32=../../ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_LE_ELF_SRCDSP_FFT16X32C64P=.././ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x32_64P_LE_ELF"
	-@ echo Project DSP_fft16x32_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x32_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft16x32//c64P//DSP_fft16x32_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fft16x32_64P_BE_ELF

#############################################################

.projects: src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_ELF

src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_ELF: src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_ELF/.project

src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft16x32_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft16x32_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_BE_ELF_SRCDSP_FFT16X32C64P/DSP_fft16x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT16X32_64P_BE_ELF_SRCDSP_FFT16X32C64P/gen_twiddle_fft16x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_BE_ELF_SRCDSP_FFT16X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT16X32_64P_BE_ELF_SRCDSP_FFT16X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft16x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_BE_ELF_SRCDSP_FFT16X32=../../ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT16X32_64P_BE_ELF_SRCDSP_FFT16X32C64P=.././ >> src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x32_64P_BE_ELF"
	-@ echo Project DSP_fft16x32_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft16x32_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft16x32//c64P//DSP_fft16x32_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fft32x32s_64P_LE_COFF

#############################################################

.projects: src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_COFF

src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_COFF: src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_COFF/.project

src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft32x32s_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft32x32s_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_LE_COFF_SRCDSP_FFT32X32SC64P/DSP_fft32x32s_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_LE_COFF_SRCDSP_FFT32X32SC64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_LE_COFF_SRCDSP_FFT32X32S "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32s" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_LE_COFF_SRCDSP_FFT32X32SC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32s/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_LE_COFF_SRCDSP_FFT32X32S=../../ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_LE_COFF_SRCDSP_FFT32X32SC64P=.././ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32s_64P_LE_COFF"
	-@ echo Project DSP_fft32x32s_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32s_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fft32x32s_64P_BE_COFF

#############################################################

.projects: src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_COFF

src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_COFF: src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_COFF/.project

src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft32x32s_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft32x32s_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_BE_COFF_SRCDSP_FFT32X32SC64P/DSP_fft32x32s_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_BE_COFF_SRCDSP_FFT32X32SC64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_BE_COFF_SRCDSP_FFT32X32S "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32s" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_BE_COFF_SRCDSP_FFT32X32SC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32s/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_BE_COFF_SRCDSP_FFT32X32S=../../ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_BE_COFF_SRCDSP_FFT32X32SC64P=.././ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32s_64P_BE_COFF"
	-@ echo Project DSP_fft32x32s_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32s_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fft32x32s_64P_LE_ELF

#############################################################

.projects: src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_ELF

src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_ELF: src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_ELF/.project

src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft32x32s_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft32x32s_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_LE_ELF_SRCDSP_FFT32X32SC64P/DSP_fft32x32s_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_LE_ELF_SRCDSP_FFT32X32SC64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_LE_ELF_SRCDSP_FFT32X32S "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32s" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_LE_ELF_SRCDSP_FFT32X32SC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32s/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_LE_ELF_SRCDSP_FFT32X32S=../../ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_LE_ELF_SRCDSP_FFT32X32SC64P=.././ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32s_64P_LE_ELF"
	-@ echo Project DSP_fft32x32s_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32s_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fft32x32s_64P_BE_ELF

#############################################################

.projects: src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_ELF

src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_ELF: src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_ELF/.project

src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft32x32s_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft32x32s_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_BE_ELF_SRCDSP_FFT32X32SC64P/DSP_fft32x32s_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32S_64P_BE_ELF_SRCDSP_FFT32X32SC64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_BE_ELF_SRCDSP_FFT32X32S "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32s" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32S_64P_BE_ELF_SRCDSP_FFT32X32SC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32s/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_BE_ELF_SRCDSP_FFT32X32S=../../ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32S_64P_BE_ELF_SRCDSP_FFT32X32SC64P=.././ >> src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32s_64P_BE_ELF"
	-@ echo Project DSP_fft32x32s_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32s_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft32x32s//c64P//DSP_fft32x32s_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fft32x32_64P_LE_COFF

#############################################################

.projects: src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_COFF

src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_COFF: src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_COFF/.project

src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft32x32_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft32x32_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_LE_COFF_SRCDSP_FFT32X32C64P/DSP_fft32x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_LE_COFF_SRCDSP_FFT32X32C64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_LE_COFF_SRCDSP_FFT32X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_LE_COFF_SRCDSP_FFT32X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_LE_COFF_SRCDSP_FFT32X32=../../ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_LE_COFF_SRCDSP_FFT32X32C64P=.././ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32_64P_LE_COFF"
	-@ echo Project DSP_fft32x32_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fft32x32_64P_BE_COFF

#############################################################

.projects: src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_COFF

src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_COFF: src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_COFF/.project

src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft32x32_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft32x32_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_BE_COFF_SRCDSP_FFT32X32C64P/DSP_fft32x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_BE_COFF_SRCDSP_FFT32X32C64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_BE_COFF_SRCDSP_FFT32X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_BE_COFF_SRCDSP_FFT32X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_BE_COFF_SRCDSP_FFT32X32=../../ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_BE_COFF_SRCDSP_FFT32X32C64P=.././ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32_64P_BE_COFF"
	-@ echo Project DSP_fft32x32_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fft32x32_64P_LE_ELF

#############################################################

.projects: src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_ELF

src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_ELF: src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_ELF/.project

src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft32x32_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft32x32_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_LE_ELF_SRCDSP_FFT32X32C64P/DSP_fft32x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_LE_ELF_SRCDSP_FFT32X32C64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_LE_ELF_SRCDSP_FFT32X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_LE_ELF_SRCDSP_FFT32X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_LE_ELF_SRCDSP_FFT32X32=../../ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_LE_ELF_SRCDSP_FFT32X32C64P=.././ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32_64P_LE_ELF"
	-@ echo Project DSP_fft32x32_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft32x32//c64P//DSP_fft32x32_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fft32x32_64P_BE_ELF

#############################################################

.projects: src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_ELF

src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_ELF: src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_ELF/.project

src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fft32x32_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fft32x32_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_BE_ELF_SRCDSP_FFT32X32C64P/DSP_fft32x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_FFT32X32_64P_BE_ELF_SRCDSP_FFT32X32C64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_BE_ELF_SRCDSP_FFT32X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_FFT32X32_64P_BE_ELF_SRCDSP_FFT32X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fft32x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_BE_ELF_SRCDSP_FFT32X32=../../ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FFT32X32_64P_BE_ELF_SRCDSP_FFT32X32C64P=.././ >> src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32_64P_BE_ELF"
	-@ echo Project DSP_fft32x32_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fft32x32_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fft32x32//c64P//DSP_fft32x32_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_firlms2_64P_LE_COFF

#############################################################

.projects: src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_COFF

src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_COFF: src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_COFF/.project

src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_firlms2_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_firlms2_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIRLMS2_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIRLMS2_64P_LE_COFF_SRCDSP_FIRLMS2C64P/DSP_firlms2_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_LE_COFF_SRCDSP_FIRLMS2 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_firlms2" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_LE_COFF_SRCDSP_FIRLMS2C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_firlms2/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_LE_COFF_SRCDSP_FIRLMS2=../../ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_LE_COFF_SRCDSP_FIRLMS2C64P=.././ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_firlms2_64P_LE_COFF"
	-@ echo Project DSP_firlms2_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_firlms2_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_firlms2_64P_BE_COFF

#############################################################

.projects: src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_COFF

src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_COFF: src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_COFF/.project

src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_firlms2_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_firlms2_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIRLMS2_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIRLMS2_64P_BE_COFF_SRCDSP_FIRLMS2C64P/DSP_firlms2_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_BE_COFF_SRCDSP_FIRLMS2 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_firlms2" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_BE_COFF_SRCDSP_FIRLMS2C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_firlms2/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_BE_COFF_SRCDSP_FIRLMS2=../../ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_BE_COFF_SRCDSP_FIRLMS2C64P=.././ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_firlms2_64P_BE_COFF"
	-@ echo Project DSP_firlms2_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_firlms2_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_firlms2_64P_LE_ELF

#############################################################

.projects: src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_ELF

src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_ELF: src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_ELF/.project

src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_firlms2_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_firlms2_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIRLMS2_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIRLMS2_64P_LE_ELF_SRCDSP_FIRLMS2C64P/DSP_firlms2_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_LE_ELF_SRCDSP_FIRLMS2 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_firlms2" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_LE_ELF_SRCDSP_FIRLMS2C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_firlms2/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_LE_ELF_SRCDSP_FIRLMS2=../../ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_LE_ELF_SRCDSP_FIRLMS2C64P=.././ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_firlms2_64P_LE_ELF"
	-@ echo Project DSP_firlms2_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_firlms2_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_firlms2//c64P//DSP_firlms2_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_firlms2_64P_BE_ELF

#############################################################

.projects: src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_ELF

src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_ELF: src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_ELF/.project

src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_firlms2_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_firlms2_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIRLMS2_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIRLMS2_64P_BE_ELF_SRCDSP_FIRLMS2C64P/DSP_firlms2_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_BE_ELF_SRCDSP_FIRLMS2 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_firlms2" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIRLMS2_64P_BE_ELF_SRCDSP_FIRLMS2C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_firlms2/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_BE_ELF_SRCDSP_FIRLMS2=../../ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIRLMS2_64P_BE_ELF_SRCDSP_FIRLMS2C64P=.././ >> src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_firlms2_64P_BE_ELF"
	-@ echo Project DSP_firlms2_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_firlms2_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_firlms2//c64P//DSP_firlms2_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fir_cplx_64P_LE_COFF

#############################################################

.projects: src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_COFF

src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_COFF: src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_COFF/.project

src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_cplx_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_cplx_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_64P_LE_COFF_SRCDSP_FIR_CPLXC64P/DSP_fir_cplx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_LE_COFF_SRCDSP_FIR_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_LE_COFF_SRCDSP_FIR_CPLXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_LE_COFF_SRCDSP_FIR_CPLX=../../ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_LE_COFF_SRCDSP_FIR_CPLXC64P=.././ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_64P_LE_COFF"
	-@ echo Project DSP_fir_cplx_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fir_cplx_64P_BE_COFF

#############################################################

.projects: src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_COFF

src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_COFF: src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_COFF/.project

src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_cplx_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_cplx_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_64P_BE_COFF_SRCDSP_FIR_CPLXC64P/DSP_fir_cplx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_BE_COFF_SRCDSP_FIR_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_BE_COFF_SRCDSP_FIR_CPLXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_BE_COFF_SRCDSP_FIR_CPLX=../../ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_BE_COFF_SRCDSP_FIR_CPLXC64P=.././ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_64P_BE_COFF"
	-@ echo Project DSP_fir_cplx_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fir_cplx_64P_LE_ELF

#############################################################

.projects: src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_ELF

src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_ELF: src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_ELF/.project

src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_cplx_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_cplx_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_64P_LE_ELF_SRCDSP_FIR_CPLXC64P/DSP_fir_cplx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_LE_ELF_SRCDSP_FIR_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_LE_ELF_SRCDSP_FIR_CPLXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_LE_ELF_SRCDSP_FIR_CPLX=../../ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_LE_ELF_SRCDSP_FIR_CPLXC64P=.././ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_64P_LE_ELF"
	-@ echo Project DSP_fir_cplx_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fir_cplx_64P_BE_ELF

#############################################################

.projects: src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_ELF

src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_ELF: src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_ELF/.project

src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_cplx_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_cplx_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_64P_BE_ELF_SRCDSP_FIR_CPLXC64P/DSP_fir_cplx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_BE_ELF_SRCDSP_FIR_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_64P_BE_ELF_SRCDSP_FIR_CPLXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_BE_ELF_SRCDSP_FIR_CPLX=../../ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_64P_BE_ELF_SRCDSP_FIR_CPLXC64P=.././ >> src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_64P_BE_ELF"
	-@ echo Project DSP_fir_cplx_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_cplx//c64P//DSP_fir_cplx_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fir_cplx_hM4X4_64P_LE_COFF

#############################################################

.projects: src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_COFF

src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_COFF: src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_COFF/.project

src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_cplx_hM4X4_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_COFF_SRCDSP_FIR_CPLX_HM4X4C64P/DSP_fir_cplx_hM4X4_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_COFF_SRCDSP_FIR_CPLX_HM4X4 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx_hM4X4" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_COFF_SRCDSP_FIR_CPLX_HM4X4C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx_hM4X4/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_COFF_SRCDSP_FIR_CPLX_HM4X4=../../ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_COFF_SRCDSP_FIR_CPLX_HM4X4C64P=.././ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_LE_COFF"
	-@ echo Project DSP_fir_cplx_hM4X4_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fir_cplx_hM4X4_64P_BE_COFF

#############################################################

.projects: src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_COFF

src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_COFF: src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_COFF/.project

src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_cplx_hM4X4_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_COFF_SRCDSP_FIR_CPLX_HM4X4C64P/DSP_fir_cplx_hM4X4_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_COFF_SRCDSP_FIR_CPLX_HM4X4 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx_hM4X4" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_COFF_SRCDSP_FIR_CPLX_HM4X4C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx_hM4X4/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_COFF_SRCDSP_FIR_CPLX_HM4X4=../../ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_COFF_SRCDSP_FIR_CPLX_HM4X4C64P=.././ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_BE_COFF"
	-@ echo Project DSP_fir_cplx_hM4X4_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fir_cplx_hM4X4_64P_LE_ELF

#############################################################

.projects: src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_ELF

src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_ELF: src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_ELF/.project

src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_cplx_hM4X4_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_ELF_SRCDSP_FIR_CPLX_HM4X4C64P/DSP_fir_cplx_hM4X4_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_ELF_SRCDSP_FIR_CPLX_HM4X4 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx_hM4X4" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_ELF_SRCDSP_FIR_CPLX_HM4X4C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx_hM4X4/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_ELF_SRCDSP_FIR_CPLX_HM4X4=../../ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_LE_ELF_SRCDSP_FIR_CPLX_HM4X4C64P=.././ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_LE_ELF"
	-@ echo Project DSP_fir_cplx_hM4X4_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fir_cplx_hM4X4_64P_BE_ELF

#############################################################

.projects: src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_ELF

src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_ELF: src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_ELF/.project

src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_cplx_hM4X4_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_ELF_SRCDSP_FIR_CPLX_HM4X4C64P/DSP_fir_cplx_hM4X4_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_ELF_SRCDSP_FIR_CPLX_HM4X4 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx_hM4X4" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_ELF_SRCDSP_FIR_CPLX_HM4X4C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_cplx_hM4X4/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_ELF_SRCDSP_FIR_CPLX_HM4X4=../../ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_CPLX_HM4X4_64P_BE_ELF_SRCDSP_FIR_CPLX_HM4X4C64P=.././ >> src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_BE_ELF"
	-@ echo Project DSP_fir_cplx_hM4X4_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_cplx_hM4X4_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_cplx_hM4X4//c64P//DSP_fir_cplx_hM4X4_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fir_gen_64P_LE_COFF

#############################################################

.projects: src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_COFF

src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_COFF: src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_COFF/.project

src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_gen_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_gen_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_64P_LE_COFF_SRCDSP_FIR_GENC64P/DSP_fir_gen_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_LE_COFF_SRCDSP_FIR_GEN "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_LE_COFF_SRCDSP_FIR_GENC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_LE_COFF_SRCDSP_FIR_GEN=../../ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_LE_COFF_SRCDSP_FIR_GENC64P=.././ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_64P_LE_COFF"
	-@ echo Project DSP_fir_gen_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fir_gen_64P_BE_COFF

#############################################################

.projects: src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_COFF

src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_COFF: src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_COFF/.project

src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_gen_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_gen_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_64P_BE_COFF_SRCDSP_FIR_GENC64P/DSP_fir_gen_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_BE_COFF_SRCDSP_FIR_GEN "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_BE_COFF_SRCDSP_FIR_GENC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_BE_COFF_SRCDSP_FIR_GEN=../../ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_BE_COFF_SRCDSP_FIR_GENC64P=.././ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_64P_BE_COFF"
	-@ echo Project DSP_fir_gen_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fir_gen_64P_LE_ELF

#############################################################

.projects: src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_ELF

src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_ELF: src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_ELF/.project

src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_gen_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_gen_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_64P_LE_ELF_SRCDSP_FIR_GENC64P/DSP_fir_gen_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_LE_ELF_SRCDSP_FIR_GEN "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_LE_ELF_SRCDSP_FIR_GENC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_LE_ELF_SRCDSP_FIR_GEN=../../ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_LE_ELF_SRCDSP_FIR_GENC64P=.././ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_64P_LE_ELF"
	-@ echo Project DSP_fir_gen_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_gen//c64P//DSP_fir_gen_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fir_gen_64P_BE_ELF

#############################################################

.projects: src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_ELF

src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_ELF: src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_ELF/.project

src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_gen_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_gen_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_64P_BE_ELF_SRCDSP_FIR_GENC64P/DSP_fir_gen_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_BE_ELF_SRCDSP_FIR_GEN "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_64P_BE_ELF_SRCDSP_FIR_GENC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_BE_ELF_SRCDSP_FIR_GEN=../../ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_64P_BE_ELF_SRCDSP_FIR_GENC64P=.././ >> src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_64P_BE_ELF"
	-@ echo Project DSP_fir_gen_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_gen//c64P//DSP_fir_gen_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fir_gen_hM17_rA8X8_64P_LE_COFF

#############################################################

.projects: src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_COFF

src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_COFF: src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_COFF/.project

src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_gen_hM17_rA8X8_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_COFF_SRCDSP_FIR_GEN_HM17_RA8X8C64P/DSP_fir_gen_hM17_rA8X8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_COFF_SRCDSP_FIR_GEN_HM17_RA8X8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen_hM17_rA8X8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_COFF_SRCDSP_FIR_GEN_HM17_RA8X8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen_hM17_rA8X8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_COFF_SRCDSP_FIR_GEN_HM17_RA8X8=../../ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_COFF_SRCDSP_FIR_GEN_HM17_RA8X8C64P=.././ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_LE_COFF"
	-@ echo Project DSP_fir_gen_hM17_rA8X8_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fir_gen_hM17_rA8X8_64P_BE_COFF

#############################################################

.projects: src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_COFF

src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_COFF: src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_COFF/.project

src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_gen_hM17_rA8X8_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_COFF_SRCDSP_FIR_GEN_HM17_RA8X8C64P/DSP_fir_gen_hM17_rA8X8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_COFF_SRCDSP_FIR_GEN_HM17_RA8X8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen_hM17_rA8X8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_COFF_SRCDSP_FIR_GEN_HM17_RA8X8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen_hM17_rA8X8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_COFF_SRCDSP_FIR_GEN_HM17_RA8X8=../../ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_COFF_SRCDSP_FIR_GEN_HM17_RA8X8C64P=.././ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_BE_COFF"
	-@ echo Project DSP_fir_gen_hM17_rA8X8_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fir_gen_hM17_rA8X8_64P_LE_ELF

#############################################################

.projects: src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_ELF

src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_ELF: src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_ELF/.project

src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_gen_hM17_rA8X8_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_ELF_SRCDSP_FIR_GEN_HM17_RA8X8C64P/DSP_fir_gen_hM17_rA8X8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_ELF_SRCDSP_FIR_GEN_HM17_RA8X8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen_hM17_rA8X8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_ELF_SRCDSP_FIR_GEN_HM17_RA8X8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen_hM17_rA8X8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_ELF_SRCDSP_FIR_GEN_HM17_RA8X8=../../ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_LE_ELF_SRCDSP_FIR_GEN_HM17_RA8X8C64P=.././ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_LE_ELF"
	-@ echo Project DSP_fir_gen_hM17_rA8X8_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fir_gen_hM17_rA8X8_64P_BE_ELF

#############################################################

.projects: src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_ELF

src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_ELF: src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_ELF/.project

src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_gen_hM17_rA8X8_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_ELF_SRCDSP_FIR_GEN_HM17_RA8X8C64P/DSP_fir_gen_hM17_rA8X8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_ELF_SRCDSP_FIR_GEN_HM17_RA8X8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen_hM17_rA8X8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_ELF_SRCDSP_FIR_GEN_HM17_RA8X8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_gen_hM17_rA8X8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_ELF_SRCDSP_FIR_GEN_HM17_RA8X8=../../ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_GEN_HM17_RA8X8_64P_BE_ELF_SRCDSP_FIR_GEN_HM17_RA8X8C64P=.././ >> src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_BE_ELF"
	-@ echo Project DSP_fir_gen_hM17_rA8X8_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_gen_hM17_rA8X8_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_gen_hM17_rA8X8//c64P//DSP_fir_gen_hM17_rA8X8_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fir_r4_64P_LE_COFF

#############################################################

.projects: src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_COFF

src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_COFF: src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_COFF/.project

src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r4_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r4_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R4_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R4_64P_LE_COFF_SRCDSP_FIR_R4C64P/DSP_fir_r4_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_LE_COFF_SRCDSP_FIR_R4 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r4" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_LE_COFF_SRCDSP_FIR_R4C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r4/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_LE_COFF_SRCDSP_FIR_R4=../../ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_LE_COFF_SRCDSP_FIR_R4C64P=.././ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r4_64P_LE_COFF"
	-@ echo Project DSP_fir_r4_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r4_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fir_r4_64P_BE_COFF

#############################################################

.projects: src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_COFF

src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_COFF: src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_COFF/.project

src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r4_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r4_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R4_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R4_64P_BE_COFF_SRCDSP_FIR_R4C64P/DSP_fir_r4_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_BE_COFF_SRCDSP_FIR_R4 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r4" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_BE_COFF_SRCDSP_FIR_R4C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r4/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_BE_COFF_SRCDSP_FIR_R4=../../ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_BE_COFF_SRCDSP_FIR_R4C64P=.././ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r4_64P_BE_COFF"
	-@ echo Project DSP_fir_r4_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r4_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fir_r4_64P_LE_ELF

#############################################################

.projects: src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_ELF

src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_ELF: src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_ELF/.project

src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r4_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r4_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R4_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R4_64P_LE_ELF_SRCDSP_FIR_R4C64P/DSP_fir_r4_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_LE_ELF_SRCDSP_FIR_R4 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r4" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_LE_ELF_SRCDSP_FIR_R4C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r4/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_LE_ELF_SRCDSP_FIR_R4=../../ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_LE_ELF_SRCDSP_FIR_R4C64P=.././ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r4_64P_LE_ELF"
	-@ echo Project DSP_fir_r4_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r4_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_r4//c64P//DSP_fir_r4_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fir_r4_64P_BE_ELF

#############################################################

.projects: src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_ELF

src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_ELF: src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_ELF/.project

src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r4_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r4_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R4_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R4_64P_BE_ELF_SRCDSP_FIR_R4C64P/DSP_fir_r4_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_BE_ELF_SRCDSP_FIR_R4 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r4" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R4_64P_BE_ELF_SRCDSP_FIR_R4C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r4/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_BE_ELF_SRCDSP_FIR_R4=../../ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R4_64P_BE_ELF_SRCDSP_FIR_R4C64P=.././ >> src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r4_64P_BE_ELF"
	-@ echo Project DSP_fir_r4_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r4_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_r4//c64P//DSP_fir_r4_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fir_r8_64P_LE_COFF

#############################################################

.projects: src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_COFF

src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_COFF: src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_COFF/.project

src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_64P_LE_COFF_SRCDSP_FIR_R8C64P/DSP_fir_r8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_LE_COFF_SRCDSP_FIR_R8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_LE_COFF_SRCDSP_FIR_R8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_LE_COFF_SRCDSP_FIR_R8=../../ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_LE_COFF_SRCDSP_FIR_R8C64P=.././ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_64P_LE_COFF"
	-@ echo Project DSP_fir_r8_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fir_r8_64P_BE_COFF

#############################################################

.projects: src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_COFF

src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_COFF: src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_COFF/.project

src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_64P_BE_COFF_SRCDSP_FIR_R8C64P/DSP_fir_r8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_BE_COFF_SRCDSP_FIR_R8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_BE_COFF_SRCDSP_FIR_R8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_BE_COFF_SRCDSP_FIR_R8=../../ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_BE_COFF_SRCDSP_FIR_R8C64P=.././ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_64P_BE_COFF"
	-@ echo Project DSP_fir_r8_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fir_r8_64P_LE_ELF

#############################################################

.projects: src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_ELF

src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_ELF: src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_ELF/.project

src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_64P_LE_ELF_SRCDSP_FIR_R8C64P/DSP_fir_r8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_LE_ELF_SRCDSP_FIR_R8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_LE_ELF_SRCDSP_FIR_R8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_LE_ELF_SRCDSP_FIR_R8=../../ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_LE_ELF_SRCDSP_FIR_R8C64P=.././ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_64P_LE_ELF"
	-@ echo Project DSP_fir_r8_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_r8//c64P//DSP_fir_r8_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fir_r8_64P_BE_ELF

#############################################################

.projects: src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_ELF

src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_ELF: src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_ELF/.project

src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_64P_BE_ELF_SRCDSP_FIR_R8C64P/DSP_fir_r8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_BE_ELF_SRCDSP_FIR_R8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_64P_BE_ELF_SRCDSP_FIR_R8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_BE_ELF_SRCDSP_FIR_R8=../../ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_64P_BE_ELF_SRCDSP_FIR_R8C64P=.././ >> src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_64P_BE_ELF"
	-@ echo Project DSP_fir_r8_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_r8//c64P//DSP_fir_r8_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF

#############################################################

.projects: src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF

src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF: src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF/.project

src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_COFF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P/DSP_fir_r8_hM16_rM8A8X8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_COFF_SRCDSP_FIR_R8_HM16_RM8A8X8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_hM16_rM8A8X8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_COFF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_hM16_rM8A8X8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_COFF_SRCDSP_FIR_R8_HM16_RM8A8X8=../../ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_COFF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P=.././ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF"
	-@ echo Project DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF

#############################################################

.projects: src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF

src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF: src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF/.project

src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_COFF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P/DSP_fir_r8_hM16_rM8A8X8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_COFF_SRCDSP_FIR_R8_HM16_RM8A8X8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_hM16_rM8A8X8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_COFF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_hM16_rM8A8X8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_COFF_SRCDSP_FIR_R8_HM16_RM8A8X8=../../ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_COFF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P=.././ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF"
	-@ echo Project DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF

#############################################################

.projects: src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF

src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF: src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF/.project

src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_ELF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P/DSP_fir_r8_hM16_rM8A8X8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_ELF_SRCDSP_FIR_R8_HM16_RM8A8X8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_hM16_rM8A8X8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_ELF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_hM16_rM8A8X8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_ELF_SRCDSP_FIR_R8_HM16_RM8A8X8=../../ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_LE_ELF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P=.././ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF"
	-@ echo Project DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF

#############################################################

.projects: src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF

src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF: src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF/.project

src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_ELF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P/DSP_fir_r8_hM16_rM8A8X8_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_ELF_SRCDSP_FIR_R8_HM16_RM8A8X8 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_hM16_rM8A8X8" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_ELF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_r8_hM16_rM8A8X8/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_ELF_SRCDSP_FIR_R8_HM16_RM8A8X8=../../ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_R8_HM16_RM8A8X8_64P_BE_ELF_SRCDSP_FIR_R8_HM16_RM8A8X8C64P=.././ >> src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF"
	-@ echo Project DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_r8_hM16_rM8A8X8//c64P//DSP_fir_r8_hM16_rM8A8X8_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fir_sym_64P_LE_COFF

#############################################################

.projects: src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_COFF

src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_COFF: src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_COFF/.project

src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_sym_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_sym_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_SYM_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_SYM_64P_LE_COFF_SRCDSP_FIR_SYMC64P/DSP_fir_sym_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_LE_COFF_SRCDSP_FIR_SYM "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_sym" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_LE_COFF_SRCDSP_FIR_SYMC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_sym/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_LE_COFF_SRCDSP_FIR_SYM=../../ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_LE_COFF_SRCDSP_FIR_SYMC64P=.././ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_sym_64P_LE_COFF"
	-@ echo Project DSP_fir_sym_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_sym_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fir_sym_64P_BE_COFF

#############################################################

.projects: src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_COFF

src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_COFF: src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_COFF/.project

src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_sym_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_sym_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_SYM_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_SYM_64P_BE_COFF_SRCDSP_FIR_SYMC64P/DSP_fir_sym_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_BE_COFF_SRCDSP_FIR_SYM "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_sym" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_BE_COFF_SRCDSP_FIR_SYMC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_sym/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_BE_COFF_SRCDSP_FIR_SYM=../../ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_BE_COFF_SRCDSP_FIR_SYMC64P=.././ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_sym_64P_BE_COFF"
	-@ echo Project DSP_fir_sym_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_sym_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fir_sym_64P_LE_ELF

#############################################################

.projects: src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_ELF

src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_ELF: src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_ELF/.project

src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_sym_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_sym_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_SYM_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_SYM_64P_LE_ELF_SRCDSP_FIR_SYMC64P/DSP_fir_sym_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_LE_ELF_SRCDSP_FIR_SYM "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_sym" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_LE_ELF_SRCDSP_FIR_SYMC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_sym/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_LE_ELF_SRCDSP_FIR_SYM=../../ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_LE_ELF_SRCDSP_FIR_SYMC64P=.././ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_sym_64P_LE_ELF"
	-@ echo Project DSP_fir_sym_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_sym_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_sym//c64P//DSP_fir_sym_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fir_sym_64P_BE_ELF

#############################################################

.projects: src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_ELF

src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_ELF: src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_ELF/.project

src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fir_sym_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fir_sym_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FIR_SYM_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FIR_SYM_64P_BE_ELF_SRCDSP_FIR_SYMC64P/DSP_fir_sym_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_BE_ELF_SRCDSP_FIR_SYM "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_sym" \
 -ccs.definePathVariable EXT_ROOT__DSP_FIR_SYM_64P_BE_ELF_SRCDSP_FIR_SYMC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fir_sym/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_BE_ELF_SRCDSP_FIR_SYM=../../ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FIR_SYM_64P_BE_ELF_SRCDSP_FIR_SYMC64P=.././ >> src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_sym_64P_BE_ELF"
	-@ echo Project DSP_fir_sym_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fir_sym_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fir_sym//c64P//DSP_fir_sym_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_fltoq15_64P_LE_COFF

#############################################################

.projects: src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_COFF

src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_COFF: src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_COFF/.project

src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fltoq15_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fltoq15_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FLTOQ15_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FLTOQ15_64P_LE_COFF_SRCDSP_FLTOQ15C64P/DSP_fltoq15_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_LE_COFF_SRCDSP_FLTOQ15 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fltoq15" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_LE_COFF_SRCDSP_FLTOQ15C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fltoq15/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_LE_COFF_SRCDSP_FLTOQ15=../../ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_LE_COFF_SRCDSP_FLTOQ15C64P=.././ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fltoq15_64P_LE_COFF"
	-@ echo Project DSP_fltoq15_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fltoq15_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_fltoq15_64P_BE_COFF

#############################################################

.projects: src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_COFF

src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_COFF: src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_COFF/.project

src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fltoq15_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fltoq15_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FLTOQ15_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FLTOQ15_64P_BE_COFF_SRCDSP_FLTOQ15C64P/DSP_fltoq15_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_BE_COFF_SRCDSP_FLTOQ15 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fltoq15" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_BE_COFF_SRCDSP_FLTOQ15C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fltoq15/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_BE_COFF_SRCDSP_FLTOQ15=../../ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_BE_COFF_SRCDSP_FLTOQ15C64P=.././ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fltoq15_64P_BE_COFF"
	-@ echo Project DSP_fltoq15_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fltoq15_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_fltoq15_64P_LE_ELF

#############################################################

.projects: src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_ELF

src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_ELF: src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_ELF/.project

src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fltoq15_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fltoq15_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FLTOQ15_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FLTOQ15_64P_LE_ELF_SRCDSP_FLTOQ15C64P/DSP_fltoq15_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_LE_ELF_SRCDSP_FLTOQ15 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fltoq15" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_LE_ELF_SRCDSP_FLTOQ15C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fltoq15/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_LE_ELF_SRCDSP_FLTOQ15=../../ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_LE_ELF_SRCDSP_FLTOQ15C64P=.././ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fltoq15_64P_LE_ELF"
	-@ echo Project DSP_fltoq15_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fltoq15_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_fltoq15//c64P//DSP_fltoq15_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_fltoq15_64P_BE_ELF

#############################################################

.projects: src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_ELF

src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_ELF: src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_ELF/.project

src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_fltoq15_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_fltoq15_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_FLTOQ15_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_FLTOQ15_64P_BE_ELF_SRCDSP_FLTOQ15C64P/DSP_fltoq15_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_BE_ELF_SRCDSP_FLTOQ15 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fltoq15" \
 -ccs.definePathVariable EXT_ROOT__DSP_FLTOQ15_64P_BE_ELF_SRCDSP_FLTOQ15C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_fltoq15/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_BE_ELF_SRCDSP_FLTOQ15=../../ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_FLTOQ15_64P_BE_ELF_SRCDSP_FLTOQ15C64P=.././ >> src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_fltoq15_64P_BE_ELF"
	-@ echo Project DSP_fltoq15_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_fltoq15_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_fltoq15//c64P//DSP_fltoq15_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_ifft16x16_64P_LE_COFF

#############################################################

.projects: src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_COFF

src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_COFF: src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_COFF/.project

src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x16_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x16_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_LE_COFF_SRCDSP_IFFT16X16C64P/DSP_ifft16x16_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_LE_COFF_SRCDSP_IFFT16X16C64P/gen_twiddle_ifft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_LE_COFF_SRCDSP_IFFT16X16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_LE_COFF_SRCDSP_IFFT16X16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_LE_COFF_SRCDSP_IFFT16X16=../../ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_LE_COFF_SRCDSP_IFFT16X16C64P=.././ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_64P_LE_COFF"
	-@ echo Project DSP_ifft16x16_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_ifft16x16_64P_BE_COFF

#############################################################

.projects: src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_COFF

src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_COFF: src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_COFF/.project

src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x16_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x16_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_BE_COFF_SRCDSP_IFFT16X16C64P/DSP_ifft16x16_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_BE_COFF_SRCDSP_IFFT16X16C64P/gen_twiddle_ifft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_BE_COFF_SRCDSP_IFFT16X16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_BE_COFF_SRCDSP_IFFT16X16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_BE_COFF_SRCDSP_IFFT16X16=../../ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_BE_COFF_SRCDSP_IFFT16X16C64P=.././ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_64P_BE_COFF"
	-@ echo Project DSP_ifft16x16_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_ifft16x16_64P_LE_ELF

#############################################################

.projects: src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_ELF

src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_ELF: src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_ELF/.project

src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x16_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x16_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_LE_ELF_SRCDSP_IFFT16X16C64P/DSP_ifft16x16_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_LE_ELF_SRCDSP_IFFT16X16C64P/gen_twiddle_ifft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_LE_ELF_SRCDSP_IFFT16X16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_LE_ELF_SRCDSP_IFFT16X16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_LE_ELF_SRCDSP_IFFT16X16=../../ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_LE_ELF_SRCDSP_IFFT16X16C64P=.././ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_64P_LE_ELF"
	-@ echo Project DSP_ifft16x16_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_ifft16x16_64P_BE_ELF

#############################################################

.projects: src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_ELF

src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_ELF: src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_ELF/.project

src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x16_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x16_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_BE_ELF_SRCDSP_IFFT16X16C64P/DSP_ifft16x16_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_64P_BE_ELF_SRCDSP_IFFT16X16C64P/gen_twiddle_ifft16x16.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_BE_ELF_SRCDSP_IFFT16X16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_64P_BE_ELF_SRCDSP_IFFT16X16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_BE_ELF_SRCDSP_IFFT16X16=../../ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_64P_BE_ELF_SRCDSP_IFFT16X16C64P=.././ >> src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_64P_BE_ELF"
	-@ echo Project DSP_ifft16x16_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_ifft16x16//c64P//DSP_ifft16x16_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_ifft16x16_imre_64P_LE_COFF

#############################################################

.projects: src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_COFF

src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_COFF: src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_COFF/.project

src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x16_imre_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x16_imre_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_COFF_SRCDSP_IFFT16X16_IMREC64P/DSP_ifft16x16_imre_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_COFF_SRCDSP_IFFT16X16_IMREC64P/gen_twiddle_ifft16x16_imre.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_COFF_SRCDSP_IFFT16X16_IMRE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16_imre" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_COFF_SRCDSP_IFFT16X16_IMREC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16_imre/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_COFF_SRCDSP_IFFT16X16_IMRE=../../ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_COFF_SRCDSP_IFFT16X16_IMREC64P=.././ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_imre_64P_LE_COFF"
	-@ echo Project DSP_ifft16x16_imre_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_imre_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_ifft16x16_imre_64P_BE_COFF

#############################################################

.projects: src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_COFF

src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_COFF: src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_COFF/.project

src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x16_imre_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x16_imre_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_COFF_SRCDSP_IFFT16X16_IMREC64P/DSP_ifft16x16_imre_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_COFF_SRCDSP_IFFT16X16_IMREC64P/gen_twiddle_ifft16x16_imre.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_COFF_SRCDSP_IFFT16X16_IMRE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16_imre" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_COFF_SRCDSP_IFFT16X16_IMREC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16_imre/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_COFF_SRCDSP_IFFT16X16_IMRE=../../ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_COFF_SRCDSP_IFFT16X16_IMREC64P=.././ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_imre_64P_BE_COFF"
	-@ echo Project DSP_ifft16x16_imre_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_imre_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_ifft16x16_imre_64P_LE_ELF

#############################################################

.projects: src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_ELF

src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_ELF: src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_ELF/.project

src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x16_imre_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x16_imre_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_ELF_SRCDSP_IFFT16X16_IMREC64P/DSP_ifft16x16_imre_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_ELF_SRCDSP_IFFT16X16_IMREC64P/gen_twiddle_ifft16x16_imre.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_ELF_SRCDSP_IFFT16X16_IMRE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16_imre" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_ELF_SRCDSP_IFFT16X16_IMREC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16_imre/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_ELF_SRCDSP_IFFT16X16_IMRE=../../ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_LE_ELF_SRCDSP_IFFT16X16_IMREC64P=.././ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_imre_64P_LE_ELF"
	-@ echo Project DSP_ifft16x16_imre_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_imre_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_ifft16x16_imre_64P_BE_ELF

#############################################################

.projects: src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_ELF

src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_ELF: src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_ELF/.project

src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x16_imre_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x16_imre_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_ELF_SRCDSP_IFFT16X16_IMREC64P/DSP_ifft16x16_imre_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_ELF_SRCDSP_IFFT16X16_IMREC64P/gen_twiddle_ifft16x16_imre.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_ELF_SRCDSP_IFFT16X16_IMRE "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16_imre" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_ELF_SRCDSP_IFFT16X16_IMREC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x16_imre/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_ELF_SRCDSP_IFFT16X16_IMRE=../../ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X16_IMRE_64P_BE_ELF_SRCDSP_IFFT16X16_IMREC64P=.././ >> src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_imre_64P_BE_ELF"
	-@ echo Project DSP_ifft16x16_imre_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x16_imre_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_ifft16x16_imre//c64P//DSP_ifft16x16_imre_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_ifft16x32_64P_LE_COFF

#############################################################

.projects: src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_COFF

src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_COFF: src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_COFF/.project

src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x32_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x32_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_LE_COFF_SRCDSP_IFFT16X32C64P/DSP_ifft16x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_LE_COFF_SRCDSP_IFFT16X32C64P/gen_twiddle_fft16x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_LE_COFF_SRCDSP_IFFT16X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_LE_COFF_SRCDSP_IFFT16X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_LE_COFF_SRCDSP_IFFT16X32=../../ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_LE_COFF_SRCDSP_IFFT16X32C64P=.././ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x32_64P_LE_COFF"
	-@ echo Project DSP_ifft16x32_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x32_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_ifft16x32_64P_BE_COFF

#############################################################

.projects: src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_COFF

src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_COFF: src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_COFF/.project

src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x32_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x32_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_BE_COFF_SRCDSP_IFFT16X32C64P/DSP_ifft16x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_BE_COFF_SRCDSP_IFFT16X32C64P/gen_twiddle_fft16x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_BE_COFF_SRCDSP_IFFT16X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_BE_COFF_SRCDSP_IFFT16X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_BE_COFF_SRCDSP_IFFT16X32=../../ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_BE_COFF_SRCDSP_IFFT16X32C64P=.././ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x32_64P_BE_COFF"
	-@ echo Project DSP_ifft16x32_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x32_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_ifft16x32_64P_LE_ELF

#############################################################

.projects: src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_ELF

src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_ELF: src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_ELF/.project

src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x32_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x32_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_LE_ELF_SRCDSP_IFFT16X32C64P/DSP_ifft16x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_LE_ELF_SRCDSP_IFFT16X32C64P/gen_twiddle_fft16x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_LE_ELF_SRCDSP_IFFT16X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_LE_ELF_SRCDSP_IFFT16X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_LE_ELF_SRCDSP_IFFT16X32=../../ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_LE_ELF_SRCDSP_IFFT16X32C64P=.././ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x32_64P_LE_ELF"
	-@ echo Project DSP_ifft16x32_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x32_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_ifft16x32_64P_BE_ELF

#############################################################

.projects: src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_ELF

src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_ELF: src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_ELF/.project

src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft16x32_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft16x32_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_BE_ELF_SRCDSP_IFFT16X32C64P/DSP_ifft16x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT16X32_64P_BE_ELF_SRCDSP_IFFT16X32C64P/gen_twiddle_fft16x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_BE_ELF_SRCDSP_IFFT16X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT16X32_64P_BE_ELF_SRCDSP_IFFT16X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft16x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_BE_ELF_SRCDSP_IFFT16X32=../../ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT16X32_64P_BE_ELF_SRCDSP_IFFT16X32C64P=.././ >> src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x32_64P_BE_ELF"
	-@ echo Project DSP_ifft16x32_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft16x32_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_ifft16x32//c64P//DSP_ifft16x32_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_ifft32x32_64P_LE_COFF

#############################################################

.projects: src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_COFF

src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_COFF: src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_COFF/.project

src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft32x32_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft32x32_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_LE_COFF_SRCDSP_IFFT32X32C64P/DSP_ifft32x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_LE_COFF_SRCDSP_IFFT32X32C64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_LE_COFF_SRCDSP_IFFT32X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft32x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_LE_COFF_SRCDSP_IFFT32X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft32x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_LE_COFF_SRCDSP_IFFT32X32=../../ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_LE_COFF_SRCDSP_IFFT32X32C64P=.././ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft32x32_64P_LE_COFF"
	-@ echo Project DSP_ifft32x32_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft32x32_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_ifft32x32_64P_BE_COFF

#############################################################

.projects: src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_COFF

src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_COFF: src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_COFF/.project

src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft32x32_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft32x32_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_BE_COFF_SRCDSP_IFFT32X32C64P/DSP_ifft32x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_BE_COFF_SRCDSP_IFFT32X32C64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_BE_COFF_SRCDSP_IFFT32X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft32x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_BE_COFF_SRCDSP_IFFT32X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft32x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_BE_COFF_SRCDSP_IFFT32X32=../../ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_BE_COFF_SRCDSP_IFFT32X32C64P=.././ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft32x32_64P_BE_COFF"
	-@ echo Project DSP_ifft32x32_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft32x32_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_ifft32x32_64P_LE_ELF

#############################################################

.projects: src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_ELF

src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_ELF: src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_ELF/.project

src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft32x32_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft32x32_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_LE_ELF_SRCDSP_IFFT32X32C64P/DSP_ifft32x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_LE_ELF_SRCDSP_IFFT32X32C64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_LE_ELF_SRCDSP_IFFT32X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft32x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_LE_ELF_SRCDSP_IFFT32X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft32x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_LE_ELF_SRCDSP_IFFT32X32=../../ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_LE_ELF_SRCDSP_IFFT32X32C64P=.././ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft32x32_64P_LE_ELF"
	-@ echo Project DSP_ifft32x32_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft32x32_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_ifft32x32_64P_BE_ELF

#############################################################

.projects: src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_ELF

src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_ELF: src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_ELF/.project

src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_ifft32x32_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_ifft32x32_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_BE_ELF_SRCDSP_IFFT32X32C64P/DSP_ifft32x32_d.c\
 -ccs.linkFile EXT_ROOT__DSP_IFFT32X32_64P_BE_ELF_SRCDSP_IFFT32X32C64P/gen_twiddle_fft32x32.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_BE_ELF_SRCDSP_IFFT32X32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft32x32" \
 -ccs.definePathVariable EXT_ROOT__DSP_IFFT32X32_64P_BE_ELF_SRCDSP_IFFT32X32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_ifft32x32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_BE_ELF_SRCDSP_IFFT32X32=../../ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IFFT32X32_64P_BE_ELF_SRCDSP_IFFT32X32C64P=.././ >> src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft32x32_64P_BE_ELF"
	-@ echo Project DSP_ifft32x32_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_ifft32x32_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_ifft32x32//c64P//DSP_ifft32x32_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_iir_64P_LE_COFF

#############################################################

.projects: src/DSP_iir//c64P//DSP_iir_64P_LE_COFF

src/DSP_iir//c64P//DSP_iir_64P_LE_COFF: src/DSP_iir//c64P//DSP_iir_64P_LE_COFF/.project

src/DSP_iir//c64P//DSP_iir_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_64P_LE_COFF_SRCDSP_IIRC64P/DSP_iir_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir//c64P//DSP_iir_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_LE_COFF_SRCDSP_IIR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_LE_COFF_SRCDSP_IIRC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir//c64P//DSP_iir_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir//c64P//DSP_iir_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir//c64P//DSP_iir_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_LE_COFF_SRCDSP_IIR=../../ >> src/DSP_iir//c64P//DSP_iir_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_LE_COFF_SRCDSP_IIRC64P=.././ >> src/DSP_iir//c64P//DSP_iir_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_64P_LE_COFF"
	-@ echo Project DSP_iir_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_iir//c64P//DSP_iir_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_iir_64P_BE_COFF

#############################################################

.projects: src/DSP_iir//c64P//DSP_iir_64P_BE_COFF

src/DSP_iir//c64P//DSP_iir_64P_BE_COFF: src/DSP_iir//c64P//DSP_iir_64P_BE_COFF/.project

src/DSP_iir//c64P//DSP_iir_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_64P_BE_COFF_SRCDSP_IIRC64P/DSP_iir_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir//c64P//DSP_iir_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_BE_COFF_SRCDSP_IIR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_BE_COFF_SRCDSP_IIRC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir//c64P//DSP_iir_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir//c64P//DSP_iir_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir//c64P//DSP_iir_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_BE_COFF_SRCDSP_IIR=../../ >> src/DSP_iir//c64P//DSP_iir_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_BE_COFF_SRCDSP_IIRC64P=.././ >> src/DSP_iir//c64P//DSP_iir_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_64P_BE_COFF"
	-@ echo Project DSP_iir_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_iir//c64P//DSP_iir_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_iir_64P_LE_ELF

#############################################################

.projects: src/DSP_iir//c64P//DSP_iir_64P_LE_ELF

src/DSP_iir//c64P//DSP_iir_64P_LE_ELF: src/DSP_iir//c64P//DSP_iir_64P_LE_ELF/.project

src/DSP_iir//c64P//DSP_iir_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_64P_LE_ELF_SRCDSP_IIRC64P/DSP_iir_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir//c64P//DSP_iir_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_LE_ELF_SRCDSP_IIR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_LE_ELF_SRCDSP_IIRC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir//c64P//DSP_iir_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir//c64P//DSP_iir_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir//c64P//DSP_iir_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_LE_ELF_SRCDSP_IIR=../../ >> src/DSP_iir//c64P//DSP_iir_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_LE_ELF_SRCDSP_IIRC64P=.././ >> src/DSP_iir//c64P//DSP_iir_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_64P_LE_ELF"
	-@ echo Project DSP_iir_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_iir//c64P//DSP_iir_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_iir_64P_BE_ELF

#############################################################

.projects: src/DSP_iir//c64P//DSP_iir_64P_BE_ELF

src/DSP_iir//c64P//DSP_iir_64P_BE_ELF: src/DSP_iir//c64P//DSP_iir_64P_BE_ELF/.project

src/DSP_iir//c64P//DSP_iir_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_64P_BE_ELF_SRCDSP_IIRC64P/DSP_iir_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir//c64P//DSP_iir_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_BE_ELF_SRCDSP_IIR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_64P_BE_ELF_SRCDSP_IIRC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir//c64P//DSP_iir_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir//c64P//DSP_iir_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir//c64P//DSP_iir_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_BE_ELF_SRCDSP_IIR=../../ >> src/DSP_iir//c64P//DSP_iir_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_64P_BE_ELF_SRCDSP_IIRC64P=.././ >> src/DSP_iir//c64P//DSP_iir_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_64P_BE_ELF"
	-@ echo Project DSP_iir_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_iir//c64P//DSP_iir_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_iir_lat_64P_LE_COFF

#############################################################

.projects: src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_COFF

src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_COFF: src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_COFF/.project

src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_lat_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_lat_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_LAT_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_LAT_64P_LE_COFF_SRCDSP_IIR_LATC64P/DSP_iir_lat_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_LE_COFF_SRCDSP_IIR_LAT "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_lat" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_LE_COFF_SRCDSP_IIR_LATC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_lat/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_LE_COFF_SRCDSP_IIR_LAT=../../ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_LE_COFF_SRCDSP_IIR_LATC64P=.././ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_lat_64P_LE_COFF"
	-@ echo Project DSP_iir_lat_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_lat_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_iir_lat_64P_BE_COFF

#############################################################

.projects: src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_COFF

src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_COFF: src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_COFF/.project

src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_lat_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_lat_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_LAT_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_LAT_64P_BE_COFF_SRCDSP_IIR_LATC64P/DSP_iir_lat_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_BE_COFF_SRCDSP_IIR_LAT "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_lat" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_BE_COFF_SRCDSP_IIR_LATC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_lat/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_BE_COFF_SRCDSP_IIR_LAT=../../ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_BE_COFF_SRCDSP_IIR_LATC64P=.././ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_lat_64P_BE_COFF"
	-@ echo Project DSP_iir_lat_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_lat_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_iir_lat_64P_LE_ELF

#############################################################

.projects: src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_ELF

src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_ELF: src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_ELF/.project

src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_lat_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_lat_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_LAT_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_LAT_64P_LE_ELF_SRCDSP_IIR_LATC64P/DSP_iir_lat_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_LE_ELF_SRCDSP_IIR_LAT "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_lat" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_LE_ELF_SRCDSP_IIR_LATC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_lat/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_LE_ELF_SRCDSP_IIR_LAT=../../ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_LE_ELF_SRCDSP_IIR_LATC64P=.././ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_lat_64P_LE_ELF"
	-@ echo Project DSP_iir_lat_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_lat_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_iir_lat//c64P//DSP_iir_lat_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_iir_lat_64P_BE_ELF

#############################################################

.projects: src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_ELF

src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_ELF: src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_ELF/.project

src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_lat_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_lat_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_LAT_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_LAT_64P_BE_ELF_SRCDSP_IIR_LATC64P/DSP_iir_lat_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_BE_ELF_SRCDSP_IIR_LAT "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_lat" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_LAT_64P_BE_ELF_SRCDSP_IIR_LATC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_lat/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_BE_ELF_SRCDSP_IIR_LAT=../../ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_LAT_64P_BE_ELF_SRCDSP_IIR_LATC64P=.././ >> src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_lat_64P_BE_ELF"
	-@ echo Project DSP_iir_lat_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_lat_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_iir_lat//c64P//DSP_iir_lat_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_iir_ss_64P_LE_COFF

#############################################################

.projects: src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_COFF

src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_COFF: src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_COFF/.project

src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_ss_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_ss_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_SS_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_SS_64P_LE_COFF_SRCDSP_IIR_SSC64P/DSP_iir_ss_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_LE_COFF_SRCDSP_IIR_SS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_ss" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_LE_COFF_SRCDSP_IIR_SSC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_ss/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_LE_COFF_SRCDSP_IIR_SS=../../ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_LE_COFF_SRCDSP_IIR_SSC64P=.././ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_ss_64P_LE_COFF"
	-@ echo Project DSP_iir_ss_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_ss_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_iir_ss_64P_BE_COFF

#############################################################

.projects: src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_COFF

src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_COFF: src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_COFF/.project

src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_ss_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_ss_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_SS_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_SS_64P_BE_COFF_SRCDSP_IIR_SSC64P/DSP_iir_ss_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_BE_COFF_SRCDSP_IIR_SS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_ss" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_BE_COFF_SRCDSP_IIR_SSC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_ss/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_BE_COFF_SRCDSP_IIR_SS=../../ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_BE_COFF_SRCDSP_IIR_SSC64P=.././ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_ss_64P_BE_COFF"
	-@ echo Project DSP_iir_ss_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_ss_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_iir_ss_64P_LE_ELF

#############################################################

.projects: src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_ELF

src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_ELF: src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_ELF/.project

src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_ss_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_ss_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_SS_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_SS_64P_LE_ELF_SRCDSP_IIR_SSC64P/DSP_iir_ss_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_LE_ELF_SRCDSP_IIR_SS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_ss" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_LE_ELF_SRCDSP_IIR_SSC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_ss/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_LE_ELF_SRCDSP_IIR_SS=../../ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_LE_ELF_SRCDSP_IIR_SSC64P=.././ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_ss_64P_LE_ELF"
	-@ echo Project DSP_iir_ss_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_ss_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_iir_ss//c64P//DSP_iir_ss_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_iir_ss_64P_BE_ELF

#############################################################

.projects: src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_ELF

src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_ELF: src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_ELF/.project

src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_iir_ss_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_iir_ss_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_IIR_SS_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_IIR_SS_64P_BE_ELF_SRCDSP_IIR_SSC64P/DSP_iir_ss_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_BE_ELF_SRCDSP_IIR_SS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_ss" \
 -ccs.definePathVariable EXT_ROOT__DSP_IIR_SS_64P_BE_ELF_SRCDSP_IIR_SSC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_iir_ss/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_BE_ELF_SRCDSP_IIR_SS=../../ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_IIR_SS_64P_BE_ELF_SRCDSP_IIR_SSC64P=.././ >> src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_ss_64P_BE_ELF"
	-@ echo Project DSP_iir_ss_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_iir_ss_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_iir_ss//c64P//DSP_iir_ss_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_mat_mul_64P_LE_COFF

#############################################################

.projects: src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_COFF

src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_COFF: src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_COFF/.project

src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_mul_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_mul_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_64P_LE_COFF_SRCDSP_MAT_MULC64P/DSP_mat_mul_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_LE_COFF_SRCDSP_MAT_MUL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_LE_COFF_SRCDSP_MAT_MULC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_LE_COFF_SRCDSP_MAT_MUL=../../ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_LE_COFF_SRCDSP_MAT_MULC64P=.././ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_64P_LE_COFF"
	-@ echo Project DSP_mat_mul_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_mat_mul_64P_BE_COFF

#############################################################

.projects: src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_COFF

src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_COFF: src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_COFF/.project

src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_mul_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_mul_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_64P_BE_COFF_SRCDSP_MAT_MULC64P/DSP_mat_mul_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_BE_COFF_SRCDSP_MAT_MUL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_BE_COFF_SRCDSP_MAT_MULC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_BE_COFF_SRCDSP_MAT_MUL=../../ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_BE_COFF_SRCDSP_MAT_MULC64P=.././ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_64P_BE_COFF"
	-@ echo Project DSP_mat_mul_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_mat_mul_64P_LE_ELF

#############################################################

.projects: src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_ELF

src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_ELF: src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_ELF/.project

src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_mul_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_mul_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_64P_LE_ELF_SRCDSP_MAT_MULC64P/DSP_mat_mul_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_LE_ELF_SRCDSP_MAT_MUL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_LE_ELF_SRCDSP_MAT_MULC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_LE_ELF_SRCDSP_MAT_MUL=../../ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_LE_ELF_SRCDSP_MAT_MULC64P=.././ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_64P_LE_ELF"
	-@ echo Project DSP_mat_mul_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_mat_mul//c64P//DSP_mat_mul_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_mat_mul_64P_BE_ELF

#############################################################

.projects: src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_ELF

src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_ELF: src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_ELF/.project

src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_mul_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_mul_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_64P_BE_ELF_SRCDSP_MAT_MULC64P/DSP_mat_mul_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_BE_ELF_SRCDSP_MAT_MUL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_64P_BE_ELF_SRCDSP_MAT_MULC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_BE_ELF_SRCDSP_MAT_MUL=../../ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_64P_BE_ELF_SRCDSP_MAT_MULC64P=.././ >> src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_64P_BE_ELF"
	-@ echo Project DSP_mat_mul_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_mat_mul//c64P//DSP_mat_mul_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_mat_mul_cplx_64P_LE_COFF

#############################################################

.projects: src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_COFF

src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_COFF: src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_COFF/.project

src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_mul_cplx_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_mul_cplx_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_COFF_SRCDSP_MAT_MUL_CPLXC64P/DSP_mat_mul_cplx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_COFF_SRCDSP_MAT_MUL_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_COFF_SRCDSP_MAT_MUL_CPLXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul_cplx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_COFF_SRCDSP_MAT_MUL_CPLX=../../ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_COFF_SRCDSP_MAT_MUL_CPLXC64P=.././ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_cplx_64P_LE_COFF"
	-@ echo Project DSP_mat_mul_cplx_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_cplx_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_mat_mul_cplx_64P_BE_COFF

#############################################################

.projects: src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_COFF

src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_COFF: src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_COFF/.project

src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_mul_cplx_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_mul_cplx_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_COFF_SRCDSP_MAT_MUL_CPLXC64P/DSP_mat_mul_cplx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_COFF_SRCDSP_MAT_MUL_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_COFF_SRCDSP_MAT_MUL_CPLXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul_cplx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_COFF_SRCDSP_MAT_MUL_CPLX=../../ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_COFF_SRCDSP_MAT_MUL_CPLXC64P=.././ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_cplx_64P_BE_COFF"
	-@ echo Project DSP_mat_mul_cplx_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_cplx_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_mat_mul_cplx_64P_LE_ELF

#############################################################

.projects: src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_ELF

src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_ELF: src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_ELF/.project

src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_mul_cplx_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_mul_cplx_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_ELF_SRCDSP_MAT_MUL_CPLXC64P/DSP_mat_mul_cplx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_ELF_SRCDSP_MAT_MUL_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_ELF_SRCDSP_MAT_MUL_CPLXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul_cplx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_ELF_SRCDSP_MAT_MUL_CPLX=../../ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_LE_ELF_SRCDSP_MAT_MUL_CPLXC64P=.././ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_cplx_64P_LE_ELF"
	-@ echo Project DSP_mat_mul_cplx_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_cplx_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_mat_mul_cplx_64P_BE_ELF

#############################################################

.projects: src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_ELF

src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_ELF: src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_ELF/.project

src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_mul_cplx_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_mul_cplx_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_ELF_SRCDSP_MAT_MUL_CPLXC64P/DSP_mat_mul_cplx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_ELF_SRCDSP_MAT_MUL_CPLX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul_cplx" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_ELF_SRCDSP_MAT_MUL_CPLXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_mul_cplx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_ELF_SRCDSP_MAT_MUL_CPLX=../../ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_MUL_CPLX_64P_BE_ELF_SRCDSP_MAT_MUL_CPLXC64P=.././ >> src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_cplx_64P_BE_ELF"
	-@ echo Project DSP_mat_mul_cplx_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_mul_cplx_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_mat_mul_cplx//c64P//DSP_mat_mul_cplx_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_mat_trans_64P_LE_COFF

#############################################################

.projects: src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_COFF

src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_COFF: src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_COFF/.project

src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_trans_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_trans_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_TRANS_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_TRANS_64P_LE_COFF_SRCDSP_MAT_TRANSC64P/DSP_mat_trans_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_LE_COFF_SRCDSP_MAT_TRANS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_trans" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_LE_COFF_SRCDSP_MAT_TRANSC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_trans/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_LE_COFF_SRCDSP_MAT_TRANS=../../ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_LE_COFF_SRCDSP_MAT_TRANSC64P=.././ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_trans_64P_LE_COFF"
	-@ echo Project DSP_mat_trans_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_trans_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_mat_trans_64P_BE_COFF

#############################################################

.projects: src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_COFF

src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_COFF: src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_COFF/.project

src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_trans_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_trans_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_TRANS_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_TRANS_64P_BE_COFF_SRCDSP_MAT_TRANSC64P/DSP_mat_trans_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_BE_COFF_SRCDSP_MAT_TRANS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_trans" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_BE_COFF_SRCDSP_MAT_TRANSC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_trans/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_BE_COFF_SRCDSP_MAT_TRANS=../../ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_BE_COFF_SRCDSP_MAT_TRANSC64P=.././ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_trans_64P_BE_COFF"
	-@ echo Project DSP_mat_trans_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_trans_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_mat_trans_64P_LE_ELF

#############################################################

.projects: src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_ELF

src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_ELF: src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_ELF/.project

src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_trans_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_trans_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_TRANS_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_TRANS_64P_LE_ELF_SRCDSP_MAT_TRANSC64P/DSP_mat_trans_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_LE_ELF_SRCDSP_MAT_TRANS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_trans" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_LE_ELF_SRCDSP_MAT_TRANSC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_trans/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_LE_ELF_SRCDSP_MAT_TRANS=../../ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_LE_ELF_SRCDSP_MAT_TRANSC64P=.././ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_trans_64P_LE_ELF"
	-@ echo Project DSP_mat_trans_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_trans_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_mat_trans//c64P//DSP_mat_trans_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_mat_trans_64P_BE_ELF

#############################################################

.projects: src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_ELF

src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_ELF: src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_ELF/.project

src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mat_trans_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mat_trans_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAT_TRANS_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAT_TRANS_64P_BE_ELF_SRCDSP_MAT_TRANSC64P/DSP_mat_trans_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_BE_ELF_SRCDSP_MAT_TRANS "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_trans" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAT_TRANS_64P_BE_ELF_SRCDSP_MAT_TRANSC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mat_trans/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_BE_ELF_SRCDSP_MAT_TRANS=../../ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAT_TRANS_64P_BE_ELF_SRCDSP_MAT_TRANSC64P=.././ >> src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_trans_64P_BE_ELF"
	-@ echo Project DSP_mat_trans_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mat_trans_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_mat_trans//c64P//DSP_mat_trans_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_maxidx_64P_LE_COFF

#############################################################

.projects: src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_COFF

src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_COFF: src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_COFF/.project

src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_maxidx_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_maxidx_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAXIDX_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAXIDX_64P_LE_COFF_SRCDSP_MAXIDXC64P/DSP_maxidx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_LE_COFF_SRCDSP_MAXIDX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxidx" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_LE_COFF_SRCDSP_MAXIDXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxidx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_LE_COFF_SRCDSP_MAXIDX=../../ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_LE_COFF_SRCDSP_MAXIDXC64P=.././ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_maxidx_64P_LE_COFF"
	-@ echo Project DSP_maxidx_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_maxidx_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_maxidx_64P_BE_COFF

#############################################################

.projects: src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_COFF

src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_COFF: src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_COFF/.project

src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_maxidx_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_maxidx_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAXIDX_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAXIDX_64P_BE_COFF_SRCDSP_MAXIDXC64P/DSP_maxidx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_BE_COFF_SRCDSP_MAXIDX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxidx" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_BE_COFF_SRCDSP_MAXIDXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxidx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_BE_COFF_SRCDSP_MAXIDX=../../ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_BE_COFF_SRCDSP_MAXIDXC64P=.././ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_maxidx_64P_BE_COFF"
	-@ echo Project DSP_maxidx_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_maxidx_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_maxidx_64P_LE_ELF

#############################################################

.projects: src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_ELF

src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_ELF: src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_ELF/.project

src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_maxidx_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_maxidx_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAXIDX_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAXIDX_64P_LE_ELF_SRCDSP_MAXIDXC64P/DSP_maxidx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_LE_ELF_SRCDSP_MAXIDX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxidx" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_LE_ELF_SRCDSP_MAXIDXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxidx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_LE_ELF_SRCDSP_MAXIDX=../../ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_LE_ELF_SRCDSP_MAXIDXC64P=.././ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_maxidx_64P_LE_ELF"
	-@ echo Project DSP_maxidx_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_maxidx_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_maxidx//c64P//DSP_maxidx_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_maxidx_64P_BE_ELF

#############################################################

.projects: src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_ELF

src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_ELF: src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_ELF/.project

src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_maxidx_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_maxidx_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAXIDX_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAXIDX_64P_BE_ELF_SRCDSP_MAXIDXC64P/DSP_maxidx_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_BE_ELF_SRCDSP_MAXIDX "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxidx" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXIDX_64P_BE_ELF_SRCDSP_MAXIDXC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxidx/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_BE_ELF_SRCDSP_MAXIDX=../../ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXIDX_64P_BE_ELF_SRCDSP_MAXIDXC64P=.././ >> src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_maxidx_64P_BE_ELF"
	-@ echo Project DSP_maxidx_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_maxidx_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_maxidx//c64P//DSP_maxidx_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_maxval_64P_LE_COFF

#############################################################

.projects: src/DSP_maxval//c64P//DSP_maxval_64P_LE_COFF

src/DSP_maxval//c64P//DSP_maxval_64P_LE_COFF: src/DSP_maxval//c64P//DSP_maxval_64P_LE_COFF/.project

src/DSP_maxval//c64P//DSP_maxval_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_maxval_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_maxval_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAXVAL_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAXVAL_64P_LE_COFF_SRCDSP_MAXVALC64P/DSP_maxval_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_maxval//c64P//DSP_maxval_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_LE_COFF_SRCDSP_MAXVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxval" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_LE_COFF_SRCDSP_MAXVALC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxval/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_maxval//c64P//DSP_maxval_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_maxval//c64P//DSP_maxval_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_maxval//c64P//DSP_maxval_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_LE_COFF_SRCDSP_MAXVAL=../../ >> src/DSP_maxval//c64P//DSP_maxval_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_LE_COFF_SRCDSP_MAXVALC64P=.././ >> src/DSP_maxval//c64P//DSP_maxval_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_maxval_64P_LE_COFF"
	-@ echo Project DSP_maxval_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_maxval_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_maxval//c64P//DSP_maxval_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_maxval_64P_BE_COFF

#############################################################

.projects: src/DSP_maxval//c64P//DSP_maxval_64P_BE_COFF

src/DSP_maxval//c64P//DSP_maxval_64P_BE_COFF: src/DSP_maxval//c64P//DSP_maxval_64P_BE_COFF/.project

src/DSP_maxval//c64P//DSP_maxval_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_maxval_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_maxval_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAXVAL_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAXVAL_64P_BE_COFF_SRCDSP_MAXVALC64P/DSP_maxval_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_maxval//c64P//DSP_maxval_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_BE_COFF_SRCDSP_MAXVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxval" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_BE_COFF_SRCDSP_MAXVALC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxval/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_maxval//c64P//DSP_maxval_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_maxval//c64P//DSP_maxval_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_maxval//c64P//DSP_maxval_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_BE_COFF_SRCDSP_MAXVAL=../../ >> src/DSP_maxval//c64P//DSP_maxval_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_BE_COFF_SRCDSP_MAXVALC64P=.././ >> src/DSP_maxval//c64P//DSP_maxval_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_maxval_64P_BE_COFF"
	-@ echo Project DSP_maxval_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_maxval_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_maxval//c64P//DSP_maxval_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_maxval_64P_LE_ELF

#############################################################

.projects: src/DSP_maxval//c64P//DSP_maxval_64P_LE_ELF

src/DSP_maxval//c64P//DSP_maxval_64P_LE_ELF: src/DSP_maxval//c64P//DSP_maxval_64P_LE_ELF/.project

src/DSP_maxval//c64P//DSP_maxval_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_maxval_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_maxval_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAXVAL_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAXVAL_64P_LE_ELF_SRCDSP_MAXVALC64P/DSP_maxval_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_maxval//c64P//DSP_maxval_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_LE_ELF_SRCDSP_MAXVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxval" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_LE_ELF_SRCDSP_MAXVALC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxval/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_maxval//c64P//DSP_maxval_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_maxval//c64P//DSP_maxval_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_maxval//c64P//DSP_maxval_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_LE_ELF_SRCDSP_MAXVAL=../../ >> src/DSP_maxval//c64P//DSP_maxval_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_LE_ELF_SRCDSP_MAXVALC64P=.././ >> src/DSP_maxval//c64P//DSP_maxval_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_maxval_64P_LE_ELF"
	-@ echo Project DSP_maxval_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_maxval_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_maxval//c64P//DSP_maxval_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_maxval_64P_BE_ELF

#############################################################

.projects: src/DSP_maxval//c64P//DSP_maxval_64P_BE_ELF

src/DSP_maxval//c64P//DSP_maxval_64P_BE_ELF: src/DSP_maxval//c64P//DSP_maxval_64P_BE_ELF/.project

src/DSP_maxval//c64P//DSP_maxval_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_maxval_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_maxval_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MAXVAL_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MAXVAL_64P_BE_ELF_SRCDSP_MAXVALC64P/DSP_maxval_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_maxval//c64P//DSP_maxval_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_BE_ELF_SRCDSP_MAXVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxval" \
 -ccs.definePathVariable EXT_ROOT__DSP_MAXVAL_64P_BE_ELF_SRCDSP_MAXVALC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_maxval/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_maxval//c64P//DSP_maxval_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_maxval//c64P//DSP_maxval_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_maxval//c64P//DSP_maxval_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_BE_ELF_SRCDSP_MAXVAL=../../ >> src/DSP_maxval//c64P//DSP_maxval_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MAXVAL_64P_BE_ELF_SRCDSP_MAXVALC64P=.././ >> src/DSP_maxval//c64P//DSP_maxval_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_maxval_64P_BE_ELF"
	-@ echo Project DSP_maxval_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_maxval_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_maxval//c64P//DSP_maxval_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_minerror_64P_LE_COFF

#############################################################

.projects: src/DSP_minerror//c64P//DSP_minerror_64P_LE_COFF

src/DSP_minerror//c64P//DSP_minerror_64P_LE_COFF: src/DSP_minerror//c64P//DSP_minerror_64P_LE_COFF/.project

src/DSP_minerror//c64P//DSP_minerror_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_minerror_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_minerror_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MINERROR_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MINERROR_64P_LE_COFF_SRCDSP_MINERRORC64P/DSP_minerror_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_minerror//c64P//DSP_minerror_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_LE_COFF_SRCDSP_MINERROR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minerror" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_LE_COFF_SRCDSP_MINERRORC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minerror/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_minerror//c64P//DSP_minerror_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_minerror//c64P//DSP_minerror_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_minerror//c64P//DSP_minerror_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_LE_COFF_SRCDSP_MINERROR=../../ >> src/DSP_minerror//c64P//DSP_minerror_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_LE_COFF_SRCDSP_MINERRORC64P=.././ >> src/DSP_minerror//c64P//DSP_minerror_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_minerror_64P_LE_COFF"
	-@ echo Project DSP_minerror_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_minerror_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_minerror//c64P//DSP_minerror_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_minerror_64P_BE_COFF

#############################################################

.projects: src/DSP_minerror//c64P//DSP_minerror_64P_BE_COFF

src/DSP_minerror//c64P//DSP_minerror_64P_BE_COFF: src/DSP_minerror//c64P//DSP_minerror_64P_BE_COFF/.project

src/DSP_minerror//c64P//DSP_minerror_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_minerror_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_minerror_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MINERROR_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MINERROR_64P_BE_COFF_SRCDSP_MINERRORC64P/DSP_minerror_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_minerror//c64P//DSP_minerror_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_BE_COFF_SRCDSP_MINERROR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minerror" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_BE_COFF_SRCDSP_MINERRORC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minerror/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_minerror//c64P//DSP_minerror_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_minerror//c64P//DSP_minerror_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_minerror//c64P//DSP_minerror_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_BE_COFF_SRCDSP_MINERROR=../../ >> src/DSP_minerror//c64P//DSP_minerror_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_BE_COFF_SRCDSP_MINERRORC64P=.././ >> src/DSP_minerror//c64P//DSP_minerror_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_minerror_64P_BE_COFF"
	-@ echo Project DSP_minerror_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_minerror_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_minerror//c64P//DSP_minerror_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_minerror_64P_LE_ELF

#############################################################

.projects: src/DSP_minerror//c64P//DSP_minerror_64P_LE_ELF

src/DSP_minerror//c64P//DSP_minerror_64P_LE_ELF: src/DSP_minerror//c64P//DSP_minerror_64P_LE_ELF/.project

src/DSP_minerror//c64P//DSP_minerror_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_minerror_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_minerror_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MINERROR_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MINERROR_64P_LE_ELF_SRCDSP_MINERRORC64P/DSP_minerror_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_minerror//c64P//DSP_minerror_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_LE_ELF_SRCDSP_MINERROR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minerror" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_LE_ELF_SRCDSP_MINERRORC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minerror/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_minerror//c64P//DSP_minerror_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_minerror//c64P//DSP_minerror_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_minerror//c64P//DSP_minerror_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_LE_ELF_SRCDSP_MINERROR=../../ >> src/DSP_minerror//c64P//DSP_minerror_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_LE_ELF_SRCDSP_MINERRORC64P=.././ >> src/DSP_minerror//c64P//DSP_minerror_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_minerror_64P_LE_ELF"
	-@ echo Project DSP_minerror_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_minerror_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_minerror//c64P//DSP_minerror_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_minerror_64P_BE_ELF

#############################################################

.projects: src/DSP_minerror//c64P//DSP_minerror_64P_BE_ELF

src/DSP_minerror//c64P//DSP_minerror_64P_BE_ELF: src/DSP_minerror//c64P//DSP_minerror_64P_BE_ELF/.project

src/DSP_minerror//c64P//DSP_minerror_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_minerror_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_minerror_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MINERROR_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MINERROR_64P_BE_ELF_SRCDSP_MINERRORC64P/DSP_minerror_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_minerror//c64P//DSP_minerror_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_BE_ELF_SRCDSP_MINERROR "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minerror" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINERROR_64P_BE_ELF_SRCDSP_MINERRORC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minerror/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_minerror//c64P//DSP_minerror_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_minerror//c64P//DSP_minerror_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_minerror//c64P//DSP_minerror_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_BE_ELF_SRCDSP_MINERROR=../../ >> src/DSP_minerror//c64P//DSP_minerror_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINERROR_64P_BE_ELF_SRCDSP_MINERRORC64P=.././ >> src/DSP_minerror//c64P//DSP_minerror_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_minerror_64P_BE_ELF"
	-@ echo Project DSP_minerror_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_minerror_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_minerror//c64P//DSP_minerror_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_minval_64P_LE_COFF

#############################################################

.projects: src/DSP_minval//c64P//DSP_minval_64P_LE_COFF

src/DSP_minval//c64P//DSP_minval_64P_LE_COFF: src/DSP_minval//c64P//DSP_minval_64P_LE_COFF/.project

src/DSP_minval//c64P//DSP_minval_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_minval_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_minval_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MINVAL_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MINVAL_64P_LE_COFF_SRCDSP_MINVALC64P/DSP_minval_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_minval//c64P//DSP_minval_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_LE_COFF_SRCDSP_MINVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minval" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_LE_COFF_SRCDSP_MINVALC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minval/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_minval//c64P//DSP_minval_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_minval//c64P//DSP_minval_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_minval//c64P//DSP_minval_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_LE_COFF_SRCDSP_MINVAL=../../ >> src/DSP_minval//c64P//DSP_minval_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_LE_COFF_SRCDSP_MINVALC64P=.././ >> src/DSP_minval//c64P//DSP_minval_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_minval_64P_LE_COFF"
	-@ echo Project DSP_minval_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_minval_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_minval//c64P//DSP_minval_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_minval_64P_BE_COFF

#############################################################

.projects: src/DSP_minval//c64P//DSP_minval_64P_BE_COFF

src/DSP_minval//c64P//DSP_minval_64P_BE_COFF: src/DSP_minval//c64P//DSP_minval_64P_BE_COFF/.project

src/DSP_minval//c64P//DSP_minval_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_minval_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_minval_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MINVAL_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MINVAL_64P_BE_COFF_SRCDSP_MINVALC64P/DSP_minval_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_minval//c64P//DSP_minval_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_BE_COFF_SRCDSP_MINVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minval" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_BE_COFF_SRCDSP_MINVALC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minval/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_minval//c64P//DSP_minval_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_minval//c64P//DSP_minval_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_minval//c64P//DSP_minval_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_BE_COFF_SRCDSP_MINVAL=../../ >> src/DSP_minval//c64P//DSP_minval_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_BE_COFF_SRCDSP_MINVALC64P=.././ >> src/DSP_minval//c64P//DSP_minval_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_minval_64P_BE_COFF"
	-@ echo Project DSP_minval_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_minval_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_minval//c64P//DSP_minval_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_minval_64P_LE_ELF

#############################################################

.projects: src/DSP_minval//c64P//DSP_minval_64P_LE_ELF

src/DSP_minval//c64P//DSP_minval_64P_LE_ELF: src/DSP_minval//c64P//DSP_minval_64P_LE_ELF/.project

src/DSP_minval//c64P//DSP_minval_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_minval_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_minval_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MINVAL_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MINVAL_64P_LE_ELF_SRCDSP_MINVALC64P/DSP_minval_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_minval//c64P//DSP_minval_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_LE_ELF_SRCDSP_MINVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minval" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_LE_ELF_SRCDSP_MINVALC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minval/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_minval//c64P//DSP_minval_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_minval//c64P//DSP_minval_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_minval//c64P//DSP_minval_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_LE_ELF_SRCDSP_MINVAL=../../ >> src/DSP_minval//c64P//DSP_minval_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_LE_ELF_SRCDSP_MINVALC64P=.././ >> src/DSP_minval//c64P//DSP_minval_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_minval_64P_LE_ELF"
	-@ echo Project DSP_minval_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_minval_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_minval//c64P//DSP_minval_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_minval_64P_BE_ELF

#############################################################

.projects: src/DSP_minval//c64P//DSP_minval_64P_BE_ELF

src/DSP_minval//c64P//DSP_minval_64P_BE_ELF: src/DSP_minval//c64P//DSP_minval_64P_BE_ELF/.project

src/DSP_minval//c64P//DSP_minval_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_minval_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_minval_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MINVAL_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MINVAL_64P_BE_ELF_SRCDSP_MINVALC64P/DSP_minval_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_minval//c64P//DSP_minval_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_BE_ELF_SRCDSP_MINVAL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minval" \
 -ccs.definePathVariable EXT_ROOT__DSP_MINVAL_64P_BE_ELF_SRCDSP_MINVALC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_minval/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_minval//c64P//DSP_minval_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_minval//c64P//DSP_minval_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_minval//c64P//DSP_minval_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_BE_ELF_SRCDSP_MINVAL=../../ >> src/DSP_minval//c64P//DSP_minval_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MINVAL_64P_BE_ELF_SRCDSP_MINVALC64P=.././ >> src/DSP_minval//c64P//DSP_minval_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_minval_64P_BE_ELF"
	-@ echo Project DSP_minval_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_minval_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_minval//c64P//DSP_minval_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_mul32_64P_LE_COFF

#############################################################

.projects: src/DSP_mul32//c64P//DSP_mul32_64P_LE_COFF

src/DSP_mul32//c64P//DSP_mul32_64P_LE_COFF: src/DSP_mul32//c64P//DSP_mul32_64P_LE_COFF/.project

src/DSP_mul32//c64P//DSP_mul32_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mul32_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mul32_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MUL32_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MUL32_64P_LE_COFF_SRCDSP_MUL32C64P/DSP_mul32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mul32//c64P//DSP_mul32_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_LE_COFF_SRCDSP_MUL32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mul32" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_LE_COFF_SRCDSP_MUL32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mul32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mul32//c64P//DSP_mul32_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mul32//c64P//DSP_mul32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mul32//c64P//DSP_mul32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_LE_COFF_SRCDSP_MUL32=../../ >> src/DSP_mul32//c64P//DSP_mul32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_LE_COFF_SRCDSP_MUL32C64P=.././ >> src/DSP_mul32//c64P//DSP_mul32_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mul32_64P_LE_COFF"
	-@ echo Project DSP_mul32_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mul32_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_mul32//c64P//DSP_mul32_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_mul32_64P_BE_COFF

#############################################################

.projects: src/DSP_mul32//c64P//DSP_mul32_64P_BE_COFF

src/DSP_mul32//c64P//DSP_mul32_64P_BE_COFF: src/DSP_mul32//c64P//DSP_mul32_64P_BE_COFF/.project

src/DSP_mul32//c64P//DSP_mul32_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mul32_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mul32_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MUL32_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MUL32_64P_BE_COFF_SRCDSP_MUL32C64P/DSP_mul32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mul32//c64P//DSP_mul32_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_BE_COFF_SRCDSP_MUL32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mul32" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_BE_COFF_SRCDSP_MUL32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mul32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mul32//c64P//DSP_mul32_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mul32//c64P//DSP_mul32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mul32//c64P//DSP_mul32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_BE_COFF_SRCDSP_MUL32=../../ >> src/DSP_mul32//c64P//DSP_mul32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_BE_COFF_SRCDSP_MUL32C64P=.././ >> src/DSP_mul32//c64P//DSP_mul32_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mul32_64P_BE_COFF"
	-@ echo Project DSP_mul32_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mul32_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_mul32//c64P//DSP_mul32_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_mul32_64P_LE_ELF

#############################################################

.projects: src/DSP_mul32//c64P//DSP_mul32_64P_LE_ELF

src/DSP_mul32//c64P//DSP_mul32_64P_LE_ELF: src/DSP_mul32//c64P//DSP_mul32_64P_LE_ELF/.project

src/DSP_mul32//c64P//DSP_mul32_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mul32_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mul32_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MUL32_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MUL32_64P_LE_ELF_SRCDSP_MUL32C64P/DSP_mul32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mul32//c64P//DSP_mul32_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_LE_ELF_SRCDSP_MUL32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mul32" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_LE_ELF_SRCDSP_MUL32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mul32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mul32//c64P//DSP_mul32_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mul32//c64P//DSP_mul32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mul32//c64P//DSP_mul32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_LE_ELF_SRCDSP_MUL32=../../ >> src/DSP_mul32//c64P//DSP_mul32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_LE_ELF_SRCDSP_MUL32C64P=.././ >> src/DSP_mul32//c64P//DSP_mul32_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mul32_64P_LE_ELF"
	-@ echo Project DSP_mul32_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mul32_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_mul32//c64P//DSP_mul32_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_mul32_64P_BE_ELF

#############################################################

.projects: src/DSP_mul32//c64P//DSP_mul32_64P_BE_ELF

src/DSP_mul32//c64P//DSP_mul32_64P_BE_ELF: src/DSP_mul32//c64P//DSP_mul32_64P_BE_ELF/.project

src/DSP_mul32//c64P//DSP_mul32_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_mul32_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_mul32_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_MUL32_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_MUL32_64P_BE_ELF_SRCDSP_MUL32C64P/DSP_mul32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_mul32//c64P//DSP_mul32_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_BE_ELF_SRCDSP_MUL32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mul32" \
 -ccs.definePathVariable EXT_ROOT__DSP_MUL32_64P_BE_ELF_SRCDSP_MUL32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_mul32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_mul32//c64P//DSP_mul32_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_mul32//c64P//DSP_mul32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_mul32//c64P//DSP_mul32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_BE_ELF_SRCDSP_MUL32=../../ >> src/DSP_mul32//c64P//DSP_mul32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_MUL32_64P_BE_ELF_SRCDSP_MUL32C64P=.././ >> src/DSP_mul32//c64P//DSP_mul32_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_mul32_64P_BE_ELF"
	-@ echo Project DSP_mul32_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_mul32_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_mul32//c64P//DSP_mul32_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_neg32_64P_LE_COFF

#############################################################

.projects: src/DSP_neg32//c64P//DSP_neg32_64P_LE_COFF

src/DSP_neg32//c64P//DSP_neg32_64P_LE_COFF: src/DSP_neg32//c64P//DSP_neg32_64P_LE_COFF/.project

src/DSP_neg32//c64P//DSP_neg32_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_neg32_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_neg32_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_NEG32_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_NEG32_64P_LE_COFF_SRCDSP_NEG32C64P/DSP_neg32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_neg32//c64P//DSP_neg32_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_LE_COFF_SRCDSP_NEG32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_neg32" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_LE_COFF_SRCDSP_NEG32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_neg32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_neg32//c64P//DSP_neg32_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_neg32//c64P//DSP_neg32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_neg32//c64P//DSP_neg32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_LE_COFF_SRCDSP_NEG32=../../ >> src/DSP_neg32//c64P//DSP_neg32_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_LE_COFF_SRCDSP_NEG32C64P=.././ >> src/DSP_neg32//c64P//DSP_neg32_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_neg32_64P_LE_COFF"
	-@ echo Project DSP_neg32_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_neg32_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_neg32//c64P//DSP_neg32_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_neg32_64P_BE_COFF

#############################################################

.projects: src/DSP_neg32//c64P//DSP_neg32_64P_BE_COFF

src/DSP_neg32//c64P//DSP_neg32_64P_BE_COFF: src/DSP_neg32//c64P//DSP_neg32_64P_BE_COFF/.project

src/DSP_neg32//c64P//DSP_neg32_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_neg32_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_neg32_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_NEG32_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_NEG32_64P_BE_COFF_SRCDSP_NEG32C64P/DSP_neg32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_neg32//c64P//DSP_neg32_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_BE_COFF_SRCDSP_NEG32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_neg32" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_BE_COFF_SRCDSP_NEG32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_neg32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_neg32//c64P//DSP_neg32_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_neg32//c64P//DSP_neg32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_neg32//c64P//DSP_neg32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_BE_COFF_SRCDSP_NEG32=../../ >> src/DSP_neg32//c64P//DSP_neg32_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_BE_COFF_SRCDSP_NEG32C64P=.././ >> src/DSP_neg32//c64P//DSP_neg32_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_neg32_64P_BE_COFF"
	-@ echo Project DSP_neg32_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_neg32_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_neg32//c64P//DSP_neg32_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_neg32_64P_LE_ELF

#############################################################

.projects: src/DSP_neg32//c64P//DSP_neg32_64P_LE_ELF

src/DSP_neg32//c64P//DSP_neg32_64P_LE_ELF: src/DSP_neg32//c64P//DSP_neg32_64P_LE_ELF/.project

src/DSP_neg32//c64P//DSP_neg32_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_neg32_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_neg32_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_NEG32_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_NEG32_64P_LE_ELF_SRCDSP_NEG32C64P/DSP_neg32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_neg32//c64P//DSP_neg32_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_LE_ELF_SRCDSP_NEG32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_neg32" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_LE_ELF_SRCDSP_NEG32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_neg32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_neg32//c64P//DSP_neg32_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_neg32//c64P//DSP_neg32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_neg32//c64P//DSP_neg32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_LE_ELF_SRCDSP_NEG32=../../ >> src/DSP_neg32//c64P//DSP_neg32_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_LE_ELF_SRCDSP_NEG32C64P=.././ >> src/DSP_neg32//c64P//DSP_neg32_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_neg32_64P_LE_ELF"
	-@ echo Project DSP_neg32_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_neg32_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_neg32//c64P//DSP_neg32_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_neg32_64P_BE_ELF

#############################################################

.projects: src/DSP_neg32//c64P//DSP_neg32_64P_BE_ELF

src/DSP_neg32//c64P//DSP_neg32_64P_BE_ELF: src/DSP_neg32//c64P//DSP_neg32_64P_BE_ELF/.project

src/DSP_neg32//c64P//DSP_neg32_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_neg32_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_neg32_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_NEG32_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_NEG32_64P_BE_ELF_SRCDSP_NEG32C64P/DSP_neg32_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_neg32//c64P//DSP_neg32_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_BE_ELF_SRCDSP_NEG32 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_neg32" \
 -ccs.definePathVariable EXT_ROOT__DSP_NEG32_64P_BE_ELF_SRCDSP_NEG32C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_neg32/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_neg32//c64P//DSP_neg32_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_neg32//c64P//DSP_neg32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_neg32//c64P//DSP_neg32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_BE_ELF_SRCDSP_NEG32=../../ >> src/DSP_neg32//c64P//DSP_neg32_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_NEG32_64P_BE_ELF_SRCDSP_NEG32C64P=.././ >> src/DSP_neg32//c64P//DSP_neg32_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_neg32_64P_BE_ELF"
	-@ echo Project DSP_neg32_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_neg32_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_neg32//c64P//DSP_neg32_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_q15tofl_64P_LE_COFF

#############################################################

.projects: src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_COFF

src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_COFF: src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_COFF/.project

src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_q15tofl_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_q15tofl_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_Q15TOFL_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_Q15TOFL_64P_LE_COFF_SRCDSP_Q15TOFLC64P/DSP_q15tofl_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_LE_COFF_SRCDSP_Q15TOFL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_q15tofl" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_LE_COFF_SRCDSP_Q15TOFLC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_q15tofl/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_LE_COFF_SRCDSP_Q15TOFL=../../ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_LE_COFF_SRCDSP_Q15TOFLC64P=.././ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_q15tofl_64P_LE_COFF"
	-@ echo Project DSP_q15tofl_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_q15tofl_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_q15tofl_64P_BE_COFF

#############################################################

.projects: src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_COFF

src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_COFF: src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_COFF/.project

src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_q15tofl_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_q15tofl_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_Q15TOFL_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_Q15TOFL_64P_BE_COFF_SRCDSP_Q15TOFLC64P/DSP_q15tofl_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_BE_COFF_SRCDSP_Q15TOFL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_q15tofl" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_BE_COFF_SRCDSP_Q15TOFLC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_q15tofl/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_BE_COFF_SRCDSP_Q15TOFL=../../ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_BE_COFF_SRCDSP_Q15TOFLC64P=.././ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_q15tofl_64P_BE_COFF"
	-@ echo Project DSP_q15tofl_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_q15tofl_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_q15tofl_64P_LE_ELF

#############################################################

.projects: src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_ELF

src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_ELF: src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_ELF/.project

src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_q15tofl_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_q15tofl_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_Q15TOFL_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_Q15TOFL_64P_LE_ELF_SRCDSP_Q15TOFLC64P/DSP_q15tofl_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_LE_ELF_SRCDSP_Q15TOFL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_q15tofl" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_LE_ELF_SRCDSP_Q15TOFLC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_q15tofl/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_LE_ELF_SRCDSP_Q15TOFL=../../ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_LE_ELF_SRCDSP_Q15TOFLC64P=.././ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_q15tofl_64P_LE_ELF"
	-@ echo Project DSP_q15tofl_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_q15tofl_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_q15tofl//c64P//DSP_q15tofl_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_q15tofl_64P_BE_ELF

#############################################################

.projects: src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_ELF

src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_ELF: src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_ELF/.project

src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_q15tofl_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_q15tofl_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_Q15TOFL_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_Q15TOFL_64P_BE_ELF_SRCDSP_Q15TOFLC64P/DSP_q15tofl_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_BE_ELF_SRCDSP_Q15TOFL "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_q15tofl" \
 -ccs.definePathVariable EXT_ROOT__DSP_Q15TOFL_64P_BE_ELF_SRCDSP_Q15TOFLC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_q15tofl/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_BE_ELF_SRCDSP_Q15TOFL=../../ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_Q15TOFL_64P_BE_ELF_SRCDSP_Q15TOFLC64P=.././ >> src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_q15tofl_64P_BE_ELF"
	-@ echo Project DSP_q15tofl_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_q15tofl_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_q15tofl//c64P//DSP_q15tofl_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_recip16_64P_LE_COFF

#############################################################

.projects: src/DSP_recip16//c64P//DSP_recip16_64P_LE_COFF

src/DSP_recip16//c64P//DSP_recip16_64P_LE_COFF: src/DSP_recip16//c64P//DSP_recip16_64P_LE_COFF/.project

src/DSP_recip16//c64P//DSP_recip16_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_recip16_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_recip16_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_RECIP16_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_RECIP16_64P_LE_COFF_SRCDSP_RECIP16C64P/DSP_recip16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_recip16//c64P//DSP_recip16_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_LE_COFF_SRCDSP_RECIP16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_recip16" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_LE_COFF_SRCDSP_RECIP16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_recip16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_recip16//c64P//DSP_recip16_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_recip16//c64P//DSP_recip16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_recip16//c64P//DSP_recip16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_LE_COFF_SRCDSP_RECIP16=../../ >> src/DSP_recip16//c64P//DSP_recip16_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_LE_COFF_SRCDSP_RECIP16C64P=.././ >> src/DSP_recip16//c64P//DSP_recip16_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_recip16_64P_LE_COFF"
	-@ echo Project DSP_recip16_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_recip16_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_recip16//c64P//DSP_recip16_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_recip16_64P_BE_COFF

#############################################################

.projects: src/DSP_recip16//c64P//DSP_recip16_64P_BE_COFF

src/DSP_recip16//c64P//DSP_recip16_64P_BE_COFF: src/DSP_recip16//c64P//DSP_recip16_64P_BE_COFF/.project

src/DSP_recip16//c64P//DSP_recip16_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_recip16_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_recip16_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_RECIP16_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_RECIP16_64P_BE_COFF_SRCDSP_RECIP16C64P/DSP_recip16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_recip16//c64P//DSP_recip16_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_BE_COFF_SRCDSP_RECIP16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_recip16" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_BE_COFF_SRCDSP_RECIP16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_recip16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_recip16//c64P//DSP_recip16_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_recip16//c64P//DSP_recip16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_recip16//c64P//DSP_recip16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_BE_COFF_SRCDSP_RECIP16=../../ >> src/DSP_recip16//c64P//DSP_recip16_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_BE_COFF_SRCDSP_RECIP16C64P=.././ >> src/DSP_recip16//c64P//DSP_recip16_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_recip16_64P_BE_COFF"
	-@ echo Project DSP_recip16_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_recip16_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_recip16//c64P//DSP_recip16_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_recip16_64P_LE_ELF

#############################################################

.projects: src/DSP_recip16//c64P//DSP_recip16_64P_LE_ELF

src/DSP_recip16//c64P//DSP_recip16_64P_LE_ELF: src/DSP_recip16//c64P//DSP_recip16_64P_LE_ELF/.project

src/DSP_recip16//c64P//DSP_recip16_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_recip16_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_recip16_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_RECIP16_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_RECIP16_64P_LE_ELF_SRCDSP_RECIP16C64P/DSP_recip16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_recip16//c64P//DSP_recip16_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_LE_ELF_SRCDSP_RECIP16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_recip16" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_LE_ELF_SRCDSP_RECIP16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_recip16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_recip16//c64P//DSP_recip16_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_recip16//c64P//DSP_recip16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_recip16//c64P//DSP_recip16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_LE_ELF_SRCDSP_RECIP16=../../ >> src/DSP_recip16//c64P//DSP_recip16_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_LE_ELF_SRCDSP_RECIP16C64P=.././ >> src/DSP_recip16//c64P//DSP_recip16_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_recip16_64P_LE_ELF"
	-@ echo Project DSP_recip16_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_recip16_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_recip16//c64P//DSP_recip16_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_recip16_64P_BE_ELF

#############################################################

.projects: src/DSP_recip16//c64P//DSP_recip16_64P_BE_ELF

src/DSP_recip16//c64P//DSP_recip16_64P_BE_ELF: src/DSP_recip16//c64P//DSP_recip16_64P_BE_ELF/.project

src/DSP_recip16//c64P//DSP_recip16_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_recip16_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_recip16_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_RECIP16_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_RECIP16_64P_BE_ELF_SRCDSP_RECIP16C64P/DSP_recip16_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_recip16//c64P//DSP_recip16_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_BE_ELF_SRCDSP_RECIP16 "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_recip16" \
 -ccs.definePathVariable EXT_ROOT__DSP_RECIP16_64P_BE_ELF_SRCDSP_RECIP16C64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_recip16/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_recip16//c64P//DSP_recip16_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_recip16//c64P//DSP_recip16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_recip16//c64P//DSP_recip16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_BE_ELF_SRCDSP_RECIP16=../../ >> src/DSP_recip16//c64P//DSP_recip16_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_RECIP16_64P_BE_ELF_SRCDSP_RECIP16C64P=.././ >> src/DSP_recip16//c64P//DSP_recip16_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_recip16_64P_BE_ELF"
	-@ echo Project DSP_recip16_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_recip16_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_recip16//c64P//DSP_recip16_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_vecsumsq_64P_LE_COFF

#############################################################

.projects: src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_COFF

src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_COFF: src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_COFF/.project

src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_vecsumsq_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_vecsumsq_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_VECSUMSQ_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_VECSUMSQ_64P_LE_COFF_SRCDSP_VECSUMSQC64P/DSP_vecsumsq_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_LE_COFF_SRCDSP_VECSUMSQ "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_vecsumsq" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_LE_COFF_SRCDSP_VECSUMSQC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_vecsumsq/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_LE_COFF_SRCDSP_VECSUMSQ=../../ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_LE_COFF_SRCDSP_VECSUMSQC64P=.././ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_vecsumsq_64P_LE_COFF"
	-@ echo Project DSP_vecsumsq_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_vecsumsq_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_vecsumsq_64P_BE_COFF

#############################################################

.projects: src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_COFF

src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_COFF: src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_COFF/.project

src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_vecsumsq_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_vecsumsq_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_VECSUMSQ_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_VECSUMSQ_64P_BE_COFF_SRCDSP_VECSUMSQC64P/DSP_vecsumsq_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_BE_COFF_SRCDSP_VECSUMSQ "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_vecsumsq" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_BE_COFF_SRCDSP_VECSUMSQC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_vecsumsq/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_BE_COFF_SRCDSP_VECSUMSQ=../../ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_BE_COFF_SRCDSP_VECSUMSQC64P=.././ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_vecsumsq_64P_BE_COFF"
	-@ echo Project DSP_vecsumsq_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_vecsumsq_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_vecsumsq_64P_LE_ELF

#############################################################

.projects: src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_ELF

src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_ELF: src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_ELF/.project

src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_vecsumsq_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_vecsumsq_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_VECSUMSQ_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_VECSUMSQ_64P_LE_ELF_SRCDSP_VECSUMSQC64P/DSP_vecsumsq_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_LE_ELF_SRCDSP_VECSUMSQ "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_vecsumsq" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_LE_ELF_SRCDSP_VECSUMSQC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_vecsumsq/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_LE_ELF_SRCDSP_VECSUMSQ=../../ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_LE_ELF_SRCDSP_VECSUMSQC64P=.././ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_vecsumsq_64P_LE_ELF"
	-@ echo Project DSP_vecsumsq_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_vecsumsq_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_vecsumsq_64P_BE_ELF

#############################################################

.projects: src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_ELF

src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_ELF: src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_ELF/.project

src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_vecsumsq_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_vecsumsq_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_VECSUMSQ_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_VECSUMSQ_64P_BE_ELF_SRCDSP_VECSUMSQC64P/DSP_vecsumsq_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_BE_ELF_SRCDSP_VECSUMSQ "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_vecsumsq" \
 -ccs.definePathVariable EXT_ROOT__DSP_VECSUMSQ_64P_BE_ELF_SRCDSP_VECSUMSQC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_vecsumsq/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_BE_ELF_SRCDSP_VECSUMSQ=../../ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_VECSUMSQ_64P_BE_ELF_SRCDSP_VECSUMSQC64P=.././ >> src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_vecsumsq_64P_BE_ELF"
	-@ echo Project DSP_vecsumsq_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_vecsumsq_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_vecsumsq//c64P//DSP_vecsumsq_64P_BE_ELF"


#############################################################

# Rule to Build Project DSP_w_vec_64P_LE_COFF

#############################################################

.projects: src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_COFF

src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_COFF: src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_COFF/.project

src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_w_vec_64P_LE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_w_vec_64P_LE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_W_VEC_64P_LE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_W_VEC_64P_LE_COFF_SRCDSP_W_VECC64P/DSP_w_vec_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw -Dti_targets_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_LE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_LE_COFF_SRCDSP_W_VEC "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_w_vec" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_LE_COFF_SRCDSP_W_VECC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_w_vec/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_LE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_LE_COFF_SRCDSP_W_VEC=../../ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_COFF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_LE_COFF_SRCDSP_W_VECC64P=.././ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_w_vec_64P_LE_COFF"
	-@ echo Project DSP_w_vec_64P_LE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_w_vec_64P_LE_COFF"

clean::
	-$(RMDIR) "src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_COFF"


#############################################################

# Rule to Build Project DSP_w_vec_64P_BE_COFF

#############################################################

.projects: src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_COFF

src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_COFF: src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_COFF/.project

src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_COFF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_w_vec_64P_BE_COFF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_w_vec_64P_BE_COFF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_W_VEC_64P_BE_COFF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_W_VEC_64P_BE_COFF_SRCDSP_W_VECC64P/DSP_w_vec_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw  -Dti_targets_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_COFF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat coff\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_BE_COFF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_BE_COFF_SRCDSP_W_VEC "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_w_vec" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_BE_COFF_SRCDSP_W_VECC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_w_vec/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_COFF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_BE_COFF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_BE_COFF_SRCDSP_W_VEC=../../ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_COFF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_BE_COFF_SRCDSP_W_VECC64P=.././ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_COFF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_w_vec_64P_BE_COFF"
	-@ echo Project DSP_w_vec_64P_BE_COFF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_w_vec_64P_BE_COFF"

clean::
	-$(RMDIR) "src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_COFF"


#############################################################

# Rule to Build Project DSP_w_vec_64P_LE_ELF

#############################################################

.projects: src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_ELF

src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_ELF: src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_ELF/.project

src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_w_vec_64P_LE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_w_vec_64P_LE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness little\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_W_VEC_64P_LE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_W_VEC_64P_LE_ELF_SRCDSP_W_VECC64P/DSP_w_vec_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_LE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_LE_ELF_SRCDSP_W_VEC "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_w_vec" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_LE_ELF_SRCDSP_W_VECC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_w_vec/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_LE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_LE_ELF_SRCDSP_W_VEC=../../ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_ELF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_LE_ELF_SRCDSP_W_VECC64P=.././ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_w_vec_64P_LE_ELF"
	-@ echo Project DSP_w_vec_64P_LE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_w_vec_64P_LE_ELF"

clean::
	-$(RMDIR) "src/DSP_w_vec//c64P//DSP_w_vec_64P_LE_ELF"


#############################################################

# Rule to Build Project DSP_w_vec_64P_BE_ELF

#############################################################

.projects: src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_ELF

src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_ELF: src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_ELF/.project

src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_ELF/.project: .xdcenv.mak Package.bld Package.mak
	$(ECLIPSE_CMD)  -data "C:/Temp/workspace/DSP_w_vec_64P_BE_ELF" -application com.ti.ccstudio.apps.projectCreate \
 -ccs.name DSP_w_vec_64P_BE_ELF\
 -ccs.device com.ti.ccstudio.deviceModel.C6000.CustomC6000Device\
 -ccs.endianness big\
 -ccs.kind com.ti.ccstudio.managedbuild.core.ProjectKind_Executable \
 -ccs.outputType executable -ccs.linkFile EXT_ROOT__DSP_W_VEC_64P_BE_ELF_SRCCOMMONC64P/lnk.cmd\
 -ccs.linkFile EXT_ROOT__DSP_W_VEC_64P_BE_ELF_SRCDSP_W_VECC64P/DSP_w_vec_d.c\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -g  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Debug\
 -ccs.setCompilerOptions "-mv64plus -k -mw --strip_coff_underscore -Dti_targets_elf_C64P_big_endian --mem_model:data=far -o3 --symdebug:none  -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../" @configurations Release\
 -ccs.setLinkerOptions " -i../../../../../../../ -i$$$${MATHLIB_INSTALL_DIR}/packages  -i$$$${DSPLIB_INSTALL_DIR} -i../../../../common/c64P -i../../../ -i../../"\
 -ccs.location src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_ELF\
 -ccs.overwrite full \
 -ccs.rts libc.a \
 -ccs.cgtVersion $(CCSCGTVER)\
 -ccs.outputFormat elf\
 -ccs.definePathVariable DSPLIB_INSTALL_DIR "$(DSPLIB_INSTALL_DIR)" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_BE_ELF_SRCCOMMONC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/common/c64P" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_BE_ELF_SRCDSP_W_VEC "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_w_vec" \
 -ccs.definePathVariable EXT_ROOT__DSP_W_VEC_64P_BE_ELF_SRCDSP_W_VECC64P "C:/nightlybuilds/dsplib/ti/dsplib/src/DSP_w_vec/c64P" \

	${FIXCCSPJT}
	echo MATHLIB_INSTALL_DIR=c:/ti/mathlib_c66x_3_1_0_0 >> src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_ELF/macros.ini
	echo DSPLIB_INSTALL_DIR=../../../../../../ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_BE_ELF_SRCCOMMONC64P=../../../common/c64P >> src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_BE_ELF_SRCDSP_W_VEC=../../ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_ELF/macros.ini
	echo EXT_ROOT__DSP_W_VEC_64P_BE_ELF_SRCDSP_W_VECC64P=.././ >> src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_ELF/macros.ini
	-$(RMDIR) "C:/Temp/workspace/DSP_w_vec_64P_BE_ELF"
	-@ echo Project DSP_w_vec_64P_BE_ELF Completed ...
	-@ echo ########################################
	-$(RMDIR) "C:/Temp/workspace/DSP_w_vec_64P_BE_ELF"

clean::
	-$(RMDIR) "src/DSP_w_vec//c64P//DSP_w_vec_64P_BE_ELF"

