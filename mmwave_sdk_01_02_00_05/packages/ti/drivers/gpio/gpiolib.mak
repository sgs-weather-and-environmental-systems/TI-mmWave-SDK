###################################################################################
# GPIO Driver Makefile
###################################################################################
.PHONY: gpioDrv gpioDrvClean

###################################################################################
# Setup the VPATH:
###################################################################################
vpath %.c src
vpath %.c platform

###################################################################################
# Driver Source Files:
###################################################################################
GPIO_DRV_SOURCES = gpio.c

###################################################################################
# Driver Source Files:
# - XWR14xx:
#   GPIO driver is available
# - XWR16xx:
#   GPIO driver is available only for the MSS
###################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
GPIO_DRV_SOURCES         += gpio_xwr14xx.c
GPIO_R4F_DRV_LIB_OBJECTS  = $(addprefix $(PLATFORM_OBJDIR)/, $(GPIO_DRV_SOURCES:.c=.$(R4F_OBJ_EXT)))
GPIO_C674_DRV_LIB_OBJECTS =
else
GPIO_DRV_SOURCES         += gpio_xwr16xx.c
GPIO_R4F_DRV_LIB_OBJECTS  = $(addprefix $(PLATFORM_OBJDIR)/, $(GPIO_DRV_SOURCES:.c=.$(R4F_OBJ_EXT)))
GPIO_C674_DRV_LIB_OBJECTS =
endif

###################################################################################
# Driver Dependency:
###################################################################################
GPIO_R4F_DRV_DEPENDS  = $(addprefix $(PLATFORM_OBJDIR)/, $(GPIO_DRV_SOURCES:.c=.$(R4F_DEP_EXT)))
GPIO_C674_DRV_DEPENDS =

###################################################################################
# Driver Library Names:
###################################################################################
GPIO_R4F_DRV_LIB  = lib/libgpio_$(MMWAVE_SDK_DEVICE_TYPE).$(R4F_LIB_EXT)
GPIO_C674_DRV_LIB =

###################################################################################
# GPIO Driver Build:
# - XWR14xx: Build the R4 Library
# - XWR16xx: Build the R4 & DSP Library
###################################################################################
gpioDrv: buildDirectories $(GPIO_R4F_DRV_LIB_OBJECTS) $(GPIO_C674_DRV_LIB_OBJECTS)
	if [ ! -d "lib" ]; then mkdir lib; fi
	echo "Archiving $@"
	$(R4F_AR) $(R4F_AR_OPTS) $(GPIO_R4F_DRV_LIB) $(GPIO_R4F_DRV_LIB_OBJECTS)

###################################################################################
# Clean the GPIO Driver Libraries
###################################################################################
gpioDrvClean:
	@echo 'Cleaning the GPIO Driver Library Objects'
	@$(DEL) $(GPIO_R4F_DRV_LIB_OBJECTS) $(GPIO_R4F_DRV_LIB)
	@$(DEL) $(GPIO_R4F_DRV_DEPENDS)
	@$(DEL) $(PLATFORM_OBJDIR)

###################################################################################
# Dependency handling
###################################################################################
-include $(GPIO_R4F_DRV_DEPENDS)

