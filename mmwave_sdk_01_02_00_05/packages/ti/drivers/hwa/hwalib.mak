###################################################################################
# HWA Driver Makefile
###################################################################################
.PHONY: hwaDrv hwaDrvClean

###################################################################################
# Setup the VPATH:
###################################################################################
vpath %.c src
vpath %.c platform

###################################################################################
# Driver Source Files:
# - XWR14xx:
#   HWA driver is available
# - XWR16xx:
#   HWA driver is not available
###################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
HWA_DRV_SOURCES         = hwa.c hwa_xwr14xx.c
HWA_R4F_DRV_LIB_OBJECTS = $(addprefix $(PLATFORM_OBJDIR)/,  $(HWA_DRV_SOURCES:.c=.$(R4F_OBJ_EXT)))
endif

###################################################################################
# Driver Dependency:
###################################################################################
HWA_R4F_DRV_DEPENDS = $(addprefix $(PLATFORM_OBJDIR)/, $(HWA_DRV_SOURCES:.c=.$(R4F_DEP_EXT)))

###################################################################################
# Driver Library Names:
###################################################################################
HWA_R4F_DRV_LIB  = lib/libhwa_$(MMWAVE_SDK_DEVICE_TYPE).$(R4F_LIB_EXT)

###################################################################################
# HWA Driver Build:
# - XWR14xx: Build the R4 Library
# - XWR16xx: Build is not applicable
###################################################################################
hwaDrv: buildDirectories $(HWA_R4F_DRV_LIB_OBJECTS)
ifndef HWA_R4F_DRV_LIB_OBJECTS
	@echo "Error: Unsupported device"
else
	if [ ! -d "lib" ]; then mkdir lib; fi
	echo "Archiving $@"
	$(R4F_AR) $(R4F_AR_OPTS) $(HWA_R4F_DRV_LIB) $(HWA_R4F_DRV_LIB_OBJECTS)
endif

###################################################################################
# Clean the HWA Driver Libraries
###################################################################################
hwaDrvClean:
	@echo 'Cleaning the HWA Driver Library Objects'
ifdef HWA_R4F_DRV_LIB_OBJECTS
	@$(DEL) $(HWA_R4F_DRV_DEPENDS)
	@$(DEL) $(HWA_R4F_DRV_LIB_OBJECTS) $(HWA_R4F_DRV_LIB)
endif
	@$(DEL) $(PLATFORM_OBJDIR)

###################################################################################
# Dependency handling
###################################################################################
-include $(HWA_R4F_DRV_DEPENDS)

