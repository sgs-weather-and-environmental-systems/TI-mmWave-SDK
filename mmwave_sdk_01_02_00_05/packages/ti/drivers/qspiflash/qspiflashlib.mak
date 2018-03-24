###################################################################################
# QSPIFLASH Driver Makefile
###################################################################################
.PHONY: qspiflashDrv qspiflashDrvClean

###################################################################################
# Setup the VPATH:
###################################################################################
vpath %.c src
vpath %.c platform

###################################################################################
# Driver Source Files:
###################################################################################
QSPIFLASH_DRV_SOURCES = qspiflash.c

###################################################################################
# Driver Flash device file
# - SPANSION
###################################################################################
QSPIFLASH_DRV_SOURCES += qspiflash_device_spansion.c

# Following flash device is for reference purpose, not tested.
# QSPIFLASH_DRV_SOURCES += qspiflash_device_micron.c
# QSPIFLASH_DRV_SOURCES += qspiflash_device_macronix.c
###################################################################################
# Driver Source Files:
# - XWR14xx/XWR16xx platform Source files
###################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
QSPIFLASH_DRV_SOURCES        += qspiflash_xwr14xx.c
QSPIFLASH_R4F_DRV_LIB_OBJECTS = $(addprefix $(PLATFORM_OBJDIR)/,  $(QSPIFLASH_DRV_SOURCES:.c=.$(R4F_OBJ_EXT)))
endif
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr16xx)
QSPIFLASH_DRV_SOURCES        += qspiflash_xwr16xx.c
QSPIFLASH_R4F_DRV_LIB_OBJECTS = $(addprefix $(PLATFORM_OBJDIR)/,  $(QSPIFLASH_DRV_SOURCES:.c=.$(R4F_OBJ_EXT)))
endif

###################################################################################
# Driver Dependency:
###################################################################################
QSPIFLASH_R4F_DRV_DEPENDS  = $(addprefix $(PLATFORM_OBJDIR)/, $(QSPIFLASH_DRV_SOURCES:.c=.$(R4F_DEP_EXT)))

###################################################################################
# Driver Library Names:
###################################################################################
QSPIFLASH_R4F_DRV_LIB  = lib/libqspiflash_$(MMWAVE_SDK_DEVICE_TYPE).$(R4F_LIB_EXT)

###################################################################################
# QSPIFlash Driver Build:
# - XWR14xx + XWR16xx: Build the R4 Library
###################################################################################
qspiflashDrv: buildDirectories $(QSPIFLASH_R4F_DRV_LIB_OBJECTS)
ifndef QSPIFLASH_R4F_DRV_LIB_OBJECTS
	@echo "Error: Unsupported device"
else
	if [ ! -d "lib" ]; then mkdir lib; fi
	echo "Archiving $@"
	$(R4F_AR) $(R4F_AR_OPTS) $(QSPIFLASH_R4F_DRV_LIB)  $(QSPIFLASH_R4F_DRV_LIB_OBJECTS)
endif
###################################################################################
# Clean the QSPIFLASH Driver Libraries
###################################################################################
qspiflashDrvClean:
	@echo 'Cleaning the QSPIFLASH Driver Library Objects'
	@$(DEL) $(QSPIFLASH_R4F_DRV_LIB_OBJECTS) $(QSPIFLASH_R4F_DRV_LIB)
	@$(DEL) $(QSPIFLASH_R4F_DRV_DEPENDS)
	@$(DEL) $(PLATFORM_OBJDIR)

###################################################################################
# Dependency handling
###################################################################################
-include $(QSPIFLASH_R4F_DRV_DEPENDS)

