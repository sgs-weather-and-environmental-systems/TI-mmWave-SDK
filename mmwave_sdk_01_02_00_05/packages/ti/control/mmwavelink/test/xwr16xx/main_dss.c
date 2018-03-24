/*
 *   @file  main_dss.c
 *
 *   @brief
 *      Unit Test code for the mmWave Link on the AR16xx DSS
 *
 *  \par
 *  NOTE:
 *      (C) Copyright 2016 Texas Instruments, Inc.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *    Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the
 *    distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/**************************************************************************
 *************************** Include Files ********************************
 **************************************************************************/

/* Standard Include Files. */
#include <stdint.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include <stdio.h>
#include <c6x.h>

/* BIOS/XDC Include Files. */
#include <xdc/std.h>
#include <xdc/cfg/global.h>
#include <xdc/runtime/IHeap.h>
#include <xdc/runtime/System.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Memory.h>
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Event.h>
#include <ti/sysbios/knl/Semaphore.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/heaps/HeapBuf.h>
#include <ti/sysbios/heaps/HeapMem.h>
#include <ti/sysbios/knl/Event.h>
#include <ti/sysbios/family/c64p/Hwi.h>
#include <ti/sysbios/family/c64p/EventCombiner.h>
#include <ti/sysbios/family/c64p/Cache.h>

/* mmWave SK Include Files: */
#include <ti/common/sys_common.h>
#include <ti/drivers/mailbox/mailbox.h>
#include <ti/control/mmwavelink/mmwavelink.h>
#include <ti/drivers/crc/crc.h>
#include <ti/drivers/soc/soc.h>
#include <ti/control/mmwavelink/include/rl_driver.h>
#include <ti/utils/testlogger/logger.h>
/* ADCBUF Driver: */
#include <ti/drivers/adcbuf/ADCBuf.h>
#include <ti/utils/cycleprofiler/cycle_profiler.h>
#include <ti/control/mmwavelink/test/common/link_testcase_setting.h>

/**************************************************************************
 **************************** Extern Functions ****************************
 **************************************************************************/
extern int32_t MmwaveLink_initLink (rlUInt8_t deviceType, rlUInt8_t platform);
extern int32_t MmwaveLink_getRfBootupStatus (void);
extern int32_t MmwaveLink_getVersion (void);
extern int32_t MmwaveLink_setChannelConfig (void);
extern int32_t MmwaveLink_setRfAnaMonConfig (void);
extern int32_t MmwaveLink_setRfTempMonConfig (void);
extern int32_t MmwaveLink_setRfRxGainPhaMonConfig (void);
extern int32_t MmwaveLink_setRfRxNoiseMonConfig (void);
extern int32_t MmwaveLink_setRfRxIfStageMonConfig (void);
extern int32_t MmwaveLink_setRfTxPowMonConfig (void);
extern int32_t MmwaveLink_setRfTxGainPhaseMismatchMonConfig (void);
extern int32_t MmwaveLink_setRfTxBallbreakMonConfig (void);
extern int32_t MmwaveLink_setRfTxBpmMonConfig (void);
extern int32_t MmwaveLink_setRfSynthFreqMonConfig (void);
extern int32_t MmwaveLink_setRfExtAnaSignalsMonConfig (void);
extern int32_t MmwaveLink_setRfTxIntAnaSignalMonConfig (void);
extern int32_t MmwaveLink_setRfRxIntAnaSignalsMonConfig (void);
extern int32_t MmwaveLink_setRfPmClkLoIntAnaSignalsMonConfig (void);
extern int32_t MmwaveLink_setRfGpadcIntAnaSignalsMonConfig (void);
extern int32_t MmwaveLink_setRfPllContrlVoltMonConfig (void);
extern int32_t MmwaveLink_setRfDualClkCompMonConfig (void);
extern int32_t MmwaveLink_setRfRxIfSatMonConfig (void);
extern int32_t MmwaveLink_setRfRxSigImgMonConfig (void);
extern int32_t MmwaveLink_setAdcOutConfig (void);
extern int32_t MmwaveLink_setLowPowerModeConfig (void);
extern int32_t MmwaveLink_setHsiClk (void);
extern int32_t MmwaveLink_rfCalibration (void);
extern int32_t MmwaveLink_setProfileConfig (void);
extern int32_t MmwaveLink_setChirpConfig (void);
extern int32_t MmwaveLink_setFrameConfig (void);
extern int32_t MmwaveLink_sensorStart (void);
extern int32_t MmwaveLink_sensorStop (void);
extern int32_t MmwaveLink_setCalMonConfig (void);
extern int32_t MmwaveLink_setInitTimeCalibConfig (void);
extern int32_t MmwaveLink_setRunTimeCalibConfig (void);
extern int32_t MmwaveLink_rlCalibDataStore(void);
extern int32_t MmwaveLink_rlSetLoopBckBurstCfg(void);
extern int32_t MmwaveLink_rlSetDynChirpCfg(void);
extern int32_t MmwaveLink_rlSetDynPerChirpPhShifterCfg(void);
extern int32_t MmwaveLink_setAdvFrameConfig (void);
extern int32_t MmwaveLink_setBpmCommonConfig (void);
extern int32_t MmwaveLink_setBpmChirpConfig (void);
extern int32_t MmwaveLink_setContModeConfig (void);
extern int32_t MmwaveLink_enableContMode (uint8_t bEnable);
extern int32_t MmwaveLink_rfDynamicPowerSave (void);
extern int32_t MmwaveLink_setRfDevCfg (rlUInt32_t);
extern int32_t MmwaveLink_setGpAdcConfig (void);
extern int32_t MmwaveLink_rlRfAnaFaultInjConfig(void);
extern int32_t MmwaveLink_progFilterConfig(void);
extern int32_t MmwaveLink_rlSetDynChirpEn(void);
extern int32_t MmwaveLink_RxMixerInPwrConfig (void);
extern void MmwaveLink_printMonitoringResult(void);
extern int8_t MmwaveLink_VerifyCQData(uint8_t coreType);
extern int8_t MmwaveLink_VerifyCPData(uint8_t coreType);
extern int MmwaveLink_CQedmaSetup(void);
extern void MmwaveLink_triggerEdmaTransfer();

/**************************************************************************
 *************************** Extern Definitions ***************************
 **************************************************************************/


/**************************************************************************
 *************************** Global Variables *****************************
 **************************************************************************/

/**
 * @brief
 *  Initialize the MCPI Log Message Buffer
 */
MCPI_LOGBUF_INIT(9216);

/* Array to hold average chirp interval for Dynamic chirps*/
uint32_t avgChirpTimeInterval[2];
uint32_t lastChirpIntTimeStamp;

/*Counter for number of chirps*/
volatile uint32_t gLinkChirpCnt = 0U;

/*Counter for number of frames*/
volatile uint32_t gLinkFrameCnt = 0U;

volatile uint32_t dynChirpTestStatus = 0;

/*RF Monitoring test*/
bool gLinkMonitoringTest = true;

/*RF calibration test*/
bool gLinkCalibTest      = true;

/*RF Advance frame test*/
bool gLinkAdvanceFrameTest  = false;

/* CQ1 and CQ2 data verification test
    Here is the the flow to verify the CQ1 and CQ2 RAM data
   1. At end of last chirp of last frame application triggers eDMA to transfer CQ1 and CQ2 
      data of single chirp to L3 memory.
   2. After all other test completes application checks for CQ1 data reading from L3 memory. In good 
      condition signal data should be greater than image energy data for given time slices, if it is 
      not true then set error flag.
   3. CQ2 data verification is not covered in this application, but user can verify this by putting another
      EVM running countinous mode of frequency range which cause interference on EVM under test. In case 
      of any interference recieved on EVM under test, CQ2 data will have non-zero values.
*/
/* enable this flag to verify CQ data in this application */
bool cqDataVerifyTest = false;
extern volatile uint8_t eDMADataTransferDone;

/* Store CQ verification test result */
int32_t gCqTestResult = 0xFF;
/* Store CP data verification result */
int32_t gCpTestResult  = 0xFF;

/* RF Advance frame test
   Note: If gLinkContModeTest is enabled then gLinkMonitoringTest and gLinkCalibTest 
   must be disabled
*/
bool gLinkContModeTest  = false;

/* Dynaic Chirp configuration test */
bool gDynamicChirpTest  = false;

/*Binary phase modulation test*/
bool gLinkBpmEnableTest  = false;

/*RF program filter test*/
bool gLinkProgFiltTest  = false;

/* Dynamic Chirp configuration Number, Initially 0, After Dynamic chirp configuration,
  Set to 1*/
uint8_t gDynChirpConfigNum = 0U;

/* set to True if chirp interrupt is missed in a whole frame */
bool chirpMissedError = false;

/*frame interrupt Semaphore  */
Semaphore_Handle gLinkFrameSem;
Semaphore_Params gLinkSemParams;

/*Frame Configuration*/
extern const rlFrameCfg_t  frameCfg;

/* Advance Frame Configuration */
extern const rlAdvFrameCfg_t  advFrameCfg;

/*! @brief   ADCBUF handle */
ADCBuf_Handle             adcbufHandle;

/**************************************************************************
 ************************** mmWave Link Functions *************************
 **************************************************************************/

 
static void MmwaveLink_setupEventCombiner (void)
{
    Hwi_Params  params;
    uint32_t    i;

    Hwi_Params_init(&params);
    params.enableInt = TRUE;
    for (i = 0; i < 4; i++)
    {
        params.arg      = i;
        params.eventId  = i;
        if (Hwi_create(4 + i, &EventCombiner_dispatch, &params, NULL) == NULL)
        {
            System_printf("failed to create Hwi interrupt %d\n",4 + i);
        }
    }
    return;
}

/**
 *  @b Description
 *  @n
 *      RF Monitoring Enable/Configuration function. Enables all monitoring in
 *      Radar SS
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
static int32_t MmwaveLink_monitoring()
{
    System_printf ("----------Debug: Monitoring Configuration-----------\n");
    
    /* Set mmWave Analog monitor config to the BSS */
    if (MmwaveLink_setRfAnaMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF analog monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF analog monitor Config", MCPI_TestResult_PASS);

    /* Set mmWave temperature monitor config to the BSS */
    if (MmwaveLink_setRfTempMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF temperature monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF temperature monitor Config", MCPI_TestResult_PASS);

    /* Set mmWave RX gain and phase monitoring config to the BSS */
    if (MmwaveLink_setRfRxGainPhaMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF RX gain and phase monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF RX gain and phase monitor Config", MCPI_TestResult_PASS);

    /* Set mmWave RX noise monitoring config to the BSS */
    if (MmwaveLink_setRfRxNoiseMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF RX noise monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF RX noise monitor Config", MCPI_TestResult_PASS);

    /* Set mmWave RX IF filter attenuation config to the BSS*/
    if (MmwaveLink_setRfRxIfStageMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF RX IF stage monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF RX IF stage monitor Config", MCPI_TestResult_PASS);

    /* Set mmWave TX balbreak config to the BSS */
    if (MmwaveLink_setRfTxBallbreakMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF Tx ballbreak monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF Tx ballbreak monitor Config", MCPI_TestResult_PASS);

    /* Set mmWave TX TX gain and phase mismatch config to the BSS*/
    if (MmwaveLink_setRfTxGainPhaseMismatchMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF TX gain and phase mismatch monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF TX gain and phase mismatch monitor Config", MCPI_TestResult_PASS);

    /* Set mmWave TX BPM config to the BSS */
    if (MmwaveLink_setRfTxBpmMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF TX BPM monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF TX BPM monitor Config", MCPI_TestResult_PASS);

    /* Set mmWave Rf external analog signal config to the BSS */
    if (MmwaveLink_setRfExtAnaSignalsMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link Rf external analog signal Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link Rf external analog signal Config", MCPI_TestResult_PASS);

    /* Set mmWave Rf internal analog signal config to the BSS */
    if (MmwaveLink_setRfTxIntAnaSignalMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link Rf TX internal analog signal Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link Rf TX internal analog signal Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfRxIntAnaSignalsMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RX Internal Analog Signals mon. Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RX Internal Analog Signals mon. Config", MCPI_TestResult_PASS);

    /* Set mmWave Rf pm,clock  config to the BSS */
    if (MmwaveLink_setRfPmClkLoIntAnaSignalsMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link Rf pm, clock Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link Rf pm, clock Config", MCPI_TestResult_PASS);

    /* Set mmWave GPADC Internal Analog Signals config to the BSS */
    if (MmwaveLink_setRfGpadcIntAnaSignalsMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link GPADC Internal Analog Signals Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link GPADC Internal Analog Signals Config", MCPI_TestResult_PASS);

    /* Set mmWave Rf synth freq config to the BSS */
    if (MmwaveLink_setRfSynthFreqMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link Rf synth freq Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link Rf synth freq Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfDualClkCompMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link Dual Clk Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link Dual Clk Config", MCPI_TestResult_PASS);

    /* CQ data verification test is enable */
    if (cqDataVerifyTest)
    {
        if (MmwaveLink_setRfRxIfSatMonConfig() < 0)
        {
            MCPI_setFeatureTestResult ("Set mmWave Rx Saturation Detector Mon Config", MCPI_TestResult_FAIL);
            return -1;
        }
        MCPI_setFeatureTestResult ("Set mmWave Rx Saturation Detector Mon Config", MCPI_TestResult_PASS);

        if (MmwaveLink_setRfRxSigImgMonConfig() < 0)
        {
            MCPI_setFeatureTestResult ("Set mmWave Signal-Image Mon Config", MCPI_TestResult_FAIL);
            return -1;
        }
        MCPI_setFeatureTestResult ("Set mmWave Signal-Image Mon Config", MCPI_TestResult_PASS);
    }
    
    if (MmwaveLink_setRfPllContrlVoltMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link MmwaveLink_setRfPllContrlVoltMonConfig Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link MmwaveLink_setRfPllContrlVoltMonConfig Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfTxPowMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link Tx power monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF Tx power monitor Config", MCPI_TestResult_PASS);

    System_printf ("----------------------------------------------------\n");
    return 0;

}

/**
 *  @b Description
 *  @n
 *      ADC Buffer configuration to receive chirp interrupt from mmWave 
 *      front end
 *      
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 *
 */
int32_t MmwaveLink_adcBufConfig()
{
    ADCBuf_dataFormat       dataFormat;
    ADCBuf_RxChanConf       rxChanConf;
    int32_t retVal;
    uint8_t      numBytePerSample, numRxChannel = 0, channel;
    uint32_t bufSizePerChan;
    extern const rlChanCfg_t chCfg;
    extern const rlProfileCfg_t  profileCfg[4];
    extern const rlAdcOutCfg_t adcOutCfgArgs;
    extern const rlContModeCfg_t contModeCfg;
    
    /* Configure ADC buffer data format */
    if (adcOutCfgArgs.fmt.b2AdcOutFmt == ADC_FORMAT_REAL)
    {
        dataFormat.adcOutFormat       = 1U; /* 0 - Complex Data mode, 1 - Real data mode */
    }
    else
    {
        dataFormat.adcOutFormat       = 0U; /* 0 - Complex Data mode, 1 - Real data mode */
    }
    dataFormat.sampleInterleave   = 0U;
    dataFormat.channelInterleave  = 1U;

    retVal = ADCBuf_control(adcbufHandle, ADCBufMMWave_CMD_CONF_DATA_FORMAT, (void *)&dataFormat);
    if (retVal < 0)
    {
        System_printf("Error: ADCBufMMWave_CMD_CONF_DATA_FORMAT failed with [Error %d]\n", retVal);
    }
    
    /* Calculate the DMA transfer parameters */
    if (dataFormat.adcOutFormat == 0)
    {
        /* Complex dataFormat has 4 bytes */
        numBytePerSample =  4 ;
    }
    else
    {
        /* Real dataFormat has 2 bytes */
        numBytePerSample =  2 ;
    }
    
    /* Enable the receive channels */
    for (channel = 0; channel < SYS_COMMON_NUM_RX_CHANNEL; channel++)
    {
        /* Is the channel enabled? */
        if (chCfg.rxChannelEn & (0x1 << channel))
        {
            /* YES: Populate the receive channel configuration: */
            rxChanConf.channel = channel;

            /* Are we operating in continuous mode? */
            if (gLinkContModeTest == false)
            {
                /* Calculate ADCBuf size per channel */
                bufSizePerChan = profileCfg[0].numAdcSamples * numBytePerSample;

                /* Chirp Mode: */
                rxChanConf.offset = bufSizePerChan * numRxChannel;
            }
            else
            {
                /* Continuous Mode: */
                rxChanConf.offset = (PROFILE_ADC_SAMPLE_VAL*4) * numBytePerSample * numRxChannel;
            }

            /* Enable the channel: ADCBuf channel offset address is used for non-interleaved mode, the address must be 16 bytes aligned.*/
            retVal = ADCBuf_control(adcbufHandle, ADCBufMMWave_CMD_CHANNEL_ENABLE, (void *)&rxChanConf);
            if(retVal < 0)
            {
                System_printf("Error: ADCBufMMWave_CMD_CHANNEL_ENABLE failed for channel %d , offset = %x, with [Error %d]\n",
                               channel, rxChanConf.offset, retVal);
            }

            /* Track the number of receive channels: */
            numRxChannel++;
        }
    }
    System_printf("Debug: ADCbuf configuration is done!!\n");
    return 0;
}

/**
 *  @b Description
 *  @n
 *      System Initialization Task which initializes the various
 *      components in the system.
 *
 *  @retval
 *      Not Applicable.
 */
static void MmwaveLink_initTask(UArg arg0, UArg arg1)
{
    /* Status variables */
    int32_t resultSensorStart = -1;
    int32_t resultDynamicChirpCfg = -1;
    int32_t resultDynamicChirpEnable = -1;
    
    /* Debug Message: */
    System_printf("Debug: Launched the mmwaveLink Initialization Task\n");

    /* Initialize the test logger framework: */
    MCPI_Initialize ();

    /* Initialize & setup the Event combiner: */
    MmwaveLink_setupEventCombiner();

    /* Initialize the Mailbox */
    Mailbox_init(MAILBOX_TYPE_DSS);

    if (cqDataVerifyTest)
    {
        /* setup edma to copy CQ1 and CQ2 RAM data to L3 memory */
        if(MmwaveLink_CQedmaSetup() < 0)
        {
            MCPI_setFeatureTestResult ("mmWave Link CQ EDMA setup", MCPI_TestResult_FAIL);
            return;
        }
    }
    
    /* Setup and initialize the mmWave Link: */
    if (MmwaveLink_initLink (RL_AR_DEVICETYPE_16XX, RL_PLATFORM_DSS) < 0)
    {
        MCPI_setFeatureTestResult ("mmWave Link Initialization", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("mmWave Link Initialization", MCPI_TestResult_PASS);

    /* Get radarSS bootup status */
    if (MmwaveLink_getRfBootupStatus () < 0)
    {
        MCPI_setFeatureTestResult ("Get radarSS bootup status", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("Get radarSS bootup status", MCPI_TestResult_PASS);
    
    /* Get mmWave Link Version: */
    if(MmwaveLink_getVersion() < 0)
    {
        MCPI_setFeatureTestResult ("Get mmWave Link Version", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("Get mmWave Link Version", MCPI_TestResult_PASS);

    /* Set mmWave Link Channel Configuration to the BSS */
    if (MmwaveLink_setChannelConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link Channel Config", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link Channel Config", MCPI_TestResult_PASS);

    /* Set mmWave Link ADC Out Configuration to the BSS */
    if (MmwaveLink_setAdcOutConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link ADC Out Config", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link ADC Out Config", MCPI_TestResult_PASS);

    /* Set mmWave Link low power mode config*/
    if (MmwaveLink_setLowPowerModeConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link Low Power Mode config", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link Low Power Mode config", MCPI_TestResult_PASS);

    /* mmWave Link set Async event configuration */
    if (MmwaveLink_setRfDevCfg(0xA) < 0)
    {
        MCPI_setFeatureTestResult ("Set Async event config", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("Set Async event config", MCPI_TestResult_PASS);

    /* Set device HSI clock */
    if (MmwaveLink_setHsiClk() < 0)
    {
        MCPI_setFeatureTestResult ("Set HSI clock", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("Set HSI clock", MCPI_TestResult_PASS);

    /* mmWave Link RF Init/Calibration */
    if (MmwaveLink_rfCalibration() < 0)
    {
        MCPI_setFeatureTestResult ("mmWave Link RF Calibration", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("mmWave Link RF Calibration", MCPI_TestResult_PASS);

    
    if (MmwaveLink_setGpAdcConfig() < 0)
    {
        MCPI_setFeatureTestResult ("mmWave Link Get GPAdc", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("mmWave Link Get GPAdc", MCPI_TestResult_PASS);

    /* mmWave Link Calib/Monitoring config */
    if (MmwaveLink_setCalMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("mmWave Link Calib/Monitoring config", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("mmWave Link Calib/Monitoring config", MCPI_TestResult_PASS);

    /* Check for Programmable Filter Test */
    if(gLinkProgFiltTest == true)
    {
        /* mmWave Link Programmable filter configuration */
        if (MmwaveLink_progFilterConfig() < 0)
        {
            MCPI_setFeatureTestResult ("Set mmWave Link Programmable filter config", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Set mmWave Link Programmable filter config", MCPI_TestResult_PASS); 
    }

    /* Check for If Continous Streaming mode Test is enabled */
    if(gLinkContModeTest == false)
    {
        /* mmWave Link set profile configuration */
        if (MmwaveLink_setProfileConfig() < 0)
        {
            MCPI_setFeatureTestResult ("Set mmWave Link Profile config", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Set mmWave Link Profile config", MCPI_TestResult_PASS);

        /* mmWave Link set Chirp configuration */
        if (MmwaveLink_setChirpConfig() < 0)
        {
            MCPI_setFeatureTestResult ("Set mmWave Link Chirp config", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Set mmWave Link Chirp config", MCPI_TestResult_PASS);

        /* Check for If Advance Frame Test is enabled */
        if(gLinkAdvanceFrameTest == false)
        {
            /* mmWave Link set Frame configuration */
            if (MmwaveLink_setFrameConfig() < 0)
            {
                MCPI_setFeatureTestResult ("Set mmWave Link Frame config", MCPI_TestResult_FAIL);
                return;
            }
            MCPI_setFeatureTestResult ("Set mmWave Link Frame config", MCPI_TestResult_PASS);
        }
        else
        {
            /* mmWave Link set Advance Frame configuration */
            if (MmwaveLink_setAdvFrameConfig() < 0)
            {
                MCPI_setFeatureTestResult ("Set mmWave Link Advance Frame config", MCPI_TestResult_FAIL);
                return;
            }
            MCPI_setFeatureTestResult ("Set mmWave Link Advance Frame config", MCPI_TestResult_PASS);
        }
    }
    else
    {
        /* mmWave Link set Continous Mode configuration */
        if (MmwaveLink_setContModeConfig() < 0)
        {
            MCPI_setFeatureTestResult ("Set mmWave Link Continous Mode config", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Set mmWave Link Continous Mode config", MCPI_TestResult_PASS);

        /* mmWave Link Enable/Disable Continous mode */
        if (MmwaveLink_enableContMode(1) < 0)
        {
            MCPI_setFeatureTestResult ("Enable/Disable mmWave Link Continous mode", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Enable/Disable mmWave Link Continous modeg", MCPI_TestResult_PASS);
    }
    
    /* configure AdcBuffer based on sample size and rx-channels */
    MmwaveLink_adcBufConfig();
    
    /* Check If Binary Phase Modulation test is enabled */
    if(gLinkBpmEnableTest == true)
    {
        /* mmWave Link Sets Binary Phase Modulation Common Configuration */
        if (MmwaveLink_setBpmCommonConfig() < 0)
        {
            MCPI_setFeatureTestResult ("Set mmWave Link Binary Phase Modulation Common Config", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Set mmWave Link Binary Phase Modulation Common Config", MCPI_TestResult_PASS);

        /* mmWave Link Sets Binary Phase Modulation Chirp Configuration */
        if (MmwaveLink_setBpmChirpConfig() < 0)
        {
            MCPI_setFeatureTestResult ("Set mmWave Link Binary Phase Modulation Chirp Config", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Set mmWave Link Binary Phase Modulation Chirp Config", MCPI_TestResult_PASS);    
    }

    /* Check If Run Time calibration test is enabled */
    if(gLinkCalibTest == true)
    {
        /* mmWave Link Run time calibration configuration */
        if (MmwaveLink_setRunTimeCalibConfig() < 0)
        {
            MCPI_setFeatureTestResult ("Set mmWave Link Run time Monitoring config", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Set mmWave Link Run time Monitoring config", MCPI_TestResult_PASS);
    }
    
    /* Check If Run Time monitoring test is enabled */
    if(gLinkMonitoringTest == true)
    {
        /* mmWave RF Monitoring */
        if (MmwaveLink_monitoring() < 0)
        {
            MCPI_setFeatureTestResult ("Start Monitoring", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Start Monitoring", MCPI_TestResult_PASS);
    }
    
    if(gLinkContModeTest == false)
    {
        System_printf ("Debug: Starting Sensor.. \n");
        /* mmWave Link start sensor */
        resultSensorStart = MmwaveLink_sensorStart();
        if (resultSensorStart < 0)
        {
            MCPI_setFeatureTestResult ("Start sensor", MCPI_TestResult_FAIL);
            return;
        }

        /* Dynamically update chirp config while frame is ongoing */
        /* @Note - In case dynamic chirp test is ON in link_test application, then before downloading
           debug image from CCS to device, please disable CIO feature in CCS.
           This change required to avoid any Chirp/Frame interrupt in this application.
           
           Steps to disable CIO function in CCS for specific target configuration
           1. Open properties window of your target configuration file (*.ccxml) from 'Target Configuration'
           mini-window.
           2. Choose 'Program/Memory Load Options' 
           3. Un-check 'Enable CIO function use' checkbox
           4. Apply this change and press OK.
           5. Launch Target Configuration and download MSS/DSS test application.
           
           After running this application wait for few minutes and then halt to check that if 
           any error occured. 
           dynChirpTestStatus == 0x0FFF -> no error occured while dynamic chirp config and new parameters are effective.
           dynChirpTestStatus == 0x0000 -> Either rlSetDynChirpCfg or rlSetDynChirpEn failed
           dynChirpTestStatus == 0x0AFF -> DynChirp config is not effective.           
        */
        if(gDynamicChirpTest == true)
        {
            /* wait till few (~half) frame interrupts are received */
            Semaphore_pend (gLinkFrameSem, BIOS_WAIT_FOREVER);

            /* re-configure new Chirp configuration when above semaphore is posted by 
               Mmwavelink_frameInterrupCallBackFunc API */
            resultDynamicChirpCfg = MmwaveLink_rlSetDynChirpCfg();
            if (resultDynamicChirpCfg < 0)
            {
                MCPI_setFeatureTestResult ("Dynamic Chirp config", MCPI_TestResult_FAIL);
                return;
            }
            resultDynamicChirpEnable = MmwaveLink_rlSetDynChirpEn();
            if (resultDynamicChirpEnable < 0)
            {
                MCPI_setFeatureTestResult ("Dynamic Chirp Enable", MCPI_TestResult_FAIL);
                return;
            }
        }
        /* wait till all frame interrupts are received */
        Semaphore_pend (gLinkFrameSem, BIOS_WAIT_FOREVER);

        if(gDynamicChirpTest == true)
        {
            if(resultDynamicChirpCfg == 0)
            {
                MCPI_setFeatureTestResult ("Dynamic Chirp config", MCPI_TestResult_PASS);
            }
            if(resultDynamicChirpEnable == 0)
            {
                MCPI_setFeatureTestResult ("Dynamic Chirp Enable", MCPI_TestResult_PASS);
            }
            /* set the status value to notify that dynamic chirp configuration has been done correctly */
            dynChirpTestStatus |= 0x000F;
        }
        else
        {
            /* for Legacy frame config test */
            if(gLinkAdvanceFrameTest == false)
            {
                /* wait for all chirp interrupts of current frame */
                while(gLinkChirpCnt != ((frameCfg.chirpEndIdx - frameCfg.chirpStartIdx + 1U)* frameCfg.numLoops));
            }
            else
            {
                /* In case of advaced frame config, by this time last frame should be over.
                   Check if we recieved same number of chirp interrupts as given in last 
                   sub-frame of Advanced frame configuration */
                while(gLinkChirpCnt != advFrameCfg.frameSeq.subFrameCfg[advFrameCfg.frameSeq.numOfSubFrames-1U].numOfChirps);
            }
        }

        if((gLinkFrameCnt == frameCfg.numFrames) || (gLinkFrameCnt == (advFrameCfg.frameSeq.numFrames * 
                advFrameCfg.frameSeq.numOfSubFrames)))
        {
            MCPI_setFeatureTestResult ("All Frames Received", MCPI_TestResult_PASS);
        }
        else
        {
            MCPI_setFeatureTestResult ("All Frames are not Received", MCPI_TestResult_PASS);
        }

        /* mmWave Link stop sensor */
        if (MmwaveLink_sensorStop() < 0)
        {
            MCPI_setFeatureTestResult ("Stop sensor", MCPI_TestResult_FAIL);            
        }
        else
        {
            MCPI_setFeatureTestResult ("Stop sensor", MCPI_TestResult_PASS);
        }
        
        /* To verify that new Chirp configurations have been taken effect on RF-front end,
           we need to take time comparison of chirp interrupt arrival before and after dynamic 
           chirp config. As in DynChirp Config chirp-Idle Time has increased so after this come
           in effect, every chirp interrupt arrival will have extra time delay */
        if(gDynamicChirpTest == true)
        {
            /* Set the status value to notify that sensor stop is passed */
            dynChirpTestStatus |= 0x00F0;
            
            /* Average interval post dynamic chirp should be more than old chirp avg interval */
            if(avgChirpTimeInterval[1U] <= avgChirpTimeInterval[0U])
            {
                /* Set the status value to notify that Dynamic chirp config is not affective */
                dynChirpTestStatus |= 0x0A00;
                MCPI_setFeatureTestResult ("Dynamic Chirp config", MCPI_TestResult_FAIL);
            }
            else
            {
                /* Set the status value to notify that Dynamic chirp config is affective */
                dynChirpTestStatus |= 0x0F00;
                MCPI_setFeatureTestResult ("Dynamic Chirp config", MCPI_TestResult_PASS);
            }
        }

        if(gLinkMonitoringTest == true)
        {
            /* Print Monitoring Results */
            MmwaveLink_printMonitoringResult();
        }
    }
    else
    {
        /* mmWave Link Enable/Disable Continous mode */
        if (MmwaveLink_enableContMode(0) < 0)
        {
            MCPI_setFeatureTestResult ("Enable/Disable mmWave Link Continous mode", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Enable/Disable mmWave Link Continous modeg", MCPI_TestResult_PASS);  
    }

    /* If CQ test is enable then verify the CQ1 and CQ2 data which has been copied to 
       L3 memory using eDMA at the last chirp of last frame */
    if ((cqDataVerifyTest) && (eDMADataTransferDone == 1U))
    {
        /* verify CQ1 & CQ2 data and store the test result */
        gCqTestResult = MmwaveLink_VerifyCQData(RL_PLATFORM_MSS);
        /* verify CP-data and store the test result */
        gCpTestResult = MmwaveLink_VerifyCPData(RL_PLATFORM_MSS);
        if (gCqTestResult == 0)
        {
            MCPI_setTestResult ("CQ test result ", MCPI_TestResult_PASS);
        }
        else
        {
            MCPI_setTestResult ("CQ test result ", MCPI_TestResult_FAIL);
        }
        
        if (gCpTestResult == 0)
        {
            MCPI_setTestResult ("CP test result ", MCPI_TestResult_PASS);
        }
        else
        {
            MCPI_setTestResult ("CP test result ", MCPI_TestResult_FAIL);
        }
    }
    MCPI_setTestResult ();

    BIOS_exit(0);
    return;
}

/**
 *  @b Description
 *  @n
 *      Interrupt handler callback for frame start ISR.
 *
 *  @retval
 *      Not Applicable.
 */
static void Mmwavelink_frameInterrupCallBackFunc(uintptr_t arg)
{
    /* check if number of chirps in last frame is same as configured numbers */
    if((gLinkFrameCnt > 0) &&
       (gLinkChirpCnt != (((frameCfg.chirpEndIdx - frameCfg.chirpStartIdx) + 1U)*frameCfg.numLoops))&&
       (gLinkChirpCnt != advFrameCfg.frameSeq.subFrameCfg[0].numOfChirps))
    {
        chirpMissedError = true;
    }

    gLinkChirpCnt = 0;

    /* increment Frame count */
    gLinkFrameCnt++;    

    /* if Dynamic Chirp test is enabled then signal the main thread after receiving half
       the number of configured frames, so that application can configure and enable
       new chirps using Dynamic chirp configuration APIs */
    if((gDynamicChirpTest == true) && (gDynChirpConfigNum == 0U))
    {
        /* assuming frameCfg.numFrames is more than double of MAX_CHIRP_TIME_INTERVAL_STORE */
        if(((gLinkFrameCnt >= frameCfg.numFrames/2U) || (gLinkFrameCnt >= (advFrameCfg.frameSeq.numFrames * 
                advFrameCfg.frameSeq.numOfSubFrames)/2U))  && (gLinkChirpCnt == 0))
        {
            /* set tag to false to notify that by this time Dynamic chirp configuration is done */
            gDynChirpConfigNum = 1U;
            Semaphore_post (gLinkFrameSem);
        }
    }
    else
    {
        if((gLinkFrameCnt >= (frameCfg.numFrames)) || (gLinkFrameCnt >= (advFrameCfg.frameSeq.numFrames *
                 advFrameCfg.frameSeq.numOfSubFrames)))
        {
            Semaphore_post (gLinkFrameSem);
        }
    }

}

/**
 *  @b Description
 *  @n
 *      Interrupt handler callback for chirp available ISR.
 *
 *  @retval
 *      Not Applicable.
 */
static void Mmwavelink_chirpAvailInterrupCallBackFunc(uintptr_t arg)
{
    /* if Dynamic Chirp test is enabled then profile the time taken by chirps before and
       and after dynamic chirp configuration to ensure that new chirps are configured correctly */
    if(gDynamicChirpTest == true)
    {        
        if(gLinkChirpCnt == 0)
        {
            lastChirpIntTimeStamp =  Cycleprofiler_getTimeStamp();
        }
        else if(gLinkChirpCnt == (NUM_OF_DYNAMIC_CHIRP_CONFIG_SEG * 16U) - 1U)
        {   
            /* Compare the average of Dynamic chirp programmed
            avgChirpTimeInterval[0] = Before Dynamic chirps,
            avgChirpTimeInterval[1] = After Dynamic chirps */
            avgChirpTimeInterval[gDynChirpConfigNum] = Cycleprofiler_getTimeStamp() - lastChirpIntTimeStamp;
        }   
    }
    /* increment the Chirp count for current frame */
    gLinkChirpCnt++;

    /* CQ data verification test: trigger eDMA to copy data from CQ RAM to L3 mem.
     * Note - this test has been defined for legacy frame scenario, for advanced frame config user 
     *        needs to write seperate logic.
     */
    if (cqDataVerifyTest)
    {
        /* Trigger eDMA to trasnfer CQ1 and CQ2 RAM data to L3 memory at the end of last frame */
        if ((gLinkFrameCnt == frameCfg.numFrames) &&
            ((gLinkChirpCnt == ((frameCfg.chirpEndIdx - frameCfg.chirpStartIdx + 1U) * frameCfg.numLoops))))
        {
            MmwaveLink_triggerEdmaTransfer();
        }
    }
}

/**
 *  @b Description
 *  @n
 *      Entry point into the mmWave Link Unit Test
 *
 *  @retval
 *      Not Applicable.
 */
int32_t main (void)
{
    Task_Params     taskParams;
    SOC_Handle      socHandle;
    SOC_Cfg         socCfg;
    int32_t         errCode;

    SOC_SysIntListenerCfg    linkFrameCfg;
    /* Start the Timestamp counter */
    TSCL = 0;

    /* Initialize the SOC confiugration: */
    memset ((void *)&socCfg, 0, sizeof(SOC_Cfg));

    /* Populate the SOC configuration: We are bypassing the clock initialization
     * in the unit test here since the MSS Link unit test is doing this. */
    socCfg.clockCfg = SOC_SysClock_BYPASS_INIT;

    /* Initialize the SOC Module: */
    socHandle = SOC_init (&socCfg, &errCode);
    if (socHandle == NULL)
    {
        System_printf ("Error: SOC Module Initialization failed [Error code %d]\n", errCode);
        return -1;
    }

    ADCBuf_Params       ADCBufparams;

    /*****************************************************************************
     * Initialize ADCBUF driver
     *****************************************************************************/
    ADCBuf_init();

    /* ADCBUF Params initialize */
    ADCBuf_Params_init(&ADCBufparams);
    ADCBufparams.chirpThresholdPing = 1;
    ADCBufparams.chirpThresholdPong = 1;
    ADCBufparams.continousMode  = 0;
    
    adcbufHandle = ADCBuf_open(0, &ADCBufparams);
    if (adcbufHandle == NULL)
    {
        System_printf("Error: Unable to open the ADCBUF Instance\n");
        return -1;
    }
    System_printf("Debug: ADCBUF Instance %p has been reopened successfully\n", adcbufHandle);
    
    Semaphore_Params_init(&gLinkSemParams);
    gLinkSemParams.mode  = Semaphore_Mode_BINARY;
    gLinkFrameSem = Semaphore_create(0, &gLinkSemParams, NULL);

    /* Register frame interrupt */
    memset((void *)&linkFrameCfg, 0 , sizeof(SOC_SysIntListenerCfg));
    linkFrameCfg.systemInterrupt    = SOC_XWR16XX_DSS_INTC_EVENT_FRAME_START;
    linkFrameCfg.listenerFxn        = Mmwavelink_frameInterrupCallBackFunc;
    linkFrameCfg.arg                = (uintptr_t)NULL;
    if ((SOC_registerSysIntListener(socHandle, &linkFrameCfg, &errCode)) == NULL)
    {
        System_printf("Error: Unable to register Frame interrupt listener , error = %d\n", errCode);
        return -1;
    }
    
    /* Register chirp interrupt */
    memset((void *)&linkFrameCfg, 0 , sizeof(SOC_SysIntListenerCfg));
    linkFrameCfg.systemInterrupt    = SOC_XWR16XX_DSS_INTC_EVENT_CHIRP_AVAIL;
    linkFrameCfg.listenerFxn        = Mmwavelink_chirpAvailInterrupCallBackFunc;
    linkFrameCfg.arg                = (uintptr_t)NULL;
    if ((SOC_registerSysIntListener(socHandle, &linkFrameCfg, &errCode)) == NULL)
    {
        System_printf("Error: Unable to register Chirp interrupt listener , error = %d\n", errCode);
        return -1;
    }
    
    Cycleprofiler_init();

    /* Debug Message: */
    System_printf ("******************************************\n");
    System_printf ("Debug: Launching the mmwaveLink\n");
    System_printf ("******************************************\n");

    /* Initialize the Task Parameters. */
    Task_Params_init(&taskParams);
    taskParams.stackSize = 4*1024;
    Task_create(MmwaveLink_initTask, &taskParams, NULL);

    /* Debug Message: */
    System_printf ("Debug: Launching BIOS\n");

    /* Start BIOS */
    BIOS_start();
    return 0;
}

