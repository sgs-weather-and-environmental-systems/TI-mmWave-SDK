# #################################################################################
#   mmWaveLib makefile
###################################################################################

include ../../common/mmwave_sdk.mak
include ./mmwavelib.mak

##################################################################################
# SOC Specific Test Targets
##################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr16xx)
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/dssTest.mak
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/winFltTest.mak
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/accumPowerFltTest.mak
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/cfarcaFltTest.mak
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/aoaestFltTest.mak
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/dbscanClusteringTest.mak
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/cfarosTest.mak
include ./test/$(MMWAVE_SDK_DEVICE_TYPE)/vecmathTest.mak
endif

###################################################################################
# Standard Targets which need to be implemented by each mmWave SDK module. This
# plugs into the release scripts.
###################################################################################

.PHONY: all clean lib libClean allTest allTestClean test testClean help

##################################################################################
# Build/Clean the library
##################################################################################

ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr16xx)
# This builds the mmWavelib library
lib: mmwavelib

# This cleans the mmWavelib library
libClean: mmwavelibClean
endif

##################################################################################
# Test targets which are device specific
##################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr16xx)
testClean: dssTestClean
test:      dssTest
endif

# Clean: This cleans all the test objects
allTestClean: testClean winFltClean accumPowerFltClean cfarcaFltClean aoaEstFltClean floatTestClean \
	dbscanClusteringClean cfarosClean vecmathClean

# Builds all the tests
allTest: test winFltTest accumPowerFltTest cfarcaFltTest aoaEstFltTest floatTest \
	dbscanClusteringTest cfarosTest vecmathTest

# Clean: This cleans all the objects
clean: libClean allTestClean

# Build everything
all: lib allTest

# Help: This displays the MAKEFILE Usage.
help:
	@echo '****************************************************************************************'
	@echo '* Makefile Targets for alg\mmWaveLib '
	@echo 'clean                -> Clean out all the objects'
	@echo 'lib                  -> Build the Core Library only'
	@echo 'libClean             -> Clean the Core Library only'
	@echo 'allTest              -> Builds all the Unit Tests (fixed-point & float point)'
	@echo 'allTestClean         -> Cleans all the Unit Tests (fixed-point & float point)'
	@echo 'test                 -> Builds the Unit Tests (fixed-point)'
	@echo 'testClean            -> Cleans the Unit Tests (fixed-point)'
	@echo 'floatTest            -> Builds the floating-point chain test'
	@echo 'floatTestClean       -> Cleans the floating-point chain test'
	@echo 'winFltTest           -> Builds the floating-point windowing Tests'
	@echo 'winFltClean          -> Cleans the floating-point windowing Tests'
	@echo 'accumPowerFltTest    -> Builds the floating-point power accumulation Tests'
	@echo 'accumPowerFltClean   -> Cleans the floating-point power accumulation Tests'
	@echo 'cfarcaFltTest        -> Builds the floating-point CFAR CA, CACC, SO, GO Tests'
	@echo 'cfarcaFltClean       -> Cleans the floating-point CFAR CA, CACC, SO, GO Tests'
	@echo 'aoaEstFltTest        -> Builds the floating-point AOA Estimation Tests'
	@echo 'aoaEstFltClean       -> Cleans the floating-point AOA Estimation Tests'
	@echo 'dbscanClusteringTest      -> Builds the DBSCAN fixed-point Tests'
	@echo 'dbscanClusteringClean     -> Cleans the DBSCAN fixed-point Tests'
	@echo 'cfarosTest           -> Builds the fixed-point CFAR OS Unit Tests'
	@echo 'cfarosClean          -> Cleans the fixed-point CFAR OS Unit Tests'
	@echo 'vecmathTest          -> Builds the fixed-point vector math utility Unit Tests'
	@echo 'vecmathClean         -> Cleans the fixed-point vector math utility Unit Tests'
	@echo '****************************************************************************************'

