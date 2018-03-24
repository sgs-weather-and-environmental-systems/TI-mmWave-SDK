/* ======================================================================
 *   Copyright (C) 2015 Texas Instruments Incorporated
 *
 *   All rights reserved. Property of Texas Instruments Incorporated.
 *   Restricted rights to use, duplicate or disclose this code are
 *   granted through contract.
 *
 *   The program may not be used without the written permission
 *   of Texas Instruments Incorporated or against the terms and conditions
 *   stipulated in the agreement under which this program has been
 *   supplied.
 * ==================================================================== */

/**
 *  \file link_testcase_config.h
 *
 *  \brief This file defines the common configurations like driver config etc...
 */

#ifndef LINK_TESTCASE_CONFIG_H_
#define LINK_TESTCASE_CONFIG_H_

/* mmwave SDK include files */
#include <ti/control/mmwavelink/mmwavelink.h>

/* Test include files */
#include <ti/control/mmwavelink/test/common/link_testcase_setting.h>


const rlChanCfg_t chCfg  =
{
    .rxChannelEn = RX_CHANNEL_1_2_3_4_ENABLE,
    .txChannelEn = TX_CHANNEL_1_2_ENABLE,
    .cascading   = 0x0,
    .bReserved   = 0x0,
};

const rlAdcOutCfg_t adcOutCfgArgs =
{
    .fmt.b2AdcBits = ADC_BITS_16,
    .fmt.b2AdcOutFmt = ADC_FORMAT_CPMLEX_WITH_IMG_BAND,
    .fmt.b8FullScaleReducFctr = 0U,
    .reserved   = 0x0,
    .reserved1  = 0x0,   
};

const rlLowPowerModeCfg_t lowPowerModeCfg =
{
    .reserved0 = 0x0,
    .lpAdcMode = LP_ADC_MODE_REGULAR,
};

const rlDevHsiClk_t deviceHsiClk = 
{
    .hsiClk = 9 ,//0xD,
    .reserved = 0x0,
};


const rlProfileCfg_t  profileCfg[4U] = 
{
    {
        .profileId = CHIRP_PROFILE_ID,
        .pfVcoSelect = 0x0,
        .pfCalLutUpdate = 0x0,
        .startFreqConst = PROFILE_START_FREQ_VAL,
        .idleTimeConst = PROFILE_IDLE_TIME_VAL,
        .adcStartTimeConst = PROFILE_ADC_START_TIME_VAL,
        .rampEndTime = PROFILE_RAMP_END_TIME_VAL,
        .txOutPowerBackoffCode = PROFILE_TXOUT_POWER_BACKOFF,
        .txPhaseShifter = PROFILE_TXPHASESHIFTER_VAL,
        .freqSlopeConst = PROFILE_FREQ_SLOPE_VAL,
        .txStartTime = PROFILE_TX_START_TIME_VAL,
        .numAdcSamples = PROFILE_ADC_SAMPLE_VAL,
        .digOutSampleRate = PROFILE_DIGOUT_SAMPLERATE_VAL,
        .hpfCornerFreq1 = PROFILE_HPFCORNER_FREQ1_VAL,
        .hpfCornerFreq2 = PROFILE_HPFCORNER_FREQ2_VAL,
        .reserved0 = 0x0,
        .rxGain = PROFILE_RX_GAIN_VAL,
        .reserved1 = 0x0    
    },
    {
        .profileId = CHIRP_PROFILE_ID+1,
        .pfVcoSelect = 0x0,
        .pfCalLutUpdate = 0x0,
        .startFreqConst = PROFILE_START_FREQ_VAL,
        .idleTimeConst = PROFILE_IDLE_TIME_VAL,
        .adcStartTimeConst = PROFILE_ADC_START_TIME_VAL,
        .rampEndTime = PROFILE_RAMP_END_TIME_VAL,
        .txOutPowerBackoffCode = PROFILE_TXOUT_POWER_BACKOFF,
        .txPhaseShifter = PROFILE_TXPHASESHIFTER_VAL,
        .freqSlopeConst = PROFILE_FREQ_SLOPE_VAL,
        .txStartTime = PROFILE_TX_START_TIME_VAL,
        .numAdcSamples = PROFILE_ADC_SAMPLE_VAL,
        .digOutSampleRate = PROFILE_DIGOUT_SAMPLERATE_VAL,
        .hpfCornerFreq1 = PROFILE_HPFCORNER_FREQ1_VAL,
        .hpfCornerFreq2 = PROFILE_HPFCORNER_FREQ2_VAL,
        .reserved0 = 0x0,
        .rxGain = PROFILE_RX_GAIN_VAL,
        .reserved1 = 0x0  
    },
    {
        .profileId = CHIRP_PROFILE_ID+2,
        .pfVcoSelect = 0x0,
        .pfCalLutUpdate = 0x0,
        .startFreqConst = PROFILE_START_FREQ_VAL,
        .idleTimeConst = PROFILE_IDLE_TIME_VAL,
        .adcStartTimeConst = PROFILE_ADC_START_TIME_VAL,
        .rampEndTime = PROFILE_RAMP_END_TIME_VAL,
        .txOutPowerBackoffCode = PROFILE_TXOUT_POWER_BACKOFF,
        .txPhaseShifter = PROFILE_TXPHASESHIFTER_VAL,
        .freqSlopeConst = PROFILE_FREQ_SLOPE_VAL,
        .txStartTime = PROFILE_TX_START_TIME_VAL,
        .numAdcSamples = PROFILE_ADC_SAMPLE_VAL,
        .digOutSampleRate = PROFILE_DIGOUT_SAMPLERATE_VAL,
        .hpfCornerFreq1 = PROFILE_HPFCORNER_FREQ1_VAL,
        .hpfCornerFreq2 = PROFILE_HPFCORNER_FREQ2_VAL,
        .reserved0 = 0x0,
        .rxGain = PROFILE_RX_GAIN_VAL,
        .reserved1 = 0x0  
    },
    {
        .profileId = CHIRP_PROFILE_ID+3,
        .pfVcoSelect = 0x0,
        .pfCalLutUpdate = 0x0,
        .startFreqConst = PROFILE_START_FREQ_VAL,
        .idleTimeConst = PROFILE_IDLE_TIME_VAL,
        .adcStartTimeConst = PROFILE_ADC_START_TIME_VAL,
        .rampEndTime = PROFILE_RAMP_END_TIME_VAL,
        .txOutPowerBackoffCode = PROFILE_TXOUT_POWER_BACKOFF,
        .txPhaseShifter = PROFILE_TXPHASESHIFTER_VAL,
        .freqSlopeConst = PROFILE_FREQ_SLOPE_VAL,
        .txStartTime = PROFILE_TX_START_TIME_VAL,
        .numAdcSamples = PROFILE_ADC_SAMPLE_VAL,
        .digOutSampleRate = PROFILE_DIGOUT_SAMPLERATE_VAL,
        .hpfCornerFreq1 = PROFILE_HPFCORNER_FREQ1_VAL,
        .hpfCornerFreq2 = PROFILE_HPFCORNER_FREQ2_VAL,
        .reserved0 = 0x0,
        .rxGain = PROFILE_RX_GAIN_VAL,
        .reserved1 = 0x0  
    }
};

const rlChirpCfg_t  chirpCfg[2] = 
{
    {
        .chirpStartIdx = CHIRP_START_INDEX,
        .chirpEndIdx = CHIRP_END_INDEX + 255U,
        .profileId = CHIRP_PROFILE_ID,
        .reserved = 0x0,
        .startFreqVar = CHIRP_START_FREQ_VAL,
        .freqSlopeVar= CHIRP_FREQ_SLOPE_VAL,
        .idleTimeVar = CHIRP_IDLE_TIME_VAL,
        .adcStartTimeVar = CHIRP_ADC_START_TIME_VAL,
        .txEnable = CHIRP_TX_1_CHANNEL_ENABLE
    },
    {
        .chirpStartIdx = CHIRP_START_INDEX + 256U,
        .chirpEndIdx = CHIRP_END_INDEX + 511U,
        .profileId = CHIRP_PROFILE_ID + 1U,
        .reserved = 0x0,
        .startFreqVar = CHIRP_START_FREQ_VAL,
        .freqSlopeVar= CHIRP_FREQ_SLOPE_VAL,
        .idleTimeVar = CHIRP_IDLE_TIME_VAL,
        .adcStartTimeVar = CHIRP_ADC_START_TIME_VAL,
        .txEnable = CHIRP_TX_2_CHANNEL_ENABLE
    }    
};

 rlDynChirpCfg_t dynChirpCfg[10] = 
{

    0x00,
    0,
    0x0000,
    {
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0},
         {0x00010000, 0x00000000, 0x00000FF0}
    },

    0x00,
    1,
    0x0000,
    {
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0}

    },

    0x00,
    2,
    0x0000,
    {
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0}

    },
    
    0x00,
    3,
    0x0000,
    {
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0}

    },

    0x00,
    4,
    0x0000,
    {
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0}

    },

    0x00,
    5,
    0x0000,
    {
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0}

    },

    0x00,
    6,
    0x0000,
    {
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0}

    },
    
    0x00,
    7,
    0x0000,
    {
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0}

    },

    0x00,
    8,
    0x0000,
    {
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0}

    },

    0x00,
    9,
    0x0000,
    {
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0},
        {0x00010000, 0x00000000, 0x00000FF0}

    }
};

const rlRxSatMonConf_t rxSatMonCfg = 
{
    .profileIndx   = 0U,
    .satMonSel     = 3U,
    .reserved0     = 0U,
    .primarySliceDuration = 5U,
    .numSlices     = CQ_NUM_SLICES,
    .rxChannelMask = 0U,
    .reserved1     = 0U,
    .reserved2     = 0U,
    .reserved3     = 0U,
    .reserved4     = 0U
};

const rlSigImgMonConf_t sigImgMonCfg =
{
    .profileIndx = 0U,
    .numSlices   = CQ_NUM_SLICES,
    .timeSliceNumSamples = 8U,
    .reserved0   = 0U,
    .reserved1   = 0U
};

const rlFrameCfg_t  frameCfg =
{
    .reserved = 0x0,
    .chirpStartIdx = FRAME_CHIRP_START_IDX,
    .chirpEndIdx = FRAME_CHIRP_END_IDX,
    .numLoops = FRAME_LOOP_COUNT,
    .numFrames = FRAME_COUNT_VAL,
    .numAdcSamples = FRAME_ADC_SAMPLE_NUM,
    .framePeriodicity = FRAME_PRIODICITY_VAL,
    .triggerSelect = RL_FRAMESTRT_API_TRIGGER,
    .reserved2 = 0x0,
    .frameTriggerDelay = FRAME_TRIGGER_DELAY_VAL,
};


const rlRfCalMonTimeUntConf_t calMonTimeUnitConf = 
{
    .calibMonTimeUnit = 1,
    .numOfCascadeDev = 1,
    .devId = 1,
    .reserved =0
};

const rlRfCalMonFreqLimitConf_t freqLimit = 
{
    .freqLimitLow = 760,
    .freqLimitHigh = 810,
    .reserved0 = 0,
    .reserved1 =0
};

const rlRfInitCalConf_t rfInitCalib = 
{
    .calibEnMask = 0x17F0, /* Enable All Init time Calibration */
    .reserved0 = 0,
    .reserved1 = 0,
    .reserved2 =0,
    .reserved3 =0
};

const rlRunTimeCalibConf_t runTimeCalib = 
{
    .oneTimeCalibEnMask = 0x610,  /* Enable All Run time Calibration */
    .periodicCalibEnMask = 0x610, /* Enable All Run time Calibration */
    .calibPeriodicity = 1,
    .reportEn =1,
    .reserved0 =0,
    .reserved1 =0
};

const rlAdvFrameCfg_t advFrameCfg =
{
        .frameSeq.numOfSubFrames = 4,    
        .frameSeq.forceProfile = 0,    
        .frameSeq.loopBackCfg = 0,
        .frameSeq.reserved0 = 0,    
        
        .frameSeq.subFrameCfg[0].forceProfileIdx = 0,          
        .frameSeq.subFrameCfg[0].chirpStartIdx = 0,             
        .frameSeq.subFrameCfg[0].numOfChirps = 64,               
        .frameSeq.subFrameCfg[0].numLoops = 1,                 
        .frameSeq.subFrameCfg[0].burstPeriodicity = 4000000,          
        .frameSeq.subFrameCfg[0].chirpStartIdxOffset = 0,       
        .frameSeq.subFrameCfg[0].numOfBurst = 1,                
        .frameSeq.subFrameCfg[0].numOfBurstLoops = 1,           
        .frameSeq.subFrameCfg[0].reserved1 = 0,                 
        .frameSeq.subFrameCfg[0].subFramePeriodicity = 4000000,      
        .frameSeq.subFrameCfg[0].reserved2 = 0,                
        .frameSeq.subFrameCfg[0].reserved3 = 0,
        .frameSeq.subFrameCfg[1].forceProfileIdx = 0,          
        .frameSeq.subFrameCfg[1].chirpStartIdx = 64,             
        .frameSeq.subFrameCfg[1].numOfChirps = 64,               
        .frameSeq.subFrameCfg[1].numLoops = 1,                 
        .frameSeq.subFrameCfg[1].burstPeriodicity = 4000000,          
        .frameSeq.subFrameCfg[1].chirpStartIdxOffset = 0,       
        .frameSeq.subFrameCfg[1].numOfBurst = 1,                
        .frameSeq.subFrameCfg[1].numOfBurstLoops = 1,           
        .frameSeq.subFrameCfg[1].reserved1 = 0,                 
        .frameSeq.subFrameCfg[1].subFramePeriodicity = 4000000,      
        .frameSeq.subFrameCfg[1].reserved2 = 0,                
        .frameSeq.subFrameCfg[1].reserved3 = 0,
        .frameSeq.subFrameCfg[2].forceProfileIdx = 0,          
        .frameSeq.subFrameCfg[2].chirpStartIdx = 128,             
        .frameSeq.subFrameCfg[2].numOfChirps = 64,               
        .frameSeq.subFrameCfg[2].numLoops = 1,                 
        .frameSeq.subFrameCfg[2].burstPeriodicity = 4000000,          
        .frameSeq.subFrameCfg[2].chirpStartIdxOffset = 0,       
        .frameSeq.subFrameCfg[2].numOfBurst = 1,                
        .frameSeq.subFrameCfg[2].numOfBurstLoops = 1,           
        .frameSeq.subFrameCfg[2].reserved1 = 0,                 
        .frameSeq.subFrameCfg[2].subFramePeriodicity = 4000000,      
        .frameSeq.subFrameCfg[2].reserved2 = 0,                
        .frameSeq.subFrameCfg[2].reserved3 = 0,
        .frameSeq.subFrameCfg[3].forceProfileIdx = 0,          
        .frameSeq.subFrameCfg[3].chirpStartIdx = 192,             
        .frameSeq.subFrameCfg[3].numOfChirps = 64,               
        .frameSeq.subFrameCfg[3].numLoops = 1,                 
        .frameSeq.subFrameCfg[3].burstPeriodicity = 4000000,          
        .frameSeq.subFrameCfg[3].chirpStartIdxOffset = 0,       
        .frameSeq.subFrameCfg[3].numOfBurst = 1,                
        .frameSeq.subFrameCfg[3].numOfBurstLoops = 1,           
        .frameSeq.subFrameCfg[3].reserved1 = 0,                 
        .frameSeq.subFrameCfg[3].subFramePeriodicity = 4000000,      
        .frameSeq.subFrameCfg[3].reserved2 = 0,                
        .frameSeq.subFrameCfg[3].reserved3 = 0,

        .frameSeq.numFrames = 50,         
        .frameSeq.triggerSelect = 1,     
        .frameSeq.frameTrigDelay = 0,    
        .frameSeq.reserved1 = 0,                 
        .frameSeq.reserved2 = 0,                 
        
};

const rlBpmCommonCfg_t bpmCommonCfg = 
{
    .mode.b2SrcSel = 0,               
    .mode.b1Reserved1 = 0,
    .mode.b13Reserved2 = 0,
    .reserved0 = 0,
    .reserved1 = 0,        
    .reserved2 = 0,
    .reserved3 = 0,
    .reserved4 = 0
};

 rlBpmChirpCfg_t bpmChirpCfg[3] =  
{
    {
        .chirpStartIdx = CHIRP_START_INDEX,
        .chirpEndIdx = CHIRP_END_INDEX,
        .constBpmVal = 0,
        .reserved = 0x0
    },
    {
        .chirpStartIdx = CHIRP_START_INDEX+1,
        .chirpEndIdx = CHIRP_END_INDEX+1,
        .constBpmVal = 21,
        .reserved = 0x0
    },
    {
        .chirpStartIdx = CHIRP_START_INDEX+2,
        .chirpEndIdx = CHIRP_END_INDEX+2,
        .constBpmVal = 21,
        .reserved = 0x0
    }
};

const rlContModeCfg_t contModeCfg = 
{
    .startFreqConst = 1435384036,         
    .txOutPowerBackoffCode = 0,
    .txPhaseShifter = 0,
    .digOutSampleRate = 10000,
    .hpfCornerFreq1 = 0,
    .hpfCornerFreq2 = 0,
    .rxGain = 30,
    .vcoSelect = 0x0,
    .reserved0 = 0x0
};

const rlContModeEn_t contModeEn = 
{
    .contModeEn = 1,                             
    .reserved1 = 0
};

const rlDynPwrSave_t dynPwrSave = 
{
    .blkCfg = 0x7,
    .reserved = 0
};

const rlGpAdcCfg_t gpAdcCfg =
{
    .enable = 0x3,
    .numOfSamples[0].sampleCnt = 0x20,
    .numOfSamples[0].reserved = 0,
    .numOfSamples[1].sampleCnt = 0x20,
    .numOfSamples[1].reserved = 0,
    .numOfSamples[2].sampleCnt = 0x20,
    .numOfSamples[2].reserved = 0,
    .numOfSamples[3].sampleCnt = 0x20,
    .numOfSamples[3].reserved = 0,
    .numOfSamples[4].sampleCnt = 0x20,
    .numOfSamples[4].reserved = 0,
    .numOfSamples[5].sampleCnt = 0x20,
    .numOfSamples[5].reserved = 0,
    .numOfSamples[6].sampleCnt = 0x20,
    .numOfSamples[6].reserved = 0,
    .numOfSamples[7].sampleCnt = 0,
    .numOfSamples[7].reserved = 0,
    .numOfSamples[8].sampleCnt = 0,
    .numOfSamples[8].reserved = 0,
    .numOfSamples[9].sampleCnt = 0,
    .numOfSamples[9].reserved = 0,
    .numOfSamples[10].sampleCnt = 0,
    .numOfSamples[10].reserved = 0,
    .numOfSamples[11].sampleCnt = 0,
    .numOfSamples[11].reserved = 0,
    .reserved0 = 0
};

const rlRfLdoBypassCfg_t rfLdoBypassCfg =
{
    .ldoBypassEnable = 0,
    .supplyMonIrDrop = 0
};

const rlTempMonConf_t tempMonCfg =
{
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .reserved0 = 0,
    .anaTempThreshMin = -10,
    .anaTempThreshMax = 60,
    .digTempThreshMin = -10,
    .digTempThreshMax = 60,
    .tempDiffThresh = 20,
    .reserved1 = 0,
    .reserved2 = 0,
};

const rlRxGainPhaseMonConf_t rxGainPhaseMonCfg =
{
    .profileIndx = 0,
    .rfFreqBitMask = HIGHEST_CENTER_LOWEST_RF_FRQ_IN_PROFILES_SWEEP_BW,
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .txSel = 0,
    .rxGainAbsThresh = 40,
    .rxGainMismatchErrThresh = 40,
    .rxGainFlatnessErrThresh = 40,
    .rxGainPhaseMismatchErrThresh = (30 * (1U << 16))/360U,
    .rxGainMismatchOffsetVal = 0,
    .rxGainPhaseMismatchOffsetVal = 0,
    .reserved0 = 0,
    .reserved1 = 0,
};

const rlRxNoiseMonConf_t rxNoiseMonCfg = 
{
    .profileIndx = 0,//profileCfg.profileId,
    .rfFreqBitMask = HIGHEST_CENTER_LOWEST_RF_FRQ_IN_PROFILES_SWEEP_BW,
    .reserved0 = 0x0,
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .reserved1 = 0x0,
    .noiseThresh = 250,
    .reserved2 = 0x0,
};

const rlRxIfStageMonConf_t monRxIfStageCfg =
{
    .profileIndx = 0,
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .reserved0 = 0,
    .reserved1 = 0,
    .hpfCutoffErrThresh = 15,
    .lpfCutoffErrThresh = 15,
    .ifaGainErrThresh = 100,
    .reserved2 = 0,
};

rlTxPowMonConf_t tx0PowMonCfg = 
{
    .profileIndx = 0x0,
    .rfFreqBitMask = HIGHEST_CENTER_LOWEST_RF_FRQ_IN_PROFILES_SWEEP_BW,
    .reserved0 = 0x0,
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .reserved1 = 0x0,
    .txPowAbsErrThresh = 30,
    .txPowFlatnessErrThresh = 30,
    .reserved2 = 0x0,
    .reserved3 = 0x0,
};

rlTxPowMonConf_t tx1PowMonCfg = 
{
    .profileIndx = 0x0,
    .rfFreqBitMask = HIGHEST_CENTER_LOWEST_RF_FRQ_IN_PROFILES_SWEEP_BW,
    .reserved0 = 0x0,
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .reserved1 = 0x0,
    .txPowAbsErrThresh = 30,
    .txPowFlatnessErrThresh = 30,
    .reserved2 = 0x0,
    .reserved3 = 0x0,
};

const rlAllTxPowMonConf_t allTxPowMonCfg = 
{
    .tx0PowrMonCfg = &tx0PowMonCfg,
    .tx1PowrMonCfg = &tx1PowMonCfg,
    .tx2PowrMonCfg = NULL,
};

rlTxBallbreakMonConf_t tx0BallBreakMonCfg =
{
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .reserved0 = 0x0,
    .txReflCoeffMagThresh = -40,
    .reserved1 = 0x0,
    .reserved2 = 0x0,
};

rlTxBallbreakMonConf_t tx1BallBreakMonCfg =
{
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .reserved0 = 0x0,
    .txReflCoeffMagThresh = -40,
    .reserved1 = 0x0,
    .reserved2 = 0x0,
};

const rlAllTxBallBreakMonCfg_t allTxBallbreakMonCfg =
{
    .tx0BallBrkMonCfg = &tx0BallBreakMonCfg,
    .tx1BallBrkMonCfg = &tx1BallBreakMonCfg,
    .tx2BallBrkMonCfg = NULL,
};

const rlTxGainPhaseMismatchMonConf_t txGainPhMisMatchMonCfg =
{
    .profileIndx = 0x0,
    .rfFreqBitMask = HIGHEST_CENTER_LOWEST_RF_FRQ_IN_PROFILES_SWEEP_BW,
    .txEn = 3,
    .rxEn = 0x1,
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .reserved0 = 0x0,
    .txGainMismatchThresh = 50,
    .txPhaseMismatchThresh = (30 * (1 << 16))/360 ,
    .txGainMismatchOffsetVal = 0x0,
    .txPhaseMismatchOffsetVal = 0x0,
    .reserved1 = 0x0,
    .reserved2 = 0x0,
};

rlTxBpmMonConf_t tx0BpmMonCfg =
{
    .profileIndx = 0x0,
    .reserved0 = 0x0,
    .reserved1 = 0x0,
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .rxEn = 0x1,
    .txBpmPhaseErrThresh = 0x1555,
    .txBpmAmplErrThresh = 30,
    .reserved2 = 0x0,
    .reserved3 = 0x0,
};

rlTxBpmMonConf_t tx1BpmMonCfg =
{
    .profileIndx = 0x0,
    .reserved0 = 0x0,
    .reserved1 = 0x0,
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .rxEn = 0x1,
    .txBpmPhaseErrThresh = 0x1555,
    .txBpmAmplErrThresh = 30,
    .reserved2 = 0x0,
    .reserved3 = 0x0,
};

const rlAllTxBpmMonConf_t allTxBpmMonCfg =
{
    .tx0BpmMonCfg = &tx0BpmMonCfg,
    .tx1BpmMonCfg = &tx1BpmMonCfg,
    .tx2BpmMonCfg = NULL,
};

const rlSynthFreqMonConf_t synthFreqMonCfg =
{
    .profileIndx = 0,
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .freqErrThresh = 4000,
    .monStartTime = 10,
    .reserved0 = 0,
    .reserved1 = 0,
    .reserved2 = 0,
};

const rlExtAnaSignalsMonConf_t extAnaSigMonCfg =
{
    .reportMode = 2,
    .reserved0 = 0,
    .signalInpEnables = 0,
    .signalBuffEnables = 0,
    .signalSettlingTime[0] = 0,
    .signalSettlingTime[1] = 0,
    .signalSettlingTime[2] = 0,
    .signalSettlingTime[3] = 0,
    .signalSettlingTime[4] = 0,
    .signalSettlingTime[5] = 0,
    .signalThresh[0] = 0,
    .signalThresh[1] = 0,
    .signalThresh[2] = 0,
    .signalThresh[3] = 0,
    .signalThresh[4] = 0,
    .signalThresh[5] = 0,
    .signalThresh[6] = 0,
    .signalThresh[7] = 0,
    .signalThresh[8] = 0,
    .signalThresh[9] = 0,
    .signalThresh[10] = 0,
    .signalThresh[11] = 0,
    .reserved1 = 0,
    .reserved2 = 0,
    .reserved3 = 0,
};

rlTxIntAnaSignalsMonConf_t tx0IntAnaSigMonCfg =
{
    .profileIndx = 0,
    .reportMode = 2,
    .reserved0 = 0,
    .reserved1 = 0,
};

rlTxIntAnaSignalsMonConf_t tx1IntAnaSigMonCfg =
{
    .profileIndx = 0,
    .reportMode = 2,
    .reserved0 = 0,
    .reserved1 = 0,
};

const rlAllTxIntAnaSignalsMonConf_t allTxanaSigMonCfg =
{
    .tx0IntAnaSgnlMonCfg = &tx0IntAnaSigMonCfg,
    .tx1IntAnaSgnlMonCfg = &tx1IntAnaSigMonCfg,
    .tx2IntAnaSgnlMonCfg = NULL,
};

const rlRxIntAnaSignalsMonConf_t rxIntAnaSigMonCfg =
{
    .profileIndx = 0,
    .reportMode = 2,
    .reserved0 = 0,
    .reserved1 = 0,
};

const rlPmClkLoIntAnaSignalsMonConf_t pmClkLoIntAnaSigMonCfg = 
{
    .profileIndx = 0,
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .reserved0 = 0,
    .reserved1 = 0,
};

const rlGpadcIntAnaSignalsMonConf_t gpadcIntAnaSigMonCfg =
{
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .reserved0 = 0,
    .reserved1 = 0,
    .reserved2 = 0,
};

const rlPllContrVoltMonConf_t pllConVoltMonCfg =
{
    .reportMode = MON_REPORT_MODE_PERIODIC_WITH_THRESHOLD_CHECK,
    .reserved0 = 0,
    .signalEnables = 7,
    .reserved1 = 0,
};

const rlDualClkCompMonConf_t dualClkCompMonCfg =
{
    .reportMode = 0,
    .reserved0 = 10,
    .dccPairEnables = 63,
    .reserved1 = 0,
};

const rlRfProgFiltConf_t progFiltCfg =
{
	.profileId = 0,
	.coeffStartIdx = 0,
	.progFiltLen = 14,
	.progFiltFreqShift = 100,
};

const rlRfProgFiltCoeff_t progFiltCoef =
{
    .coeffArray[0] = -876,
    .coeffArray[1] = -272,
    .coeffArray[2] = 1826,
    .coeffArray[3] = -395,
    .coeffArray[4] = -3672,
    .coeffArray[5] = 3336,
    .coeffArray[6] = 15976,
    .coeffArray[7] = 15976,
    .coeffArray[8] = 3336,
    .coeffArray[9] = -3672,
    .coeffArray[10] = -395,
    .coeffArray[11] = 1826,
    .coeffArray[12] = -272,
    .coeffArray[13] = -876,
};


#endif /* #ifndef LINK_TESTCASE_CONFIG_H_ */
