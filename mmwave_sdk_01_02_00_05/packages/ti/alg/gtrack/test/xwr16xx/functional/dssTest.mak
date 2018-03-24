###################################################################################
# GTRACK Functional Unit Test on DSS Makefile
###################################################################################
.PHONY: dssTest dssTestClean

###################################################################################
# Setup the VPATH:
###################################################################################
vpath %.c src
vpath %.c test/$(MMWAVE_SDK_DEVICE_TYPE)/functional
vpath %.c test/common

###################################################################################
# The GTRACK Unit test requires additional libraries
###################################################################################
GTRACK_DSS_TEST_STD_LIBS = $(C674_COMMON_STD_LIB)						\
						  -llibgtrack_$(MMWAVE_SDK_DEVICE_TYPE).$(C674_LIB_EXT) \
                          -llibtestlogger_$(MMWAVE_SDK_DEVICE_TYPE).$(C674_LIB_EXT)
GTRACK_DSS_TEST_LOC_LIBS = $(C674_COMMON_LOC_LIB)						\
						  -ilib \
                          -i$(MMWAVE_SDK_INSTALL_PATH)/ti/utils/testlogger/lib

###################################################################################
# Unit Test Files
###################################################################################
GTRACK_DSS_TEST_CFG		= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/dss.cfg
GTRACK_DSS_TEST_CMD		= $(MMWAVE_SDK_INSTALL_PATH)/ti/platform/$(MMWAVE_SDK_DEVICE_TYPE)
GTRACK_DSS_TEST_CONFIGPKG	= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/dss_configPkg_$(MMWAVE_SDK_DEVICE_TYPE)
GTRACK_DSS_TEST_MAP		= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/$(MMWAVE_SDK_DEVICE_TYPE)_gtrack_functional_dss.map
GTRACK_DSS_TEST_OUT		= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/$(MMWAVE_SDK_DEVICE_TYPE)_gtrack_functional_dss.$(C674_EXE_EXT)
GTRACK_DSS_TEST_BIN		= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/$(MMWAVE_SDK_DEVICE_TYPE)_gtrack_functional_dss.bin
GTRACK_DSS_TEST_APP_CMD	= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/dss_gtrack_linker.cmd
GTRACK_DSS_TEST_SOURCES	= functional_gtracker_test.c \
						  benchmark_gtrackersubmodule.c \
						  benchmark_gtrack.c \
                          main_gtrackerDss_test.c \
						  gtrackAlloc.c \
						  gtrackLog.c

GTRACK_DSS_TEST_DEPENDS 	 = $(addprefix $(PLATFORM_OBJDIR)/, $(GTRACK_DSS_TEST_SOURCES:.c=.$(C674_DEP_EXT)))
GTRACK_DSS_TEST_OBJECTS 	 = $(addprefix $(PLATFORM_OBJDIR)/, $(GTRACK_DSS_TEST_SOURCES:.c=.$(C674_OBJ_EXT)))

# Compiler Flags for DSP Unit Test Builds:
OPTIMIZE_FOR_SPEED_OPTIONS := -o1 -o2 -o3 -O1 -O2 -O3

###################################################################################
# RTSC Configuration:
###################################################################################
dssRTSC:
	@echo 'Configuring RTSC packages...'
	$(XS) --xdcpath="$(XDCPATH)" xdc.tools.configuro $(C674_XSFLAGS) -o $(GTRACK_DSS_TEST_CONFIGPKG) $(GTRACK_DSS_TEST_CFG)
	@echo 'Finished configuring packages'
	@echo ' '

###################################################################################
# Build Unit Test:
###################################################################################
dssTest: BUILD_CONFIGPKG=$(GTRACK_DSS_TEST_CONFIGPKG)
dssTest: C674_CFLAGS += --cmd_file=$(BUILD_CONFIGPKG)/compiler.opt
dssTest: C674_CFLAGS := $(filter-out $(OPTIMIZE_FOR_SPEED_OPTIONS),$(C674_CFLAGS))
dssTest: buildDirectories dssRTSC $(GTRACK_DSS_TEST_OBJECTS)
	$(C674_LD) $(C674_LDFLAGS) $(GTRACK_DSS_TEST_LOC_LIBS) $(GTRACK_DSS_TEST_STD_LIBS) 	\
	-l$(GTRACK_DSS_TEST_CONFIGPKG)/linker.cmd --map_file=$(GTRACK_DSS_TEST_MAP) 		\
	$(GTRACK_DSS_TEST_OBJECTS) $(PLATFORM_C674X_LINK_CMD) $(GTRACK_DSS_TEST_APP_CMD) 	\
	$(C674_LD_RTS_FLAGS) -o $(GTRACK_DSS_TEST_OUT)
	@echo '******************************************************************************'
	@echo 'Built the GTRACK DSS Unit Test '
	@echo '******************************************************************************'

###################################################################################
# Cleanup Unit Test:
###################################################################################
dssTestClean:
	@echo 'Cleaning the GTRACK Functional DSS Unit Test objects'
	@$(DEL) $(GTRACK_DSS_TEST_OBJECTS) $(GTRACK_DSS_TEST_OUT) $(GTRACK_DSS_TEST_BIN)
	@$(DEL) $(GTRACK_DSS_TEST_MAP) $(GTRACK_DSS_TEST_DEPENDS)
	@echo 'Cleaning the GTRACK Functional DSS Unit RTSC package'
	@$(DEL) $(GTRACK_DSS_TEST_CONFIGPKG)
	@$(DEL) $(PLATFORM_OBJDIR)

###################################################################################
# Dependency handling
###################################################################################
-include $(GTRACK_DSS_TEST_DEPENDS)
