###################################################################################
# QSPI Driver Makefile
###################################################################################
.PHONY: qspiDrv qspiDrvClean

###################################################################################
# Setup the VPATH:
###################################################################################
vpath %.c src
vpath %.c platform

###################################################################################
# Driver Source Files:
###################################################################################
QSPI_DRV_SOURCES = qspi.c
###################################################################################
# Driver Source Files:
# - XWR14xx:
#   QSPI driver is available
# - XWR16xx:
#   QSPI driver is available for R4
###################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
QSPI_DRV_SOURCES        += qspi_xwr14xx.c
QSPI_R4F_DRV_LIB_OBJECTS = $(addprefix $(PLATFORM_OBJDIR)/,  $(QSPI_DRV_SOURCES:.c=.$(R4F_OBJ_EXT)))
endif
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr16xx)
QSPI_DRV_SOURCES        += qspi_xwr16xx.c
QSPI_R4F_DRV_LIB_OBJECTS = $(addprefix $(PLATFORM_OBJDIR)/,  $(QSPI_DRV_SOURCES:.c=.$(R4F_OBJ_EXT)))
endif
###################################################################################
# Driver Dependency:
###################################################################################
QSPI_R4F_DRV_DEPENDS  = $(addprefix $(PLATFORM_OBJDIR)/, $(QSPI_DRV_SOURCES:.c=.$(R4F_DEP_EXT)))

###################################################################################
# Driver Library Names:
###################################################################################
QSPI_R4F_DRV_LIB  = lib/libqspi_$(MMWAVE_SDK_DEVICE_TYPE).$(R4F_LIB_EXT)

###################################################################################
# CRC Driver Build:
# - XWR14xx + XWR16xx: Build the R4 Library
###################################################################################
qspiDrv: buildDirectories $(QSPI_R4F_DRV_LIB_OBJECTS)
ifndef QSPI_R4F_DRV_LIB_OBJECTS
	@echo "Error: Unsupported device"
else
	if [ ! -d "lib" ]; then mkdir lib; fi
	echo "Archiving $@"
	$(R4F_AR) $(R4F_AR_OPTS) $(QSPI_R4F_DRV_LIB)  $(QSPI_R4F_DRV_LIB_OBJECTS)
endif
###################################################################################
# Clean the QSPI Driver Libraries
###################################################################################
qspiDrvClean:
	@echo 'Cleaning the QSPI Driver Library Objects'
	@$(DEL) $(QSPI_R4F_DRV_LIB_OBJECTS) $(QSPI_R4F_DRV_LIB)
	@$(DEL) $(QSPI_R4F_DRV_DEPENDS)
	@$(DEL) $(PLATFORM_OBJDIR)

###################################################################################
# Dependency handling
###################################################################################
-include $(QSPI_R4F_DRV_DEPENDS)

