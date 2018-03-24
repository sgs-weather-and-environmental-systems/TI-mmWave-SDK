###################################################################################
# HWA-EDMA Test
###################################################################################
.PHONY: mssTest mssTestClean

###################################################################################
# Setup the VPATH:
###################################################################################
vpath %.c $(MMWAVE_SDK_DEVICE_TYPE)
vpath %.c ../common
vpath %.c ../../../demo/$(MMWAVE_SDK_DEVICE_TYPE)/mmw
vpath %.c ../../../demo/utils

###################################################################################
# The HWA EDMA Test requires additional libraries
###################################################################################
HWA_EDMA_TEST_STD_LIBS = $(R4F_COMMON_STD_LIB)								\
           				-llibedma_$(MMWAVE_SDK_DEVICE_TYPE).$(R4F_LIB_EXT) 		\
           				-llibhwa_$(MMWAVE_SDK_DEVICE_TYPE).$(R4F_LIB_EXT)       \
                        -llibtestlogger_$(MMWAVE_SDK_DEVICE_TYPE).$(R4F_LIB_EXT)
HWA_EDMA_TEST_LOC_LIBS = $(R4F_COMMON_LOC_LIB)								\
						-i$(MMWAVE_SDK_INSTALL_PATH)/ti/drivers/edma/lib 	\
           				-i$(MMWAVE_SDK_INSTALL_PATH)/ti/drivers/hwa/lib    \
                        -i$(MMWAVE_SDK_INSTALL_PATH)/ti/utils/testlogger/lib

###################################################################################
# Unit Test Files
###################################################################################
HWA_EDMA_TEST_CFG	 	= $(MMWAVE_SDK_DEVICE_TYPE)/mss.cfg
HWA_EDMA_TEST_CMD       = $(MMWAVE_SDK_INSTALL_PATH)/ti/platform/$(MMWAVE_SDK_DEVICE_TYPE)
HWA_EDMA_TEST_CONFIGPKG = $(MMWAVE_SDK_DEVICE_TYPE)/mss_configPkg_$(MMWAVE_SDK_DEVICE_TYPE)
HWA_EDMA_TEST_MAP       = $(MMWAVE_SDK_DEVICE_TYPE)/$(MMWAVE_SDK_DEVICE_TYPE)_hwa_edma_mss.map
HWA_EDMA_TEST_OUT       = $(MMWAVE_SDK_DEVICE_TYPE)/$(MMWAVE_SDK_DEVICE_TYPE)_hwa_edma_mss.$(R4F_EXE_EXT)
HWA_EDMA_TEST_BIN       = $(MMWAVE_SDK_DEVICE_TYPE)/$(MMWAVE_SDK_DEVICE_TYPE)_hwa_edma_mss.bin
HWA_EDMA_TEST_APP_CMD   = $(MMWAVE_SDK_DEVICE_TYPE)/mss_hwa_edma_linker.cmd
HWA_EDMA_TEST_SOURCES   = main.c \
                          data_path.c \
                          config_hwa_util.c \
                          config_edma_util.c \
                          post_processing.c \
                          gen_frame_data.c \
                          rx_ch_bias_measure.c 

HWA_EDMA_TEST_DEPENDS 	 = $(addprefix $(PLATFORM_OBJDIR)/, $(HWA_EDMA_TEST_SOURCES:.c=.$(R4F_DEP_EXT)))
HWA_EDMA_TEST_OBJECTS 	 = $(addprefix $(PLATFORM_OBJDIR)/, $(HWA_EDMA_TEST_SOURCES:.c=.$(R4F_OBJ_EXT)))

###################################################################################
# RTSC Configuration:
###################################################################################
mssRTSC: $(R4_CFG)
	@echo 'Configuring RTSC packages...'
	$(XS) --xdcpath="$(XDCPATH)" xdc.tools.configuro $(R4F_XSFLAGS) -o $(HWA_EDMA_TEST_CONFIGPKG) $(HWA_EDMA_TEST_CFG)
	@echo 'Finished configuring packages'
	@echo ' '

###################################################################################
# Build Unit Test:
###################################################################################
mssTest: BUILD_CONFIGPKG=$(HWA_EDMA_TEST_CONFIGPKG)
mssTest: R4F_CFLAGS += --cmd_file=$(BUILD_CONFIGPKG)/compiler.opt
mssTest: buildDirectories mssRTSC $(HWA_EDMA_TEST_OBJECTS)
	$(R4F_LD) $(R4F_LDFLAGS) $(HWA_EDMA_TEST_LOC_LIBS) $(HWA_EDMA_TEST_STD_LIBS) -l$(HWA_EDMA_TEST_CONFIGPKG)/linker.cmd --map_file=$(HWA_EDMA_TEST_MAP) $(HWA_EDMA_TEST_OBJECTS) \
	$(PLATFORM_R4F_LINK_CMD) $(HWA_EDMA_TEST_APP_CMD) $(R4F_LD_RTS_FLAGS) -o $(HWA_EDMA_TEST_OUT)
	@echo '******************************************************************************'
	@echo 'Built the Datapath EDMA/HWA R4 Unit Test '
	@echo '******************************************************************************'

###################################################################################
# Cleanup Unit Test:
###################################################################################
mssTestClean:
	@echo 'Cleaning the HWA R4 Unit Test objects'
	@$(DEL) $(HWA_EDMA_TEST_OBJECTS) $(HWA_EDMA_TEST_OUT) $(HWA_EDMA_TEST_BIN)
	@$(DEL) $(HWA_EDMA_TEST_MAP) $(HWA_EDMA_TEST_DEPENDS)
	@echo 'Cleaning the HWA R4 Unit RTSC package'
	@$(DEL) $(HWA_EDMA_TEST_CONFIGPKG)
	@$(DEL) $(PLATFORM_OBJDIR)

###################################################################################
# Dependency handling
###################################################################################
-include $(HWA_EDMA_TEST_DEPENDS)

