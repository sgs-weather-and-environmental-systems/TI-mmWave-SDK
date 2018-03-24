###################################################################################
# CAN Driver Makefile
###################################################################################
.PHONY: canDrv canDrvClean

###################################################################################
# Setup the VPATH:
###################################################################################
vpath %.c src
vpath %.c platform

###################################################################################
# Driver Source Files:
###################################################################################
CAN_DRV_SOURCES = can.c dcan.c

###################################################################################
# Driver Source Files:
# - XWR14xx:
#   CAN driver is available
# - XWR16xx:
#   CAN driver is available for the R4
###################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
CAN_DRV_SOURCES        += can_xwr14xx.c
CAN_R4F_DRV_LIB_OBJECTS = $(addprefix $(PLATFORM_OBJDIR)/,  $(CAN_DRV_SOURCES:.c=.$(R4F_OBJ_EXT)))
else
CAN_DRV_SOURCES        += can_xwr16xx.c
CAN_R4F_DRV_LIB_OBJECTS = $(addprefix $(PLATFORM_OBJDIR)/,  $(CAN_DRV_SOURCES:.c=.$(R4F_OBJ_EXT)))
endif

###################################################################################
# Driver Dependency:
###################################################################################
CAN_R4F_DRV_DEPENDS  = $(addprefix $(PLATFORM_OBJDIR)/, $(CAN_DRV_SOURCES:.c=.$(R4F_DEP_EXT)))

###################################################################################
# Driver Library Names:
###################################################################################
CAN_R4F_DRV_LIB = lib/libcan_$(MMWAVE_SDK_DEVICE_TYPE).$(R4F_LIB_EXT)

###################################################################################
# CAN Driver Build:
# - XWR14xx + XWR16xx: Build the R4 Library
###################################################################################
canDrv: buildDirectories $(CAN_R4F_DRV_LIB_OBJECTS)
	if [ ! -d "lib" ]; then mkdir lib; fi
	echo "Archiving $@"
	$(R4F_AR) $(R4F_AR_OPTS) $(CAN_R4F_DRV_LIB) $(CAN_R4F_DRV_LIB_OBJECTS)

###################################################################################
# Clean the CAN Driver Libraries
###################################################################################
canDrvClean:
	@echo 'Cleaning the CAN Driver Library Objects'
	@$(DEL) $(CAN_R4F_DRV_DEPENDS)
	@$(DEL) $(CAN_R4F_DRV_LIB_OBJECTS) $(CAN_R4F_DRV_LIB)
	@$(DEL) $(PLATFORM_OBJDIR)

###################################################################################
# Dependency handling
###################################################################################
-include $(CAN_R4F_DRV_DEPENDS)


