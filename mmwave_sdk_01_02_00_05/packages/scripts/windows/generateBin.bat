@echo off
@REM generateBin.bat <*.out> <*.bin> <Offset> 

set MMWAVE_SDK_DEVICE_TYPE=xwr14xx
set IMAGE_CREATOR_DIR=xwr14xx
if [%MMWAVE_SDK_DEVICE%] == [awr16xx] (
    set MMWAVE_SDK_DEVICE_TYPE=xwr16xx
    set IMAGE_CREATOR_DIR=xwr16xx
)
if [%MMWAVE_SDK_DEVICE%] == [iwr16xx] (
    set MMWAVE_SDK_DEVICE_TYPE=xwr16xx
    set IMAGE_CREATOR_DIR=xwr16xx
)

REM ================================================
REM tools required
SET OUT2RPRC_EXE=%MMWAVE_SDK_INSTALL_PATH%\scripts\ImageCreator\%IMAGE_CREATOR_DIR%\out2rprc\out2rprc.exe
SET CRC_EXE=%MMWAVE_SDK_INSTALL_PATH%\scripts\ImageCreator\append_bin_crc\gen_bincrc32.exe
REM ================================================


if [%MMWAVE_SDK_DEVICE_TYPE%] == [xwr14xx] (
    @REM To convert .out to .bin file
    call %OUT2RPRC_EXE% %1 %2 %3
    @REM DO NOT change the below if check. This is the only one that works consistently
    if ERRORLEVEL 1 (
        call set RETVAL=%%ERRORLEVEL%%
        call echo %%RETVAL%%
        echo Error: out2rprc failed for file %1 !!!
        @REM Delete the bin file since it is not complete
        IF EXIST %2 (
            echo Deleting %2 since it is incomplete !!!
            DEL /F /Q %2
        )
        exit /b %RETVAL%
    )

    @REM To append CRC of image in the same bin output file
    call %CRC_EXE% %2
    @REM DO NOT change the below if check. This is the only one that works consistently
    if ERRORLEVEL 1 (
        call set RETVAL=%%ERRORLEVEL%%
        @REM call echo %%RETVAL%%
        echo Error: gen_bincrc32 failed for file %2 !!!
        @REM Delete the bin file since it is not complete
        IF EXIST %2 (
            echo Deleting %2
            DEL /F /Q %2
        )
        exit /b %RETVAL%
    )
) else (
    @REM To convert .out to .bin file (without offset)
    call %OUT2RPRC_EXE% %1 %2
)


