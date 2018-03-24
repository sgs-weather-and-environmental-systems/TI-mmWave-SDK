#!/bin/bash
# Usage: generateBin.sh <*.out> <*.bin> <Offset> 
#        <Offset> is only needed when "$MMWAVE_SDK_DEVICE" == "awr14xx" OR "iwr14xx"

if [ "$MMWAVE_SDK_DEVICE" == "awr14xx" ] || [ "$MMWAVE_SDK_DEVICE" == "iwr14xx" ]
then
    ImageCreatorDevice=xwr14xx
else
    ImageCreatorDevice=xwr16xx
fi

OUT2RPRC_EXE=${MMWAVE_SDK_INSTALL_PATH}/scripts/ImageCreator/$ImageCreatorDevice/out2rprc/out2rprc.exe
GEN_BINCRC32=${MMWAVE_SDK_INSTALL_PATH}/scripts/ImageCreator/append_bin_crc/gen_bincrc32

# To convert .out to .bin file
# mono runs windows executable on linux
echo mono ${OUT2RPRC_EXE} "$@"
mono ${OUT2RPRC_EXE} "$@"
retval=$?
if [ $retval -ne 0 ]; then
    echo "Error: out2rprc failed for file $1 !!!"
    if [ ! -z ${BUILD_NOTES} ]; then
        echo "" >> ${BUILD_NOTES}
        echo "Error: out2rprc failed for file $1 !!!" >> ${BUILD_NOTES}
    fi

    # Delete the bin file since it is not complete
    if [ -f $2 ]; then
        echo "Deleting $2 since it is incomplete !!!"
        rm -f $2
    fi
    return $retval; 
fi

if [ "$MMWAVE_SDK_DEVICE" == "awr14xx" ] || [ "$MMWAVE_SDK_DEVICE" == "iwr14xx" ]; then
    # To append CRC of image in the same bin output file.
    ${GEN_BINCRC32} $2
    retval=$?
    if [ $retval -ne 0 ]; then
        echo "Error: gen_bincrc32 failed for file $2 !!!"
        if [ ! -z ${BUILD_NOTES} ]; then
            echo "" >> ${BUILD_NOTES}
            echo "Error: gen_bincrc32 failed for file $2 !!!" >> ${BUILD_NOTES}
        fi

        # Delete the bin file since it is not complete
        if [ -f $2 ]; then
            # remove the bin file
            rm -f $2
            return $retval;
        fi
    fi
fi

