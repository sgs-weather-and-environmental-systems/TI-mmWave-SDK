###################################################################################
# EDMA makefile
###################################################################################
include ../../../common/mmwave_sdk.mak

##################################################################################
# SOC Specific Test Targets
##################################################################################

ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr16xx)
include ./$(MMWAVE_SDK_DEVICE_TYPE)/dsstest.mak
endif

###################################################################################
# Standard Targets which need to be implemented by each mmWave SDK module. This
# plugs into the release scripts.
###################################################################################
.PHONY: all clean dssTestClean test testClean help

ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr16xx)
testClean: 	dssTestClean
test: 		dssTest
endif

# Clean: This cleans all the objects
clean: testClean

# Build driver and all the unit tests
all: test

# Help: This displays the MAKEFILE Usage.
help:
	@echo '****************************************************************************************'
	@echo '* Makefile Targets for the EDMA '
	@echo 'clean                -> Clean out all the objects'
	@echo 'test                 -> Builds all the unit tests for the SOC'
	@echo 'testClean            -> Cleans the unit tests for the SOC'
	@echo '****************************************************************************************'

