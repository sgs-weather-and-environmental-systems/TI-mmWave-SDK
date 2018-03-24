@echo off
rem # *************************************************************************
rem #  FILE           : setenv.bat
rem #  DESCRIPTION    :
rem #
rem #     This batch script should be run first before building dsplib
rem #
rem # *************************************************************************

rem # *************************************************************************
rem # *** Set up tools version (which are root directory)
rem # *************************************************************************

set CCSCGTVER=7.2.4
set CCSVERSION=CCSV4.2

set CCSV4_INSTALL_DIR=C:/Program Files/Texas Instruments/ccsv4
set CCSV5_INSTALL_DIR=C:/Program Files/Texas Instruments/ccsv5
set CGT_INSTALL_DIR=C:/Program Files/Texas Instruments/C6000 Code Generation Tools 7.2.4

rem # set dsplib repository path
xs -f setxdcpath.js
if errorlevel 1 goto end

rem # call tempcfg.bat
call tempcfg
rem # remove tempcfg.bat
rm tempcfg.bat
