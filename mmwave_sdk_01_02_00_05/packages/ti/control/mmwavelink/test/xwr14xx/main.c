/*
 *   @file  main.c
 *
 *   @brief
 *      This is the mmWave link unit test which executes on the R4 on
 *      the AR14xx.
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
#include <ti/sysbios/family/arm/v7r/vim/Hwi.h>

/* mmWave SDK Include Files: */
#include <ti/common/sys_common.h>
#include <ti/drivers/pinmux/pinmux.h>
#include <ti/drivers/esm/esm.h>
#include <ti/drivers/mailbox/mailbox.h>
#include <ti/control/mmwavelink/mmwavelink.h>
#include <ti/drivers/soc/soc.h>
#include <ti/drivers/crc/crc.h>
#include <ti/control/mmwavelink/include/rl_driver.h>
#include <ti/utils/testlogger/logger.h>

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

extern int32_t MmwaveLink_setAdvFrameConfig (void);
extern int32_t MmwaveLink_setBpmCommonConfig (void);
extern int32_t MmwaveLink_setBpmChirpConfig (void);
extern int32_t MmwaveLink_setContModeConfig (void);
extern int32_t MmwaveLink_enableContMode (uint8_t bEnable);
extern int32_t MmwaveLink_rfDynamicPowerSave (void);
extern int32_t MmwaveLink_setRfDevCfg (rlUInt32_t);
extern int32_t MmwaveLink_setGpAdcConfig (void);
extern int32_t MmwaveLink_progFilterConfig(void);

/**************************************************************************
 *************************** Extern Definitions ***************************
 **************************************************************************/

/**************************************************************************
 *************************** Global Variables *****************************
 **************************************************************************/
/*RF Monitoring test*/
bool gLinkMonitoringTest = false;

/*RF calibration test*/
bool gLinkCalibTest      = false;

/*RF Advance frame test*/
bool gLinkAdvanceFrameTest  = false;

/* RF Advance frame test
   Note: If gLinkContModeTest is enabled then gLinkMonitoringTest and gLinkCalibTest 
   must be disabled
*/
bool gLinkContModeTest  = false;

/*Binary phase modulation test*/
bool gLinkBpmEnableTest  = false;

/*RF program filter test*/
bool gLinkProgFiltTest  = false;

/*frame interrupt Semaphore  */
Semaphore_Handle gLinkFrameSem;
Semaphore_Params gLinkSemParams;

/**
 * @brief
 *  Initialize the MCPI Log Message Buffer
 */
MCPI_LOGBUF_INIT(9216);

/*Counter for number of frames*/
volatile int gLinkFrameCnt =0;

/* Frame Configuration */
extern const rlFrameCfg_t  frameCfg;

/* Advance Frame Configuration */
extern const rlAdvFrameCfg_t  advFrameCfg;

/**************************************************************************
 ************************** mmWave Link Functions *************************
 **************************************************************************/
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

    /* Set mmWave TX power config to the BSS */
    if (MmwaveLink_setRfTxPowMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF Tx power monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF Tx power monitor Config", MCPI_TestResult_PASS);

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

    if (MmwaveLink_setRfPllContrlVoltMonConfig() < 0)
    {
       MCPI_setFeatureTestResult ("Set mmWave Link MmwaveLink_setRfPllContrlVoltMonConfig Config", MCPI_TestResult_FAIL);
       return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link MmwaveLink_setRfPllContrlVoltMonConfig Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfRxGainPhaMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF RX gain and phase monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF RX gain and phase monitor Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfRxNoiseMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF RX noise monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF RX noise monitor Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfTxPowMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link Tx power monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF Tx power monitor Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfTxBallbreakMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link Tx ballbreak monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF Tx ballbreak monitor Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfTxGainPhaseMismatchMonConfig() < 0)
    {
       MCPI_setFeatureTestResult ("Set mmWave Link TX gain and phase mismatch monitor Config", MCPI_TestResult_FAIL);
       return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF TX gain and phase mismatch monitor Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfTxBpmMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link TX BPM monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF TX BPM Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfTempMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF temperature monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF temperature monitor Config", MCPI_TestResult_PASS);

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

    if (MmwaveLink_setRfRxIfStageMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link RF RX IF stage monitor Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link RF RX IF stage monitor Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfPmClkLoIntAnaSignalsMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link Rf pm,clock  Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link Rf pm,clock Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfGpadcIntAnaSignalsMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link GPADC Internal Analog Signals Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link GPADC Internal Analog Signals Config", MCPI_TestResult_PASS);

    if (MmwaveLink_setRfPllContrlVoltMonConfig() < 0)
    {
        MCPI_setFeatureTestResult ("Set mmWave Link MmwaveLink_setRfPllContrlVoltMonConfig Config", MCPI_TestResult_FAIL);
        return -1;
    }
    MCPI_setFeatureTestResult ("Set mmWave Link MmwaveLink_setRfPllContrlVoltMonConfig Config", MCPI_TestResult_PASS);
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
    /* Debug Message: */
    System_printf("Debug: Launched the mmwaveLink Initialization Task\n");

    /* Initialize the test logger framework: */
    MCPI_Initialize();

    /* Initialize the Mailbox */
    Mailbox_init(MAILBOX_TYPE_MSS);

    /* Setup and initialize the mmWave Link: */
    if (MmwaveLink_initLink (RL_AR_DEVICETYPE_14XX,RL_PLATFORM_MSS) < 0)
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

    /* mmWave Link set Async event configuration */
    if (MmwaveLink_setRfDevCfg(0) < 0)
    {
        MCPI_setFeatureTestResult ("Set Async event config", MCPI_TestResult_FAIL);
        return;
    }
    MCPI_setFeatureTestResult ("Set Async event config", MCPI_TestResult_PASS);

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
    }

    if(gLinkContModeTest == false)
    {

        /* mmWave Link start sensor */
        if (MmwaveLink_sensorStart() < 0)
        {
            MCPI_setFeatureTestResult ("Start sensor", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Start sensor", MCPI_TestResult_PASS);


        /* wait till all frame interrupts are received */
        Semaphore_pend (gLinkFrameSem, BIOS_WAIT_FOREVER);

        /* mmWave Link stop sensor */
        if (MmwaveLink_sensorStop() < 0)
        {
            MCPI_setFeatureTestResult ("Stop sensor", MCPI_TestResult_FAIL);
            return;
        }
        MCPI_setFeatureTestResult ("Stop sensor", MCPI_TestResult_PASS);
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
    gLinkFrameCnt ++;
    if(gLinkAdvanceFrameTest == false)
    {
        if(gLinkFrameCnt >= frameCfg.numFrames)
        {
            Semaphore_post (gLinkFrameSem);
        }
    }
    else
    {
        if(gLinkFrameCnt >= (advFrameCfg.frameSeq.numFrames * advFrameCfg.frameSeq.numOfSubFrames))
        {
            Semaphore_post (gLinkFrameSem);
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
    Task_Params	    taskParams;
    int32_t         errCode;
    SOC_Handle      socHandle;
    SOC_Cfg         socCfg;

    /* Initialize the ESM: Dont clear errors as TI RTOS does it */
    ESM_init(0U);
    SOC_SysIntListenerCfg    linkFrameCfg;

    /* Initialize the SOC confiugration: */
    memset ((void *)&socCfg, 0, sizeof(SOC_Cfg));

    /* Populate the SOC configuration: */
    socCfg.clockCfg = SOC_SysClock_INIT;

    /* Initialize the SOC Module: This is done as soon as the application is started
     * to ensure that the MPU is correctly configured. */
    socHandle = SOC_init (&socCfg, &errCode);
    if (socHandle == NULL)
    {
        System_printf ("Error: SOC Module Initialization failed [Error code %d]\n", errCode);
        return -1;
    }

    /* Wait for BSS powerup */
    if (SOC_waitBSSPowerUp(socHandle, &errCode) < 0)
    {
        /* Debug Message: */
        System_printf ("Debug: SOC_waitBSSPowerUp failed with Error [%d]\n", errCode);
        return 0;
    }

    Semaphore_Params_init(&gLinkSemParams);
    gLinkSemParams.mode  = Semaphore_Mode_BINARY;
    gLinkFrameSem = Semaphore_create(0, &gLinkSemParams, NULL);

    /* Register frame interrupt */
    memset((void *)&linkFrameCfg, 0 , sizeof(SOC_SysIntListenerCfg));
    linkFrameCfg.systemInterrupt    = SOC_XWR14XX_DSS_FRAME_START_IRQ;
    linkFrameCfg.listenerFxn        = Mmwavelink_frameInterrupCallBackFunc;
    linkFrameCfg.arg                = (uintptr_t)NULL;
    if ((SOC_registerSysIntListener(socHandle, &linkFrameCfg, &errCode)) == NULL)
    {
        System_printf("Error: Unable to register synth linear interrupt listener , error = %d\n", errCode);
        return -1;
    }

    /* Debug Message: */
    System_printf ("******************************************\n");
    System_printf ("Debug: Launching the mmwaveLink\n");
    System_printf ("******************************************\n");

    /* Initialize the Task Parameters. */
    Task_Params_init(&taskParams);
    taskParams.priority = 5;
    Task_create(MmwaveLink_initTask, &taskParams, NULL);

    /* Start BIOS */
    BIOS_start();
    return 0;
}

