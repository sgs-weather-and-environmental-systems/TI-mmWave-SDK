###############################################################################
#
# Set up tools and build environment variables for mmwave sdk
#
###############################################################################

###############################################################################
# Build variables (to be modified based on build need)
###############################################################################

# Select your device. Options (case sensitive) are: awr14xx, iwr14xx, awr16xx, iwr16xx
export MMWAVE_SDK_DEVICE=awr16xx

# If download via CCS is needed, set below define to yes else no
#   yes: Out file created can be loaded using CCS.
#        Binary file created can be used to flash
#   no:  Out file created cannot be loaded using CCS.
#        Binary file created can be used to flash 
#        (additional features: write-protect of TCMA, etc)
export DOWNLOAD_FROM_CCS=yes

###############################################################################
# Customer installed tools variables (to be modified based on the installation)
###############################################################################


###############################################################################
# TI tools variables (no changes needed below this line if default mmwave sdk
# installation options are used)
###############################################################################

export MMWAVE_SDK_TOOLS_INSTALL_PATH=/home/anirudh/ti
 
# Common settings for awr14xx, awr16xx, iwr14xx, iwr16xx
# Path to <mmwave_sdk installation path>/packages folder
export MMWAVE_SDK_INSTALL_PATH=${MMWAVE_SDK_TOOLS_INSTALL_PATH}/mmwave_sdk_01_02_00_05/packages
# TI ARM compiler
export R4F_CODEGEN_INSTALL_PATH=${MMWAVE_SDK_TOOLS_INSTALL_PATH}/ti-cgt-arm_16.9.6.LTS
# TI XDC TOOLS
export XDC_INSTALL_PATH=${MMWAVE_SDK_TOOLS_INSTALL_PATH}/xdctools_3_50_04_43_core
# TI BIOS
export BIOS_INSTALL_PATH=${MMWAVE_SDK_TOOLS_INSTALL_PATH}/bios_6_53_02_00/packages
  
# Following only needed for awr16xx and iwr16xx
# TI DSP compiler
export C674_CODEGEN_INSTALL_PATH=${MMWAVE_SDK_TOOLS_INSTALL_PATH}/ti-cgt-c6000_8.1.3
# DSPlib
export C64Px_DSPLIB_INSTALL_PATH=${MMWAVE_SDK_TOOLS_INSTALL_PATH}/dsplib_c64Px_3_4_0_0
# DSPlib c674
export C674x_DSPLIB_INSTALL_PATH=${MMWAVE_SDK_TOOLS_INSTALL_PATH}/dsplib_c674x_3_4_0_0
# MATHlib
export C674x_MATHLIB_INSTALL_PATH=${MMWAVE_SDK_TOOLS_INSTALL_PATH}/mathlib_c674x_3_1_2_1
# awr16xx/iwr16xx radarss firmware. Use the RPRC formatted binary file.
export XWR16XX_RADARSS_IMAGE_BIN=${MMWAVE_SDK_INSTALL_PATH}/../firmware/radarss/xwr16xx_radarss_rprc.bin

# Call script to check env variables and set paths
source ./checkenv.sh
retval=$?
if [[ $retval != 0 ]]; then
    printErrorMsg "ERROR: Failure in checkenv !!!"
fi
return $retval;

