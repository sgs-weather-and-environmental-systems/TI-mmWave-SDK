#!/bin/bash
#
# ******************************************************************
# * FILE PURPOSE: Check environment setup
# ******************************************************************
# * FILE NAME: checkenv.sh
# *
# * DESCRIPTION:
# *  Checks the build environment and sets PATH for mmWave SDK build.
# *
# ******************************************************************

. ./print_utilities.sh

retval=0

# -------------------------------------------------------------------
# Sanity Check: Ensure that all the required variables are defined
# -------------------------------------------------------------------
if [ -z $MMWAVE_SDK_INSTALL_PATH ]; then
    printErrorMsg "Error: MMWAVE_SDK_INSTALL_PATH [mmWave SDK Package Location] needs to be defined"
    printInfoMsg  "For example:"
    printInfoMsg  "  export MMWAVE_SDK_INSTALL_PATH=~/ti/mmwave_sdk_01_02_00_05/packages"
    retval=1
fi
if [ -z $R4F_CODEGEN_INSTALL_PATH ]; then
    printErrorMsg "Error: R4F_CODEGEN_INSTALL_PATH [R4F Toochain] needs to be defined"
    printInfoMsg  "For example:"
    printInfoMsg  "  export R4F_CODEGEN_INSTALL_PATH=~/ti/ti-cgt-arm_16.9.6.LTS"
    retval=1
fi
if [ -z $BIOS_INSTALL_PATH ]; then
    printErrorMsg "Error: BIOS_INSTALL_PATH [SYSBIOS] needs to be defined"
    printInfoMsg  "For example:"
    printInfoMsg  "  export BIOS_INSTALL_PATH=~/ti/bios_6_53_02_00/packages"
    retval=1
fi
if [ -z $XDC_INSTALL_PATH ]; then
    printErrorMsg "Error: XDC_INSTALL_PATH [XDC Build Tools] needs to be defined"
    printInfoMsg  "For example:"
    printInfoMsg  "  export XDC_INSTALL_PATH=~/ti/xdctools_3_50_04_43_core"
    retval=1
else
    if [ ! -d $XDC_INSTALL_PATH/jre ]; then
        printErrorMsg "Error: Installed XDC tool version does not have JRE"
        printInfoMsg  "       Please install the XDC tool version with JRE"
        printInfoMsg  "          - The XDC installer with JRE will be larger in size than the one without JRE"
        printInfoMsg  "          - The XDC installer with JRE does not have jre in its name or description"
        retval=1
    fi
fi

# This define is not directly tools related but needed for mmwave sdk build
if [ -z $DOWNLOAD_FROM_CCS ]; then
    printErrorMsg "Error: DOWNLOAD_FROM_CCS needs to be defined to yes or no"
    printInfoMsg  "For example:"
    printInfoMsg  "  export DOWNLOAD_FROM_CCS=yes"
    retval=1
fi
if [ -z $MMWAVE_SDK_DEVICE ]; then
    printErrorMsg "Error: MMWAVE_SDK_DEVICE needs to be defined to awr14xx, awr16xx, iwr14xx or iwr16xx"
    printInfoMsg  "For example:"
    printInfoMsg  "  export MMWAVE_SDK_DEVICE=awr16xx"
    retval=1
fi

# This is for adjusting L3RAM size with user environment variable setting(XWR14xx only)
if [ "$MMWAVE_SDK_DEVICE" == "awr14xx" ] || [ "$MMWAVE_SDK_DEVICE" == "iwr14xx" ]; then
if [ "$MMWAVE_L3RAM_SIZE" != "" ] ; then
    printInfoMsg "L3RAM_SIZE=$MMWAVE_L3RAM_SIZE"
    export  L3RAM_SIZE=${MMWAVE_L3RAM_SIZE}
fi
fi

if [ "$MMWAVE_SDK_DEVICE" == "awr16xx" ] || [ "$MMWAVE_SDK_DEVICE" == "iwr16xx" ]; then
if [ -z $C674_CODEGEN_INSTALL_PATH ]; then
    printErrorMsg "Error: C674_CODEGEN_INSTALL_PATH [DSP Toolchain] needs to be defined"
    printInfoMsg  "For example:"
    printInfoMsg  "  export C674_CODEGEN_INSTALL_PATH=~/ti/ti-cgt-c6000_8.1.3"
    retval=1
fi
if [ -z $C64Px_DSPLIB_INSTALL_PATH ]; then
    printErrorMsg "Error: C64Px_DSPLIB_INSTALL_PATH needs to be defined"
    printInfoMsg  "For example:"
    printInfoMsg  "  export C64Px_DSPLIB_INSTALL_PATH=~/ti/dsplib_c64Px_3_4_0_0"
    retval=1
fi
if [ -z $C674x_DSPLIB_INSTALL_PATH ]; then
    printErrorMsg "Error: C674x_DSPLIB_INSTALL_PATH needs to be defined"
    printInfoMsg  "For example:"
    printInfoMsg  "  export C674x_DSPLIB_INSTALL_PATH=~/ti/dsplib_c674x_3_4_0_0"
    retval=1
fi
if [ -z $C674x_MATHLIB_INSTALL_PATH ]; then
    printErrorMsg "Error: C674x_MATHLIB_INSTALL_PATH needs to be defined"
    printInfoMsg  "For example:"
    printInfoMsg  "  export C674x_MATHLIB_INSTALL_PATH=~/ti/mathlib_c674x_3_1_2_1"
    retval=1
fi
if [ -z $XWR16XX_RADARSS_IMAGE_BIN ]; then
    printErrorMsg "Error: XWR16XX_RADARSS_IMAGE_BIN needs to be defined with the complete path and filename of the radarss binary"
    printInfoMsg  "For example:"
    printInfoMsg  "  export XWR16XX_RADARSS_IMAGE_BIN=$MMWAVE_SDK_INSTALL_PATH/../firmware/radarss/xwr16xx_radarss_rprc.bin"
    retval=1
else
    if [ ! -f "$XWR16XX_RADARSS_IMAGE_BIN" ]; then
        printErrorMsg "Error: $XWR16XX_RADARSS_IMAGE_BIN does not exist. Check the path"
        retval=1
    fi
fi
fi

if [ $retval -eq 1 ]; then
    printErrorMsg "Error: One of more build variables are not set correctly. Exiting...."
    return 1
fi

# ---------------------------------------------------------
# Setup the PATH configuration:
# ----------------------------------------------------------
export PATH=$XDC_INSTALL_PATH:$XDC_INSTALL_PATH/bin:$PATH

printInfoMsg "-----------------------------------------------"
printInfoMsg "mmWave Build Environment Configured"
printInfoMsg "-----------------------------------------------"
return 0

