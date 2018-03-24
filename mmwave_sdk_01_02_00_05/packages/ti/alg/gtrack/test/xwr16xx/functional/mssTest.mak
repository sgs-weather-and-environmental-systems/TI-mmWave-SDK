###################################################################################
# GTRACK Functional Unit Test on MSS Makefile
###################################################################################
.PHONY: mssTest mssTestClean

###################################################################################
# Setup the VPATH:
###################################################################################
vpath %.c src
vpath %.c test/$(MMWAVE_SDK_DEVICE_TYPE)/functional
vpath %.c test/common

###################################################################################
# The GTRACK Unit test requires additional libraries
###################################################################################
GTRACK_MSS_TEST_STD_LIBS = $(R4F_COMMON_STD_LIB)						\
						  -llibgtrack_$(MMWAVE_SDK_DEVICE_TYPE).$(R4F_LIB_EXT) \
                          -llibtestlogger_$(MMWAVE_SDK_DEVICE_TYPE).$(R4F_LIB_EXT)
GTRACK_MSS_TEST_LOC_LIBS = $(R4F_COMMON_LOC_LIB)						\
						  -ilib \
                          -i$(MMWAVE_SDK_INSTALL_PATH)/ti/utils/testlogger/lib

###################################################################################
# Unit Test Files
###################################################################################
GTRACK_MSS_TEST_CFG		= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/mss.cfg
GTRACK_MSS_TEST_CMD		= $(MMWAVE_SDK_INSTALL_PATH)/ti/platform/$(MMWAVE_SDK_DEVICE_TYPE)
GTRACK_MSS_TEST_CONFIGPKG	= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/mss_configPkg_$(MMWAVE_SDK_DEVICE_TYPE)
GTRACK_MSS_TEST_MAP		= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/$(MMWAVE_SDK_DEVICE_TYPE)_gtrack_functional_mss.map
GTRACK_MSS_TEST_OUT		= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/$(MMWAVE_SDK_DEVICE_TYPE)_gtrack_functional_mss.$(R4F_EXE_EXT)
GTRACK_MSS_TEST_BIN		= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/$(MMWAVE_SDK_DEVICE_TYPE)_gtrack_functional_mss.bin
GTRACK_MSS_TEST_APP_CMD	= test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/mss_gtrack_linker.cmd
GTRACK_MSS_TEST_SOURCES	= functional_gtracker_test.c \
						  benchmark_gtrackersubmodule.c \
						  benchmark_gtrack.c \
						  main_gtrackerMss_test.c \
						  gtrackAlloc.c \
						  gtrackLog.c
GTRACK_MSS_TEST_DEPENDS 	 = $(addprefix $(PLATFORM_OBJDIR)/, $(GTRACK_MSS_TEST_SOURCES:.c=.$(R4F_DEP_EXT)))
GTRACK_MSS_TEST_OBJECTS 	 = $(addprefix $(PLATFORM_OBJDIR)/, $(GTRACK_MSS_TEST_SOURCES:.c=.$(R4F_OBJ_EXT)))
# Compiler Flags for DSP Unit Test Builds:
OPTIMIZE_FOR_SPEED_OPTIONS := -o1 -o2 -o3 -O1 -O2 -O3

###################################################################################
# RTSC Configuration:
###################################################################################
mssRTSC:
	@echo 'Configuring RTSC packages...'
	$(XS) --xdcpath="$(XDCPATH)" xdc.tools.configuro $(R4F_XSFLAGS) -o $(GTRACK_MSS_TEST_CONFIGPKG) $(GTRACK_MSS_TEST_CFG)
	@echo 'Finished configuring packages'
	@echo ' '

###################################################################################
# Build Unit Test:
###################################################################################
mssTest: BUILD_CONFIGPKG=$(GTRACK_MSS_TEST_CONFIGPKG)
mssTest: R4F_CFLAGS += --cmd_file=$(BUILD_CONFIGPKG)/compiler.opt
mssTest: R4F_CFLAGS := $(filter-out $(OPTIMIZE_FOR_SPEED_OPTIONS),$(R4F_CFLAGS))
mssTest: buildDirectories mssRTSC $(GTRACK_MSS_TEST_OBJECTS)
	$(R4F_LD) $(R4F_LDFLAGS) $(GTRACK_MSS_TEST_LOC_LIBS) $(GTRACK_MSS_TEST_STD_LIBS) 	\
	-l$(GTRACK_MSS_TEST_CONFIGPKG)/linker.cmd --map_file=$(GTRACK_MSS_TEST_MAP) 		\
	$(GTRACK_MSS_TEST_OBJECTS) $(PLATFORM_R4F_LINK_CMD) $(GTRACK_MSS_TEST_APP_CMD) 	\
	$(R4F_LD_RTS_FLAGS) -o $(GTRACK_MSS_TEST_OUT)
	@echo '******************************************************************************'
	@echo 'Built the GTRACK Functional MSS Unit Test '
	@echo '******************************************************************************'

###################################################################################
# Cleanup Unit Test:
###################################################################################
mssTestClean:
	@echo 'Cleaning the GTRACK Functional MSS Unit Test objects'
	@$(DEL) $(GTRACK_MSS_TEST_OBJECTS) $(GTRACK_MSS_TEST_OUT) $(GTRACK_MSS_TEST_BIN)
	@$(DEL) $(GTRACK_MSS_TEST_MAP) $(GTRACK_MSS_TEST_DEPENDS)
	@echo 'Cleaning the GTRACK Functional MSS Unit RTSC package'
	@$(DEL) $(GTRACK_MSS_TEST_CONFIGPKG)
	@$(DEL) $(PLATFORM_OBJDIR)

###################################################################################
# Dependency handling
###################################################################################
-include $(GTRACK_MSS_TEST_DEPENDS)
