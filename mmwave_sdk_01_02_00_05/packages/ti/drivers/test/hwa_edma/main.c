/**
 *   @file  main.c
 *
 *   @brief
 *      Unit Test code for the EDMA + HWA drivers.
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

 /** @mainpage R4-EDMA-HWA Data Path Processing Chain Unit Test
 *
 *  @section intro_sec Introduction
 *
 *  The data path processing on XWR14xx for 1D, 2D and 3D processing consists of 
 *  a coordinated execution between
 *  the R4, HWA and EDMA. This is demonstrated as part of millimeter wave demo
 *  located at:
 *   @verbatim ti\demo\xwr14xx\mmw @endverbatim 
 *  The demo runs in real-time
 *  and has all the associated framework for BSS control etc with it. There is need to
 *  have a stand-alone unit test like code that allows the data path to be excited
 *  in non real-time. This allows developer to use it as a debug/development aid
 *  towards eventually  making the data path processing real-time with real chirping.
 *  Developer can easily step into the code and test against
 *  knowns input signals. The core
 *  data path processing source codes are shared between this test and the mmw demo.
 *  Most of the documentation is therefore also shared and can be looked up in the
 *  mmw demo documentation. Here we will only document the test generator briefly.
 *
 *  @section testGen Test Generator
 *   The test generator allows user to set objects artificially at desired
 *   range, doppler and azimuth bins, and noise level so that output can be checked
 *   against these settings. It can generate one frame of data.
 *
 *   The test data generator is located in file:
 *   <code> ti\drivers\test\common\gen_frame_data.c </code>
 *   The function initFrameData() specifies the number of targets, and for each target the following parametrs:
 *   - signal amplitude,
 *   - peak index position in the range FFT,
 *   - peak index position the Doppler FFT and
 *   - peak index position in the Azimuth FFT.
 *
 *   The reference signal of one target is generated as:
 *   @image html ref_data_eq1.png
 *
 *   where
 *   - <I>k</I> is chirp index in the frame <I>k</I>=0,...,<I>N<SUB>Tx</SUB></I><I>N<SUB>DFFT</SUB></I>-1,
 *   - <I>m</I> is receive antenna index   <I>m</I>=0,...,<I>N<SUB>Rx</SUB></I>-1 and
 *   - <I>n</I> is sample index inside the chirp <I>n</I>=0,…<I>N<SUB>RFFT</SUB></I>-1
 *   - <I>N<SUB>RFFT</SUB></I> is number of range bins, (range FFT size)
 *   - <I>f<SUB>R</SUB></I> is expected peak index in the range FFT
 *   - <I>f<SUB>D</SUB></I> is expected peak index at the Doppler FFT
 *   - <I>f<SUB>A</SUB></I> is expected peak index at the azimuth FFT
 *   - <I>N<SUB>AFFT</SUB></I> is number of angle bins (azimuth FFT size)
 *   - <I>N<SUB>Tx</SUB></I> is number of Tx antennas
 *   - <I>N<SUB>Rx</SUB></I> is number of Rx antennas
 *   - <I>N<SUB>DFFT</SUB></I> is number of Doppler bins (Doppler FFT size)
 *
 *
 *
 *
 *
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
#include <math.h>

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
#include <ti/sysbios/knl/Event.h>
#define DebugP_ASSERT_ENABLED 1
#include <ti/drivers/osal/DebugP.h>
#include <assert.h>
#include <ti/common/sys_common.h>
#include <ti/drivers/osal/SemaphoreP.h>
#include <ti/drivers/edma/edma.h>
#include <ti/drivers/esm/esm.h>
#include <ti/drivers/soc/soc.h>

#include <ti/demo/xwr14xx/mmw/mmw.h>
#include <ti/drivers/test/common/gen_frame_data.h>
#include <ti/demo/xwr14xx/mmw/data_path.h>

#include <ti/utils/testlogger/logger.h>

//#include <ti/utils/cycleprofiler/cycle_profiler.h> 

bool gReadTestConfigFromBinFile = false;

typedef struct sensorConfig_t_ {
    uint32_t numRxAntennas;
    uint32_t numAdcSamples;
    uint32_t numTxAntAzim;
    uint32_t numTxAntElev;
    uint32_t numAngleBins;
    uint32_t numChirpsPerFrame;
} sensorConfig_t;

typedef struct frameConfig_t_ {
    sensorConfig_t sensorConfig;
    sceneConfig_t sceneConfig;
} frameConfig_t;

frameConfig_t gFrameConfig = {
    .sensorConfig.numRxAntennas = 4,
    .sensorConfig.numAdcSamples = 256,
    .sensorConfig.numTxAntAzim = 2,
    .sensorConfig.numTxAntElev = 1,
    .sensorConfig.numAngleBins = 64,

    /* Needs to be (power of 2)*(gNumTxAntAzim + gNumTxAntElev). E.g 48 when 
      gNumTxAntAzim = 2 and gNumTxAntElev = 1 */
    .sensorConfig.numChirpsPerFrame = 48,
    
    .sceneConfig.snrdB = 10,
    .sceneConfig.numTargets = 4,
    
    .sceneConfig.sceneObj[0].amplitude = 1000,
    .sceneConfig.sceneObj[0].azimPhyBin = 10,
    .sceneConfig.sceneObj[0].rngPhyBin = 35,
    .sceneConfig.sceneObj[0].doppPhyBin = 3,
    .sceneConfig.sceneObj[0].elevationDeg = -5,
    
    .sceneConfig.sceneObj[1].amplitude = 800,
    .sceneConfig.sceneObj[1].azimPhyBin = 7,
    .sceneConfig.sceneObj[1].rngPhyBin = 77,
    .sceneConfig.sceneObj[1].doppPhyBin = -2,
    .sceneConfig.sceneObj[1].elevationDeg = 0,

    .sceneConfig.sceneObj[2].amplitude = 700,
    .sceneConfig.sceneObj[2].azimPhyBin = 60,
    .sceneConfig.sceneObj[2].rngPhyBin = 43,
    .sceneConfig.sceneObj[2].doppPhyBin = -5,
    .sceneConfig.sceneObj[2].elevationDeg = 10,

    .sceneConfig.sceneObj[3].amplitude = 600,
    .sceneConfig.sceneObj[3].azimPhyBin = 57,
    .sceneConfig.sceneObj[3].rngPhyBin = 100,
    .sceneConfig.sceneObj[3].doppPhyBin = 7,
    .sceneConfig.sceneObj[3].elevationDeg = -20        
};

SOC_Handle          socHandle;
MmwDemo_DataPathObj gDataPathObj;
MmwDemo_CliCfg_t    gCliCfg;
MmwDemo_CliCommonCfg_t gCliCommonCfg;
genFrameStruc_t     gGenFrameDataObj;

extern mmwHwaBuf_t gMmwHwaMemBuf[MMW_HWA_NUM_MEM_BUFS];

/**
 * @brief
 *  Initialize the MCPI Log Message Buffer
 */
MCPI_LOGBUF_INIT(9216);

/*! L3 RAM buffer */
uint8_t gMmwL3[SOC_XWR14XX_MSS_L3RAM_SIZE];
#pragma DATA_SECTION(gMmwL3, ".l3ram");

/*! L3 heap for convenicence of partitioning L3 RAM */
MmwDemoMemPool_t gMmwL3heap =
{
    &gMmwL3[0],
    SOC_XWR14XX_MSS_L3RAM_SIZE,
    0
};


//volatile cycleLog_t gCycleLog;

//#define USE_BUILT_IN_REFERENCE
//#define USE_REFERENCE_ASCI_FILE
//#define USE_REFERENCE_BIN_FILE
#define USE_BUILT_IN_GENERATOR

#ifdef USE_BUILT_IN_REFERENCE
extern const uint32_t ref_input_frame[];
#endif

/**
 *  @b Description
 *  @n
 *      Print assert information to console.
 */
void _MmwDemo_debugAssert(int32_t expression, const char *file, int32_t line)
{
    if (!expression) {
        System_printf ("Exception: %s, line %d.\n",file,line);
    }
}

/* hard-code numbers below, in future can read from test vector file (meta-information) */
void Test_setProfile(MmwDemo_DataPathObj *obj, sensorConfig_t *sensorConfig)
{
    MmwDemo_CliCfg_t *cliCfg = obj->cliCfg;
    uint32_t i;

    obj->numRxAntennas = sensorConfig->numRxAntennas;

    obj->numAdcSamples = sensorConfig->numAdcSamples;
    obj->numRangeBins = obj->numAdcSamples;
    obj->numTxAntennas = sensorConfig->numTxAntAzim + sensorConfig->numTxAntElev;
    obj->numAngleBins = sensorConfig->numAngleBins;
    obj->numChirpsPerFrame = sensorConfig->numChirpsPerFrame;
    obj->numDopplerBins = obj->numChirpsPerFrame/obj->numTxAntennas;
    obj->numRangeBinsPerTransfer = 2;

    obj->numVirtualAntAzim   = sensorConfig->numTxAntAzim * obj->numRxAntennas;
    obj->numVirtualAntElev   = sensorConfig->numTxAntElev * obj->numRxAntennas;
    obj->numVirtualAntennas  = obj->numVirtualAntAzim + obj->numVirtualAntElev;

    for (i = 0; i < obj->numVirtualAntennas; i++)
    {
        obj->compRxChanCfg.rxChPhaseComp[i] = obj->cliCommonCfg->compRxChanCfg.rxChPhaseComp[i];
    }

    obj->rangeResolution =0;

    cliCfg->cfarCfg.averageMode = 2;
    cliCfg->cfarCfg.cyclicMode = 0;
    cliCfg->cfarCfg.guardLen = 4;
    cliCfg->cfarCfg.noiseDivShift = 3;
    cliCfg->cfarCfg.thresholdScale = 1200;
    cliCfg->cfarCfg.winLen = 8;

    cliCfg->peakGroupingCfg.inDopplerDirectionEn = 1;
    cliCfg->peakGroupingCfg.inRangeDirectionEn = 1;
    cliCfg->peakGroupingCfg.maxRangeIndex = obj->numRangeBins - 1;
    cliCfg->peakGroupingCfg.minRangeIndex = 0;
    cliCfg->peakGroupingCfg.scheme = 1;

    cliCfg->multiObjBeamFormingCfg.enabled = 1;
    cliCfg->multiObjBeamFormingCfg.multiPeakThrsScal = 0.5;

    obj->dataPathMode = DATA_PATH_STANDALONE;    
    obj->datapathChainSel = DATA_PATH_CHAIN_COMBINED_LOGMAG; 

    System_printf("Number of antennas: Ntx=%d, Nrx=%d\n",obj->numTxAntennas, obj->numRxAntennas);
}

#ifdef USE_BUILT_IN_GENERATOR
void Test_initGenerator(MmwDemo_DataPathObj *obj, sceneConfig_t *sceneConfig)
{
    /* Initialize ref data generator*/
    initFrameData (obj, &gGenFrameDataObj, sceneConfig);
}
#endif

#define AZIMUTH_ALLOWED_ERROR 4
#define ELEVATION_ALLOWED_ERROR 0.5 /*in degrees*/

uint32_t Test_CompareToRef(MmwDemo_DataPathObj *obj)
{
    uint32_t isOk = 1;
    uint32_t refIdx;
    uint32_t j;
    uint32_t objFound;
    int32_t  dopplerIndex;
    float    outputAngle, refAngle;
    for (refIdx = 0; refIdx < gGenFrameDataObj.numTargets; refIdx++)
    {
        objFound = 0;
        for (j = 0; j < obj->numObjOut; j++)
        {

            dopplerIndex = obj->objOut[j].dopplerIdx;

            if (obj->numVirtualAntAzim > 1)
            {
                if ((obj->objOut[j].rangeIdx == gGenFrameDataObj.targetObj[refIdx].rngPhyBin) &&
                        (dopplerIndex == gGenFrameDataObj.targetObj[refIdx].doppPhyBin))
                {
                   /* check if azimuth is within the allowed range due to Log2(abs(val)) imprecision*/
                      if(((obj->detObj2dAzimIdx[j] <= gGenFrameDataObj.targetObj[refIdx].azimPhyBin + AZIMUTH_ALLOWED_ERROR) &&
                         ((int32_t)obj->detObj2dAzimIdx[j] >= (int32_t)gGenFrameDataObj.targetObj[refIdx].azimPhyBin - AZIMUTH_ALLOWED_ERROR))
                          
                         ||((gGenFrameDataObj.targetObj[refIdx].azimPhyBin + AZIMUTH_ALLOWED_ERROR >= 64) && 
                         (obj->detObj2dAzimIdx[j] <= ((gGenFrameDataObj.targetObj[refIdx].azimPhyBin + AZIMUTH_ALLOWED_ERROR)&0x3F)))
                         
                         ||((gGenFrameDataObj.targetObj[refIdx].azimPhyBin < AZIMUTH_ALLOWED_ERROR ) &&
                         (obj->detObj2dAzimIdx[j] >= (gGenFrameDataObj.targetObj[refIdx].azimPhyBin +64-AZIMUTH_ALLOWED_ERROR))))
                      {
                         objFound = 1;
                         break;
                      }
                      else
                      {
                        /* If multipeak azimuth is enabled, a different object with different azimuth
                         can be found for the same range/doppler. In this case, this is not necessarily
                         an error condition.
                         If there multipeak search is not enabled, then the detected object for this
                         range and doppler must be withing the range for the azimuth imprecision.*/
                        if(obj->cliCfg->multiObjBeamFormingCfg.enabled != MMWDEMO_AZIMUTH_TWO_PEAK_DETECTION_ENABLE)
                        {
                            printf("Azimuth error for index [%d] is %d. Maximum allowed error for azimuth is %d.\n",
                                   j,abs(obj->detObj2dAzimIdx[j] - gGenFrameDataObj.targetObj[refIdx].azimPhyBin),
                                   AZIMUTH_ALLOWED_ERROR);
                        }            
                      }
                }
            }
            else
            {
                if ((obj->objOut[j].rangeIdx == gGenFrameDataObj.targetObj[refIdx].rngPhyBin) &&
                        (dopplerIndex == gGenFrameDataObj.targetObj[refIdx].doppPhyBin))
                {
                    objFound = 1;
                    break;
                }
            }
        }

        /* Need to check the elevation angle?*/
        if((objFound == 1) && (obj->numVirtualAntElev > 0))
        {
            /* compare output (detected) angle against reference angle*/
            outputAngle = (float)(180/PI_)*asin(obj->detObjElevationAngle[j]);
            refAngle    = (float)(180/PI_)*asin(gGenFrameDataObj.targetObj[refIdx].elevationPhy/PI_);
            
            if((outputAngle > refAngle + ELEVATION_ALLOWED_ERROR) ||
               (outputAngle < refAngle - ELEVATION_ALLOWED_ERROR) )
            {
                isOk = 0;
                printf("Target Reference number[%d]: Error in elevation estimation. outputAngle=%2.2f refAngle=%2.2f\n",refIdx+1,outputAngle,refAngle);
            }                
        }
        
        if (!objFound)
        {
            isOk = 0;
            break;
        }
    }
    
        
    /* check if found the correct number of targets */
    if(gGenFrameDataObj.numTargets != obj->numObjOut)
    {
        printf("Expected number of targets = %d. Detected number of targets = %d.\n",    
               gGenFrameDataObj.numTargets, obj->numObjOut);
    }
    
    return isOk;
}

void Test_printResults(MmwDemo_DataPathObj *obj, char* feature)
{
    printf("2D calculation Done!! num obj: %d\n\r", obj->numObjOut);
    {
        uint32_t i;
        int32_t dopplerIndex;
        uint32_t testStatus;

        printf("\tPeak,\tRange,\tDoppler,Azimuth,Elevation\n");
        for (i = 0; i < obj->numObjOut; i++)
        {
            dopplerIndex = obj->objOut[i].dopplerIdx;
            printf("[%2d]:\t%5d\t%4d\t%4d\t%4d",i ,
                    obj->objOut[i].peakVal,
                    obj->objOut[i].rangeIdx,
                    dopplerIndex,
                    obj->detObj2dAzimIdx[i]);
                    
            if(obj->numVirtualAntElev > 0)
            {
                /*detObjElevationAngle = Wz/PI.
                  Wz = PI*sin(phy)
                  phy = arcsin(detObjElevationAngle)
                */
                printf("\t%2.2lf\n",180*asin(obj->detObjElevationAngle[i])/PI_);
            }            
            else
            {
                printf("\tNA\n");
            }
        }

        testStatus = Test_CompareToRef(obj);
        if(testStatus == 1)
        {
            System_printf("\nTest PASSED!\n");
            MCPI_setFeatureTestResult(feature, MCPI_TestResult_PASS);
        }
        else
        {
            System_printf("\nTest FAILED!\n");
            MCPI_setFeatureTestResult(feature, MCPI_TestResult_FAIL);
        }

    }
}

void Test_testDataInit(void)
{
#ifdef USE_REFERENCE_ASCI_FILE
    FILE * fileId = fopen("..\\matlab\\ref_input_frame.dat", "r");
    if (fileId == NULL)
    {
        printf("Error:  Cannot open reference file!\n");
        exit(0);
    }
#endif

#ifdef USE_REFERENCE_BIN_FILE
    FILE * fileId = fopen("..\\matlab\\ref_input_frame.bin", "rb");
    if (fileId == NULL)
    {
        printf("Error:  Cannot open reference file!\n");
        exit(0);
    }
#endif
}

void Test_getChirpData(MmwDemo_DataPathObj *obj)
{
#ifndef USE_BUILT_IN_GENERATOR
    uint32_t refReadIndex = 0;
#endif
#ifndef USE_BUILT_IN_GENERATOR
    uint32_t sampIdx, antIndx;
    uint32_t * cmplxSampPtr;
    cmplxSampPtr = (uint32_t *) obj->ADCdataBuf;
#endif

#ifdef USE_BUILT_IN_REFERENCE
    for (antIndx = 0; antIndx < obj->numRxAntennas;  antIndx++)
    {
        for (sampIdx = 0; sampIdx < obj->numRangeBins;  sampIdx++)
        {
            cmplxSampPtr[(antIndx * obj->numRangeBins) + sampIdx] = ref_input_frame[refReadIndex++];
        }
    }
#endif

#ifdef USE_REFERENCE_ASCI_FILE
    uint32_t refReadIndex = 0;
    for (antIndx = 0; antIndx < obj->numRxAntennas;  antIndx++)
    {
        for (sampIdx = 0; sampIdx < obj->numRangeBins;  sampIdx++)
        {
            fscanf(fileId, "%x\n", &cmplxSampPtr[(antIndx * obj->numRangeBins) + sampIdx]);
        }
    }
#endif

#ifdef USE_REFERENCE_BIN_FILE
    fread( (uint8_t *) cmplxSampPtr, sizeof( uint32_t ), obj->numRxAntennas * obj->numRangeBins, fileId );
#endif

#ifdef USE_BUILT_IN_GENERATOR
    /* The chirp will be placed/written into HWA's M0 memory to be processed by HWA in this test.
       This is done because CPU can not write to real ADC buffer, therefore, in this test
       the chirp is written directly into the HWA memory.*/
    genChirpData (obj, &gGenFrameDataObj,(uint8_t *)MMW_HWA_1D_ADCBUF_INP);
#endif
}

void MmwDemo_CliCommonCfgInit(void)
{
    uint32_t i;

    memset((void *)&gCliCommonCfg, 0, sizeof(MmwDemo_CliCommonCfg_t));

    /* Initialize range bias and rx channel compensation coefficients */
    gCliCommonCfg.compRxChanCfg.rangeBias = 0;

    /* Initialize Rx channel phase compensation coefficients to 1 in Q15 */
    for (i = 0; i < (SYS_COMMON_NUM_TX_ANTENNAS*SYS_COMMON_NUM_RX_CHANNEL); i++)
    {
        gCliCommonCfg.compRxChanCfg.rxChPhaseComp[i].real = 32767;
        gCliCommonCfg.compRxChanCfg.rxChPhaseComp[i].imag = 0;
    }
}

void Test_task(UArg arg0, UArg arg1)
{
    MmwDemo_DataPathObj *dataPathObj = &gDataPathObj;
    uint16_t numDetectedObjects;
    int32_t  errCode; 
    uint32_t i;

    FILE * fileId;    
    uint32_t numTests;
    uint32_t testIndx;
    char tempMsg[20]; 
    char featureName[200]; 
     
    Test_testDataInit();

    MmwDemo_CliCommonCfgInit();

    MmwDemo_dataPathObjInit(dataPathObj, &gCliCfg, &gCliCommonCfg);

    if(gReadTestConfigFromBinFile)
    {
        fileId = fopen("..\\testdata\\xwr14xx_data_path_test_config.bin", "rb");
        if (fileId == NULL)
        {
            printf("Error:  Cannot open xwr14xx_data_path_test_config.bin!\n");
            exit(0);
        }
        /* read in number of tests to be run */
        fread(&numTests, sizeof(uint32_t),1,fileId);
    }
    else
    {
        numTests = 1;
    }
    printf("%d Tests to be run\n\r", numTests);
    
    /* process each test */
    for (testIndx = 0; testIndx < numTests;  testIndx++)
    {
        sensorConfig_t *sensorConfig;
        sceneConfig_t *sceneConfig;
        uint8_t sceneObjIndx;
        
        sensorConfig = &gFrameConfig.sensorConfig;
        sceneConfig = &gFrameConfig.sceneConfig;  
        
        printf("Test #%d start\r", testIndx);

        if (gReadTestConfigFromBinFile)
        {
            /* read in test config */
            fread(&sensorConfig->numRxAntennas, sizeof(uint32_t),1,fileId);
            fread(&sensorConfig->numAdcSamples, sizeof(uint32_t),1,fileId);
            fread(&sensorConfig->numTxAntAzim, sizeof(uint32_t),1,fileId);
            fread(&sensorConfig->numTxAntElev, sizeof(uint32_t),1,fileId);
            fread(&sensorConfig->numAngleBins, sizeof(uint32_t),1,fileId);
            fread(&sensorConfig->numChirpsPerFrame, sizeof(uint32_t),1,fileId);           

            fread(&sceneConfig->numTargets, sizeof(uint32_t),1,fileId);
            fread(&sceneConfig->snrdB, sizeof(int32_t),1,fileId);
            
            for (sceneObjIndx = 0; sceneObjIndx < MAX_NUM_OBJECTS; sceneObjIndx++)
            {
                fread(&sceneConfig->sceneObj[sceneObjIndx].amplitude, sizeof(uint32_t),1,fileId); 
                fread(&sceneConfig->sceneObj[sceneObjIndx].azimPhyBin, sizeof(uint32_t),1,fileId);
                fread(&sceneConfig->sceneObj[sceneObjIndx].rngPhyBin, sizeof(uint32_t),1,fileId);
                fread(&sceneConfig->sceneObj[sceneObjIndx].doppPhyBin, sizeof(int32_t),1,fileId);
                fread(&sceneConfig->sceneObj[sceneObjIndx].elevationDeg, sizeof(int32_t),1,fileId);
            }
        }

        printf("numRxAntennas = %d\r", sensorConfig->numRxAntennas);      
        printf("numAdcSamples = %d\r", sensorConfig->numAdcSamples);                   
        printf("numTxAntAzim = %d\r", sensorConfig->numTxAntAzim);                   
        printf("numTxAntElev = %d\r", sensorConfig->numTxAntElev);
        printf("numAngleBins = %d\r",  sensorConfig->numAngleBins);                   
        printf("numChirpsPerFrame = %d\r", sensorConfig->numChirpsPerFrame);
        printf("numTargets = %d\r", sceneConfig->numTargets);
        printf("snrdB = %d\r", sceneConfig->snrdB);
        
        for (sceneObjIndx = 0; sceneObjIndx < MAX_NUM_OBJECTS; sceneObjIndx++)
        {
            printf("sceneObj[%d] = \r", sceneObjIndx);
            printf("    amplitude = %d\r", sceneConfig->sceneObj[sceneObjIndx].amplitude);    
            printf("    azimPhyBin = %d\r", sceneConfig->sceneObj[sceneObjIndx].azimPhyBin);
            printf("    rngPhyBin = %d\r", sceneConfig->sceneObj[sceneObjIndx].rngPhyBin);    
            printf("    doppPhyBin = %d\r", sceneConfig->sceneObj[sceneObjIndx].doppPhyBin);
            printf("    elevationDeg = %d\r", sceneConfig->sceneObj[sceneObjIndx].elevationDeg);
        }
        printf("\n");

        /* check validity of arguments */
        if((sensorConfig->numChirpsPerFrame % 
            (sensorConfig->numTxAntAzim + sensorConfig->numTxAntElev)) != 0)
        {
            printf("\n#### BAD argument. numChirpsPerFrame needs to be (power of 2)*(numTxAntAzim + numTxAntElev)\n\n");
        }
        
        /* prepare the feature to be printed in test report */
        if (sceneConfig->numTargets == 2)
        {
            sprintf(tempMsg, "%s", " m");
        }
        else
        {
            sprintf(tempMsg, "%s", " r");
        }
        sprintf(featureName, "%d%s%d%s%d%s%d%s%d%s%d%s",testIndx,
            ":TxA", sensorConfig->numTxAntAzim,
            " TxE", sensorConfig->numTxAntElev,
            " Rx", sensorConfig->numRxAntennas,
            " R", sensorConfig->numAdcSamples,
            " D", sensorConfig->numChirpsPerFrame /
                (sensorConfig->numTxAntAzim + sensorConfig->numTxAntElev),
            tempMsg);
    
        /* Initialize HWA */
        MmwDemo_hwaInit(dataPathObj);
        
        /* Initialize EDMA */
        MmwDemo_edmaInit(dataPathObj);
    
        /* datapath open*/
        MmwDemo_hwaOpen(dataPathObj, socHandle);
        MmwDemo_edmaOpen(dataPathObj);
    
        Test_setProfile(dataPathObj, &gFrameConfig.sensorConfig);

        /* datapath config*/
        MmwDemo_dataPathCfgBuffers(dataPathObj, &gMmwL3heap);
        //System_printf("MmwDemo_dataPathCfgBuffers done\n");
    
        MmwDemo_dataPathConfigCommon(dataPathObj);
        //System_printf("MmwDemo_dataPathConfigCommon done\n");
    
        MmwDemo_config1D_HWA(dataPathObj);
        //System_printf("MmwDemo_config1D_HWA done\n");
    
        MmwDemo_dataPathTrigger1D(dataPathObj);
        //System_printf("MmwDemo_dataPathTrigger1D done\n");

#ifdef USE_BUILT_IN_GENERATOR    
        Test_initGenerator(dataPathObj, &gFrameConfig.sceneConfig);
        System_printf("Test_initGenerator done\n");
#endif
    
        /* receive all chirps per frame*/
        for(i=0; i<dataPathObj->numChirpsPerFrame; i++)
        {
            Test_getChirpData(dataPathObj);
     
            MEM_BARRIER();
            /* Enable the HWA */
            errCode = HWA_setSoftwareTrigger(dataPathObj->hwaHandle);
            if (errCode != 0)
            {
                System_printf("Error: HWA_enable(1) returned %d\n",errCode);
                return;
            }
            /* make sure HWA finishes before triggering next chirp */
            Task_sleep(1);
        }    

        /*process frame*/
        /* 1st D FFT */
        MmwDemo_dataPathWait1D(dataPathObj);
        //System_printf("MmwDemo_dataPathWait1D done\n");
    
        /* 2nd D FFT */
        MmwDemo_process2D(dataPathObj);
        //System_printf("MmwDemo_process2D done\n");
    
        /* CFAR */
        MmwDemo_processCfar(dataPathObj, &numDetectedObjects);
        //System_printf("MmwDemo_processCfar done\n");
    
        /* Postprocessing/angle estimation */
        dataPathObj->numHwaCfarDetections = numDetectedObjects;
        MmwDemo_processAngle(dataPathObj);

        MmwDemo_edmaClose(dataPathObj);
        MmwDemo_hwaClose(dataPathObj);
        MmwDemo_dataPathDeleteSemaphore(dataPathObj);
        
        Test_printResults(dataPathObj, (char*)&featureName);

        printf("Test #%d finished!\n\r", testIndx);
    }/* end of each test */
    
    printf("All %d Tests finished!\n\r", testIndx);

    if(gReadTestConfigFromBinFile)
    {
        fclose(fileId);
    }

    MCPI_setTestResult ();

    /* Exit BIOS */
    BIOS_exit(0);
}

/**
 *  @b Description
 *  @n
 *      Entry point into the test code.
 *
 *  @retval
 *      Not Applicable.
 */
int main (void)
{
    Task_Params taskParams;
    int32_t     errCode;
    SOC_Cfg     socCfg;

    /* Initialize test logger */
    MCPI_Initialize();

    /* Initialize the ESM: Dont clear errors as TI RTOS does it */
    ESM_init(0U);
#if 0
    Cycleprofiler_init();
#endif

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

    /* Initialize the Task Parameters. */
    Task_Params_init(&taskParams);
    taskParams.stackSize = 4*1024;
    Task_create(Test_task, &taskParams, NULL);

    /* Start BIOS */
    BIOS_start();
    
    return 0;
}


