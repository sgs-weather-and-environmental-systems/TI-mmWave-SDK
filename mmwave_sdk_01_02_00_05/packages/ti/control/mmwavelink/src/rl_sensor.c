/****************************************************************************************
 * FileName     : rl_sensor.c
 *
 * Description  : This file defines the functions to configure RF/Sensor in mmwave radar device.
 *
 ****************************************************************************************
 * (C) Copyright 2014, Texas Instruments Incorporated. - TI web address www.ti.com
 *---------------------------------------------------------------------------------------
 *
 *  Redistribution and use in source and binary forms, with or without modification,
 *  are permitted provided that the following conditions are met:
 *
 *    Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 *  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 *  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT  OWNER OR CONTRIBUTORS
 *  BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 *  CONTRACT,  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 */

 /*
 ****************************************************************************************
 * Revision History   :
 *---------------------------------------------------------------------------------------
 * Version  Date        Author             Defect No               Description
 *---------------------------------------------------------------------------------------
 * 0.1.0    12May2015   Kaushal Kukkar    -               Initial Version
 *
 * 0.5.2    23Sep2016   Kaushal Kukkar    AUTORADAR-540   Advance Frame APIs
 *
 * 0.6.0    15Nov2016   Kaushal Kukkar    MMWSDK-206      Dynamic Power Save API
 *                      Kaushal Kukkar    AUTORADAR-571   Cascade Feature Support
 *
 * 0.7.0    11May2017   Jitendra Gupta    MMWSDK-450      Calibration Config/Report APIs
 *                      Jitendra Gupta    MMWSDK-322      PS/PA/IF Loopback APIs
 *
 * 0.8.6    24Jul2017   Jitendra Gupta    MMWL-30         RF/Analog Monitoring APIs
 *                      Kaushal Kukkar    MMWL-23         Big Endian Support
 *
 * 0.9.1       -        Jitendra Gupta    MMWL-5          Code size optimization
 ****************************************************************************************
 */
/******************************************************************************
 * INCLUDE FILES
 ******************************************************************************
 */
#include <stdlib.h>
#include <string.h>
#include <ti/control/mmwavelink/mmwavelink.h>
#include <ti/control/mmwavelink/include/rl_driver.h>
#include <ti/control/mmwavelink/include/rl_messages.h>
#include <ti/control/mmwavelink/include/rl_controller.h>
#include <ti/control/mmwavelink/include/rl_sensor.h>
#include <ti/control/mmwavelink/include/rl_trace.h>


/******************************************************************************
 * GLOBAL VARIABLES/DATA-TYPES DEFINITIONS
 ******************************************************************************
 */

/******************************************************************************
 * FUNCTION DEFINITIONS
 ******************************************************************************
 */

/** @fn rlReturnVal_t rlSetChannelConfig(rlUInt8_t deviceMap, rlChanCfg_t* data)
*
*   @brief Sets the Rx and Tx Channel Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Container for Channel Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function allows configuration of mmWave Front end for how many Receiver and
*   Transmit channels need to be enabled. It also defines whether to to enable
*   single mmWave device or multiple mmWave devices to realize a larger antenna array
*   (multiple is applicable only in AWR1243). This is applicable for given power cycle.

*   @note This is global configuration for transmit channels. Later one can chose
*   which transmit channel to be used for each chirp using Chirp configuaration API.
*   For e.g - If Chirp 0, uses TX0 and TX1, and Chirp 1 uses TX1 and TX2, One need
*   to enable TX0, TX1 and TX2 in this API. Based on the configuration, mmWave Front
*   would do necessary calibration before the transmit channel is used to transmit
*   chirps

*   @ref rlSetChirpConfig
*/
/* DesignId : MMWL_DesignId_009 */
/* Requirements : AUTORADAR_REQ-752, AUTORADAR_REQ-757 */
rlReturnVal_t rlSetChannelConfig(rlUInt8_t deviceMap, rlChanCfg_t* data)
{
    rlReturnVal_t retVal;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_STATIC_CONF_SET_MSG,
                                       RL_RF_CHAN_CONF_SB, (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlChanCfg_t));
    }

    RL_LOGV_ARG0("rlSetChannelConfig ends...\n");
    return retVal;

}

/** @fn rlReturnVal_t rlSetAdcOutConfig(rlUInt8_t deviceMap, rlAdcOutCfg_t* data)
*
*   @brief Sets ADC Output Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Container for ADC Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function sets the static device configuration for the data format of the ADC
*   and digital front end output. This is RAW ADC samples of IF signal and needs to
*   be processed by HW accelerator or DSP. The ADC data can be sent to external Processor
*   over High Speed Interface such as LVDS or CSI2. The ADC data size supported are
*   12, 14 and 16 bits and supported formats are Real, Complex 1x and Complex 2x.
*   In Complex 1x, Image band is filtered out and only signal band is sampled in ADC.
*   Where as in Complex 2x, Both Image and Signal band is sampled.\n Complex baseband
*   architecture results in better noise figure and is recommended.

*   @note At the same sampling frequency(Fs), Complex 1x would support IF bandwidth of Fs,
*   where as real and complex 2x would provide IF bandwidth of upto Fs/2.
*/
/* DesignId :  MMWL_DesignId_010 */
/* Requirements : AUTORADAR_REQ-753, AUTORADAR_REQ-754 */
rlReturnVal_t rlSetAdcOutConfig(rlUInt8_t deviceMap, rlAdcOutCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlSetAdcOutConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlSetAdcOutConfig, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_STATIC_CONF_SET_MSG,
                                       RL_RF_ADCOUT_CONF_SB, (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlAdcOutCfg_t));
    }

    RL_LOGV_ARG0("rlSetAdcOutConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlSetBpmCommonConfig(rlUInt8_t deviceMap, rlBpmCommonCfg_t* data)
*
*   @brief Sets Binary Phase Modulation Common Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Container for BPM common Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API defines static configurations related to BPM (Binary Phase Modulation) feature in
*   each of the TXs. E.g. the source of the BPM pattern (one constant value for each chirp as
*   defined, or intra-chirp pseudo random BPM pattern as found by a programmable
*   LFSR or a programmable sequence inside each chirp), are defined here.
*
*   @note Different source of BPM is currently not supported, hence this API is not required
*         to be called by application.
*/
/* DesignId : MMWL_DesignId_016 */
/* Requirements : AUTORADAR_REQ-724 */
rlReturnVal_t rlSetBpmCommonConfig(rlUInt8_t deviceMap, rlBpmCommonCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlSetBpmCommonConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlSetBpmCommonConfig, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_ADVANCED_FEATURES_SET_MSG,
                                       RL_RF_BPM_COMMON_CONF_SB, (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlBpmCommonCfg_t));
    }
    RL_LOGV_ARG0("rlSetBpmCommonConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlSetBpmChirpConfig(rlUInt8_t deviceMap, rlBpmChirpCfg_t* data)
*
*   @brief Sets Binary Phase Modulation Chirp Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Container for BPM chirp configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API defines static configurations related to BPM (Binary Phase Modulation) feature in
*   each of the TXs
*/
/* DesignId : MMWL_DesignId_037 */
/* Requirements : AUTORADAR_REQ-727 */
rlReturnVal_t rlSetBpmChirpConfig(rlUInt8_t deviceMap, rlBpmChirpCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlSetBpmChirpConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlSetBpmChirpConfig, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_ADVANCED_FEATURES_SET_MSG,
                                       RL_RF_BPM_CHIRP_CONF_SB, (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlBpmChirpCfg_t));
    }

    RL_LOGV_ARG0("rlSetBpmChirpConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlSetMultiBpmChirpConfig(rlUInt8_t deviceMap, rlUInt16_t cnt,
                                               rlBpmChirpCfg_t** data)
*
*   @brief Sets Binary Phase Modulation configuration for multiple Chirp
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] cnt - number of BPM chirp config data
*   @param[in] data - pointer to linked list/array of BPM chirp configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   Using this API application can configure multiple BPM chirp configuration
*   in a single call. This API defines static configurations related to BPM (Binary
*   Phase Modulation) feature in each of the TXs.
*/
/* DesignId : MMWL_DesignId_037 */
/* Requirements : AUTORADAR_REQ-727 */
rlReturnVal_t rlSetMultiBpmChirpConfig(rlUInt8_t deviceMap, rlUInt16_t cnt,
                                                        rlBpmChirpCfg_t** data)
{
    rlReturnVal_t retVal;
    RL_LOGV_ARG0("rlSetMultiBpmChirpConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data) || \
        (cnt == 0U))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg;
        rlDriverMsg_t outMsg = {0};

        /* Index and other paramerters to send multiple sub blocks in one/more commands chunk */
        rlUInt16_t sbLen, maxSbCntInMsg, sbCntInMsg, numChnkOfMsg, lastSbCntInMsg, loopCnt, indx;


        /* Initialize Command and Response Sub Blocks */
        rlPayloadSb_t inPayloadSb[RL_CMD_PL_LEN_MAX/(sizeof(rlBpmChirpCfg_t) + \
                                  RL_SBC_ID_SIZE + RL_SBC_LEN_SIZE)];

        /* single sub-block length for chirp config API */
        sbLen = (rlUInt16_t)(sizeof(rlBpmChirpCfg_t) + (RL_SBC_LEN_SIZE + RL_SBC_ID_SIZE));

        /* get Max Sub Block count */
        /* AR_CODE_REVIEW MR:D.4.1 <INSPECTED> "sbLen can not be zero" */
        /*LDRA_INSPECTED 127 D */
        maxSbCntInMsg = (RL_CMD_PL_LEN_MAX /sbLen);

        retVal = RL_RET_CODE_OK;
        /* if requested count of chirpConfig is within one Message packet */
        if (cnt <= maxSbCntInMsg)
        {
            sbCntInMsg     = cnt;
            numChnkOfMsg   = 1U;
            lastSbCntInMsg = 0U;
        }
        else
        {
            sbCntInMsg     = maxSbCntInMsg;
            numChnkOfMsg   = cnt / maxSbCntInMsg;
            lastSbCntInMsg = cnt % maxSbCntInMsg;
        }

        /* Fill in-message packet */
        rlDriverConstructInMsg(RL_RF_ADVANCED_FEATURES_SET_MSG, &inMsg, &inPayloadSb[0]);

        loopCnt = (lastSbCntInMsg == 0U) ? numChnkOfMsg : (numChnkOfMsg + 1U);

        while (retVal == RL_RET_CODE_OK)
        {
            /* all full messages have been sent, then send last partial message */
            if ((loopCnt == 1U) && (lastSbCntInMsg != 0U))
            {
                inMsg.opcode.nsbc = lastSbCntInMsg;
            }
            else
            {
                inMsg.opcode.nsbc = sbCntInMsg;
            }

            for (indx = 0U; indx < inMsg.opcode.nsbc; indx++)
            {
                /* Set Command Sub Block*/
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].sbid = RL_GET_UNIQUE_SBID(RL_RF_ADVANCED_FEATURES_SET_MSG,
                                             RL_RF_BPM_CHIRP_CONF_SB);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].len       = (rlUInt16_t)sizeof(rlBpmChirpCfg_t);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].pSblkData = (rlUInt8_t*)(*data);

                /*AR_CODE_REVIEW MR:R.18.1 <INSPECTED> "require pointer increment to jump to
                  next profile Config */
                /*LDRA_INSPECTED 567 S */
                data++;
            }
            /* Send Command to mmWave Radar Device */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
            loopCnt--;

            if (loopCnt == 0U)
            {
                break;
            }
        }
    }
    RL_LOGV_ARG0("rlSetMultiBpmChirpConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlSetProfileConfig(rlUInt8_t deviceMap, rlUInt16_t cnt, rlProfileCfg_t* data)
*
*   @brief Sets Chirp profile Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] cnt  - Number of Profiles
*   @param[in] data - Array of Profile Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function sets the chirp profile in mmWave Front end. A profile is like a template which
*   contains coarse information about FMCW signal such as start frequency, chirp slope, chirp
*   duration, TX power etc. The API allows multiple profiles to be set together by passing the
*   array of profile data along with count of profiles.
*
*   @note One can set upto 4 profiles. Each profile contains coarse inforamtion. Fine dithering
*   can be added using chirp configuration API
*
*   @ref rlSetChirpConfig
*
*/
/* DesignId : MMWL_DesignId_013 */
/* Requirements :  AUTORADAR_REQ-728, AUTORADAR_REQ-729, AUTORADAR_REQ-730, AUTORADAR_REQ-731,
                   AUTORADAR_REQ-732, AUTORADAR_REQ-733, AUTORADAR_REQ-734, AUTORADAR_REQ-735,
                   AUTORADAR_REQ-736, AUTORADAR_REQ-737, AUTORADAR_REQ-738, AUTORADAR_REQ-739,
                   AUTORADAR_REQ-740, AUTORADAR_REQ-741, AUTORADAR_REQ-742, AUTORADAR_REQ-743,
                   AUTORADAR_REQ-773
 */
rlReturnVal_t rlSetProfileConfig(rlUInt8_t deviceMap, rlUInt16_t cnt,
                                            rlProfileCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlSetProfileConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data) || (cnt == 0U))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlSetProfileConfig, Invalid device map\n");
    }
    else
    {
        rlDriverMsg_t inMsg = {0};
        rlDriverMsg_t outMsg = {0};

        /* Initialize Command and Response Sub Blocks */
        rlPayloadSb_t inPayloadSb[RL_CMD_PL_LEN_MAX/(sizeof(rlProfileCfg_t) + \
                                  RL_SBC_ID_SIZE + RL_SBC_LEN_SIZE)];
        /* Variable to count message chunks */
        rlUInt16_t indx;
        rlUInt16_t sbCntInAllChunk = 0U;
        rlUInt16_t maxSbInMsg = (RL_CMD_PL_LEN_MAX /(sizeof(rlProfileCfg_t) + \
                                  RL_SBC_ID_SIZE + RL_SBC_LEN_SIZE));

        /* Construct command packet */
        rlDriverConstructInMsg(RL_RF_DYNAMIC_CONF_SET_MSG, &inMsg, &inPayloadSb[0]);

        retVal = RL_RET_CODE_OK;
        /* Loop to copy all the command data to one message */
        for (indx = 0U; (indx < cnt) && (retVal == RL_RET_CODE_OK); indx++)
        {
            /* Fill in-message payload */
            /*AR_CODE_REVIEW MR:R.18.1 <INSPECTED> "require pointer increment to jump to
              next profile Config */
            /*AR_CODE_REVIEW MR:R.18.4 <INSPECTED> "require pointer increment to jump to
              next profile Config */
            /*LDRA_INSPECTED 87 S */
            /*LDRA_INSPECTED 567 S */
            rlDriverFillPayload(RL_RF_DYNAMIC_CONF_SET_MSG, RL_RF_PROFILE_CONF_SB,
                                &inPayloadSb[indx], (rlUInt8_t*)(data + indx),
                                (rlUInt16_t)sizeof(rlProfileCfg_t));

            /* increment Sub-block count in one packet */
            sbCntInAllChunk++;

            /* check if total payload length is going beyond defined limitation */
            if ((maxSbInMsg == (indx + 1U)) || (cnt == sbCntInAllChunk))
            {
                /* setting of numSBC to inMsg */
                inMsg.opcode.nsbc = (indx + 1U);
                /* Send Command to mmWave Radar Device */
                retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
            }
        }
    }

    RL_LOGV_ARG0("rlSetProfileConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlGetProfileConfig(rlUInt8_t deviceMap, rlUInt16_t profileId,
*                                        rlProfileCfg_t* data)
*
*   @brief Gets Chirp profile Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] profileId - Profile Id
*   @param[out] data - Container for Profile Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function gets the FMCW radar chirp properties like FMCW slope, chirp duration,
*   TX power etc. from the device.
*/
/* DesignId :  */
/* Requirements :  */
rlReturnVal_t rlGetProfileConfig(rlUInt8_t deviceMap, rlUInt16_t profileId, rlProfileCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlGetProfileConfig ends...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlGetProfileConfig, Invalid device map\n");
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg = {0};
        rlDriverMsg_t outMsg = {0};
        rlPayloadSb_t inPayloadSb = {0};
        rlPayloadSb_t outPayloadSb = {0};
        rlWordParam_t wordParam;
        /* combine half words into WORD structure */
        wordParam.halfWordOne = profileId;
        wordParam.halfWordTwo = 0U;

        /* Construct command packet */
        rlDriverConstructInMsg(RL_RF_DYNAMIC_CONF_GET_MSG, &inMsg, &inPayloadSb);
        /* Fill in-message Payload */
        rlDriverFillPayload(RL_RF_DYNAMIC_CONF_GET_MSG, RL_RF_PROFILE_CONF_SB, &inPayloadSb,
                            (rlUInt8_t*)&wordParam, (rlUInt16_t)sizeof(rlWordParam_t));

        /* Construct response packet */
        rlDriverConstructOutMsg(1U, &outMsg, &outPayloadSb);
        /* Fill in-message Payload */
        rlDriverFillPayload(0U, 0U, &outPayloadSb, (rlUInt8_t*)data, 0U);

        /* Send Command to mmWave Radar Device */
        retVal = rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
    }

    RL_LOGV_ARG0("rlGetProfileConfig ends...\n");
    return retVal;
}

/** @fn rlReturnVal_t rlSetChirpConfig(rlUInt8_t deviceMap, rlUInt16_t cnt, rlChirpCfg_t* data)
*
*   @brief Sets Chirp Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] cnt  - Number of configurations
*   @param[in] data - Array of Chirp Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function sets the chirp to chirp variations on top of the chirp profile. The
*   User should first define a profile using rlSetProfileConfig.\n This function then configures
*   the chirp by associating it with a particular profile defined in rlSetProfileConfig API.
*   In addition to that user can define fine dither to the profile parameters using this API\n
*   This API allows configuration of 1 or upto 512 chirps. Also it allows configuraiton of
*   which Transmit channels to be used for each chirp.

*   @note One can set upto 512 unique chirps which can be stored in dedicated memory inside
*   mmWave front end. Hence user doesn't need to program the chirps during run time. Also these
*   chirps can be sequenced in a frame using rlSetFrameConfig to create a larger FMCW signal

*   @ref rlSetFrameConfig
*/
/* DesignId : MMWL_DesignId_014 */
/* Requirements : AUTORADAR_REQ-744, AUTORADAR_REQ-745, AUTORADAR_REQ-746, AUTORADAR_REQ-747,
                  AUTORADAR_REQ-748, AUTORADAR_REQ-749, AUTORADAR_REQ-750, AUTORADAR_REQ-751,
                  AUTORADAR_REQ-773
 */
rlReturnVal_t rlSetChirpConfig(rlUInt8_t deviceMap, rlUInt16_t cnt, rlChirpCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlSetChirpConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
        (RL_NULL_PTR == data) || (cnt == 0U))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg;
        rlDriverMsg_t outMsg = {0};
        /* Index and other paramerters to send multiple sub blocks in one/more commands chunk */
        rlUInt16_t sbLen, maxSbCntInMsg, sbCntInMsg, numChnkOfMsg, lastSbCntInMsg, loopCnt, indx;

        /* Initialize Command and Response Sub Blocks */
        rlPayloadSb_t inPayloadSb[RL_CMD_PL_LEN_MAX/(sizeof(rlChirpCfg_t) + \
                                  RL_SBC_ID_SIZE + RL_SBC_LEN_SIZE)];

        /* single sub-block length for chirp config API */
        sbLen = (rlUInt16_t)(sizeof(rlChirpCfg_t) + (RL_SBC_LEN_SIZE + RL_SBC_ID_SIZE));

        /* get Max Sub Block count */
        /* AR_CODE_REVIEW MR:D.4.1 <INSPECTED> "sbLen can not be zero" */
        /*LDRA_INSPECTED 127 D */
        maxSbCntInMsg = (RL_CMD_PL_LEN_MAX /sbLen);

        retVal = RL_RET_CODE_OK;
        /* if requested count of chirpConfig is within one Message packet */
        if (cnt <= maxSbCntInMsg)
        {
            sbCntInMsg     = cnt;
            numChnkOfMsg   = 1U;
            lastSbCntInMsg = 0U;
        }
        else
        {
            sbCntInMsg     = maxSbCntInMsg;
            numChnkOfMsg   = cnt / maxSbCntInMsg;
            lastSbCntInMsg = cnt % maxSbCntInMsg;
        }

        /* Fill in-message packet */
        rlDriverConstructInMsg(RL_RF_DYNAMIC_CONF_SET_MSG, &inMsg, &inPayloadSb[0]);
        /* get the loop count in form of number of msg chunks */
        loopCnt = (lastSbCntInMsg == 0U) ? numChnkOfMsg : (numChnkOfMsg + 1U);

        while (retVal == RL_RET_CODE_OK)
        {
            /* all full messages have been sent, then send last partial message */
            if ((loopCnt == 1U) && (lastSbCntInMsg != 0U))
            {
                inMsg.opcode.nsbc = lastSbCntInMsg;
            }
            else
            {
                inMsg.opcode.nsbc = sbCntInMsg;
            }

            for (indx = 0U; indx < inMsg.opcode.nsbc; indx++)
            {
                /* Set Command Sub Block*/
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].sbid = RL_GET_UNIQUE_SBID(RL_RF_DYNAMIC_CONF_SET_MSG,
                                             RL_RF_CHIRP_CONF_SB);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].len       = (rlUInt16_t)sizeof(rlChirpCfg_t);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].pSblkData = (rlUInt8_t*)(data);
                /*AR_CODE_REVIEW MR:R.18.1 <INSPECTED> "require pointer increment to jump to \
                  next chirp Config */
                /*LDRA_INSPECTED 567 S */
                data++;
            }
            /* Send Command to mmWave Radar Device */
            /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
            LDRA Tool Issue" */
            /*LDRA_INSPECTED 105 D */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
            /* decrement the loop count */
            loopCnt--;
            /* if all chirp configurations have been sent to device then terminate the loop */
            if (loopCnt == 0U)
            {
                break;
            }
        }
    }

    RL_LOGV_ARG0("rlSetChirpConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlGetChirpConfig(rlUInt8_t deviceMap, rlUInt16_t chirpStartIdx,
*                                      rlUInt16_t chirpEndIdx, rlChirpCfg_t* data)
*
*   @brief Gets Chirp Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] chirpStartIdx - Chirp Start Index
*   @param[in] chirpEndIdx - Chirp End Index
*   @param[out] data - Container for Chirp Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function gets the chirp configuration from the device.
*/
/* DesignId :  */
/* Requirements :  */
rlReturnVal_t rlGetChirpConfig(rlUInt8_t deviceMap, rlUInt16_t chirpStartIdx,
                                    rlUInt16_t chirpEndIdx, rlChirpCfg_t* data)
{
    rlReturnVal_t retVal;
    rlChirpCfg_t *chirpCfgData = data;

    RL_LOGV_ARG0("rlGetChirpConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == chirpCfgData))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlGetChirpConfig, Invalid device map\n");
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg = {0};
        rlDriverMsg_t outMsg = {0};
        /* Index and other paramerters to send multiple sub blocks in one/more commands chunk */
        rlUInt16_t sbLen, maxSbCntOutMsg, sbCntOutMsg, numChnkOfMsg, lastSbCntOutMsg, loopCnt;

        /* file chirp start and end index */
        rlWordParam_t wordParam;

        rlPayloadSb_t inPayloadSb = {0};
        rlPayloadSb_t outPayloadSb;

        /* single sub-block length for chirp config API */
        sbLen = (rlUInt16_t)(sizeof(rlChirpCfg_t));

        /* get Max Sub Block count */
        /* AR_CODE_REVIEW MR:D.4.1 <INSPECTED> "sbLen can not be zero" */
        /*LDRA_INSPECTED 127 D */
        maxSbCntOutMsg = (RL_CMD_PL_LEN_MAX -(RL_SBC_LEN_SIZE + RL_SBC_ID_SIZE)) /sbLen;

        retVal = RL_RET_CODE_OK;
        /* if requested count of chirpConfig is within one Message packet */
        if ((chirpEndIdx - chirpStartIdx + 1U) <= maxSbCntOutMsg)
        {
            sbCntOutMsg     = (chirpEndIdx - chirpStartIdx + 1U);
            numChnkOfMsg    = 0U;
            lastSbCntOutMsg = 0U;
        }
        else
        {
            sbCntOutMsg     = maxSbCntOutMsg;
            numChnkOfMsg    = (chirpEndIdx - chirpStartIdx + 1U) / maxSbCntOutMsg;
            lastSbCntOutMsg = (chirpEndIdx - chirpStartIdx + 1U) % maxSbCntOutMsg;
        }
        /* set chirp start index to inMsg field */
        /* AR_CODE_REVIEW MR:R.2.2 <INSPECTED> "required to intial with startIdx" */
        /*LDRA_INSPECTED 8 D */
        wordParam.halfWordTwo = chirpStartIdx;

        /* get the loop count in form of number of msg chunks */
        loopCnt = numChnkOfMsg + 1U;
        /* setting num of sub-block to one in outMsg */
        outMsg.opcode.nsbc = 1U;

        while (retVal == RL_RET_CODE_OK)
        {
            /* combine half words into WORD structure */
            wordParam.halfWordOne = wordParam.halfWordTwo;
            /* all full messages have been sent, then send last partial message */
            if ((loopCnt == 1U) && (lastSbCntOutMsg != 0U))
            {
                wordParam.halfWordTwo = wordParam.halfWordOne + (lastSbCntOutMsg - 1U);
            }
            else
            {
                wordParam.halfWordTwo = wordParam.halfWordOne + (sbCntOutMsg - 1U);
            }

            /* Construct command packet */
            rlDriverConstructInMsg(RL_RF_DYNAMIC_CONF_GET_MSG, &inMsg, &inPayloadSb);
            /* Fill in-message Payload */
            rlDriverFillPayload(RL_RF_DYNAMIC_CONF_GET_MSG, RL_RF_CHIRP_CONF_SB, &inPayloadSb,
                            (rlUInt8_t*)&wordParam, (rlUInt16_t)sizeof(rlWordParam_t));

            /* Set Command Sub Block*/
            outPayloadSb.sbid = RL_GET_UNIQUE_SBID(RL_RF_DYNAMIC_CONF_GET_MSG,
                                            RL_RF_CHIRP_CONF_SB);
            outPayloadSb.len       = (rlUInt16_t)sizeof(rlChirpCfg_t);
            outPayloadSb.pSblkData = (rlUInt8_t*)(chirpCfgData);

            /* Construct response packet */
            rlDriverConstructOutMsg(outMsg.opcode.nsbc, &outMsg, &outPayloadSb);

            /* Send Command to mmWave Radar Device */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);

            /* increment data pointer for next chunk of reponse */
            chirpCfgData += sbCntOutMsg;

            /* decrement the loop count */
            loopCnt--;
            wordParam.halfWordTwo++;
            /* if all chirp configurations have been sent to device then terminate the loop */
            if (loopCnt == 0U)
            {
                break;
            }
        }
    }

    RL_LOGV_ARG0("rlGetChirpConfig ends...\n");

    return retVal;
}


/** @fn rlReturnVal_t rlSetMultiChirpCfg(rlUInt8_t deviceMap, rlUInt16_t cnt,
                                         rlChirpCfg_t **data)
*
*   @brief Injects chirp configuration to be programmed dynamically
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] cnt - number of chirps
*   @param[in] data - Pointer to Chirp configuration linked list/array
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function sets the chirp to chirp variations on top of the chirp profile. The
*   User should first define a profile using rlSetProfileConfig.\n This function then configures
*   the chirp by associating it with a particular profile defined in rlSetProfileConfig API.
*   In addition to that user can define fine dither to the profile parameters using this API \n
*   This API allows configuration of 1 or upto 512 chirps. Also it allows configuraiton of
*   which Transmit channels to be used for each chirp.
*
*   @note One can set upto 512 unique chirps which can be stored in dedicated memory inside
*   mmWave front end. Hence user doesn't need to program the chirps during run time. Also these
*   chirps can be sequenced in a frame using rlSetFrameConfig to create a larger FMCW signal\n
*   This API is similar to rlSetChirpConfig but gives the flexibility to pass the array of
*   chirp configuration pointers, so chirp configuration memory need not be contiguous.
*
*/
rlReturnVal_t rlSetMultiChirpCfg(rlUInt8_t deviceMap, rlUInt16_t cnt,
                                         rlChirpCfg_t **data)
{
    rlReturnVal_t retVal;
    RL_LOGV_ARG0("rlSetMultiChirpCfg starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data) || \
        (cnt == 0U))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg;
        rlDriverMsg_t outMsg = {0};

        /* Index and other paramerters to send multiple sub blocks in one/more commands chunk */
        rlUInt16_t sbLen, maxSbCntInMsg, sbCntInMsg, numChnkOfMsg, lastSbCntInMsg, loopCnt, indx;


        /* Initialize Command and Response Sub Blocks */
        rlPayloadSb_t inPayloadSb[RL_CMD_PL_LEN_MAX/(sizeof(rlChirpCfg_t) + \
                                  RL_SBC_ID_SIZE + RL_SBC_LEN_SIZE)];

        /* single sub-block length for chirp config API */
        sbLen = (rlUInt16_t)(sizeof(rlChirpCfg_t) + (RL_SBC_LEN_SIZE + RL_SBC_ID_SIZE));


        /* get Max Sub Block count */
        /* AR_CODE_REVIEW MR:D.4.1 <INSPECTED> "sbLen can not be zero" */
        /*LDRA_INSPECTED 127 D */
        maxSbCntInMsg = (RL_CMD_PL_LEN_MAX /sbLen);

        retVal = RL_RET_CODE_OK;
        /* if requested count of chirpConfig is within one Message packet */
        if (cnt <= maxSbCntInMsg)
        {
            sbCntInMsg     = cnt;
            numChnkOfMsg   = 1U;
            lastSbCntInMsg = 0U;
        }
        else
        {
            sbCntInMsg     = maxSbCntInMsg;
            numChnkOfMsg   = cnt / maxSbCntInMsg;
            lastSbCntInMsg = cnt % maxSbCntInMsg;
        }

        /* Fill in-message packet */
        rlDriverConstructInMsg(RL_RF_DYNAMIC_CONF_SET_MSG, &inMsg, &inPayloadSb[0]);

        loopCnt = (lastSbCntInMsg == 0U) ? numChnkOfMsg : (numChnkOfMsg + 1U);

        while (retVal == RL_RET_CODE_OK)
        {
            /* all full messages have been sent, then send last partial message */
            if ((loopCnt == 1U) && (lastSbCntInMsg != 0U))
            {
                inMsg.opcode.nsbc = lastSbCntInMsg;
            }
            else
            {
                inMsg.opcode.nsbc = sbCntInMsg;
            }

            for (indx = 0U; indx < inMsg.opcode.nsbc; indx++)
            {
                /* Set Command Sub Block*/
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].sbid = RL_GET_UNIQUE_SBID(RL_RF_DYNAMIC_CONF_SET_MSG,
                                             RL_RF_CHIRP_CONF_SB);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].len       = (rlUInt16_t)sizeof(rlChirpCfg_t);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].pSblkData = (rlUInt8_t*)(*data);

                /*AR_CODE_REVIEW MR:R.18.1 <INSPECTED> "require pointer increment to jump to
                  next profile Config */
                /*LDRA_INSPECTED 567 S */
                data++;
            }
            /* Send Command to mmWave Radar Device */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
            loopCnt--;

            if (loopCnt == 0U)
            {
                break;
            }
        }
    }
    RL_LOGV_ARG0("rlSetMultiChirpCfg ends...\n");
    return retVal;
}

/** @fn rlReturnVal_t rlSetFrameConfig(rlUInt8_t deviceMap, rlFrameCfg_t* data)
*
*   @brief Sets Frame Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Container for Frame Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function allows configuration of FMCW frame in mmWave Front end. A Frame is basically
*   a sequence of chirps and how this sequnece needs to be repeated over time. User first need
*   to define a profile and set of chirps(associated with a profile).\n This function then defines
*   how to sequence these chirps. The same chirp can be simply looped to create a large FMCW frame
*   or multiple unique chirps cane be sequenced to create the frame. Chirp Start and end Index
*   defines how to sequence them in a frame. \n The API also allows configuration of number of
*   frames to be transmitted, periodicity of the frame and the trigger method. The trigger method
*   could be SW API based trigger or HW SYNC IN based trigger.
*
*   @note Frame could have multiple chirps associated with different profile, but number of
*         samples need to be same in all the profiles.
*/
/* DesignId : MMWL_DesignId_015 */
/* Requirements : AUTORADAR_REQ-715, AUTORADAR_REQ-716, AUTORADAR_REQ-717,
   AUTORADAR_REQ-718, AUTORADAR_REQ-719, AUTORADAR_REQ-720 */
rlReturnVal_t rlSetFrameConfig(rlUInt8_t deviceMap, rlFrameCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlSetFrameConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlSetFrameConfig, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_FRAME_CONF_SB, (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlFrameCfg_t));

        /* If only mmWaveLink instance is running on Host */
        if ((retVal == RL_RET_CODE_OK) && (RL_PLATFORM_HOST == rlDriverGetPlatformId()))
        {
            /* Initialize Command and Response Sub Blocks */
            rlDriverMsg_t inMsg = {0};
            rlDriverMsg_t outMsg = {0};
            rlPayloadSb_t inPayloadSb = {0};
            rlFrameApplyCfg_t frameApplyCfgArgs;
            rlUInt16_t tempVar;
            frameApplyCfgArgs.reserved      = 0U;
            frameApplyCfgArgs.numAdcSamples = (data->numAdcSamples);
            tempVar = ((data->chirpEndIdx - data->chirpStartIdx) + 1U) *
                       (data->numLoops);
#ifndef MMWL_BIG_ENDIAN
            frameApplyCfgArgs.numChirps     = tempVar;
#else
            frameApplyCfgArgs.numChirps = RL_SWAP_32(tempVar);
#endif
            /* Construct command packet */
            rlDriverConstructInMsg(RL_DEV_CONFIG_APPLY_MSG, &inMsg, &inPayloadSb);
            /* Fill in-message Payload */
            rlDriverFillPayload(RL_DEV_CONFIG_APPLY_MSG, RL_SYS_CONFIG_APPLY_SB,
                                &inPayloadSb, (rlUInt8_t*)&frameApplyCfgArgs,
                                (rlUInt16_t)sizeof(rlFrameApplyCfg_t));

            /* Send Command to mmWave Radar Device */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
        }
    }

    RL_LOGV_ARG0("rlSetFrameConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlGetFrameConfig(rlUInt8_t deviceMap, rlFrameCfg_t* data)
*
*   @brief Gets Frame Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[out] data - Container for Frame Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function reads the frame properties of the device.
*/
/* DesignId :  */
/* Requirements :  */
rlReturnVal_t rlGetFrameConfig(rlUInt8_t deviceMap, rlFrameCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlGetFrameConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlGetFrameConfig, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteGetApi(deviceMap, RL_RF_DYNAMIC_CONF_GET_MSG,
                               RL_RF_FRAME_CONF_SB, (rlUInt8_t*)data, 0U);

        /* If only mmWaveLink instance is running on Host */
        if ((retVal == RL_RET_CODE_OK) && (RL_PLATFORM_HOST == rlDriverGetPlatformId()))
        {
            /* Initialize Command and Response Sub Blocks */
            rlDriverMsg_t inMsg = {0};
            rlDriverMsg_t outMsg = {0};
            rlPayloadSb_t inPayloadSb = {0};
            rlPayloadSb_t outPayloadSb = {0};
            rlFrameApplyCfg_t frameApplyCfgArgs = {0};

            /* Construct command packet */
            rlDriverConstructInMsg(RL_DEV_STATUS_GET_MSG, &inMsg, &inPayloadSb);
            /* Fill in-message Payload */
            /*AR_CODE_REVIEW MR:R.11.2 <REVIEWED> "Need to pass NULL pointer" */
            /*LDRA_INSPECTED 95 S */
            rlDriverFillPayload(RL_DEV_STATUS_GET_MSG, RL_SYS_FRAME_CONFIG_GET_SB,
                                &inPayloadSb, (rlUInt8_t*)RL_NULL_PTR, 0x0U);

            /* Construct response packet */
            rlDriverConstructOutMsg(1U, &outMsg, &outPayloadSb);
            /* Fill out-message Payload */
            rlDriverFillPayload(0U, 0U, &outPayloadSb,
                                (rlUInt8_t*)&frameApplyCfgArgs, 0U);

            /* Send Command to mmWave Radar Device */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
#ifndef MMWL_BIG_ENDIAN

            /* update parameter received by Get Command */
            data->numAdcSamples = frameApplyCfgArgs.numAdcSamples;
#else
            /* update parameter received by Get Command */
            data->numAdcSamples = RL_SWAP_32(frameApplyCfgArgs.numAdcSamples);
#endif
        }
    }

    RL_LOGV_ARG0("rlGetFrameConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlSetAdvFrameConfig(rlUInt8_t deviceMap, rlAdvFrameCfg_t* data)
*
*   @brief Sets Advance Frame Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Container for Advance Frame Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function allows configuration of advance frame in mmWave Front end. Advance Frame is
*   a sequence of chirps and how this sequnece needs to be repeated over time. User first need
*   to define a profile and set of chirps(associated with a profile).\n This function then defines
*   how to sequence these chirps. Multiple chirps can be looped to create a burst. Multiple bursts
*   can be grouped to create a sub-frame. Multiple sub-frames(Upto 4) can be grouped to create
*   advance frame.\n This function defines the advance frame properties like the number of burst
*   in subframe, number of chirps and loops in a burst, sequence of subframes to be transmitted,
*   number of frames to be transmitted, periodicity of the frame and the trigger method.
*/
/* DesignId : MMWL_DesignId_046 */
/* Requirements : AUTORADAR_REQ-795 */
rlReturnVal_t rlSetAdvFrameConfig(rlUInt8_t deviceMap, rlAdvFrameCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlSetAdvFrameConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlSetAdvFrameConfig, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_FRAME_CONF_ADVANCED_SB,
                                       (rlUInt8_t*)(&(data->frameSeq)),
                                       (rlUInt16_t)sizeof(rlAdvFrameSeqCfg_t));

        /* If only mmWaveLink instance is running on Host */
        if ((RL_RET_CODE_OK == retVal) && (RL_PLATFORM_HOST == rlDriverGetPlatformId()))
        {
            /* Initialize Command and Response Sub Blocks */
            rlDriverMsg_t inMsg = {0};
            rlDriverMsg_t outMsg = {0};
            rlPayloadSb_t inPayloadSb = {0};
            /* Construct command packet */
            rlDriverConstructInMsg(RL_DEV_CONFIG_APPLY_MSG, &inMsg, &inPayloadSb);
            /* Fill in-message Payload */
            rlDriverFillPayload(RL_DEV_CONFIG_APPLY_MSG, RL_ADV_FRAME_DATA_CONFIG_SB,
                                &inPayloadSb, (rlUInt8_t*)&(data->frameData),
                                (rlUInt16_t)sizeof(rlAdvFrameDataCfg_t));

            /* Send Command to mmWave Radar Device */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
        }
    }

    RL_LOGV_ARG0("rlSetAdvFrameConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlGetAdvFrameConfig(rlUInt8_t deviceMap, rlAdvFrameCfg_t* data)
*
*   @brief Gets Advance Frame Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[out] data - Container for Advance Frame Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function reads the advance frame properties of the device.
*/
/* DesignId : MMWL_DesignId_047 */
/* Requirements : AUTORADAR_REQ-796 */
rlReturnVal_t rlGetAdvFrameConfig(rlUInt8_t deviceMap, rlAdvFrameCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlGetAdvFrameConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlGetAdvFrameConfig, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteGetApi(deviceMap, RL_RF_DYNAMIC_CONF_GET_MSG,
                                       RL_RF_FRAME_CONF_ADVANCED_SB,
                                       (rlUInt8_t*)(&(data->frameSeq)), 0U);

        /* If only mmWaveLink instance is running on Host */
        if ((RL_RET_CODE_OK == retVal) && (RL_PLATFORM_HOST == rlDriverGetPlatformId()))
        {
            /* Initialize Command and Response Sub Blocks */
            rlDriverMsg_t inMsg = {0};
            rlDriverMsg_t outMsg = {0};
            rlPayloadSb_t inPayloadSb = {0};
            rlPayloadSb_t outPayloadSb = {0};

            /* Construct command packet */
            rlDriverConstructInMsg(RL_DEV_STATUS_GET_MSG, &inMsg, &inPayloadSb);
            /* Fill in-message Payload */
            /*AR_CODE_REVIEW MR:R.11.2 <REVIEWED> "Need to pass NULL pointer" */
            /*LDRA_INSPECTED 95 S */
            rlDriverFillPayload(RL_DEV_STATUS_GET_MSG,
                                RL_SYS_ADV_FRAME_CONFIG_GET_SB,
                                &inPayloadSb, (rlUInt8_t*)RL_NULL_PTR, 0U);

            /* Construct response packet */
            rlDriverConstructOutMsg(1U, &outMsg, &outPayloadSb);
            /* Fill out-message Payload */
            rlDriverFillPayload(0U, 0U, &outPayloadSb,
                                (rlUInt8_t*)(&(data->frameData)), 0U);

            /* Send Command to mmWave Radar Device */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
        }
    }

    RL_LOGV_ARG0("rlGetAdvFrameConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlSetContModeConfig(rlUInt8_t deviceMap, rlContModeCfg_t* data)
*
*   @brief Sets Continous mode Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Continous mode Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function sets the FMCW radar continous mode properties like Start Freq, TX power
*   etc. In continuous mode, the signal is not frequency modulated but has the same frequency
*   over time.
*/
/* DesignId : MMWL_DesignId_038 */
/* Requirements : AUTORADAR_REQ-827 */
rlReturnVal_t rlSetContModeConfig(rlUInt8_t deviceMap, rlContModeCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlSetContModeConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlSetContModeConfig, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_CONT_STREAMING_MODE_CONF_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlContModeCfg_t));
    }
    RL_LOGV_ARG0("rlSetContModeConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlEnableContMode(rlUInt8_t deviceMap, rlContModeEn_t* data)
*
*   @brief Enable/Disable Continous mode
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Continous Mode enable/disable
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function enables/disables the FMCW radar continous mode
*/
/* DesignId : MMWL_DesignId_039 */
/* Requirements : AUTORADAR_REQ-828 */
rlReturnVal_t rlEnableContMode(rlUInt8_t deviceMap, rlContModeEn_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlEnableContMode starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlEnableContMode, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_CONT_STREAMING_MODE_EN_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlContModeEn_t));
    }

    RL_LOGV_ARG0("rlEnableContMode starts...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlSetLowPowerModeConfig(rlUInt8_t deviceMap, rlLowPowerModeCfg_t* data)
*
*   @brief Sets Low Power Mode Configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Container for Low power mode Configuration data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function sets the static device configurations of low power options. Sigma Delta ADC
*   root sampling reduces to half the rate to save power in small IF bandwidth applications.
*/
/* DesignId :  MMWL_DesignId_011 */
/* Requirements : AUTORADAR_REQ-755 */
rlReturnVal_t rlSetLowPowerModeConfig(rlUInt8_t deviceMap, rlLowPowerModeCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlSetLowPowerModeConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlSetLowPowerModeConfig, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_STATIC_CONF_SET_MSG,
                                       RL_RF_LOWPOWERMODE_CONF_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlLowPowerModeCfg_t));
    }

    RL_LOGV_ARG0("rlSetLowPowerModeConfig ends...\n");
    return retVal;
}

/** @fn rlReturnVal_t rlSensorStart(rlUInt8_t deviceMap)
*
*   @brief Triggers Transmission of Frames
*   @param[in] deviceMap - Bitmap of devices to send the message
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function triggers the transmission of the frames as per the frame and chirp configuration
*   If trigger mode is selected as SW API based trigger, mmWaveFront end would start chirp
*   immediately after receiving this API. If trigger mode is HW SYNC IN pulse, it would wait for
*   SYNC pulse
*
*   @note Once the chirping starts, mmWave Front end would send asynchronous event
*   RL_RF_AE_FRAME_TRIGGER_RDY_SB indicating the start of frame
*/
/* DesignId : MMWL_DesignId_017 */
/* Requirements : AUTORADAR_REQ-759 */
rlReturnVal_t rlSensorStart(rlUInt8_t deviceMap)
{
    rlReturnVal_t retVal;

    rlFrameTrigger_t frameTriggerArgs;

    RL_LOGV_ARG0("rlSensorStart starts...\n");

    frameTriggerArgs.startStop = RL_FRAME_TRIGGER_START;
    frameTriggerArgs.reserved = 0U;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlSensorStart, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_FRAME_TRIG_MSG,
                                       RL_RF_FRAMESTARTSTOP_CONF_SB,
                                       (rlUInt8_t*)(&frameTriggerArgs),
                                       (rlUInt16_t)sizeof(rlFrameTrigger_t));
    }
    RL_LOGV_ARG0("rlSensorStart ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlSensorStop(rlUInt8_t deviceMap)
*
*   @brief Stops Transmission of Frames
*   @param[in] deviceMap - Bitmap of devices to send the message
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function stops the transmission of the frames.
*   @note Once the chirping stops, mmWave Front end would send asynchronous event
*   RL_RF_AE_FRAME_END_SB indicating the stop of frame
*/
/* DesignId : MMWL_DesignId_018 */
/* Requirements : AUTORADAR_REQ-760 */
rlReturnVal_t rlSensorStop(rlUInt8_t deviceMap)
{
    rlReturnVal_t retVal;

    rlFrameTrigger_t frameTriggerArgs;

    frameTriggerArgs.startStop = RL_FRAME_TRIGGER_STOP;
    frameTriggerArgs.reserved  = 0U;

    RL_LOGV_ARG0("rlSensorStop starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlSensorStop, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_FRAME_TRIG_MSG,
                                       RL_RF_FRAMESTARTSTOP_CONF_SB,
                                       (rlUInt8_t*)(&frameTriggerArgs),
                                       (rlUInt16_t)sizeof(rlFrameTrigger_t));
    }
    RL_LOGV_ARG0("rlSensorStop ends...\n");

    return retVal;

}

/** @fn rlReturnVal_t rlRfInit(rlUInt8_t deviceMap)
*
*   @brief Initializes the RF/Analog Subsystem
*
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   Initializes the RF/Analog Subsystem. This triggers one time calibrations for APLL
*   and synthesizer. Calibration can be enabled/disabled using Calibraton configuration APIs
*
*   @note Once the calibration is complete, mmWave Front end would send asynchronous event
*   RL_RF_AE_INITCALIBSTATUS_SB indicating the result of the initialization/calibrations
*/
/* DesignId : MMWL_DesignId_012 */
/* Requirements : AUTORADAR_REQ-758 */
rlReturnVal_t rlRfInit(rlUInt8_t deviceMap)
{
    /* Initialize Command and Response Sub Blocks */
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfInit starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlRfInit, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_INIT_MSG, RL_RF_RF_INIT_SB, NULL, 0U);
    }
    RL_LOGV_ARG0("rlRfInit ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlSetTestSourceConfig(rlUInt8_t deviceMap, rlTestSource_t* data)
*
*   @brief Configures the Test Source
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Container for Test source configuration
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API allows configuration of the Test Source in mmWave Front end. A Test source simulates
*   2 objects at certain position relative to the mmWave device and generates the RAW ADC data.
*   It also simulates velocity of objects, relative position of TX and RX antennas.

*   @note This helps in checking the integrity of control and data path during development phase.
*   API is meant to be used in development phase only and doesn't relate to any real use case.
*/
/* DesignId : MMWL_DesignId_035 */
/* Requirements : AUTORADAR_REQ-790 */
rlReturnVal_t rlSetTestSourceConfig(rlUInt8_t deviceMap, rlTestSource_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlSetTestSourceConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlSetTestSourceConfig, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_MISC_CONF_SET_MSG,
                                       RL_RF_TEST_SOURCE_CONFIG_SET_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlTestSource_t));
    }
    RL_LOGV_ARG0("rlSetTestSourceConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlTestSourceEnable(rlUInt8_t deviceMap, rlTestSourceEnable_t* data)
*
*   @brief Enables the Test Source
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Container for Test source enable parameters
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   Enables the Test Source that is configured using \ref rlSetTestSourceConfig API
*/
/* DesignId : MMWL_DesignId_036 */
/* Requirements : AUTORADAR_REQ-791 */
rlReturnVal_t rlTestSourceEnable(rlUInt8_t deviceMap, rlTestSourceEnable_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlTestSourceEnable starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlTestSourceEnable, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_MISC_CONF_SET_MSG,
                                       RL_RF_TEST_SOURCE_ENABLE_SET_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlTestSourceEnable_t));
    }
    RL_LOGV_ARG0("rlTestSourceEnable ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlRfGetTemperatureReport(rlUInt8_t deviceMap, rlRfTempData_t* data)
*
*   @brief Gets Time and Temperature information report
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[out] data - Structure to store temperature report from all the temp sensors
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function reads Temperature information from all temperature sensors in the device
*/
/* DesignId : MMWL_DesignId_029 */
/* Requirements : AUTORADAR_REQ-789 */
rlReturnVal_t rlRfGetTemperatureReport(rlUInt8_t deviceMap, rlRfTempData_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfGetTemperatureReport starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlRfGetTemperatureReport, Invalid device map\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteGetApi(deviceMap, RL_RF_MISC_CONF_GET_MSG,
                                       RL_RF_CHAR_CONF_DYNAMIC_GET_SB,
                                       (rlUInt8_t*)data, (rlUInt16_t)sizeof(rlRfTempData_t));
    }
    RL_LOGV_ARG0("rlRfGetTemperatureReport ends...\n");

    return retVal;
}
/** @fn rlReturnVal_t rlRfDfeRxStatisticsReport(rlUInt8_t deviceMap, rlDfeStatReport_t* data)
*
*   @brief Gets Digital Front end statistics such as Residual DC, RMS power in I and
*          Q chains for different Receive channels for different selected profiles.
*          It also includes Cross correlation between I and Q chains
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data      - Container of dfe receiver status report
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   Gets Digital Front end statistics such as Residual DC, RMS power in I and
*   Q chains for different Receive channels for different selected profiles.
*   It also includes Cross correlation between I and Q chains

*/
/* DesignId : MMWL_DesignId_041 */
/* Requirements : AUTORADAR_REQ-788 */
rlReturnVal_t rlRfDfeRxStatisticsReport(rlUInt8_t deviceMap, rlDfeStatReport_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfDfeRxdStatisticsReport starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("Invalid input\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteGetApi(deviceMap, RL_RF_MONITORING_REPO_GET_MSG,
                                       RL_RF_DFE_STATISTICS_REPORT_GET_SB,
                                       (rlUInt8_t*)data, 0U);
    }
    RL_LOGV_ARG0("rlRfDfeRxdStatisticsReport completes...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlRfDynamicPowerSave(rlUInt8_t deviceMap, rlDynPwrSave_t* data)
*
*   @brief : Configure dynamic power saving feature.
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data      - Container of dynamic power save information
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   Configure dynamic power saving feature during Inter chirp Idle time by
*   turning off various circuits such as Transmitter, Receiver and LO distribution
*   blocks
*/
/* DesignId : MMWL_DesignId_019 */
/* Requirements : AUTORADAR_REQ-797 */
rlReturnVal_t rlRfDynamicPowerSave(rlUInt8_t deviceMap, rlDynPwrSave_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfDynamicPowerSave starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("Invalid input\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_STATIC_CONF_SET_MSG,
                                       RL_RF_DYNAMICPOWERSAVE_CONF_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlDynPwrSave_t));
    }
    RL_LOGV_ARG0("rlRfDynamicPowerSave completes...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlRfSetDeviceCfg(rlUInt8_t deviceMap, rlRfDevCfg_t* data)
*
*   @brief : Set different RadarSS device configurations
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data      - Configuration parameter for AE.
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   Set different RadarSS device configurations. Enable and Configure asynchronous event
*   direction for device. By default all asynchronous event are enabled and sent to
*   the platform which issued the API. Below events can be configured to be received
*   on different platform by using this API:\n
*   [1.] CPU_FAULT [2.] ESM_FAULT [3.] GPADC_READ
*   Similarly all monitoring events can be configured to be received on specific platform
*   using this API
*   Below events can be disabled using this API:\n
*   [1.] FRAME_START_ASYNC_EVENT [2.] FRAME_STOP_ASYNC_EVENT \n
*   Enable[1]/Disable[0] RadarSS Watchdog, where by default it is disable. Configure CRC type
*   for asynchronous event from RadarSS  [0] 16Bit, [1] 32Bit, [2] 64Bit.
*/
/* DesignId : MMWL_DesignId_042 */
/* Requirements : AUTORADAR_REQ-794 */
rlReturnVal_t rlRfSetDeviceCfg(rlUInt8_t deviceMap, rlRfDevCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfSetDeviceCfg starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("Invalid input\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_STATIC_CONF_SET_MSG,
                                       RL_RF_DEVICE_CFG_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfDevCfg_t));
    }
    RL_LOGV_ARG0("rlRfSetDeviceCfg completes...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlSetGpAdcConfig(rlUInt8_t deviceMap, rlGpAdcCfg_t* data)
*
*   @brief : Configure GP ADC data parameters
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data      - Configuration parameter for GP ADC
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API enables the GPADC reads for external inputs (available only in xWR1642).
*   xWR1642 sends GP-ADC measurement data in async event RL_RF_AE_GPADC_MEAS_DATA_SB
*/
/* DesignId : MMWL_DesignId_044 */
/* Requirements : AUTORADAR_REQ-792 */
rlReturnVal_t rlSetGpAdcConfig(rlUInt8_t deviceMap, rlGpAdcCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlSetGpAdcConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("Invalid input\n");
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_MISC_CONF_SET_MSG,
                                       RL_RF_GPADC_CONF_SET_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlGpAdcCfg_t));
    }
    RL_LOGV_ARG0("rlSetGpAdcConfig completes...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlRfSetLdoBypassConfig(rlUInt8_t deviceMap, rlRfCalibDisableCfg_t* data)
*
*   @brief Enables/Disables LDO bypass mode. By default Internal LDO is enabled
*          and 1.3V supply is required for RF. If external PMIC supplies 1.0V RF
*          Supply directly, Internal LDO has to be bypassed using this API.
*   @param[out] data - LDO enable/disable configuration
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function Enables/Disables LDO bypass mode.
*   @note Refer to EVM/Board user guide to understand the Power Supply scheme before using this
*         API. If 1.3 V RF supply is provided and this API is called to enable LDO bypass mode,
*         devive could burn. Typically in TI EVMs, PMIC is configured to supply 1.3V to the RF
*         supplies, so in that case don't bypass LDO.
*/
/* DesignId : MMWL_DesignId_043 */
/* Requirements : AUTORADAR_REQ-793 */
rlReturnVal_t rlRfSetLdoBypassConfig(rlUInt8_t deviceMap, rlRfLdoBypassCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfSetLdoBypassConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_MISC_CONF_SET_MSG,
                                       RL_RF_LDOBYPASS_SET_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfLdoBypassCfg_t));
    }

    RL_LOGV_ARG0("rlRfSetLdoBypassConfig completes...\n");
    return retVal;
}

/** @fn rlReturnVal_t rlRfSetPhaseShiftConfig(rlUInt8_t deviceMap, rlUInt16_t cnt,
                                                rlRfPhaseShiftCfg_t* data)
*
*   @brief Enable/Disable phase shift configurations per chirp in each of the TXs
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] cnt  - Number of configurations
*   @param[in] data - phase shift enable/disable configuration
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function Enables/Disables phase shift configurations per chirp in each of the
*   TXs. This API is applicable only for AWR1243P
*/
/* DesignId : MMWL_DesignId_045 */
/* Requirements : AUTORADAR_REQ-798 */
rlReturnVal_t rlRfSetPhaseShiftConfig(rlUInt8_t deviceMap, rlUInt16_t cnt, 
                                                    rlRfPhaseShiftCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfSetPhaseShiftConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
        (RL_NULL_PTR == data) || (cnt == 0U))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg;
        rlDriverMsg_t outMsg = {0};
        /* Index and other paramerters to send multiple sub blocks in one/more commands chunk */
        rlUInt16_t sbLen, maxSbCntInMsg, sbCntInMsg, numChnkOfMsg, lastSbCntInMsg, loopCnt, indx;

        /* Initialize Command and Response Sub Blocks */
        rlPayloadSb_t inPayloadSb[RL_CMD_PL_LEN_MAX/(sizeof(rlRfPhaseShiftCfg_t) + \
                                  RL_SBC_ID_SIZE + RL_SBC_LEN_SIZE)];

        /* single sub-block length for chirp config API */
        sbLen = (rlUInt16_t)(sizeof(rlRfPhaseShiftCfg_t) + (RL_SBC_LEN_SIZE + RL_SBC_ID_SIZE));

        /* get Max Sub Block count */
        /* AR_CODE_REVIEW MR:D.4.1 <INSPECTED> "sbLen can not be zero" */
        /*LDRA_INSPECTED 127 D */
        maxSbCntInMsg = (RL_CMD_PL_LEN_MAX /sbLen);

        retVal = RL_RET_CODE_OK;
        /* if requested count of chirpConfig is within one Message packet */
        if (cnt <= maxSbCntInMsg)
        {
            sbCntInMsg     = cnt;
            numChnkOfMsg   = 1U;
            lastSbCntInMsg = 0U;
        }
        else
        {
            sbCntInMsg     = maxSbCntInMsg;
            numChnkOfMsg   = cnt / maxSbCntInMsg;
            lastSbCntInMsg = cnt % maxSbCntInMsg;
        }

        /* Fill in-message packet */
        rlDriverConstructInMsg(RL_RF_DYNAMIC_CONF_SET_MSG, &inMsg, &inPayloadSb[0]);
        /* get the loop count in form of number of msg chunks */
        loopCnt = (lastSbCntInMsg == 0U) ? numChnkOfMsg : (numChnkOfMsg + 1U);

        while (retVal == RL_RET_CODE_OK)
        {
            /* all full messages have been sent, then send last partial message */
            if ((loopCnt == 1U) && (lastSbCntInMsg != 0U))
            {
                inMsg.opcode.nsbc = lastSbCntInMsg;
            }
            else
            {
                inMsg.opcode.nsbc = sbCntInMsg;
            }

            for (indx = 0U; indx < inMsg.opcode.nsbc; indx++)
            {
                /* Set Command Sub Block*/
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].sbid = RL_GET_UNIQUE_SBID(RL_RF_DYNAMIC_CONF_SET_MSG,
                                             RL_RF_PERCHIRPPHASESHIFT_CONF_SB);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].len       = (rlUInt16_t)sizeof(rlRfPhaseShiftCfg_t);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].pSblkData = (rlUInt8_t*)(data);
                /*AR_CODE_REVIEW MR:R.18.1 <INSPECTED> "require pointer increment to jump to \
                  next chirp Config */
                /*LDRA_INSPECTED 567 S */
                data++;
            }
            /* Send Command to mmWave Radar Device */
            /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
            LDRA Tool Issue" */
            /*LDRA_INSPECTED 105 D */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
            /* decrement the loop count */
            loopCnt--;
            /* if all phase shift configs have been sent to device then terminate the loop */
            if (loopCnt == 0U)
            {
                break;
            }
        }
    }

    RL_LOGV_ARG0("rlRfSetPhaseShiftConfig ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlRfSetPALoopbackConfig(rlUInt8_t deviceMap, rlRfPALoopbackCfg_t* data)
*
*   @brief Enable/Disable PA loopback for all enabled profiles
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - PA loopback configuration
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function Enables/Disables PA loopback for all enabled profiles. This is
*   used for debug purpose that both the TX and RX paths are working properly
*/
/* DesignId :  MMWL_DesignId_098 */
/* Requirements : AUTORADAR_REQ-801 */
rlReturnVal_t rlRfSetPALoopbackConfig(rlUInt8_t deviceMap, rlRfPALoopbackCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfSetPALoopbackConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_MISC_CONF_SET_MSG,
                                       RL_RF_PALOOPBACK_CFG_SET_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfPALoopbackCfg_t));
    }

    RL_LOGV_ARG0("rlRfSetPALoopbackConfig completes...\n");
    return retVal;
}

/** @fn rlReturnVal_t rlRfSetPSLoopbackConfig(rlUInt8_t deviceMap, rlRfPSLoopbackCfg_t* data)
*
*   @brief Enable/Disable Phase shift loopback for all enabled profiles
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Phase shift loopback configuration
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function Enables/Disables Phase shift loopback for all enabled profiles.This is used
*   to debug the TX (before the PA) and RX chains.
*/
/* DesignId : MMWL_DesignId_099 */
/* Requirements : AUTORADAR_REQ-802 */
rlReturnVal_t rlRfSetPSLoopbackConfig(rlUInt8_t deviceMap, rlRfPSLoopbackCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfSetPSLoopbackConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_MISC_CONF_SET_MSG,
                                       RL_RF_PSLOOPBACK_CFG_SET_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfPSLoopbackCfg_t));
    }

    RL_LOGV_ARG0("rlRfSetPSLoopbackConfig completes...\n");
    return retVal;
}

/** @fn rlReturnVal_t rlRfSetIFLoopbackConfig(rlUInt8_t deviceMap, rlRfIFLoopbackCfg_t* data)
*
*   @brief Enable/Disable RF IF loopback for all enabled profiles.
*    This is used for debug to check if both TX and RX chains are working correctly.
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - IF loopback configuration
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function Enables/Disables RF IF loopback for all enabled profiles. This is used to
*   debug the  RX IF chain.
*/
/* DesignId :  MMWL_DesignId_100 */
/* Requirements : AUTORADAR_REQ-803 */
rlReturnVal_t rlRfSetIFLoopbackConfig(rlUInt8_t deviceMap, rlRfIFLoopbackCfg_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfSetIFLoopbackConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_MISC_CONF_SET_MSG,
                                       RL_RF_IFLOOPBACK_CFG_SET_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfIFLoopbackCfg_t));
    }

    RL_LOGV_ARG0("rlRfSetIFLoopbackConfig completes...\n");
    return retVal;
}

/** @fn rlReturnVal_t rlRfSetProgFiltCoeffRam(rlUInt8_t deviceMap, rlRfProgFiltCoeff_t* data)
*
*   @brief Set Programmable Filter coefficient RAM
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - array of coefficients for the programmable filter
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function is used to program the coefficients for the external programmable filter.
*   The API is applicable only in xWR1642.
*
*   @note the programmable filter is applicable in Complex 1X and Real-only output modes for
*   sampling rates under 6.25 Msps (Complex 1X) and under 12.5 Msps (Real). This is to allow
*   for a trade-off between digital filter chain setting time and close-in anti-alias attenuation.
*   A real-coefficient FIR with up to 26 taps (16-bit coefficients) is supported in the Complex 1X
*   output mode, and a real-coefficient FIR with up to 20 taps (16-bit coefficients) in supported
*   in the Real output mode
*/
/* DesignId :  MMWL_DesignId_050 */
/* Requirements : AUTORADAR_REQ-799 */
rlReturnVal_t rlRfSetProgFiltCoeffRam(rlUInt8_t deviceMap, rlRfProgFiltCoeff_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfSetProgFiltCoeffRam starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_PROG_FILT_COEFF_RAM_SET_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfProgFiltCoeff_t));
    }

    RL_LOGV_ARG0("rlRfSetProgFiltCoeffRam completes...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlRfSetProgFiltConfig(rlUInt8_t deviceMap, rlRfProgFiltConf_t* data)
*
*   @brief Set Programmable Filter configuration
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - programmable filter configuration
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function selects programmable filter cofficient RAM and
*   map it to configured profile ID.
*
*   @note This API is applicable only in xWR1642
*/
/* DesignId : MMWL_DesignId_051 */
/* Requirements : AUTORADAR_REQ-800 */
rlReturnVal_t rlRfSetProgFiltConfig(rlUInt8_t deviceMap, rlRfProgFiltConf_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfSetProgFiltConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_PROG_FILT_CONF_SET_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfProgFiltConf_t));
    }

    RL_LOGV_ARG0("rlRfSetProgFiltConfig completes...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlRfSetMiscConfig(rlUInt8_t deviceMap, rlRfMiscConf_t* data)
*
*   @brief Sets misc feature such as per chirp phase shifter.
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Misc configuration such as per chirp phase shifter
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function configures misc feature such as per chirp phase shifter.This API
*   is valid only for AWR1243 mmWave device when mmWaveLink instance is running on
*   External Host Processor.
*/
/* DesignId :  MMWL_DesignId_052 */
/* Requirements : AUTORADAR_REQ-891 */
rlReturnVal_t rlRfSetMiscConfig(rlUInt8_t deviceMap, rlRfMiscConf_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfSetMiscConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_STATIC_CONF_SET_MSG,
                                       RL_RF_RADAR_MISC_CTL_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfMiscConf_t));
    }

    RL_LOGV_ARG0("rlRfSetMiscConfig completes...\n");
    return retVal;
}

/** @fn rlReturnVal_t rlRfSetCalMonTimeUnitConfig(rlUInt8_t deviceMap,
                                                  rlRfCalMonTimeUntConf_t* data)
*
*   @brief Set Calibration monitoring time unit
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - RF Calib Monitoring Time unit config
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function configures calibration monitoring time unit
*/
/* DesignId :  MMWL_DesignId_053 */
/* Requirements : AUTORADAR_REQ-892 */
rlReturnVal_t rlRfSetCalMonTimeUnitConfig(rlUInt8_t deviceMap,
                                                           rlRfCalMonTimeUntConf_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfSetCalMonTimeUnitConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_CALIB_MON_TIME_UNIT_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfCalMonTimeUntConf_t));
    }

    RL_LOGV_ARG0("rlRfSetCalMonTimeUnitConfig completes...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlRfSetCalMonFreqLimitConfig(rlUInt8_t deviceMap,
                                                    rlRfCalMonFreqLimitConf_t* data)
*
*   @brief Set Calibration monitoring Frequency Limit
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - RF Calib Frequency Limit config
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function configures limits on RF frequency transmission during calibration
*   and monitoring
*/
/* DesignId :  MMWL_DesignId_054 */
/* Requirements : AUTORADAR_REQ-893 */
rlReturnVal_t rlRfSetCalMonFreqLimitConfig(rlUInt8_t deviceMap,
                                                    rlRfCalMonFreqLimitConf_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfSetCalMonFreqLimitConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_STATIC_CONF_SET_MSG,
                                       RL_RF_CAL_MON_FREQ_LIMIT_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfCalMonFreqLimitConf_t));
    }

    RL_LOGV_ARG0("rlRfSetCalMonFreqLimitConfig completes...\n");
    return retVal;
}

/** @fn rlReturnVal_t rlRfInitCalibConfig(rlUInt8_t deviceMap, rlRfInitCalConf_t* data)
*
*   @brief Set RF Init Calibration Mask bits and report type
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - RF Init calib config
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This function configures RF Init calibration mask bits and report type.
*   Normally, upon receiving rlRfInit API, the Radar SS performs all relevant initial calibrations.
*   This step can be disabled by setting the corresponding bit in \ref rlRfInitCalConf_t
*   field to 0x0.If disabled, the host needs to send the calibration data using
*   \ref rlRfCalibDataRestore so that the RadarSS can operate using the injected calibration data
*
*   @note Debug use: Each of these calibrations can be selectively disabled by issuing this
*         message before rlRfInit API.
*/
/* DesignId :  MMWL_DesignId_055 */
/* Requirements : AUTORADAR_REQ-894 */
rlReturnVal_t rlRfInitCalibConfig(rlUInt8_t deviceMap, rlRfInitCalConf_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfInitCalibConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_STATIC_CONF_SET_MSG,
                                       RL_RF_INIT_CALIB_CONF_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfInitCalConf_t));
    }

    RL_LOGV_ARG0("rlRfInitCalibConfig completes...\n");
    return retVal;
}

/** @fn rlReturnVal_t rlRfRunTimeCalibConfig(rlUInt8_t deviceMap, rlRunTimeCalibConf_t* data)
*
*   @brief Set RF one time & periodic calibration of various RF/analog aspects and trigger
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Runtime calibration config
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*  This function configures RF one time & periodic calibration of various RF/analog aspects
*  and trigger. The response is in the form of an asynchronous event. The calibration would
*  be performed by Radar SS during while framing during any idle time slot of 200uS
*
*  @note This API must be called after rlSetProfileConfig
*
*/
/* DesignId : MMWL_DesignId_056 */
/* Requirements : AUTORADAR_REQ-895 */
rlReturnVal_t rlRfRunTimeCalibConfig(rlUInt8_t deviceMap, rlRunTimeCalibConf_t* data)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRfRunTimeCalibConfig starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_RUN_TIME_CALIB_CONF_TRIG_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRunTimeCalibConf_t));
    }

    RL_LOGV_ARG0("rlRfRunTimeCalibConfig completes...\n");
    return retVal;
}

/** @fn rlReturnVal_t rlRxGainTempLutSet(rlUInt8_t deviceMap, rlRxGainTempLutData_t *data)
*
*   @brief Overwrite RX gain temperature Lookup Table(LUT) in Radar SS
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - RX gain Temperature LUT config
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API can be used to overwrite the RX gain Lookup Table(LUT) for different temperature
*   used in RadarSS.
*
*   @note This API should be issued after profile configuration API.
*/
/* DesignId : MMWL_DesignId_057 */
/* Requirements : AUTORADAR_REQ-896 */
rlReturnVal_t rlRxGainTempLutSet(rlUInt8_t deviceMap, rlRxGainTempLutData_t *data)
{
    rlReturnVal_t retVal;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_RX_GAIN_TEMPLUT_CONF_SB, (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRxGainTempLutData_t));
    }
    return retVal;
}

/** @fn rlReturnVal_t rlRxGainTempLutGet(rlUInt8_t deviceMap, rlRxGainTempLutRead_t* inData,
                                                               rlRxGainTempLutInject_t *outData)
*
*   @brief Gets RX gain temperature Lookup Table(LUT) in Radar SS
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] inData - RX gain Temperature LUT request  config
*   @param[out] outData - RX gain Temperature LUT read config
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API is to read the temperature based RX gain LUT used by the Radar SS.
*   This API should be issued after the profile configuration API.
*/
/* DesignId : MMWL_DesignId_058 */
/* Requirements : AUTORADAR_REQ-897 */
rlReturnVal_t rlRxGainTempLutGet(rlUInt8_t deviceMap, rlRxGainTempLutReadReq_t *inData,
                                                       rlRxGainTempLutData_t *outData)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlRxGainTempLutRead starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == inData))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlRxGainTempLutRead, Invalid device map\n");
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg = {0};
        rlDriverMsg_t outMsg = {0};

        /* Initialize Command and Response Sub Blocks */
        rlPayloadSb_t inPayloadSb = {0};
        rlPayloadSb_t outPayloadSb = {0};

        /* Fill in-message Payload */
        rlDriverFillPayload(RL_RF_DYNAMIC_CONF_GET_MSG, RL_RF_RX_GAIN_TEMPLUT_CONF_SB,
                            &inPayloadSb, (rlUInt8_t *)inData,
                            (rlUInt16_t)sizeof(rlRxGainTempLutReadReq_t));

        /* Construct command packet */
        rlDriverConstructInMsg(RL_RF_DYNAMIC_CONF_GET_MSG, &inMsg, &inPayloadSb);

        /* Fill out-message Payload */
        rlDriverFillPayload(0U, 0U, &outPayloadSb, (rlUInt8_t*)outData,
                            (rlUInt16_t)sizeof(rlRxGainTempLutData_t));

        /* Construct response packet */
        rlDriverConstructOutMsg(1U, &outMsg, &outPayloadSb);

        /* Send Command to mmWave Radar Device */
        retVal = rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
    }
    RL_LOGV_ARG0("rlRxGainTempLutRead ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlTxGainTempLutSet(rlUInt8_t deviceMap, rlTxGainTempLutData_t *data)
*
*   @brief Overwrites TX gain temperature based Lookup table (LUT)
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - TX gain Temperature LUT config
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API can be used to overwrite the TX gain temperature LUT used in Radar SS.
*   This API should be issued after profile configuration API.

*/
/* DesignId : MMWL_DesignId_059 */
/* Requirements : AUTORADAR_REQ-898 */
rlReturnVal_t rlTxGainTempLutSet(rlUInt8_t deviceMap, rlTxGainTempLutData_t *data)
{
    rlReturnVal_t retVal;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_TX_GAIN_TEMPLUT_CONF_SB, (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlTxGainTempLutData_t));
    }
    return retVal;
}

/** @fn rlReturnVal_t rlRxGainTempLutGet(rlUInt8_t deviceMap, rlTxGainTempLutRead_t* inData,
                                                               rlTxGainTempLutInject_t *outData)
*
*   @brief Gets TX gain temperature Lookup table (LUT)
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] inData - TX gain Temperature LUT request config
*   @param[out] outData - TX gain Temperature LUT read config
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API is to read the temperature based TX gain LUT used by the firmware.
*   This API should be issued after the rlSetProfileConfig API.
*/
/* DesignId : MMWL_DesignId_060 */
/* Requirements : AUTORADAR_REQ-899 */
rlReturnVal_t rlTxGainTempLutGet(rlUInt8_t deviceMap,
                rlTxGainTempLutReadReq_t *inData, rlTxGainTempLutData_t *outData)
{
    rlReturnVal_t retVal;

    RL_LOGV_ARG0("rlTxGainTempLutRead starts...\n");

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
       (RL_NULL_PTR == inData))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
        RL_LOGE_ARG0("rlTxGainTempLutRead, Invalid device map\n");
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg = {0};
        rlDriverMsg_t outMsg = {0};

        /* Initialize Command and Response Sub Blocks */
        rlPayloadSb_t inPayloadSb = {0};
        rlPayloadSb_t outPayloadSb = {0};

        /* Fill in-message Payload */
        rlDriverFillPayload(RL_RF_DYNAMIC_CONF_GET_MSG, RL_RF_TX_GAIN_TEMPLUT_CONF_SB,
                            &inPayloadSb, (rlUInt8_t *)inData,
                            (rlUInt16_t)sizeof(rlTxGainTempLutReadReq_t));

        /* Construct command packet */
        rlDriverConstructInMsg(RL_RF_DYNAMIC_CONF_GET_MSG, &inMsg, &inPayloadSb);

        /* Fill out-message Payload */
        rlDriverFillPayload(0U, 0U, &outPayloadSb, (rlUInt8_t*)outData,
                            (rlUInt16_t)sizeof(rlTxGainTempLutData_t));

        /* Construct response packet */
        rlDriverConstructOutMsg(1U, &outMsg, &outPayloadSb);

        /* Send Command to mmWave Radar Device */
        retVal = rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
    }
    RL_LOGV_ARG0("rlTxGainTempLutRead ends...\n");

    return retVal;
}

/** @fn rlReturnVal_t rlRfTxFreqPwrLimitConfig(rlUInt8_t deviceMap,
                                               rlRfTxFreqPwrLimitMonConf_t* data)
*
*   @brief Sets the limits for RF frequency transmission for each TX and also TX power limits
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Tx Rf freq and power limit config data
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API sets the limits for RF frequency transmission for each TX and also TX power limits.
*/
/* DesignId : MMWL_DesignId_066 */
/* Requirements : AUTORADAR_REQ-905 */
rlReturnVal_t rlRfTxFreqPwrLimitConfig(rlUInt8_t deviceMap, rlRfTxFreqPwrLimitMonConf_t* data)
{
    rlReturnVal_t retVal;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || \
        (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_STATIC_CONF_SET_MSG,
                                       RL_RF_TX_FREQ_PWR_LIMIT_SB,
                                       (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlRfTxFreqPwrLimitMonConf_t));
    }
    return retVal;
}

/** @fn rlReturnVal_t rlSetLoopBckBurstCfg(rlUInt8_t deviceMap, rlLoopbackBurst_t *data)
*
*   @brief This API is used to introduce loopback chirps within the functional frames.
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Loopback chirp config
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API can be used to introduce loopback chirps within the functional frames. This loopback
*   chirps will be introduced only if advanced frame configuration is used where user can define
*   which sub-frame contains loopback chirps. The following loopback configuration will apply to
*   one burst and user can program up to 16 different loopback configurations in 16 different
*   bursts of a given sub-frame. User has to ensure that the corresponding sub-frame is defined in
*   rlSetAdvFrameConfig and sufficient time is given to allow the loopback bursts to be
*   transmitted.
*   NOTE 1: If user desires to enable loopback chirps within functional frames, then this API
*           should be issued before rlSetProfileConfig
*   NOTE 2: Only profile based phase shifter is supported in loopback configuration. Per-chirp
*           phase shifter if enabled will not be reflected in loopback chirps.
*/
/* DesignId : MMWL_DesignId_062 */
/* Requirements : AUTORADAR_REQ-901 */
rlReturnVal_t rlSetLoopBckBurstCfg(rlUInt8_t deviceMap, rlLoopbackBurst_t *data)
{
    rlReturnVal_t retVal;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_LB_BURST_CFG_SET_SB, (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlLoopbackBurst_t));
    }
    return retVal;
}

/** @fn rlReturnVal_t rlSetDynChirpCfg(rlUInt8_t deviceMap, rlUInt16_t segCnt,
                                          rlDynChirpCfg_t **data)
*
*   @brief Injects chirp configuration to be programmed dynamically
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] segCnt - number of segments for which application sends array of data.
*   @param[in] data - Dynamic chirp configuration
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API can be used to dynamically change the chirp configuration while frames are on-going.
*   The configuration will be stored in software and at rlDynChirpEnCfg API invocation radarSS
*   copies these chirp configurations from SW RAM to HW RAM at the end of current on-going frame.
*   Note-
*    Each of this command call will fill one segment of SW chirp RAM (i.e. 16 chirp config), so
*    to fill all 512 of SW chirp RAM(32 segment, 1 segment = 16chirp), user needs to call this API
*    32 times (32*16 = 512) with proper chirpSegSel selection.
*/
/* DesignId : MMWL_DesignId_063 */
/* Requirements : AUTORADAR_REQ-902 */
rlReturnVal_t rlSetDynChirpCfg(rlUInt8_t deviceMap, rlUInt16_t segCnt,
                                         rlDynChirpCfg_t **data)
{
    rlReturnVal_t retVal;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data) || \
        (segCnt == 0U))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg;
        rlDriverMsg_t outMsg = {0};

        /* Index and other paramerters to send multiple sub blocks in one/more commands chunk */
        rlUInt16_t sbLen, maxSbCntInMsg, sbCntInMsg, numChnkOfMsg, lastSbCntInMsg, loopCnt, indx;


        /* Initialize Command and Response Sub Blocks */
        rlPayloadSb_t inPayloadSb[RL_CMD_PL_LEN_MAX/(sizeof(rlDynChirpCfg_t) + \
                                  RL_SBC_ID_SIZE + RL_SBC_LEN_SIZE)];

        /* single sub-block length for chirp config API */
        sbLen = (rlUInt16_t)(sizeof(rlDynChirpCfg_t) + (RL_SBC_LEN_SIZE + RL_SBC_ID_SIZE));


        /* get Max Sub Block count */
        /* AR_CODE_REVIEW MR:D.4.1 <INSPECTED> "sbLen can not be zero" */
        /*LDRA_INSPECTED 127 D */
        maxSbCntInMsg = (RL_CMD_PL_LEN_MAX /sbLen);

        retVal = RL_RET_CODE_OK;
        /* if requested count of chirpConfig is within one Message packet */
        if (segCnt <= maxSbCntInMsg)
        {
            sbCntInMsg     = segCnt;
            numChnkOfMsg   = 1U;
            lastSbCntInMsg = 0U;
        }
        else
        {
            sbCntInMsg     = maxSbCntInMsg;
            numChnkOfMsg   = segCnt / maxSbCntInMsg;
            lastSbCntInMsg = segCnt % maxSbCntInMsg;
        }

        /* Fill in-message packet */
        rlDriverConstructInMsg(RL_RF_DYNAMIC_CONF_SET_MSG, &inMsg, &inPayloadSb[0]);

        loopCnt = (lastSbCntInMsg == 0U) ? numChnkOfMsg : (numChnkOfMsg + 1U);

        while (retVal == RL_RET_CODE_OK)
        {
            /* all full messages have been sent, then send last partial message */
            if ((loopCnt == 1U) && (lastSbCntInMsg != 0U))
            {
                inMsg.opcode.nsbc = lastSbCntInMsg;
            }
            else
            {
                inMsg.opcode.nsbc = sbCntInMsg;
            }

            for (indx = 0U; indx < inMsg.opcode.nsbc; indx++)
            {
                /* Set Command Sub Block*/
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].sbid = RL_GET_UNIQUE_SBID(RL_RF_DYNAMIC_CONF_SET_MSG,
                                             RL_RF_DYN_CHIRP_CFG_SET_SB);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].len       = (rlUInt16_t)sizeof(rlDynChirpCfg_t);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].pSblkData = (rlUInt8_t*)(*data);

                 /*AR_CODE_REVIEW MR:R.18.1 <INSPECTED> "require pointer increment to jump to \
                  next Config */
                /*LDRA_INSPECTED 567 S */
                data++;
            }
            /* Send Command to mmWave Radar Device */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
            loopCnt--;

            if (loopCnt == 0U)
            {
                break;
            }
        }
    }
    return retVal;
}

/** @fn rlReturnVal_t rlSetDynChirpEn(rlUInt8_t deviceMap, rlDynChirpEnCfg_t *data)
*
*   @brief Triggers copy of chirp config from SW to HW RAM.
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Dynamic chirp enable configuration
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API can be used to trigger the copy of chirp configuration from software to hardware RAM.
*   The copy will be performed at the end of the ongoing frame.
*   @note User needs to invoke this API within inter-frame idle time, not at boundary of frame end.
*         Since dynamic chirps are configured at run time, there is not error checks done on the
*         input data. If input data is out of range or invalid, device might misbehave.
*/
/* DesignId : MMWL_DesignId_064 */
/* Requirements : AUTORADAR_REQ-903 */
rlReturnVal_t rlSetDynChirpEn(rlUInt8_t deviceMap, rlDynChirpEnCfg_t *data)
{
    rlReturnVal_t retVal;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_DYN_CHIRP_CFG_EN_SB, (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlDynChirpEnCfg_t));
    }
    return retVal;
}

/** @fn rlReturnVal_t rlSetDynPerChirpPhShifterCfg(rlUInt8_t deviceMap, rlUInt8_t segCnt,
                                                   rlDynPerChirpPhShftCfg_t **data)
*
*   @brief Injects per-chirp phase shifter configuration to be applied dynamically
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] segCnt - number of segments for which application sends array of data.
*   @param[in] data - Dynamic chirp configuration
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API can be used to dynamically change the per-chirp phase shifter configuration while
*   frames are on-going. The configuration will be stored in software and the new configuration
*   will be applied at the end of the on-going frame. Note that the configuration should be
*   received by the firmware 10 ms before the end of the current frame.

*   @note This API is valid only for AWR1243P mmWave device when mmWaveLink instance is running
*         on External Host Processor.
*/
/* DesignId : MMWL_DesignId_065 */
/* Requirements : AUTORADAR_REQ-904 */
rlReturnVal_t rlSetDynPerChirpPhShifterCfg(rlUInt8_t deviceMap, rlUInt16_t segCnt,
                                                             rlDynPerChirpPhShftCfg_t **data)
{
    rlReturnVal_t retVal;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data) || \
        (segCnt == 0U))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg;
        rlDriverMsg_t outMsg = {0};

        /* Index and other paramerters to send multiple sub blocks in one/more commands chunk */
        rlUInt16_t sbLen, maxSbCntInMsg, sbCntInMsg, numChnkOfMsg, lastSbCntInMsg, loopCnt, indx;

        /* Initialize Command and Response Sub Blocks */
        rlPayloadSb_t inPayloadSb[RL_CMD_PL_LEN_MAX/(sizeof(rlDynPerChirpPhShftCfg_t) + \
                                  RL_SBC_ID_SIZE + RL_SBC_LEN_SIZE)];

        /* single sub-block length for chirp config API */
        sbLen = (rlUInt16_t)(sizeof(rlDynPerChirpPhShftCfg_t) + \
                             (RL_SBC_LEN_SIZE + RL_SBC_ID_SIZE));

        /* get Max Sub Block count */
        /* AR_CODE_REVIEW MR:D.4.1 <INSPECTED> "sbLen can not be zero" */
        /*LDRA_INSPECTED 127 D */
        maxSbCntInMsg = (RL_CMD_PL_LEN_MAX /sbLen);

        retVal = RL_RET_CODE_OK;
        /* if requested count of chirpConfig is within one Message packet */
        if (segCnt <= maxSbCntInMsg)
        {
            sbCntInMsg     = segCnt;
            numChnkOfMsg   = 1U;
            lastSbCntInMsg = 0U;
        }
        else
        {
            sbCntInMsg     = maxSbCntInMsg;
            numChnkOfMsg   = segCnt / maxSbCntInMsg;
            lastSbCntInMsg = segCnt % maxSbCntInMsg;
        }

        /* Fill in-message packet */
        rlDriverConstructInMsg(RL_RF_DYNAMIC_CONF_SET_MSG, &inMsg, &inPayloadSb[0]);

        loopCnt = (lastSbCntInMsg == 0U) ? numChnkOfMsg : (numChnkOfMsg + 1U);

        while (retVal == RL_RET_CODE_OK)
        {
            /* all full messages have been sent, then send last partial message */
            if ((loopCnt == 1U) && (lastSbCntInMsg != 0U))
            {
                inMsg.opcode.nsbc = lastSbCntInMsg;
            }
            else
            {
                inMsg.opcode.nsbc = sbCntInMsg;
            }

            for (indx = 0U; indx < inMsg.opcode.nsbc; indx++)
            {
                /* Set Command Sub Block*/
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function.\
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].sbid = RL_GET_UNIQUE_SBID(RL_RF_DYNAMIC_CONF_SET_MSG,
                                             RL_RF_DYN_PERCHIRP_PHSHFT_CFG_SET_SB);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].len       = (rlUInt16_t)sizeof(rlDynPerChirpPhShftCfg_t);
                /* AR_CODE_REVIEW MR:R.2.2  <INSPECTED> "Values are used by called function. \
                LDRA Tool Issue" */
                /*LDRA_INSPECTED 105 D */
                inPayloadSb[indx].pSblkData = (rlUInt8_t*)(*data);
                /*AR_CODE_REVIEW MR:R.18.1 <INSPECTED> "require pointer increment to jump to \
                next Config */
                /*LDRA_INSPECTED 567 S */
                data++;
            }
            /* Send Command to mmWave Radar Device */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
            loopCnt--;

            if (loopCnt == 0U)
            {
                break;
            }
        }
    }
    return retVal;
}

/** @fn rlReturnVal_t rlRfCalibDataRestore(rlUInt8_t deviceMap, rlCalDataStore_t *data)
*
*   @brief Injects calibration data to the device
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Calibration data of 3 chunks stored at application space
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API restores the calibration data which was stored previously using the
*   rlCalibDataStore command. Application needs to feed in 3 chunks of calibration data.
*
*   @note Once the calibration data is restored properly in radarSS SW RAM and validated,
*   mmWave Front end would send asynchronous event RL_RF_AE_INITCALIBSTATUS_SB indicating
*   the result of the calibrations based on Calib data sent by the application.
*/
/* DesignId : MMWL_DesignId_067 */
/* Requirements : AUTORADAR_REQ-906 */
rlReturnVal_t rlRfCalibDataRestore(rlUInt8_t deviceMap, rlCalDataStore_t *data)
{
    rlReturnVal_t retVal;
    rlUInt8_t idx;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg = {0};
        rlDriverMsg_t outMsg = {0};
        rlPayloadSb_t inPayloadSb = {0};
        rlPayloadSb_t outPayloadSb = {0};
        /* set return value to zero by default */
        retVal = RL_RET_CODE_OK;
        /* Invoke Set Calibration data command for RL_MAX_CALIB_DATA_CHUNK chunks */
        for (idx = 0U; idx < RL_MAX_CALIB_DATA_CHUNK; idx++)
        {
            /* Construct command packet */
            rlDriverConstructInMsg(RL_RF_STATIC_CONF_SET_MSG, &inMsg, &inPayloadSb);
            /* Fill in-message Payload */
            /*AR_CODE_REVIEW MR:R.18.1 <INSPECTED> "require pointer increment to jump to
              next calibData */
            /*AR_CODE_REVIEW MR:R.18.1 <INSPECTED> "require pointer increment to jump to
                          next calibData */
            /*LDRA_INSPECTED 87 S */
            /*LDRA_INSPECTED 567 S */
            rlDriverFillPayload(RL_RF_STATIC_CONF_SET_MSG, RL_RF_CAL_DATA_RD_WR_SB, &inPayloadSb,
                                (rlUInt8_t*)(data+idx), (rlUInt16_t)sizeof(rlCalDataStore_t));

            /* Construct response packet */
            rlDriverConstructOutMsg(1U, &outMsg, &outPayloadSb);
            /* Fill in-message Payload */
            rlDriverFillPayload(0U, 0U, &outPayloadSb, NULL, 0U);

            /* Send Command to mmWave Radar Device */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
            /* check for return value */
            if (RL_RET_CODE_OK != retVal)
            {
                /* If command invoke is failed then terminate this loop */
                break;
            }
        }

    }
    return retVal;
}

/** @fn rlReturnVal_t rlRfCalibDataStore(rlUInt8_t deviceMap, rlCalDataStore_t *data)
*
*   @brief Read calibration data from the device
*   @param[in] deviceMap - Bitmap of devices to send the message.
*   @param[in] data - Calibration data of 3 chunks which will filled by device.
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API reads the calibration data from the device which can be injected later using the
*   rlCalibDataRestore command. RadarSS will return 3 chunks of calibration data.
*/
/* DesignId : MMWL_DesignId_068 */
/* Requirements : AUTORADAR_REQ-906 */
rlReturnVal_t rlRfCalibDataStore(rlUInt8_t deviceMap, rlCalDataStore_t *data)
{
    rlReturnVal_t retVal;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Initialize Command and Response Sub Blocks */
        rlDriverMsg_t inMsg = {0};
        rlDriverMsg_t outMsg = {0};
        rlPayloadSb_t inPayloadSb = {0};
        rlPayloadSb_t outPayloadSb = {0};
        rlCalDataGetCfg_t caldataGetCfg = {0U};
        rlUInt8_t idx;
        /* set return value to zero by default */
        retVal = RL_RET_CODE_OK;
        /* Invoke Get Calibration data command for RL_MAX_CALIB_DATA_CHUNK chunks */
        for (idx = 0U; idx < RL_MAX_CALIB_DATA_CHUNK; idx++)
        {
            /* Construct command packet */
            rlDriverConstructInMsg(RL_RF_STATIC_CONF_GET_MSG, &inMsg, &inPayloadSb);
            /* Fill in-message Payload */
            rlDriverFillPayload(RL_RF_STATIC_CONF_GET_MSG, RL_RF_CAL_DATA_RD_WR_SB, &inPayloadSb,
                                (rlUInt8_t*)&caldataGetCfg, (rlUInt16_t)sizeof(rlCalDataGetCfg_t));

            /* Construct response packet */
            rlDriverConstructOutMsg(1U, &outMsg, &outPayloadSb);
            /* Fill in-message Payload */
            /*AR_CODE_REVIEW MR:R.18.1 <INSPECTED> "require pointer increment to jump to
              next calibData */
            /*AR_CODE_REVIEW MR:R.18.4 <INSPECTED> "require pointer increment to jump to
              next calibData */
            /*LDRA_INSPECTED 87 S */
            /*LDRA_INSPECTED 567 S */
            rlDriverFillPayload(0U, 0U, &outPayloadSb, (rlUInt8_t*)(data+idx), 0U);

            /* Send Command to mmWave Radar Device */
            retVal += rlDriverCmdInvoke(deviceMap, inMsg, &outMsg);
            /* check for return value */
            if (RL_RET_CODE_OK != retVal)
            {
                /* If command invoke is failed then terminate this loop */
                break;
            }
            /* increment Chunk ID for next Get Command */
            caldataGetCfg.chunkId++;
        }
    }
    return retVal;
}

/** @fn rlReturnVal_t rlRfInterRxGainPhaseConfig(rlUInt8_t deviceMap, rlInterRxGainPhConf_t* data)
*
*   @brief Sets different Rx gain/phase offset
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Inter RX gain, phase offset config
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API can be used to induce different gain/phase offsets on the different RXs, for
*   inter-RX mismatch compensation.
*/
/* DesignId : MMWL_DesignId_061 */
/* Requirements : AUTORADAR_REQ-900 */
rlReturnVal_t rlRfInterRxGainPhaseConfig(rlUInt8_t deviceMap,
                                                         rlInterRxGainPhConf_t* data)
{
    rlReturnVal_t retVal;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_INTER_RX_GAIN_PH_FREQ_CTRL_SB, (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlInterRxGainPhConf_t));
    }
    return retVal;
}

/** @fn rlReturnVal_t rlGetRfBootupStatus(rlUInt8_t deviceMap, rlRfBootStatusCfg_t *data)
*
*   @brief Get radarSS bootup status
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - bootup status configuration
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API gets the radarSS bootup status
*/
/* DesignId :  MMWL_DesignId_096 */
/* Requirements : AUTORADAR_REQ-911 */
rlReturnVal_t rlGetRfBootupStatus(rlUInt8_t deviceMap, rlRfBootStatusCfg_t *data)
{
    rlReturnVal_t retVal;

    /* check for NULL pointer */
    if (data == RL_NULL_PTR)
    {
        /* set error code if data pointer is passed NULL */
        retVal = RL_RET_CODE_NULL_PTR;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteGetApi(deviceMap, RL_RF_STATUS_GET_MSG,
                                       RL_RF_BOOTUP_BIST_STATUS_SB, (rlUInt8_t*)data, 0U);
    }

    return retVal;
}

/** @fn rlReturnVal_t rlSetInterChirpBlkCtrl(rlUInt8_t deviceMap, rlInterChirpBlkCtrlCfg_t *data)
*
*   @brief Sets Inter-chip turn on and turn off times or various RF blocks
*   @param[in] deviceMap - Bitmap of devices to send the message
*   @param[in] data - Inter chirp block control config
*
*   @return rlReturnVal_t Success - 0, Failure - Error Code
*
*   This API programs the Inter-chip turn on and turn off times or various RF blocks
*   @note The minimum inter-chirp time should be greater than maximum of the following
    1. abs(rx02RfTurnOffTime) + max(abs(rx02RfPreEnTime), abs(rx02RfTurnOnTime))
    2. abs(rx13RfTurnOffTime) + max(abs(rx13RfPreEnTime), abs(rx13RfTurnOnTime))
    3. abs(rx02BbTurnOffTime) + max(abs(rx02BbPreEnTime), abs(rx02BbTurnOnTime))
    4. abs(rx13BbTurnOffTime) + max(abs(rx13BbPreEnTime), abs(rx13BbTurnOnTime))
    5. abs(rxLoChainTurnOffTime) + abs(rxLoChainTurnOnTime)
    6. abs(txLoChainTurnOffTime) + abs(txLoChainTurnOnTime)
*/
/* DesignId :  MMWL_DesignId_097 */
/* Requirements : AUTORADAR_REQ-912 */
rlReturnVal_t rlSetInterChirpBlkCtrl(rlUInt8_t deviceMap,
                                                   rlInterChirpBlkCtrlCfg_t *data)
{
    rlReturnVal_t retVal;

    /* check if deviceIndex is out of defined value */
    if ((rlDriverIsDeviceMapValid(deviceMap) != RL_RET_CODE_OK) || (RL_NULL_PTR == data))
    {
        /* set return error code */
        retVal = RL_RET_CODE_INVALID_INPUT;
    }
    else
    {
        /* Package the command with given data and send it to device */
        retVal = rlDriverExecuteSetApi(deviceMap, RL_RF_DYNAMIC_CONF_SET_MSG,
                                       RL_RF_INTERCHIRP_BLOCK_CTRL_SB, (rlUInt8_t*)data,
                                       (rlUInt16_t)sizeof(rlInterChirpBlkCtrlCfg_t));
    }
    return retVal;
}

/*
 * END OF rl_sensor.c FILE
 */
