@REM ###############################################################################
@REM #
@REM # Set up tools and build environment variables for mmwave sdk
@REM #
@REM ###############################################################################

@REM ###############################################################################
@REM # Build variables (to be modified based on build need)
@REM ###############################################################################

@REM Select your device. Options (case sensitive) are: awr14xx, iwr14xx, awr16xx, iwr16xx
set MMWAVE_SDK_DEVICE=awr16xx

@REM If download via CCS is needed, set below define to yes else no
@REM   yes: Out file created can be loaded using CCS.
@REM        Binary file created can be used to flash
@REM   no:  Out file created cannot be loaded using CCS.
@REM        Binary file created can be used to flash 
@REM        (additional features: write-protect of TCMA, etc)
set DOWNLOAD_FROM_CCS=yes

@REM ###############################################################################
@REM # Customer installed tools variables (to be modified based on the installation)
@REM ###############################################################################


@REM ###############################################################################
@REM # TI tools variables (no changes needed below this line if default mmwave sdk
@REM # installation options are used)
@REM ###############################################################################
 
set MMWAVE_SDK_TOOLS_INSTALL_PATH=__MMWAVE_SDK_TOOLS_INSTALL_PATH__
 
@REM Common settings for awr14xx, awr16xx, iwr14xx, iwr16xx
@REM Path to <mmwave_sdk installation path>/packages folder
set MMWAVE_SDK_INSTALL_PATH=%MMWAVE_SDK_TOOLS_INSTALL_PATH%/mmwave_sdk_01_02_00_05/packages
@REM TI ARM compiler
set R4F_CODEGEN_INSTALL_PATH=%MMWAVE_SDK_TOOLS_INSTALL_PATH%/ti-cgt-arm_16.9.6.LTS
@REM TI XDC TOOLS
set XDC_INSTALL_PATH=%MMWAVE_SDK_TOOLS_INSTALL_PATH%/xdctools_3_50_04_43_core
@REM TI BIOS
set BIOS_INSTALL_PATH=%MMWAVE_SDK_TOOLS_INSTALL_PATH%/bios_6_53_02_00/packages
  
@REM Following only needed for awr16xx and iwr16xx
@REM TI DSP compiler
set C674_CODEGEN_INSTALL_PATH=%MMWAVE_SDK_TOOLS_INSTALL_PATH%/ti-cgt-c6000_8.1.3
@REM DSPlib
set C64Px_DSPLIB_INSTALL_PATH=%MMWAVE_SDK_TOOLS_INSTALL_PATH%/dsplib_c64Px_3_4_0_0
@REM DSPlib C674
set C674x_DSPLIB_INSTALL_PATH=%MMWAVE_SDK_TOOLS_INSTALL_PATH%/dsplib_c674x_3_4_0_0
@REM MATHlib
set C674x_MATHLIB_INSTALL_PATH=%MMWAVE_SDK_TOOLS_INSTALL_PATH%/mathlib_c674x_3_1_2_1
@REM awr16xx/iwr16xx radarss firmware. Use the RPRC formatted binary file.
set XWR16XX_RADARSS_IMAGE_BIN=%MMWAVE_SDK_INSTALL_PATH%/../firmware/radarss/xwr16xx_radarss_rprc.bin

@REM Call script to check env variables and set paths
call checkenv.bat

@REM Check error code
IF %ERRORLEVEL% NEQ 0 (
  REM ERROR: Failure in checkenv.bat !!!
  REM Return error
  EXIT /B 1
)

EXIT /B 0

