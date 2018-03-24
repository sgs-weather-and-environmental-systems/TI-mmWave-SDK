###################################################################################
# DSP-EDMA Unit Test on C674 Makefile
###################################################################################
.PHONY: test testClean

###################################################################################
# Libraries
###################################################################################
DATA_PATH_UNIT_TEST_STD_LIBS = $(C674_COMMON_STD_LIB) \
                               -llibedma_$(MMWAVE_SDK_DEVICE_TYPE).$(C674_LIB_EXT) \
                               -llibmmwavealg_$(MMWAVE_SDK_DEVICE_TYPE).$(C674_LIB_EXT) \
                               -ldsplib.ae64P \
                               -lmathlib.ae674 \
                               -llibtestlogger_$(MMWAVE_SDK_DEVICE_TYPE).$(C674_LIB_EXT)
DATA_PATH_UNIT_TEST_LOC_LIBS = $(C674_COMMON_LOC_LIB) \
                               -i$(MMWAVE_SDK_INSTALL_PATH)/ti/drivers/edma/lib \
                               -i$(MMWAVE_SDK_INSTALL_PATH)/ti/alg/mmwavelib/lib \
                               -i$(C64Px_DSPLIB_INSTALL_PATH)/packages/ti/dsplib/lib \
                               -i$(C674x_MATHLIB_INSTALL_PATH)/packages/ti/mathlib/lib \
                               -i$(MMWAVE_SDK_INSTALL_PATH)/ti/utils/testlogger/lib 
   

###################################################################################
# Setup the VPATH:
###################################################################################
vpath %.c $(MMWAVE_SDK_DEVICE_TYPE)
vpath %.c ../../../demo/$(MMWAVE_SDK_DEVICE_TYPE)/mmw/dss
vpath %.c ../common
vpath %.c $(C64Px_DSPLIB_INSTALL_PATH)/packages/ti/dsplib/src/DSP_fft16x16/c64P
vpath %.c $(C64Px_DSPLIB_INSTALL_PATH)/packages/ti/dsplib/src/DSP_fft32x32/c64P
vpath %.c ../../../demo/utils

###################################################################################
# Unit Test Files
###################################################################################
DATA_PATH_UNIT_TEST_CFG	      = $(MMWAVE_SDK_DEVICE_TYPE)/test.cfg
DATA_PATH_UNIT_TEST_CMD       = $(MMWAVE_SDK_INSTALL_PATH)/ti/platform/$(MMWAVE_SDK_DEVICE_TYPE)
DATA_PATH_UNIT_TEST_CONFIGPKG = $(MMWAVE_SDK_DEVICE_TYPE)/c674_configPkg_$(MMWAVE_SDK_DEVICE_TYPE)
DATA_PATH_UNIT_TEST_MAP       = $(MMWAVE_SDK_DEVICE_TYPE)/$(MMWAVE_SDK_DEVICE_TYPE)_data_path_dss.map
DATA_PATH_UNIT_TEST_OUT       = $(MMWAVE_SDK_DEVICE_TYPE)/$(MMWAVE_SDK_DEVICE_TYPE)_data_path_dss.$(C674_EXE_EXT)
DATA_PATH_UNIT_TEST_BIN       = $(MMWAVE_SDK_DEVICE_TYPE)/$(MMWAVE_SDK_DEVICE_TYPE)_data_path.bin
DATA_PATH_UNIT_TEST_APP_CMD   = $(MMWAVE_SDK_DEVICE_TYPE)/test.cmd
DATA_PATH_UNIT_TEST_SOURCES   = main.c \
                                dss_config_edma_util.c \
                                gen_twiddle_fft16x16.c \
					            gen_twiddle_fft32x32.c \
					            dss_data_path.c \
                                gen_frame_data.c\
                                rx_ch_bias_measure.c
                                
DATA_PATH_UNIT_TEST_DEPENDS   = $(addprefix $(PLATFORM_OBJDIR)/, $(DATA_PATH_UNIT_TEST_SOURCES:.c=.$(C674_DEP_EXT)))
DATA_PATH_UNIT_TEST_OBJECTS   = $(addprefix $(PLATFORM_OBJDIR)/, $(DATA_PATH_UNIT_TEST_SOURCES:.c=.$(C674_OBJ_EXT)))

###################################################################################
# RTSC Configuration:
###################################################################################
datapathRTSC: $(DATA_PATH_UNIT_TEST_CFG)
	@echo 'Configuring RTSC packages...'
	$(XS) --xdcpath="$(XDCPATH)" xdc.tools.configuro $(C674_XSFLAGS) -o $(DATA_PATH_UNIT_TEST_CONFIGPKG) $(DATA_PATH_UNIT_TEST_CFG)
	@echo 'Finished configuring packages'
	@echo ' '

###################################################################################
# Build Unit Test:
###################################################################################
dssTest: BUILD_CONFIGPKG=$(DATA_PATH_UNIT_TEST_CONFIGPKG)
dssTest: C674_CFLAGS += --cmd_file=$(BUILD_CONFIGPKG)/compiler.opt \
                        -i$(C64Px_DSPLIB_INSTALL_PATH)/packages/ti/dsplib/src/DSP_fft16x16/c64P	\
				        -i$(C64Px_DSPLIB_INSTALL_PATH)/packages/ti/dsplib/src/DSP_fft32x32/c64P \
                        -i$(C674x_MATHLIB_INSTALL_PATH)/packages \

dssTest: buildDirectories datapathRTSC $(DATA_PATH_UNIT_TEST_OBJECTS)
	$(C674_LD) $(C674_LDFLAGS) $(DATA_PATH_UNIT_TEST_LOC_LIBS) $(DATA_PATH_UNIT_TEST_STD_LIBS) 		\
	-l$(DATA_PATH_UNIT_TEST_CONFIGPKG)/linker.cmd --map_file=$(DATA_PATH_UNIT_TEST_MAP) 			\
	$(DATA_PATH_UNIT_TEST_OBJECTS) $(PLATFORM_C674X_LINK_CMD) $(DATA_PATH_UNIT_TEST_APP_CMD) 		\
	$(C674_LD_RTS_FLAGS) -o $(DATA_PATH_UNIT_TEST_OUT)
	@echo '******************************************************************************'
	@echo 'Built the EDMA C674 Unit Test'
	@echo '******************************************************************************'

###################################################################################
# Cleanup Unit Test:
###################################################################################
dssTestClean:
	@echo 'Cleaning the edma C674 Unit Test objects'
	@$(DEL) $(DATA_PATH_UNIT_TEST_OBJECTS) $(DATA_PATH_UNIT_TEST_OUT) $(DATA_PATH_UNIT_TEST_BIN)
	@$(DEL) $(DATA_PATH_UNIT_TEST_MAP) $(DATA_PATH_UNIT_TEST_DEPENDS)
	@echo 'Cleaning the edma C674 Unit RTSC package'
	@$(DEL) $(DATA_PATH_UNIT_TEST_CONFIGPKG)
	@$(DEL) $(PLATFORM_OBJDIR)

###################################################################################
# Dependency handling
###################################################################################
-include $(DATA_PATH_UNIT_TEST_DEPENDS)

