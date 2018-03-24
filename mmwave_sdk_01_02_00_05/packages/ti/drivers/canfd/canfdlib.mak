###################################################################################
# CANFD Driver Makefile
###################################################################################
.PHONY: canfdDrv canfdDrvClean

###################################################################################
# Setup the VPATH:
###################################################################################
vpath %.c src
vpath %.c platform

###################################################################################
# Driver Source Files:
###################################################################################
CANFD_DRV_SOURCES = canfd.c mcan.c

###################################################################################
# Driver Source Files:
# - XWR16xx:
#   CANFD driver is available for the R4
###################################################################################
ifeq ($(MMWAVE_SDK_DEVICE),awr16xx)
CANFD_DRV_SOURCES        += canfd_xwr16xx.c
CANFD_R4F_DRV_LIB_OBJECTS = $(addprefix $(PLATFORM_OBJDIR)/,  $(CANFD_DRV_SOURCES:.c=.$(R4F_OBJ_EXT)))
endif

###################################################################################
# Driver Dependency:
###################################################################################
CANFD_R4F_DRV_DEPENDS  = $(addprefix $(PLATFORM_OBJDIR)/, $(CANFD_DRV_SOURCES:.c=.$(R4F_DEP_EXT)))

###################################################################################
# Driver Library Names:
###################################################################################
ifeq ($(MMWAVE_SDK_DEVICE),awr16xx)
CANFD_R4F_DRV_LIB = lib/libcanfd_$(MMWAVE_SDK_DEVICE_TYPE).$(R4F_LIB_EXT)
endif

###################################################################################
# CANFD Driver Build:
# - XWR16xx: Build the R4 Library
###################################################################################
canfdDrv: buildDirectories $(CANFD_R4F_DRV_LIB_OBJECTS)
ifndef CANFD_R4F_DRV_LIB_OBJECTS
	@echo "Error: Unsupported device"
else
	if [ ! -d "lib" ]; then mkdir lib; fi
	echo "Archiving $@"
	$(R4F_AR) $(R4F_AR_OPTS) $(CANFD_R4F_DRV_LIB) $(CANFD_R4F_DRV_LIB_OBJECTS)
endif

###################################################################################
# Clean the CANFD Driver Libraries
###################################################################################
canfdDrvClean:
	@echo 'Cleaning the CANFD Driver Library Objects'
ifdef CANFD_R4F_DRV_LIB_OBJECTS
	@$(DEL) $(CANFD_R4F_DRV_DEPENDS)
	@$(DEL) $(CANFD_R4F_DRV_LIB_OBJECTS) $(CANFD_R4F_DRV_LIB)
	@$(DEL) $(PLATFORM_OBJDIR)
endif
###################################################################################
# Dependency handling
###################################################################################
-include $(CANFD_R4F_DRV_DEPENDS)
