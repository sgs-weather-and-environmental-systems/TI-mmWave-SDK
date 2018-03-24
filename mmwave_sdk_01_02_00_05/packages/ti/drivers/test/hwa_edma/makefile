###################################################################################
#   HWA_EDMA Test makefile
###################################################################################

include ../../../common/mmwave_sdk.mak
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
include ./$(MMWAVE_SDK_DEVICE_TYPE)/mssTest.mak
endif

###################################################################################
# Standard Targets which need to be implemented by each mmWave SDK module. This
# plugs into the release scripts.
###################################################################################

.PHONY: all clean test testClean mssTest mssTestClean help

ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
testClean: 	mssTestClean
test: 		mssTest
endif

# Clean: This cleans all the objects
clean:      testClean

# This will build the hwa_edma test 
all: test

# Help: This displays the MAKEFILE Usage.
help:
	@echo '****************************************************************************************'
	@echo '* Makefile Targets for the HWA_EDMA test '
	@echo 'clean             -> Clean out all the objects'
	@echo 'test              -> Builds all the unit tests for the SOC'
	@echo 'testClean         -> Cleans all the Unit Tests for the SOC'
	@echo '****************************************************************************************'


