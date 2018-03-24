/*
 *   @file  link_test.c
 *
 *   @brief
 *      The file contains common functions which test the mmWave Link API
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
#include <ti/drivers/edma/edma.h>

#ifdef SUBSYS_MSS
#include <ti/sysbios/family/arm/v7r/vim/Hwi.h>
#else
#include <ti/sysbios/family/c64p/Hwi.h>
#endif

/* mmWave SDK Include Files: */
#include <ti/common/sys_common.h>
#include <ti/drivers/mailbox/mailbox.h>
#include <ti/control/mmwavelink/mmwavelink.h>
#include <ti/drivers/crc/crc.h>
#include <ti/control/mmwavelink/include/rl_driver.h>


/* Test include files: */
#include <ti/control/mmwavelink/test/common/link_testcase_setting.h>
#include <ti/control/mmwavelink/test/common/link_testcase_config.h>

#define EDMA_CHANNEL_CQ_DATA  EDMA_TPCC0_REQ_FREE_0
#define CQ1_RAM_ADDRESS       0x21028800U
#define L3_MEM_ADDRESS        0x20000000U

/**************************************************************************
 *************************** Local Structures *****************************
 **************************************************************************/

/**
 * @brief
 *  Mmwave Link Master Control Block
 *
 * @details
 *  The structure is used to hold all the relevant information for the
 *  Mmwave Link.
 */
typedef struct MmwaveLink_MCB
{
    /**
     * @brief   Handle to the BSS Mailbox
     */
    Mbox_Handle              bssMailbox;

    /**
     * @brief   Semaphore handle for the mmWave Link
     */
    Semaphore_Handle            linkSemaphore;

    /**
     * @brief   mmWave Link Spawning function
     */
    RL_P_OSI_SPAWN_ENTRY        spawnFxn;

    /**
     * @brief   Status of the BSS:
     */
    volatile uint32_t           bssStatus;

    /**
     * @brief   Counter which tracks of the number of times the spawn function was
     * overrun.
     */
    uint32_t                    spawnOverrun;
    /**
     * @brief   Handle to the CRC Channel
     */
    CRC_Handle                  crcHandle;
}MmwaveLink_MCB;

/**************************************************************************
 *************************** Global Definitions ***************************
 **************************************************************************/

/* Global Variable for tracking information required by the mmWave Link */
MmwaveLink_MCB    gMmwaveLinkMCB;
uint32_t gMonitorHdrCnt = 0U;
uint32_t gInitTimeCalibStatus = 0U;
uint32_t gRunTimeCalibStatus = 0U;
volatile uint32_t gFrameStartStatus = 0U;
rlUInt16_t gMonitoringStatus = 0U;
rlUInt8_t isGetGpAdcMeasData = 0U;

RL_P_EVENT_HANDLER g_MailboxInterruptFunc;

/* eDMA handler */
EDMA_Handle EdmaHandle;
/* Tag set based on eDMA data trasnfer done */
volatile uint8_t eDMADataTransferDone = 0U;

/* received GPAdc Data over Async Event */
rlRecvdGpAdcData_t rcvGpAdcData = {0};

/*! CQ MEMORY */
#pragma DATA_SECTION(gMmwCQ, ".cqdata");
uint8_t gMmwCQ [8*1024];

/* Monitoring Report Structures */
typedef struct monitoringDataAe
{
    rlMonTempReportData_t monTempReport;
    rlMonRxGainPhRep_t    monRxGainPhRep;
    rlMonRxNoiseFigRep_t  monNoiseFigRep;
    rlMonRxIfStageRep_t   monRxIfStageRep;
    rlMonTxPowRep_t       monTx1powRep;
    rlMonTxPowRep_t       monTx2powRep;
    rlMonTxBallBreakRep_t monTx1BallbreakRep;
    rlMonTxBallBreakRep_t monTx2BallbreakRep;
    rlMonTxGainPhaMisRep_t monTxGainPhMisMatchRep;
    rlMonTxBpmRep_t       monTx1BpmRep;
    rlMonTxBpmRep_t       monTx2BpmRep;
    rlMonSynthFreqRep_t   monSynthFreqRep;
    rlMonExtAnaSigRep_t   monExtAnaSigRep;
    rlMonTxIntAnaSigRep_t monTx1IntAnaSigRep;
    rlMonTxIntAnaSigRep_t monTx2IntAnaSigRep;
    rlMonRxIntAnaSigRep_t monRxIntAnaSigRep;
    rlMonPmclkloIntAnaSigRep_t monPmClkIntAnaSigRep;
    rlMonGpadcIntAnaSigRep_t   monGpadcIntAnaSigRep;
    rlMonPllConVoltRep_t    monPllConvVoltRep;
    rlMonDccClkFreqRep_t    monDccClkFreqRep;
    rlMonRxMixrInPwrRep_t   monRxMixrInPwrRep;
    rlRfInitomplete_t monRfInit;
}monitoringDataAe_t;

monitoringDataAe_t gMonDataAeStrct;

/* Async Event Enable and Direction configuration */
rlRfDevCfg_t rfDevCfg = {0};

/**************************************************************************
 *************************** Extern Definitions ***************************
 **************************************************************************/
extern rlInt32_t Osal_mutexCreate(rlOsiMutexHdl_t* mutexHdl, rlInt8_t* name);
extern rlInt32_t Osal_mutexLock(rlOsiMutexHdl_t* mutexHdl, rlOsiTime_t timeout);
extern rlInt32_t Osal_mutexUnlock(rlOsiMutexHdl_t* mutexHdl);
extern rlInt32_t Osal_mutexDelete(rlOsiMutexHdl_t* mutexHdl);
extern rlInt32_t Osal_semCreate(rlOsiSemHdl_t* semHdl, rlInt8_t* name);
extern rlInt32_t Osal_semWait(rlOsiSemHdl_t* semHdl, rlOsiTime_t timeout);
extern rlInt32_t Osal_semSignal(rlOsiSemHdl_t* semHdl);
extern rlInt32_t Osal_semDelete(rlOsiSemHdl_t* semHdl);
extern rlInt32_t Osal_delay(rlUInt32_t delay);

/**************************************************************************
 ************************* Link Unit Test Functions ***********************
 **************************************************************************/

/**
 *  @b Description
 *  @n
 *      Mailbox registered function which is invoked on the reception of data
 *
 *  @retval
 *      Success - Communicate Interface Channel Handle
 *  @retval
 *      Error   - NULL
 */
static void MmwaveLink_mboxCallbackFxn (Mbox_Handle handle, Mailbox_Type remoteEndpoint)
{
    /* Indicate to the Radar Link that a message has been received. */
    g_MailboxInterruptFunc(0, NULL);
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to open the communication
 *      interface channel
 *
 *  @retval
 *      Success - Communicate Interface Channel Handle
 *  @retval
 *      Error   - NULL
 */
static rlComIfHdl_t MmwaveLink_mboxOpen(rlUInt8_t deviceIndex, uint32_t flags)
{
    Mailbox_Config  cfg;
    int32_t         errCode;

    /* Initialize the mailbox configuration: */
    if(Mailbox_Config_init(&cfg) < 0)
    {
        System_printf("Error: Unable to initialize mailbox configuration\n");
        return NULL;
    }

    cfg.writeMode    = MAILBOX_MODE_POLLING;
    cfg.readMode     = MAILBOX_MODE_CALLBACK;
    cfg.readCallback = MmwaveLink_mboxCallbackFxn;

    /* Open the Mailbox to the BSS */
    gMmwaveLinkMCB.bssMailbox = Mailbox_open(MAILBOX_TYPE_BSS, &cfg, &errCode);
    if (gMmwaveLinkMCB.bssMailbox == NULL)
    {
        System_printf("Error: Unable to open the Mailbox Instance [Error code %d]\n", errCode);
        return NULL;
    }
    System_printf("Debug: BSS Mailbox Handle %p\n", gMmwaveLinkMCB.bssMailbox);
    return gMmwaveLinkMCB.bssMailbox;
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to close the communication
 *      interface channel
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static int32_t MmwaveLink_mboxClose(rlComIfHdl_t fd)
{
    int32_t errCode;

    /* Close the Mailbox */
    errCode = Mailbox_close ((Mbox_Handle)fd);
    if (errCode < 0)
        System_printf ("Error: Unable to close the BSS Mailbox [Error code %d]\n", errCode);

    return errCode;
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to read data from the communication
 *      interface channel
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static int32_t MmwaveLink_mboxRead(rlComIfHdl_t fd, uint8_t* pBuff, uint16_t len)
{
    return Mailbox_read((Mbox_Handle)fd, pBuff, len);
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to write data to the communication
 *      interface channel
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static int32_t MmwaveLink_mboxWrite(rlComIfHdl_t fd, uint8_t* pBuff, uint16_t len)
{
    int32_t    status;
    /*
      Currently, the mmwavelink can not detect the error condition where it did not receive a mailbox layer ACK from BSS.

      For instance:
      - The mmwavelink may try to send a message before an ACK was received for the previous message.
      - The mmwavelink may try to resend a message that did not receive a mmwavelink layer ACK back from BSS. It is possible that the
      message did not receive a mailbox layer ACK as well from BSS.

      In either case, Mailbox_writeReset() has to be called before another message is sent to BSS.

      The mmwavelink has no hooks to call the Mailbox_writeReset().
      Therefore, a write reset is done if it is detected that a mailbox layer ACK was not received for the
      previous message (MAILBOX_ETXFULL).
     */

    status = Mailbox_write((Mbox_Handle)fd, pBuff, len);
    if(status == MAILBOX_ETXFULL)
    {
        Mailbox_writeReset((Mbox_Handle)fd);
        status = Mailbox_write((Mbox_Handle)fd, pBuff, len);
    }

    return status;
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to power on the AR1XX Device
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static rlInt32_t MmwaveLink_enableDevice(rlUInt8_t deviceIndex)
{
    return 0;
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to power off the AR1XX Device
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static rlInt32_t MmwaveLink_disableDevice(rlUInt8_t deviceIndex)
{
    System_printf("Debug: Disabling the device\n");
    return 0;
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to mask the interrupts.
 *      In the case of Mailbox communication interface the driver will
 *      handle the interrupt management. This function is a dummy stub
 *
 *  @retval
 *      Not applicable
 */
static void MmwaveLink_maskHostIRQ(rlComIfHdl_t fd)
{
    return;
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to umask the interrupts.
 *      In the case of the mailbox driver we will flush out and close the
 *      read buffer.
 *
 *  @retval
 *      Not applicable
 */
void MmwaveLink_unmaskHostIRQ(rlComIfHdl_t fd)
{
    Mailbox_readFlush((Mbox_Handle)fd);
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to register the Interrupt Handler.
 *      In the case of the Mailbox the driver does the interrupt registeration and
 *      so this function is a dummy stub.
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static rlInt32_t MmwaveLink_registerInterruptHandler(rlUInt8_t deviceIndex, RL_P_EVENT_HANDLER pHandler, void* pValue)
{
    g_MailboxInterruptFunc = pHandler;
    return 0;
}

static void MmwaveLink_transferCompletionCallbackFxn(uintptr_t arg, uint8_t transferCompletionCode)
{
    /* set the TAG to indicate eDMA data transfer is done */
    eDMADataTransferDone++;
}

/* initialize eDMA module */
int32_t MmwaveLink_initEDMA(uint8_t instance)
{
    int32_t    retVal = 0;

    retVal = EDMA_init(instance);
    if (retVal != EDMA_NO_ERROR)
    {
        System_printf ("Debug: EDMA instance %d initialization returned error %d\n", instance, retVal);
        return -1;
    }
    System_printf ("Debug: EDMA instance %d has been initialized\n", instance);
    return 0;
}

/**
 *  @b Description
 *  @n
 *      Open EDMA driver Instance for ADCBUF data buffer copy.
 *
 *  @param[in]  instance
 *      EDMA driver instance.
 *
 *  @retval
 *      Success     - EDMA handle
 *      Fail        - NULL pointer
 */
static EDMA_Handle MmwaveLink_openEDMA(uint8_t instance)
{
    EDMA_errorInfo_t              EDMAErrorInfo;
    EDMA_transferControllerErrorInfo_t EDMATransferControllerErrorInfo;
    EDMA_Handle                   edmaHndle = NULL;
    EDMA_instanceInfo_t           instanceInfo;
    int32_t                       retVal = 0;

    memset(&EDMAErrorInfo, 0, sizeof(EDMAErrorInfo));
    memset(&EDMATransferControllerErrorInfo, 0, sizeof(EDMATransferControllerErrorInfo));

    /* Open the EDMA Instance */
    edmaHndle = EDMA_open(instance, &retVal, &instanceInfo);
    if (edmaHndle == NULL)
    {
        System_printf("Error: Unable to open the edma Instance(%d), errorCode = %d\n",instance, retVal);
        return NULL;
    }
    
    return edmaHndle;
}

/* configure eDMA channel to copy CQ data to L3 memory */
int32_t MmwaveLink_ConfigEdma(EDMA_Handle handle, uint8_t chId, 
                                    uint32_t* pSrcAddress, uint32_t * pDestAddress,
                                    uint16_t aCount, uint16_t bCount, uint16_t cCount, 
                                    uint16_t linkChId)
{
    EDMA_channelConfig_t config;
    int32_t errorCode = EDMA_NO_ERROR;

    config.channelId = chId;
    config.channelType = (uint8_t)EDMA3_CHANNEL_TYPE_DMA;
    config.paramId = chId;
    config.eventQueueId = 0;

    config.paramSetConfig.sourceAddress = (uint32_t) pSrcAddress;
    config.paramSetConfig.destinationAddress = (uint32_t) pDestAddress;

    config.paramSetConfig.aCount = aCount;
    config.paramSetConfig.bCount = bCount;
    config.paramSetConfig.cCount = cCount;
    config.paramSetConfig.bCountReload = config.paramSetConfig.bCount;

    config.paramSetConfig.sourceBindex = 0;
    config.paramSetConfig.destinationBindex = 0;

    config.paramSetConfig.sourceCindex = 0;
    config.paramSetConfig.destinationCindex = 0;

    config.paramSetConfig.linkAddress = EDMA_NULL_LINK_ADDRESS;
    config.paramSetConfig.transferType = (uint8_t)EDMA3_SYNC_A;
    config.paramSetConfig.transferCompletionCode = 0;
    config.paramSetConfig.sourceAddressingMode = (uint8_t) EDMA3_ADDRESSING_MODE_LINEAR;
    config.paramSetConfig.destinationAddressingMode = (uint8_t) EDMA3_ADDRESSING_MODE_LINEAR;

    /* don't care because of linear addressing modes above */
    config.paramSetConfig.fifoWidth = (uint8_t) EDMA3_FIFO_WIDTH_8BIT;

    config.paramSetConfig.isStaticSet = false;
    config.paramSetConfig.isEarlyCompletion = false;
    config.paramSetConfig.isFinalTransferInterruptEnabled = true;
    config.paramSetConfig.isIntermediateTransferInterruptEnabled = false;
    config.paramSetConfig.isFinalChainingEnabled = false;
    config.paramSetConfig.isIntermediateChainingEnabled = false;
    config.transferCompletionCallbackFxn = MmwaveLink_transferCompletionCallbackFxn;

    if ((errorCode = EDMA_configChannel(handle, &config, true)) != EDMA_NO_ERROR)
    {
        System_printf("Error: EDMA_configChannel() failed with error code = %d\n", errorCode);
    }
    return(errorCode);
}

/* Trigger eDMA transfer */
void MmwaveLink_triggerEdmaTransfer()
{
    EDMA_startDmaTransfer(EdmaHandle, EDMA_CHANNEL_CQ_DATA);
}

/* intialize and configure eDMA to copy CQ Data to L3 memory */
int MmwaveLink_CQedmaSetup(void)
{
    
    MmwaveLink_initEDMA(0);
    EdmaHandle = MmwaveLink_openEDMA(0);
    if(EdmaHandle == NULL)
    {
        System_printf("Error: MmwaveLink_CQedmaSetup() MmwaveLink_openEDMA failed with null handle.\n");
        return -1;
    }
    /* Configure eDMA */
    MmwaveLink_ConfigEdma(EdmaHandle, EDMA_CHANNEL_CQ_DATA, 
                          (uint32_t *)CQ1_RAM_ADDRESS, 
                          (uint32_t *)L3_MEM_ADDRESS,
                          0x1000, 1, 1, EDMA_NUM_DMA_CHANNELS);
    EDMA3EnableTransfer(EDMA_CC0_BASE_ADDRESS, EDMA_CHANNEL_CQ_DATA, EDMA3_TRIG_MODE_EVENT);
    return 0;
}


volatile int8_t cqTestStatus = -10;
volatile int8_t cpTestStatus = -10;

/**
 *  @b Description
 *  @n
 *      This function is to verify CQ1 and CQ2 RAM data for RX signal and image band monitor
 *      and saturation monitor for each slices which device has been configured.
 *
 *  @param : coreType- MSS or DSS core
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int8_t MmwaveLink_VerifyCQData(uint8_t coreType)
{
    unsigned char numSlices, i, maxByteLoc;
    volatile unsigned char *cq1MemL3Loc;
    volatile unsigned char *cq2MemL3Loc;

    if (coreType == RL_PLATFORM_MSS)
    {
        cq1MemL3Loc = (unsigned char*) 0x51000000U;
        cq2MemL3Loc = (unsigned char*) 0x51000800U;
    }
    else
    {
        cq1MemL3Loc = (unsigned char*) 0x20000000U;
        cq2MemL3Loc = (unsigned char*) 0x20000800U;
    }

    /* CQ data will be available in CQ RAM which is a ping-pong memory when the CQ monitors are
       enabled. Currently supported CQ monitors are RL_RF_RX_SATURATION_MON_CONF_SB for CQ2 and
       RL_RF_RX_SIGIMG_MON_CONF_SB for CQ1. CQ data will be refreshed every chirp by the hardware.
       User has to ensure that before the next chirp finishes, the current chirps’ CQ data is either
       processed or transferred to a local memory for further processing.
     */
    
    /* check for timeSlice value for CQ1 and CQ2 as configured to device via
       rlRfRxIfSatMonConfig and rlRfRxSigImgMonConfig API */
    if ((CQ_NUM_SLICES != cq1MemL3Loc[0]) || (CQ_NUM_SLICES != cq2MemL3Loc[0]))
    {
        cqTestStatus = -1;
    }
    else
    {
        numSlices = cq1MemL3Loc[0];
        /* get max byte location which application needs to 
           read starting from numSlice in CQ1-RAM memory */
        maxByteLoc = (4*(numSlices+1)/2);
        for (i = 2; i < maxByteLoc; i+=2)
        {
            /* check if any signal band data is less than image band data for all 
               primary and secondary slices, then set error  */
            if (((cq1MemL3Loc[i] / 2) * -1) < ((cq1MemL3Loc[i+1] /2)*-1))
            {
                cqTestStatus = -2;
                break;
            }
        }
        
        /* if conditions are not matched for all slices then set success */
        if (i == maxByteLoc)
        {
            cqTestStatus = 0;
        }
        
    }
    return cqTestStatus;
}

/**
 *  @b Description
 *  @n
 *      Verify Chirp parameters
 *
 *  @param : coreType- MSS or DSS core
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int8_t MmwaveLink_VerifyCPData(uint8_t coreType)
{
    uint8_t cp0DataBuff[16] = {0};
    volatile uint16_t chirpNum, channelNum, profileId;

    if (coreType == RL_PLATFORM_MSS)
    {
        /* copy CP0 data to local buffer */
        memcpy((void*)&cp0DataBuff[0], (void*)0x52070020U, 16U);
    }
    else
    {
        /* copy CP0 data to local buffer */
       memcpy((void*)&cp0DataBuff[0], (void*)0x21070020U, 16U);
    }
    
    /* Please refer mmWaveLink or ICD for Chirp parameter (CP) information fields */
    chirpNum =  (((cp0DataBuff[3] & 0x0F)<< 8) | (cp0DataBuff[2]));
    channelNum = (cp0DataBuff[0] & 0x03);
    profileId =  ((cp0DataBuff[0] >> 2) & 0x0F);
    /* verify CP-0 data for channel 0 */
    if ((channelNum != 0U) || (profileId != chirpCfg[0].profileId) || \
         (chirpNum != ((frameCfg.chirpEndIdx - frameCfg.chirpStartIdx) * frameCfg.numLoops)))
    {
        cpTestStatus = -1;
    }
    else
    {
        cpTestStatus = 0;
    }

    chirpNum =  (((cp0DataBuff[7] & 0x0F)<< 8) | (cp0DataBuff[6]));
    channelNum = (cp0DataBuff[4] & 0x03);
    profileId =  ((cp0DataBuff[4] >> 2) & 0x0F);
    /* verify CP-0 data for channel 1 */
    if ((channelNum != 1U) || (profileId != chirpCfg[0].profileId) || \
        (chirpNum != ((frameCfg.chirpEndIdx - frameCfg.chirpStartIdx) * frameCfg.numLoops)))
    {
        cpTestStatus -=1;
    }
    else
    {
        cpTestStatus = 0;
    }

    return cpTestStatus;
}

/**
 *  @b Description
 *  @n
 *      Print RF Monitoring Results
 *
 *  @retval
 *      Not applicable
 */
void MmwaveLink_printMonitoringResult()
{
    System_printf ("--------------Debug: Monitoring Report--------------\n");
    System_printf ("RL_RF_AE_MON_TEMPERATURE_REPORT_SB [0x%x] \n", gMonDataAeStrct.monTempReport.statusFlags);
    System_printf ("RL_RF_AE_MON_RX_GAIN_PHASE_REPORT [0x%x] \n", gMonDataAeStrct.monRxGainPhRep.statusFlags);
    System_printf ("RL_RF_AE_MON_RX_NOISE_FIG_REPORT [0x%x] \n", gMonDataAeStrct.monNoiseFigRep.statusFlags);
    System_printf ("RL_RF_AE_MON_RX_IF_STAGE_REPORT [0x%x] \n", gMonDataAeStrct.monRxIfStageRep.statusFlags);
    System_printf ("RL_RF_AE_MON_TX0_POWER_REPORT [0x%x] \n", gMonDataAeStrct.monTx1powRep.statusFlags);
    System_printf ("RL_RF_AE_MON_TX1_POWER_REPORT [0x%x] \n", gMonDataAeStrct.monTx2powRep.statusFlags);
    System_printf ("RL_RF_AE_MON_TX0_BALLBREAK_REPORT [0x%x] \n", gMonDataAeStrct.monTx1BallbreakRep.statusFlags);
    System_printf ("RL_RF_AE_MON_TX1_BALLBREAK_REPORT [0x%x] \n", gMonDataAeStrct.monTx2BallbreakRep.statusFlags);
    System_printf ("RL_RF_AE_MON_TX_GAIN_MISMATCH_REPORT [0x%x] \n", gMonDataAeStrct.monTxGainPhMisMatchRep.statusFlags);
    System_printf ("RL_RF_AE_MON_TX0_BPM_REPORT [0x%x] \n", gMonDataAeStrct.monTx1BpmRep.statusFlags);
    System_printf ("RL_RF_AE_MON_TX1_BPM_REPORT [0x%x] \n", gMonDataAeStrct.monTx2BpmRep.statusFlags);
    System_printf ("RL_RF_AE_MON_SYNTHESIZER_FREQ_REPORT [0x%x] \n", gMonDataAeStrct.monSynthFreqRep.statusFlags);
    System_printf ("RL_RF_AE_MON_EXT_ANALOG_SIG_REPORT [0x%x] \n", gMonDataAeStrct.monExtAnaSigRep.statusFlags);
    System_printf ("RL_RF_AE_MON_TX0_INT_ANA_SIG_REPORT [0x%x] \n", gMonDataAeStrct.monTx1IntAnaSigRep.statusFlags);
    System_printf ("RL_RF_AE_MON_TX1_INT_ANA_SIG_REPORT [0x%x] \n", gMonDataAeStrct.monTx2IntAnaSigRep.statusFlags);
    System_printf ("RL_RF_AE_MON_RX_INT_ANALOG_SIG_REPORT [0x%x] \n", gMonDataAeStrct.monRxIntAnaSigRep.statusFlags);
    System_printf ("RL_RF_AE_MON_PMCLKLO_INT_ANA_SIG_REPORT [0x%x] \n", gMonDataAeStrct.monPmClkIntAnaSigRep.statusFlags);
    System_printf ("RL_RF_AE_MON_GPADC_INT_ANA_SIG_REPORT [0x%x] \n", gMonDataAeStrct.monGpadcIntAnaSigRep.statusFlags);
    System_printf ("RL_RF_AE_MON_PLL_CONTROL_VOLT_REPORT [0x%x] \n", gMonDataAeStrct.monPllConvVoltRep.statusFlags);
    System_printf ("RL_RF_AE_MON_DCC_CLK_FREQ_REPORT [0x%x] \n", gMonDataAeStrct.monDccClkFreqRep.statusFlags);
    System_printf ("RL_RF_AE_MON_RX_MIXER_IN_PWR_REPORT [0x%x] \n", gMonDataAeStrct.monRxMixrInPwrRep.statusFlags);
    System_printf ("----------------------------------------------------\n");
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to handle asynchronous events
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
 uint16_t errorStatusCnt[5] = {0};
 
static void MmwaveLink_asyncEventHandler(uint8_t devIndex, uint16_t sbId, uint16_t sbLen, uint8_t *payload)
{
    uint16_t asyncSB = RL_GET_SBID_FROM_UNIQ_SBID(sbId);
    uint16_t msgId   = RL_GET_MSGID_FROM_SBID(sbId);

    /* Process the received message: */
    switch (msgId)
    {
        case RL_RF_ASYNC_EVENT_MSG:
        {
            /* Received Asychronous Message: */
            switch (asyncSB)
            {
                case RL_RF_AE_CPUFAULT_SB:
                {
                    System_printf ("Debug: CPU Fault has been detected\n");
                    break;
                }
                case RL_RF_AE_ESMFAULT_SB:
                {
                    System_printf ("Debug: ESM Fault has been detected\n");
                    break;
                }
                case RL_RF_AE_INITCALIBSTATUS_SB:
                {
                    gInitTimeCalibStatus = ((rlRfInitomplete_t*)payload)->calibStatus;
                    if(gInitTimeCalibStatus != 0U)
                    {
                        System_printf ("Debug: Init time calibration status [0x%x] \n", gInitTimeCalibStatus);
                    }
                    else
                    {
                        System_printf ("Error: All Init time calibrations Failed:\n");
                    }
                    break;
                }
                case RL_RF_AE_FRAME_TRIGGER_RDY_SB:
                {
                    gFrameStartStatus = 1U;
                    break;
                }
                case RL_RF_AE_MON_TIMING_FAIL_REPORT_SB:
                {
                    System_printf ("Debug: Monitoring FAIL Report received \n");
                    break;
                }
                case RL_RF_AE_RUN_TIME_CALIB_REPORT_SB:
                {
                    gRunTimeCalibStatus = ((rlRfRunTimeCalibReport_t*)payload)->calibErrorFlag;
                    if(gRunTimeCalibStatus == 0U)
                    {
                        System_printf ("Error: All Run time calibrations Failed:\n");
                    }
                    break;
                }
                case RL_RF_AE_MON_DIG_PERIODIC_REPORT_SB:
                {
                    extern volatile uint32_t gLinkFrameCnt;
                    errorStatusCnt[2] = gLinkFrameCnt;
                    break;
                }
                case RL_RF_AE_MON_TEMPERATURE_REPORT_SB:
                {
                    extern volatile uint32_t gLinkFrameCnt;
                    errorStatusCnt[1] = gLinkFrameCnt;
                    memcpy(&gMonDataAeStrct.monTempReport, payload, sizeof(rlMonTempReportData_t));

                    gMonitoringStatus = ((rlMonTempReportData_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error: Temerature monitor report Failed:%d\n",((rlMonTempReportData_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_RX_GAIN_PHASE_REPORT:
                {
                    extern volatile uint32_t gLinkFrameCnt;
                    errorStatusCnt[0] = gLinkFrameCnt;
                    memcpy(&gMonDataAeStrct.monRxGainPhRep, payload, sizeof(rlMonRxGainPhRep_t));
                    gMonitoringStatus = ((rlMonRxGainPhRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        //System_printf ("Error: Rx Gain Phase Report Failed:%d\n",((rlMonRxGainPhRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_RX_NOISE_FIG_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monNoiseFigRep, payload, sizeof(rlMonRxNoiseFigRep_t));
                    gMonitoringStatus = ((rlMonRxNoiseFigRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        //System_printf ("Error: Rx Noise Fig Report Failed:%d\n",((rlMonRxNoiseFigRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_RX_IF_STAGE_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monRxIfStageRep, payload, sizeof(rlMonRxIfStageRep_t));
                    gMonitoringStatus = ((rlMonRxIfStageRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  Rx IF Stage Report Failed:%d\n",((rlMonRxIfStageRep_t*)payload)->errorCode);
                    }

                    break;
                }
                case RL_RF_AE_MON_TX0_POWER_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monTx1powRep, payload, sizeof(rlMonTxPowRep_t));
                    gMonitoringStatus = ((rlMonTxPowRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  Rx TX0 Power Report Failed:[0x%x]\n",((rlMonTxPowRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_TX1_POWER_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monTx2powRep, payload, sizeof(rlMonTxPowRep_t));
                    gMonitoringStatus = ((rlMonTxPowRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  Rx TX1 Power Report Failed:[0x%x]\n",((rlMonTxPowRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_TX0_BALLBREAK_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monTx1BallbreakRep, payload, sizeof(rlMonTxBallBreakRep_t));
                    gMonitoringStatus = ((rlMonTxBallBreakRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  Rx TX0 Ballbreak Report Failed:[0x%x]\n", ((rlMonTxBallBreakRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_TX1_BALLBREAK_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monTx2BallbreakRep, payload, sizeof(rlMonTxBallBreakRep_t));
                    gMonitoringStatus = ((rlMonTxBallBreakRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  Rx TX1 Ballbreak Report Failed:[0x%x]\n", ((rlMonTxBallBreakRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_REPORT_HEADER_SB:
                {
                    gMonitorHdrCnt++;                    
                    break;
                }
                case RL_RF_AE_GPADC_MEAS_DATA_SB:
                {
                    isGetGpAdcMeasData = 1U;
                    memcpy(&rcvGpAdcData, payload, sizeof(rlRecvdGpAdcData_t));
                    break;
                }
                case RL_RF_AE_FRAME_END_SB:
                {
                    gFrameStartStatus = 0U;
                    System_printf ("Debug:  Frame Stop Async Event \n");
                    break;
                }
                case RL_RF_AE_ANALOG_FAULT_SB:
                {
                    System_printf ("Debug:  Analog Fault Async Event \n");
                    break;
                }
                default:
                {
                    System_printf ("Error: Asynchronous Event SB Id %d not handled with msg ID [0x%x] \n", asyncSB,msgId);
                    break;
                }
            }
            break;
        }
        case RL_RF_ASYNC_EVENT_1_MSG:
        {
            switch (asyncSB)
            {
                case RL_RF_AE_MON_TX_GAIN_MISMATCH_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monTxGainPhMisMatchRep, payload, sizeof(rlMonTxGainPhaMisRep_t));
                    gMonitoringStatus = ((rlMonTxGainPhaMisRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error: TX Gain Mismatch Report Failed:[0x%x]\n", ((rlMonTxGainPhaMisRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_TX0_BPM_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monTx1BpmRep, payload, sizeof(rlMonTxBpmRep_t));
                    gMonitoringStatus = ((rlMonTxBpmRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error: TX0 BPM Report Failed:\n");
                    }
                    break;
                }
                case RL_RF_AE_MON_TX1_BPM_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monTx2BpmRep, payload, sizeof(rlMonTxBpmRep_t));
                    gMonitoringStatus = ((rlMonTxBpmRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  TX1 BPM Report Failed:[0x%x]\n", ((rlMonTxBpmRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_SYNTHESIZER_FREQ_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monSynthFreqRep, payload, sizeof(rlMonSynthFreqRep_t));
                    gMonitoringStatus = ((rlMonSynthFreqRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error: Synthesizeer freq Report  Failed:[0x%x] \n", ((rlMonSynthFreqRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_EXT_ANALOG_SIG_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monExtAnaSigRep, payload, sizeof(rlMonExtAnaSigRep_t));
                    gMonitoringStatus = ((rlMonExtAnaSigRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        /* External Analog Monotoring failed or no external signal */
                    }
                    break;
                }
                case RL_RF_AE_MON_TX0_INT_ANA_SIG_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monTx1IntAnaSigRep, payload, sizeof(rlMonTxIntAnaSigRep_t));
                    gMonitoringStatus = ((rlMonTxIntAnaSigRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  TX0 Internal Analog Signal Report Failed:[0x%x]\n", ((rlMonTxIntAnaSigRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_TX1_INT_ANA_SIG_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monTx1IntAnaSigRep, payload, sizeof(rlMonTxIntAnaSigRep_t));
                    gMonitoringStatus = ((rlMonTxIntAnaSigRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  TX1 Internal Analog Signal Report Failed:[0x%x]\n", ((rlMonTxIntAnaSigRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_RX_INT_ANALOG_SIG_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monRxIntAnaSigRep, payload, sizeof(rlMonRxIntAnaSigRep_t));
                    gMonitoringStatus = ((rlMonRxIntAnaSigRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  RX Internal Analog Signal Report Failed:[0x%x] \n",((rlMonRxIntAnaSigRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_PMCLKLO_INT_ANA_SIG_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monPmClkIntAnaSigRep, payload, sizeof(rlMonPmclkloIntAnaSigRep_t));
                    gMonitoringStatus = ((rlMonPmclkloIntAnaSigRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error: PMCLKLO Internal Analog Signal Report Failed:[0x%x] \n", ((rlMonPmclkloIntAnaSigRep_t*)payload)->errorCode); 
                    }
                    break;
                }
                case RL_RF_AE_MON_GPADC_INT_ANA_SIG_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monGpadcIntAnaSigRep, payload, sizeof(rlMonGpadcIntAnaSigRep_t));
                    gMonitoringStatus = ((rlMonGpadcIntAnaSigRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  GPADC Internal Analog Signal Report Failed:[0x%x]\n", ((rlMonGpadcIntAnaSigRep_t*)payload)->errorCode );
                    }
                    break;
                }
                case RL_RF_AE_MON_PLL_CONTROL_VOLT_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monPllConvVoltRep, payload, sizeof(rlMonPllConVoltRep_t));
                    gMonitoringStatus = ((rlMonPllConVoltRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error: PLL Control Volt Report Failed: [0x%x]\n", ((rlMonPllConVoltRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_DCC_CLK_FREQ_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monDccClkFreqRep, payload, sizeof(rlMonDccClkFreqRep_t));
                    gMonitoringStatus = ((rlMonDccClkFreqRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  DCC CLK Freq Report Failed: [0x%x]\n", ((rlMonDccClkFreqRep_t*)payload)->errorCode);
                    }
                    break;
                }
                case RL_RF_AE_MON_RX_MIXER_IN_PWR_REPORT:
                {
                    memcpy(&gMonDataAeStrct.monRxMixrInPwrRep, payload, sizeof(rlMonRxMixrInPwrRep_t));
                    gMonitoringStatus = ((rlMonRxMixrInPwrRep_t*)payload)->statusFlags;
                    if(gMonitoringStatus == 0U)
                    {
                        System_printf ("Error:  Rx Mixer InPower Report Failed: [0x%x]\n", ((rlMonRxMixrInPwrRep_t*)payload)->errorCode);
                    }
                    break;
                }
                default:
                {
                    System_printf ("Error: Asynchronous Event SB Id %d not handled with msg ID 0x%x\n", asyncSB,msgId);
                    break;
                }
            }
            break;
        }
        default:
        {
            System_printf ("Error: Asynchronous message %d is NOT handled\n", msgId);
            break;
        }
    }
    return;
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to call the function in a different context
 *      This function is invoked from the Interrupt context.
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static rlInt32_t MmwaveLink_spawn (RL_P_OSI_SPAWN_ENTRY pEntry, const void* pValue, uint32_t flags)
{
    /* Record the function which is to be spawned. */
    if (gMmwaveLinkMCB.spawnFxn != NULL)
        gMmwaveLinkMCB.spawnOverrun++;

    /* Record the entry to be spawned. */
    gMmwaveLinkMCB.spawnFxn = pEntry;

    /* Post the semaphore and wake up the link management task */
    Semaphore_post (gMmwaveLinkMCB.linkSemaphore);
    return 0;
}

/**
 *  @b Description
 *  @n
 *      Radar Link Registered Callback function to compute the CRC.
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static rlInt32_t MmwaveLink_computeCRC(rlUInt8_t* data, rlUInt32_t dataLen, rlUInt8_t crcType, rlUInt8_t* crc)
{
    CRC_SigGenCfg   signGenCfg;
    int32_t         errCode;
    uint64_t        signature;
    uint32_t        index;
    uint8_t*        ptrSignature;
    uint8_t         crcLength;

    /* Initialize the signature generation configuration */
    memset ((void *)&signGenCfg, 0, sizeof(CRC_SigGenCfg));

    /* Allocate a unique transaction id: */
    if (CRC_getTransactionId (gMmwaveLinkMCB.crcHandle, &signGenCfg.transactionId, &errCode) < 0)
    {
        System_printf ("Error: CRC Driver Get transaction id failed [Error code %d]\n", errCode);
        return -1;
    }

    /* Populate the signature generation configuration: */
    signGenCfg.ptrData = (uint8_t*)data;
    signGenCfg.dataLen = dataLen;

    /* Compute the signature for the specific data on Channel-1 */
    if (CRC_computeSignature (gMmwaveLinkMCB.crcHandle, &signGenCfg, &errCode) < 0)
    {
        System_printf ("Error: CRC Driver compute signature failed [Error code %d]\n", errCode);
        return -1;
    }

    /* Get the Signature for Channel */
    if (CRC_getSignature (gMmwaveLinkMCB.crcHandle, signGenCfg.transactionId, &signature, &errCode) < 0)
    {
        System_printf ("Error: CRC Driver get signature failed [Error code %d]\n", errCode);
        return -1;
    }

    /* Get the pointer to the CRC Signature: */
    ptrSignature = (uint8_t*)&signature;

    /* Determine the length of the CRC: */
    switch (crcType)
    {
        case RL_CRC_TYPE_16BIT_CCITT:
        {
            crcLength = 2;
            break;
        }
        case RL_CRC_TYPE_32BIT:
        {
            crcLength = 4;
            break;
        }
        case RL_CRC_TYPE_64BIT_ISO:
        {
            crcLength = 8;
            break;
        }
        default:
        {
            System_printf ("Error: Unknown CRC Type passed from mmWave Link: %d\n", crcType);
            return -1;
        }
    }

    /* Copy the CRC signature into CRC output array */
    for(index = 0U; index < crcLength; index++)
        *(crc + index) = *(ptrSignature + index);
    return 0;
}

/**
 *  @b Description
 *  @n
 *      This is the task which handles the mmWave Link communication
 *      messages between the BSS and MSS.
 *
 *  @retval
 *      Not Applicable.
 */
static void MmwaveLink_mmwaveLinkMgmtTask (UArg arg0, UArg arg1)
{
    RL_P_OSI_SPAWN_ENTRY    spawnFxn;
    uintptr_t               key;
    Semaphore_Params        semParams;

    /* Debug Message: */
    System_printf("Debug: Launched the mmwaveLink Management Task\n");

    /* Initialize the mmWave Link Semaphore: */
    Semaphore_Params_init(&semParams);
    semParams.mode  = Semaphore_Mode_BINARY;
    gMmwaveLinkMCB.linkSemaphore = Semaphore_create(0, &semParams, NULL);

    /* Execute forever: */
    while (1)
    {
        /* Pending on the link semaphore */
        Semaphore_pend (gMmwaveLinkMCB.linkSemaphore, BIOS_WAIT_FOREVER);

        /* Critical Section: We record the spawn function which is to be executed */
        key = Hwi_disable();
        spawnFxn = gMmwaveLinkMCB.spawnFxn;
        gMmwaveLinkMCB.spawnFxn = NULL;
        Hwi_restore (key);

        /* Execute the spawn function: */
        spawnFxn (NULL);
    }
}

/**
 *  @b Description
 *  @n
 *      The function is used to get and display the version information
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_getVersion (void)
{
    rlVersion_t verArgs;
    int32_t     retVal;

    /* Get the version string: */
    retVal = rlDeviceGetVersion(RL_DEVICE_MAP_INTERNAL_BSS, &verArgs);
    if (retVal != 0)
    {
        System_printf ("Error: Unable to get the device version from mmWave link [Error %d]\n", retVal);
        return -1;
    }

    /* Display the version information */
    System_printf ("RF H/W Version    : %02d.%02d\n",
                    verArgs.rf.hwMajor, verArgs.rf.hwMinor);
    System_printf ("RF F/W Version    : %02d.%02d.%02d.%02d.%02d.%02d.%02d\n",
                    verArgs.rf.fwMajor, verArgs.rf.fwMinor, verArgs.rf.fwBuild, verArgs.rf.fwDebug,
                    verArgs.rf.fwYear, verArgs.rf.fwMonth, verArgs.rf.fwDay);
    System_printf ("mmWaveLink Version: %02d.%02d.%02d.%02d\n",
                    verArgs.mmWaveLink.major, verArgs.mmWaveLink.minor,
                    verArgs.mmWaveLink.build, verArgs.mmWaveLink.debug);
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to initialize and setup the mmWave link
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
int32_t MmwaveLink_initLink (rlUInt8_t deviceType, rlUInt8_t platform)
{
    Task_Params            taskParams;
    CRC_Config          crcCfg;
    rlClientCbs_t       RlApp_ClientCtx;
    int32_t             errCode;

    /* Initialize and populate the Mmwave Link MCB */
    memset ((void*)&gMmwaveLinkMCB, 0, sizeof(MmwaveLink_MCB));

    /*****************************************************************************
     * Start CRC driver:
     *****************************************************************************/

    /* Setup the default configuration: */
    CRC_initConfigParams(&crcCfg);

#if 1
    /*******************************************************************************
     * This is the configuration for the 16bit CRC Type:
     *******************************************************************************/
    crcCfg.channel  = CRC_Channel_CH1;
    crcCfg.mode     = CRC_Operational_Mode_FULL_CPU;
    crcCfg.type     = CRC_Type_16BIT;
    crcCfg.bitSwap  = CRC_BitSwap_MSB;
    crcCfg.byteSwap = CRC_ByteSwap_ENABLED;
    crcCfg.dataLen  = CRC_DataLen_16_BIT;
#endif
#if 0
    /*******************************************************************************
     * This is the configuration for the 32bit CRC Type:
     *******************************************************************************/
    crcCfg.channel  = CRC_Channel_CH1;
    crcCfg.mode     = CRC_Operational_Mode_FULL_CPU;
    crcCfg.type     = CRC_Type_32BIT;
    crcCfg.bitSwap  = CRC_BitSwap_LSB;
    crcCfg.byteSwap = CRC_ByteSwap_DISABLED;
    crcCfg.dataLen  = CRC_DataLen_32_BIT;
#endif
#if 0
    /*******************************************************************************
     * This is the configuration for the 64bit CRC Type:
     *******************************************************************************/
    crcCfg.channel  = CRC_Channel_CH1;
    crcCfg.mode     = CRC_Operational_Mode_FULL_CPU;
    crcCfg.type     = CRC_Type_64BIT;
    crcCfg.bitSwap  = CRC_BitSwap_MSB;
    crcCfg.byteSwap = CRC_ByteSwap_ENABLED;
    crcCfg.dataLen  = CRC_DataLen_32_BIT;
#endif

    /* Open the CRC Driver */
    gMmwaveLinkMCB.crcHandle = CRC_open (&crcCfg, &errCode);
    if (gMmwaveLinkMCB.crcHandle == NULL)
    {
        System_printf ("Error: Unable to open the CRC Channel [Error Code %d]\n", errCode);
        return -1;
    }
    System_printf("Debug: CRC Channel %p has been opened successfully\n", gMmwaveLinkMCB.crcHandle);

    /*****************************************************************************
     * Launch the Mmwave Link Tasks:
     *****************************************************************************/

    /* Initialize and Launch the mmWave Link Management Task: */
    Task_Params_init(&taskParams);
    taskParams.priority = 5;
    Task_create(MmwaveLink_mmwaveLinkMgmtTask, &taskParams, NULL);

    /*****************************************************************************
     * Initialize the mmWave Link: We need to have the link management task
     * operational to be able to process the SPAWN function.
     *****************************************************************************/

    /* Reset the client context: */
    memset ((void *)&RlApp_ClientCtx, 0, sizeof(rlClientCbs_t));

    RlApp_ClientCtx.ackTimeout  = 1000U;

    /* Setup the crc Type in the mmWave link and synchronize this with the
     * created CRC Channel. */
    if (crcCfg.type == CRC_Type_16BIT)
        RlApp_ClientCtx.crcType = RL_CRC_TYPE_16BIT_CCITT;
    else if (crcCfg.type == CRC_Type_32BIT)
        RlApp_ClientCtx.crcType = RL_CRC_TYPE_32BIT;
    else
        RlApp_ClientCtx.crcType = RL_CRC_TYPE_64BIT_ISO;

    /* Setup the platform on which the mmWave Link executes */
    RlApp_ClientCtx.platform  = platform;
    RlApp_ClientCtx.arDevType = deviceType;

    /* Initialize the Communication Interface API: */
    RlApp_ClientCtx.comIfCb.rlComIfOpen     = MmwaveLink_mboxOpen;
    RlApp_ClientCtx.comIfCb.rlComIfClose    = MmwaveLink_mboxClose;
    RlApp_ClientCtx.comIfCb.rlComIfRead     = MmwaveLink_mboxRead;
    RlApp_ClientCtx.comIfCb.rlComIfWrite    = MmwaveLink_mboxWrite;

    /* Initialize OSI Mutex Interface */
    RlApp_ClientCtx.osiCb.mutex.rlOsiMutexCreate = Osal_mutexCreate;
    RlApp_ClientCtx.osiCb.mutex.rlOsiMutexLock   = Osal_mutexLock;
    RlApp_ClientCtx.osiCb.mutex.rlOsiMutexUnLock = Osal_mutexUnlock;
    RlApp_ClientCtx.osiCb.mutex.rlOsiMutexDelete = Osal_mutexDelete;

    /* Initialize OSI Semaphore Interface */
    RlApp_ClientCtx.osiCb.sem.rlOsiSemCreate    = Osal_semCreate;
    RlApp_ClientCtx.osiCb.sem.rlOsiSemWait      = Osal_semWait;
    RlApp_ClientCtx.osiCb.sem.rlOsiSemSignal    = Osal_semSignal;
    RlApp_ClientCtx.osiCb.sem.rlOsiSemDelete    = Osal_semDelete;

    /* Initialize OSI Queue Interface */
    RlApp_ClientCtx.osiCb.queue.rlOsiSpawn      = MmwaveLink_spawn;

    /* Initialize OSI Timer Interface */
    RlApp_ClientCtx.timerCb.rlDelay             = NULL;

    /* Initialize the CRC Interface */
    RlApp_ClientCtx.crcCb.rlComputeCRC          = MmwaveLink_computeCRC;

    /* Initialize Device Control Interface */
    RlApp_ClientCtx.devCtrlCb.rlDeviceDisable            = MmwaveLink_disableDevice;
    RlApp_ClientCtx.devCtrlCb.rlDeviceEnable             = MmwaveLink_enableDevice;
    RlApp_ClientCtx.devCtrlCb.rlDeviceMaskHostIrq        = MmwaveLink_maskHostIRQ;
    RlApp_ClientCtx.devCtrlCb.rlDeviceUnMaskHostIrq      = MmwaveLink_unmaskHostIRQ;
    RlApp_ClientCtx.devCtrlCb.rlRegisterInterruptHandler = MmwaveLink_registerInterruptHandler;

    /* Initialize the Asynchronous Event Handler: */
    RlApp_ClientCtx.eventCb.rlAsyncEvent    = MmwaveLink_asyncEventHandler;

    /* Power on the Device: */
    if (rlDevicePowerOn(1U, RlApp_ClientCtx) != 0)
    {
        System_printf("Error: Power on request to the BSS failed\n");
        return -1;
    }
    System_printf("Debug: Power on request successfully passed to the BSS\n");

    return 0;
}

int32_t MmwaveLink_getRfBootupStatus (void)
{
    int32_t         retVal;
    rlRfBootStatusCfg_t statusCfg = {0};
    
    /* Set channel configuration */
    retVal = rlGetRfBootupStatus(RL_DEVICE_MAP_INTERNAL_BSS, &statusCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlGetRfBootupStatus retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished get radarSS bootup status to BSS\n");

    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to set/send mmWave Link Channel Configuration to the BSS.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setChannelConfig (void)
{
    int32_t         retVal;

    /* Set channel configuration */
    retVal = rlSetChannelConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlChanCfg_t*)&chCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: setChannelConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished set channel configurations to BSS\n");

    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function Sets the consolidated configuration of all analog monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfAnaMonConfig (void)
{
    int32_t  retVal;
    /* Each bit(0-31) represents different analog monitor enable configuration */
    rlMonAnaEnables_t data = { (1 << 0)   | \
                               (1 << 1)   | \
                               (1 << 2)   | \
                               (1 << 3)   | \
                               (1 << 4)   | \
                               (1 << 5)   | \
                               (0 << 6)   | \
                               (1 << 7)   | \
                               (1 << 8)   | \
                               (0 << 9)   | \
                               (1 << 10)  | \
                               (1 << 11)  | \
                               (1 << 12)  | \
                               (0 << 13)  | \
                               (1 << 14)  | \
                               (1 << 15)  | \
                               (1 << 16)  | \
                               (1 << 17)  | \
                               (0 << 18)  | \
                               (1 << 19)  | \
                               (1 << 20)  | \
                               (1 << 21)  | \
                               (1 << 22)  | \
                               (1 << 23)  | \
                               (1 << 24)  | \
                               (1 << 25)  | \
                               (1 << 26)  | \
                               (1 << 27)  | \
                               (0 << 28)  | \
                               (0 << 29)  | \
                               (0 << 30)  | \
                               (0 << 31)
                                ,0x0};
    /* Set channel configuration */
    retVal = rlRfAnaMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,&data);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfAnaMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished rlRfAnaMonConfig configurations to BSS\n");
    return 0;    
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to Rx Mixer InPower monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_RxMixerInPwrConfig (void)
{
    int32_t         retVal;
    rlRxMixInPwrMonConf_t rxMixInPwrCfg = {0};
    
    rxMixInPwrCfg.reportMode = 2U;
    rxMixInPwrCfg.profileIndx = 0U;
    rxMixInPwrCfg.txEnable = 1U;
    rxMixInPwrCfg.thresholds = 0x91U;
    
    /* Set channel configuration */
    retVal = rlRfRxMixerInPwrConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlRxMixInPwrMonConf_t*)&rxMixInPwrCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfRxMixerInPwrConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished Rx Mixer InPower configurations to BSS\n");
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to temperature monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfTempMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfTempMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlTempMonConf_t*)&tempMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfTempMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished temperature monitoring configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets RX gain and phase monitoring config to device.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfRxGainPhaMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfRxGainPhMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlRxGainPhaseMonConf_t*)&rxGainPhaseMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfRxGainPhMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished RX gain and phase monitoring configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to RX noise monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfRxNoiseMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfRxNoiseMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlRxNoiseMonConf_t*)&rxNoiseMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfRxNoiseMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished RX noise monitoring configurations to BSS\n");
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to RX IF filter attenuation monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfRxIfStageMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfRxIfStageMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlRxIfStageMonConf_t*)&monRxIfStageCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfRxIfStageMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished RX IF filter attenuation monitoring configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to TX power monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfTxPowMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfTxPowrMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlAllTxPowMonConf_t*)&allTxPowMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfTxPowrMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to TX Power monitor configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to TX ball break detection.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfTxBallbreakMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfTxBallbreakMonConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlAllTxBallBreakMonCfg_t*)&allTxBallbreakMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfTxBallbreakMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to TX power monitoring configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to TX gain and phase mismatch monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfTxGainPhaseMismatchMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfTxGainPhaseMismatchMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlTxGainPhaseMismatchMonConf_t*)&txGainPhMisMatchMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfTxGainPhaseMismatchMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to TX gain and phase mismatch monitoring configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to TX BPM monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfTxBpmMonConfig (void)
{
    int32_t retVal;
    /* Set channel configuration */
    retVal = rlRfTxBpmMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlAllTxBpmMonConf_t*)&allTxBpmMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfTxBpmMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to TX BPM configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to synthesizer frequency.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfSynthFreqMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfSynthFreqMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlSynthFreqMonConf_t*)&synthFreqMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfSynthFreqMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to synthesizer frequency configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to external DC signals monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfExtAnaSignalsMonConfig (void)
{
    int32_t         retVal;

    rlExtAnaSignalsMonConf_t data = {0x0};
    data.signalInpEnables = (1 << 4) | (1 << 5);
    data.signalSettlingTime[4] = 2;
    data.signalSettlingTime[5] = 2;

    /* Set channel configuration */
    retVal = rlRfExtAnaSignalsMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,&data);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfExtAnaSignalsMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to external DC signals monitoring configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to TX Internal Analog Signals monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfTxIntAnaSignalMonConfig (void)
{
    int32_t         retVal;
    rlTxIntAnaSignalsMonConf_t tx0IntAnaSgnlMonCfg = {0,2,0,0};
    rlTxIntAnaSignalsMonConf_t tx1IntAnaSgnlMonCfg = {0,2,0,0};
    rlAllTxIntAnaSignalsMonConf_t data ={ &tx0IntAnaSgnlMonCfg, &tx1IntAnaSgnlMonCfg, NULL};

    /* Set channel configuration */
    retVal = rlRfTxIntAnaSignalsMonConfig(RL_DEVICE_MAP_INTERNAL_BSS, &data);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfTxIntAnaSignalsMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to TX Internal Analog Signals configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to RX Internal Analog Signals monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfRxIntAnaSignalsMonConfig (void)
{
    int32_t         retVal;
    rlRxIntAnaSignalsMonConf_t data = {0,2,0,0};

    /* Set channel configuration */
    retVal = rlRfRxIntAnaSignalsMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,&data);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfRxIntAnaSignalsMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to RX Internal Analog Signals configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to Power Management, Clock generation and LO distribution.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfPmClkLoIntAnaSignalsMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfPmClkLoIntAnaSignalsMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlPmClkLoIntAnaSignalsMonConf_t*)&pmClkLoIntAnaSigMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfPmClkLoIntAnaSignalsMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to Power Management, Clock generation and LO distributioncon configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to GPADC Internal Analog Signals monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfGpadcIntAnaSignalsMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfGpadcIntAnaSignalsMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlGpadcIntAnaSignalsMonConf_t*) &gpadcIntAnaSigMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfGpadcIntAnaSignalsMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to GPADC Internal Analog Signals monitoring configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to APLL and Synthesizer's control voltage signals monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfPllContrlVoltMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfPllContrlVoltMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlPllContrVoltMonConf_t*)&pllConVoltMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfPllContrlVoltMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to APLL and Synthesizer's control voltage signals monitoring configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to the DCC based clock frequency monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfDualClkCompMonConfig (void)
{
    int32_t         retVal;
    /* Set channel configuration */
    retVal = rlRfDualClkCompMonConfig(RL_DEVICE_MAP_INTERNAL_BSS,(rlDualClkCompMonConf_t*)&dualClkCompMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfDualClkCompMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to the DCC based clock frequency monitoring configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to  RX saturation detector monitoring.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfRxIfSatMonConfig (void)
{
    int32_t         retVal;

    /* Set channel configuration */
    retVal = rlRfRxIfSatMonConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlRxSatMonConf_t*)&rxSatMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfRxIfSatMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to  RX saturation detector monitoring configurations to BSS\n");
    return 0;        
}

/**
 *  @b Description
 *  @n
 *      The function Sets information related to signal and image band energy.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfRxSigImgMonConfig (void)
{
    int32_t         retVal;

    /* Set channel configuration */
    retVal = rlRfRxSigImgMonConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlSigImgMonConf_t*)&sigImgMonCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfRxSigImgMonConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to signal and image band energy configurations to BSS\n");
    return 0;
}

int32_t MmwaveLink_rlSetLoopBckBurstCfg(void)
{
    int32_t         retVal;
    rlLoopbackBurst_t data ={ 0 };
    data.loopbackSel = 0;
    data.baseProfileIndx = 0;
    data.burstIndx = 0;
    data.freqConst = 1435384036U;
    data.slopeConst = -2077;
    data.txBackoff = 0;
    data.rxGain = 30;
    data.txEn = 0;
    data.bpmConfig = 0;
    data.digCorrDis = 0;
    data.ifLbFreq = 0;
    data.ifLbMag = 10;
    data.ps1PgaIndx = 10;
    data.ps2PgaIndx = 10;
    data.psLbFreq = 0;
    data.paLbFreq =100;

    /* Set channel configuration */
    retVal = rlSetLoopBckBurstCfg(RL_DEVICE_MAP_INTERNAL_BSS, &data);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlSetLoopBckBurstCfg retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to rlSetLoopBckBurstCfg configurations to BSS\n");
    return 0;
}

int32_t MmwaveLink_rlSetDynChirpCfg(void)
{
    int32_t         retVal;
    rlDynChirpCfg_t *dynChirpData[NUM_OF_DYNAMIC_CHIRP_CONFIG_SEG] = {(rlDynChirpCfg_t*)&dynChirpCfg[0], (rlDynChirpCfg_t*)&dynChirpCfg[1],
                                         (rlDynChirpCfg_t*)&dynChirpCfg[2], (rlDynChirpCfg_t*)&dynChirpCfg[3]};

    /* Set channel configuration */
    retVal = rlSetDynChirpCfg(RL_DEVICE_MAP_INTERNAL_BSS, 4U, (rlDynChirpCfg_t**)&dynChirpData[0U]);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlSetDynChirpCfg retVal=%d\n", retVal);
        return -1;
    }
    return 0;
}

int32_t MmwaveLink_rlSetDynChirpEn(void)
{
    int32_t retVal;
    rlDynChirpEnCfg_t dynChirpEnCfg = {0};
    
    retVal = rlSetDynChirpEn(RL_DEVICE_MAP_INTERNAL_BSS, &dynChirpEnCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlSetDynChirpEn retVal=%d\n", retVal);
        return -1;
    }
    return 0;
}

int32_t MmwaveLink_rlSetDynPerChirpPhShifterCfg(void)
{
    int32_t         retVal;
    rlDynPerChirpPhShftCfg_t data[1] ={ 0 };
    data[0].chirpSegSel = 20;

    /* Set channel configuration */
    retVal = rlSetDynPerChirpPhShifterCfg(RL_DEVICE_MAP_INTERNAL_BSS, 1, (rlDynPerChirpPhShftCfg_t**)&data);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlSetDynPerChirpPhShifterCfg retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to rlSetDynPerChirpPhShifterCfg configurations to BSS\n");
    return 0;
}

int32_t MmwaveLink_rlRfAnaFaultInjConfig(void)
{
    int32_t         retVal;
    rlAnaFaultInj_t data ={ 0 };
    data.rxGainDrop = 0;
    data.rxPhInv= 0;
    data.rxHighNoise = 0;
    data.rxIfStagesFault = 0;
    data.rxLoAmpFault = 0;
    data.txLoAmpFault = 0;
    data.txGainDrop = 0;
    data.txPhInv = 0;
    data.synthFault = 0;
    data.supplyLdoFault = 0;
    data.miscFault = 0;
    data.miscThreshFault = 0;

    /* Set channel configuration */
    retVal = rlRfAnaFaultInjConfig(RL_DEVICE_MAP_INTERNAL_BSS, &data);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfAnaFaultInjConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to rlRfAnaFaultInjConfig configurations to BSS\n");
    return 0;
}


int32_t MmwaveLink_rlRfDigMonPeriodicConfig (void)
{
    int32_t         retVal;
    rlDigMonPeriodicConf_t data = {0x0};

    /* Set channel configuration */
    retVal = rlRfDigMonPeriodicConfig(RL_DEVICE_MAP_INTERNAL_BSS, &data);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfDigMonPeriodicConfig retVal=%d\n", retVal);
        return -1;
    }
    System_printf("Debug: Finished information related to  rlRfDigMonPeriodicConfig monitoring configurations to BSS\n");
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to set/send the Adc out configuration to the BSS.
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setAdcOutConfig (void)
{
    int32_t         retVal;

    retVal = rlSetAdcOutConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlAdcOutCfg_t*)&adcOutCfgArgs);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: setAdcOutConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished setAdcOutConfig to BSS\n");
    
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to set low power mode.
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setLowPowerModeConfig (void)
{
    int32_t         retVal;

    retVal = rlSetLowPowerModeConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlLowPowerModeCfg_t*)&lowPowerModeCfg);

    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: setLowPowerMode retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished setLowPowerMode\n");
    
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to test Set HSI clock API.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setHsiClk (void)
{
    int32_t     retVal;

    /* Set HSI clock */
    retVal = rlDeviceSetHsiClk(RL_DEVICE_MAP_INTERNAL_BSS, (rlDevHsiClk_t*)&deviceHsiClk);
    if (retVal != 0)
    {
        System_printf ("Error: Unable to set HSI clock [Error %d]\n", retVal);
        return -1;
    }
    System_printf("Debug: Set HSI clock successfully\n");

    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to test RF Init/Calibration API.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_rfCalibration (void)
{
    int32_t     retVal;

    retVal = rlRfInit(RL_DEVICE_MAP_INTERNAL_BSS);
    if (retVal != 0)
    {
        System_printf ("Error: Unable to start RF [Error %d]\n", retVal);
        return -1;
    }
    while(gInitTimeCalibStatus == 0U)
    {
        /* Sleep and poll again: */
        Task_sleep(1);
    }
    gInitTimeCalibStatus = 0U;
    System_printf("Debug: RF start successfully\n");

    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to set Profile configuration.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setProfileConfig (void)
{
    int32_t         retVal;
   
    retVal = rlSetProfileConfig(RL_DEVICE_MAP_INTERNAL_BSS, 4U, (rlProfileCfg_t*)&profileCfg[0U]);

    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
    System_printf("Error: rlSetProfileConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlSetProfileConfig\n");
    
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to set Chirp configuration.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setChirpConfig (void)
{
    int32_t         retVal;

    retVal = rlSetChirpConfig(RL_DEVICE_MAP_INTERNAL_BSS, 2U, (rlChirpCfg_t*)&chirpCfg);
           
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlSetChirpConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlSetChirpConfig\n");
    
    return 0;
}

rlChirpCfg_t getChirpCfg[10] = {0};

int32_t MmwaveLink_getChirpConfig (uint16_t startIdx, uint16_t endIdx)
{
    int32_t retVal;

    retVal = rlGetChirpConfig(RL_DEVICE_MAP_INTERNAL_BSS, startIdx, endIdx, &getChirpCfg[0]);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlGetChirpConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlGetChirpConfig\n");
    
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to set Frame configuration.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setFrameConfig (void)
{
    int32_t         retVal;
    
    retVal = rlSetFrameConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlFrameCfg_t*)&frameCfg);
           
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlSetFrameConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlSetFrameConfig\n");
    
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to test start sensor API.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_sensorStart (void)
{
    int32_t     retVal;

    /* Trigger the frame */
    retVal = rlSensorStart(RL_DEVICE_MAP_INTERNAL_BSS);
    if (retVal != 0)
    {
        System_printf ("Error: Unable to start Sensor [Error %d]\n", retVal);
        return -1;
    }
    /* if frame start async event is enable by rlRfSetDeviceCfg API,
       then wait for Frame start async event */
    if ((rfDevCfg.aeControl & 0x1) == 0x0)
    {
        while(gFrameStartStatus == 0U)
        {
            /* Sleep and poll again: */
            Task_sleep(1);
        }
    }
    return 0;
}


/**
 *  @b Description
 *  @n
 *      The function is used to test stop sensor API.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_sensorStop (void)
{
    int32_t     retVal;

    /* Stop the frame */
    retVal = rlSensorStop(RL_DEVICE_MAP_INTERNAL_BSS);
    if (retVal != 0)
    {
        if(retVal == RL_RET_CODE_FRAME_ALREADY_ENDED)
        {
            System_printf ("Debug: Frames are already stopped  [%d]\n", retVal);
            return 0;
        }
        System_printf ("Error: Unable to stop Sensor [Error %d]\n", retVal);
        return -1;
    }
    
    /* if frame stop async event is enable by rlRfSetDeviceCfg API,
        then wait for Frame stop async event */
    if ((rfDevCfg.aeControl & 0x2) == 0x0)
    {
        while(gFrameStartStatus == 1U)
        {
            /* Sleep and poll again: */
            Task_sleep(1);
        }
    }
    System_printf("Debug: Sensor stop successfully\n");

    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to set calib/monitoring configuration
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setCalMonConfig (void)
{
    int32_t         retVal;

    retVal = rlRfSetCalMonTimeUnitConfig(RL_DEVICE_MAP_INTERNAL_BSS, 
                                     (rlRfCalMonTimeUntConf_t*)&calMonTimeUnitConf);
    if (retVal != 0)
    {
        System_printf ("Error: Unable to rlRfSetCalMonTimeUnitConfig [Error %d]\n", retVal);
        return -1;
    }

    retVal = rlRfSetCalMonFreqLimitConfig(RL_DEVICE_MAP_INTERNAL_BSS, 
                                     (rlRfCalMonFreqLimitConf_t*)&freqLimit);

    if (retVal != 0)
    {
        System_printf ("Error: Unable to rlRfSetCalMonFreqLimitConfig[Error %d]\n", retVal);
        return -1;
    }

    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to set Init time calibration.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setInitTimeCalibConfig (void)
{
    int32_t         retVal;

    retVal = rlRfInitCalibConfig(RL_DEVICE_MAP_INTERNAL_BSS, 
                                (rlRfInitCalConf_t*)&rfInitCalib);

    if (retVal != 0)
    {
        System_printf ("Error: Unable to rlRfInitCalibConfig [Error %d]\n", retVal);
        return -1;
    }

    return 0;
}


/**
 *  @b Description
 *  @n
 *      The function is used to set run time calibration.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRunTimeCalibConfig (void)
{
    int32_t         retVal;

    retVal = rlRfRunTimeCalibConfig(RL_DEVICE_MAP_INTERNAL_BSS, 
                                (rlRunTimeCalibConf_t*)&runTimeCalib);

    if (retVal != 0)
    {
        System_printf ("Error: Unable to rlRfRunTimeCalibConfig [Error %d]\n", retVal);
        return -1;
    }

    while(gRunTimeCalibStatus == 0U)
    {
        /* Sleep and poll again: */
        Task_sleep(1);
    }
    gRunTimeCalibStatus = 0U;

    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to set advance Frame configuration.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setAdvFrameConfig (void)
{
    int32_t         retVal;
    
    retVal = rlSetAdvFrameConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlAdvFrameCfg_t*)&advFrameCfg);

    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlSetAdvFrameConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlSetAdvFrameConfig\n");
    
    return 0;
}


/**
 *  @b Description
 *  @n
 *      The function is used to set Binary Phase Modulation Common configuration.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setBpmCommonConfig (void)
{
    int32_t         retVal;
    
    retVal = rlSetBpmCommonConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlBpmCommonCfg_t*)&bpmCommonCfg);

    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
    System_printf("Error: rlSetBpmCommonConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlSetBpmCommonConfig\n");
    
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to set Binary Phase Modulation Chirp configuration.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setBpmChirpConfig (void)
{
    int32_t         retVal;
    rlBpmChirpCfg_t *bpmCfg[3] = {&bpmChirpCfg[0U], &bpmChirpCfg[1U], &bpmChirpCfg[2U]};
    
    retVal = rlSetBpmChirpConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlBpmChirpCfg_t*)&bpmChirpCfg[0U]);

    /* configure multiple BPM configuration via one API call */
    retVal = rlSetMultiBpmChirpConfig(RL_DEVICE_MAP_INTERNAL_BSS, 3U, &bpmCfg[0U]);

    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlSetBpmChirpConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlSetBpmChirpConfig\n");
    
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to set Continous mode Configuration.
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setContModeConfig (void)
{
    int32_t         retVal;

    
    retVal = rlSetContModeConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlContModeCfg_t*)&contModeCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
    System_printf("Error: rlSetContModeConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlSetContModeConfig\n");
    
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to Enable/Disable Continous mode
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_enableContMode (uint8_t bEnable)
{
    int32_t         retVal;
    rlContModeEn_t contModeEnable;

    contModeEnable.contModeEn = bEnable;
    retVal = rlEnableContMode(RL_DEVICE_MAP_INTERNAL_BSS, (rlContModeEn_t*)&contModeEnable);

    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlEnableContMode retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlEnableContMode\n");
    
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to Configure dynamic power saving feature
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_rfDynamicPowerSave (void)
{
    int32_t         retVal;
    
    retVal = rlRfDynamicPowerSave(RL_DEVICE_MAP_INTERNAL_BSS, (rlDynPwrSave_t*)&dynPwrSave);

    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
    System_printf("Error: rlRfDynamicPowerSave retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlRfDynamicPowerSave\n");
    
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to Configure asynchronous event direction for device
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setRfDevCfg (rlUInt32_t dirData)
{
    int32_t         retVal;
    rfDevCfg.aeDirection = dirData; /* 0xa: BSS to DSS, 0: BSS to MSS */

    retVal = rlRfSetDeviceCfg(RL_DEVICE_MAP_INTERNAL_BSS, &rfDevCfg);
    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfSetDeviceCfg retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlRfSetDeviceCfg\n");
    
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to Configure GP ADC data parameters
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_setGpAdcConfig (void)
{
    int32_t         retVal;
    
    retVal = rlSetGpAdcConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlGpAdcCfg_t*)&gpAdcCfg);

    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlSetGpAdcConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlSetGpAdcConfig\n");
    
    while(isGetGpAdcMeasData == 0U)
    {
        /* Sleep and poll again: */
        Task_sleep(1);
    }
    return 0;
}

/**
 *  @b Description
 *  @n
 *      The function is used to Enables/Disables LDO bypass mode
 *      using the mmWave link API. 
 *  @Note - This API is required to bypass LDO for specific board/PMIC configuration.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_rfSetLdoBypassConfig (void)
{
    int32_t         retVal;
    
    retVal = rlRfSetLdoBypassConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlRfLdoBypassCfg_t*)&rfLdoBypassCfg);

    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
    System_printf("Error: rlRfSetLdoBypassConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlRfSetLdoBypassConfig\n");
    
    return 0;
}


/**
 *  @b Description
 *  @n
 *      The function is used to Enable External Programmable filter
 *      using the mmWave link API.
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t MmwaveLink_progFilterConfig (void)
{
    int32_t         retVal;
    
    retVal = rlRfSetProgFiltConfig(RL_DEVICE_MAP_INTERNAL_BSS, (rlRfProgFiltConf_t*)&progFiltCfg);

    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfSetProgFiltConfig retVal=%d\n", retVal);
        return -1;
    }
    
    System_printf("Debug: Finished rlRfSetProgFiltConfig\n");

    retVal = rlRfSetProgFiltCoeffRam(RL_DEVICE_MAP_INTERNAL_BSS, (rlRfProgFiltCoeff_t*)&progFiltCoef);

    /* Check for mmWaveLink API call status */
    if(retVal != 0)
    {
        /* Error: Link reported an issue. */
        System_printf("Error: rlRfSetProgFiltCoeffRam retVal=%d\n", retVal);
        return -1;
    }

    System_printf("Debug: Finished rlRfSetProgFiltCoeffRam\n");
    return 0;
}



