###################################################################################
# CCS Debug makefile
###################################################################################
include ../../common/mmwave_sdk.mak

ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
include mssBuild.mak
else
include mssBuild.mak
include dssBuild.mak
endif


###################################################################################
# Standard Targets which need to be implemented by each mmWave SDK module. This
# plugs into the release scripts.
###################################################################################
.PHONY: all clean help

CCS_DEBUG_BIN           = $(MMWAVE_SDK_DEVICE_TYPE)_ccsdebug.bin

###################################################################################
# Cleanup CCS Debug Utility:
###################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
clean: mssCCSDebugClean 
	@echo '******************************************************************************'
	@echo 'CCS Debug Utility Clean complete '
	@echo '******************************************************************************'
else
clean: mssCCSDebugClean dssCCSDebugClean
	@$(DEL) $(CCS_DEBUG_BIN)
	@echo '******************************************************************************'
	@echo 'CCS Debug Utility Clean complete '
	@echo '******************************************************************************'
endif

###################################################################################
# Build the CCS Debug Utility:
###################################################################################
ifeq ($(MMWAVE_SDK_DEVICE_TYPE),xwr14xx)
all: mssCCSDebug
	@echo '******************************************************************************'
	@echo 'Built the CCS Debug Utility OUT and BIN Formats'
	@echo '******************************************************************************'
else
all: mssCCSDebug dssCCSDebug
	@$(GENERATE_METAIMAGE) $(CCS_DEBUG_BIN) 0x01000005 $(CCS_DEBUG_MSS_BIN) $(XWR16XX_RADARSS_IMAGE_BIN) $(CCS_DEBUG_DSS_BIN)
	@$(DEL) $(CCS_DEBUG_MSS_BIN)
	@$(DEL) $(CCS_DEBUG_DSS_BIN)
	@echo '******************************************************************************'
	@echo 'Built the CCS Debug Utility OUT and BIN Formats'
	@echo '******************************************************************************'
endif

# Help: This displays the MAKEFILE Usage.
help:
	@echo '****************************************************************************************'
	@echo '* Makefile Targets for the CCS Debug Utility '
	@echo 'all                  -> Build the CCS Debug Utility'
	@echo 'clean                -> Clean the CCS Debug Utility'
	@echo '****************************************************************************************'


