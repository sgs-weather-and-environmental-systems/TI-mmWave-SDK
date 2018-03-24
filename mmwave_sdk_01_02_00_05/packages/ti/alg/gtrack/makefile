##################################################################################
# GTRACK makefile
##################################################################################
include ../../common/mmwave_sdk.mak
include ./gtracklib.mak

##################################################################################
# SOC Specific Test Targets
##################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
-include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/usecases/mssTest.mak
else
-include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/usecases/mssTest.mak
-include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/usecases/dssTest.mak
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/mssTest.mak
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/functional/dssTest.mak
endif

###################################################################################
# Standard Targets which need to be implemented by each mmWave SDK module. This
# plugs into the release scripts.
###################################################################################
.PHONY: all clean lib libClean test testClean mssTest mssTestClean dssTest dssTestClean help

##################################################################################
# Build/Clean the driver
##################################################################################

# This builds the GTRACK Library
lib: gTrackLib

# This cleans the GTRACK Library
libClean: gTrackLibClean

##################################################################################
# Test targets which are device specific
# XWR14xx: Build the MSS Unit Test
# XWR16xx: Build the MSS and DSS Unit Test
##################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
testClean: 	
test: 		
else ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr16xx)
testClean:	mssTestClean dssTestClean
test:		mssTest dssTest
endif

# Clean: This cleans all the objects
clean: libClean testClean

# Build everything
all: lib test

# Help: This displays the MAKEFILE Usage.
help:
	@echo '****************************************************************************************'
	@echo '* Makefile Targets for GTRACK '
	@echo 'all            -> Build gtrack lib and all functional unit tests'
	@echo 'clean          -> Clean out all the gtrack objects'
	@echo 'lib            -> Build the gtrack algorithm Library only'
	@echo 'libClean       -> Clean the gtrack algorithm Library only'
	@echo 'test           -> Builds all the gtrack functional unit tests for the SOC'
	@echo 'testClean      -> Cleans all the gtrack functional unit tests for the SOC'
	@echo 'mssTest        -> Builds the gtrack functional tests for ARM'
	@echo 'mssTestClean   -> Cleans the gtrack functional tests for ARM'
	@echo 'dssTest        -> Builds the gtrack functional tests for DSP'
	@echo 'dssTestClean   -> Cleans the gtrack functional tests for DSP'
	@echo '****************************************************************************************'

