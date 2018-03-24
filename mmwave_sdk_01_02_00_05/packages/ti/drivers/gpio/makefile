##################################################################################
# GPIO makefile
##################################################################################
include ../../common/mmwave_sdk.mak
include ./gpiolib.mak

##################################################################################
# SOC Specific Test Targets
##################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/mssTest.mak
else ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr16xx)
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/mssTest.mak
endif

###################################################################################
# Standard Targets which need to be implemented by each mmWave SDK module. This
# plugs into the release scripts.
###################################################################################
.PHONY: all clean drv drvClean test testClean help

##################################################################################
# Build/Clean the driver
##################################################################################

# This builds the GPIO Driver
drv: gpioDrv

# This cleans the GPIO Driver
drvClean: gpioDrvClean

##################################################################################
# Test targets which are device specific
##################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
testClean: mssTestClean
test:      mssTest
else ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr16xx)
testClean: mssTestClean
test:      mssTest
endif

# Clean: This cleans all the objects
clean: drvClean testClean

# Build everything
all: drv test

# Help: This displays the MAKEFILE Usage.
help:
	@echo '****************************************************************************************'
	@echo '* Makefile Targets for the GPIO '
	@echo 'clean                -> Clean out all the objects'
	@echo 'drv                  -> Build the Driver only'
	@echo 'drvClean             -> Clean the Driver Library only'
	@echo 'test                 -> Builds all the unit tests for the SOC'
	@echo 'testClean            -> Cleans the unit tests for the SOC'
	@echo '****************************************************************************************'

