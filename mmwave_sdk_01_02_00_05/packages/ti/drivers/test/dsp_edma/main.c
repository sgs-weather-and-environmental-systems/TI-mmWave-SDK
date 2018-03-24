/**
 *   @file  main.c
 *
 *   @brief
 *      Unit Test code for the EDMA driver.
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

 /** @mainpage DSP(C674)-EDMA Data Path Processing Chain Unit Test
 *
 *  @section intro_sec Introduction
 *
 *  The data path processing on XWR16xx for 1D, 2D and 3D processing consists of 
 *  a coordinated execution between
 *  the C674 DSP and EDMA. This is demonstrated as part of millimeter wave demo
 *  located at:
 *   @verbatim ti\demo\xwr16xx\mmw @endverbatim 
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
 *
 *   \f[
 *          x_{k,m}(n)=A \exp (j2\pi\frac{f_R}{N_{RFFT}}n + j2\pi\frac{f_A}{N_{AFFT}}(m+(k \% N_{Tx})N_{Rx}) + j2\pi\frac{f_D}{N_{Tx} \cdot N_{DFFT}}k) + noise
 *   \f]
 *
 *   where
 *   - \f$k\f$ is chirp index in the frame \f$k=0,...,N_{Tx}N_{DFFT}-1\f$
 *   - \f$m\f$ is receive antenna index   \f$m=0,...,N_{Rx}-1\f$
 *   - \f$n\f$ is sample index inside the chirp \f$n=0,N_{RFFT}-1\f$
 *   - \f$N_{RFFT}\f$ is number of range bins, (range FFT size)
 *   - \f$f_{R}\f$ is expected peak index in the range FFT
 *   - \f$f_{D}\f$ is expected peak index at the Doppler FFT
 *   - \f$f_{A}\f$ is expected peak index at the azimuth FFT
 *   - \f$N_{AFFT}\f$ is number of angle bins (azimuth FFT size)
 *   - \f$N_{Tx}\f$ is number of Tx antennas
 *   - \f$N_{Rx}\f$ is number of Rx antennas
 *   - \f$N_{DFFT}\f$ is number of Doppler bins (Doppler FFT size)
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
#if defined (SUBSYS_DSS)
#include <ti/sysbios/family/c64p/Hwi.h>
#include <ti/sysbios/family/c64p/EventCombiner.h>
#endif
#define DebugP_ASSERT_ENABLED 1
#include <ti/drivers/osal/DebugP.h>
#include <assert.h>
#include <ti/common/sys_common.h>
#include <ti/drivers/osal/SemaphoreP.h>
#include <ti/drivers/edma/edma.h>
#include <ti/drivers/esm/esm.h>
#include <ti/drivers/soc/soc.h>

#include <ti/alg/mmwavelib/mmwavelib.h>
#include "gen_twiddle_fft32x32.h"
#include "gen_twiddle_fft16x16.h"
#include "DSP_fft32x32.h"
#include "DSP_fft16x16.h"
/* Suppress the mathlib.h warnings
 *  #48-D: incompatible redefinition of macro "TRUE"
 *  #48-D: incompatible redefinition of macro "FALSE" 
 */
#pragma diag_push
#pragma diag_suppress 48
#include <ti/mathlib/mathlib.h>
#pragma diag_pop

#include <ti/control/mmwavelink/mmwavelink.h>
#include <ti/demo/xwr16xx/mmw/dss/dss_config_edma_util.h>
#include <ti/demo/xwr16xx/mmw/dss/dss_data_path.h>
#include <ti/drivers/test/common/gen_frame_data.h>
#include <ti/utils/cycleprofiler/cycle_profiler.h> 

#include <ti/utils/testlogger/logger.h>

/**
 * @brief
 *  Initialize the MCPI Log Message Buffer
 */
MCPI_LOGBUF_INIT(9216);

bool gReadTestConfigFromBinFile = false;

volatile uint32_t gSubFrameSwitchingCycles = 0;

typedef struct sensorConfig_t_ {
    uint32_t numRxAntennas;
    uint32_t numAdcSamples;
    uint32_t numTxAntennas;
    uint32_t numAngleBins;
    uint32_t numChirpsPerFrame;
} sensorConfig_t;

typedef struct subFrameConfig_t_ {
    sensorConfig_t sensorConfig;
    sceneConfig_t sceneConfig;
} subFrameConfig_t;

uint8_t gNumSubFrames = RL_MAX_SUBFRAMES;

MmwDemo_DSS_DataPathObj gDataPathObj[RL_MAX_SUBFRAMES];
MmwDemo_DSS_dataPathContext_t gMmwDemo_dataPathContext;
MmwDemo_CliCfg_t gCliCfg[RL_MAX_SUBFRAMES];
MmwDemo_CliCommonCfg_t gCliCommonCfg;
MmwDemo_Cfg gCfg;

genFrameStruc_t gGenFrameDataObj;

volatile cycleLog_t gCycleLog;

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
 *      Prints to console DSS assert information
 *
 *  @retval
 *      Not Applicable.
 */
void _MmwDemo_dssAssert(int32_t expression,const char *file, int32_t line)
{
    if (!expression) 
    {
        System_printf ("Exception: %s, line %d.\n",file,line);
    }    
}        

/* hard-code numbers below, in future can read from test vector file (meta-information) */
void Test_setProfile(MmwDemo_DSS_DataPathObj *obj, sensorConfig_t *sensorConfig)
{
    MmwDemo_CliCfg_t *cliCfg = obj->cliCfg;
    int32_t i;

    obj->numRxAntennas = sensorConfig->numRxAntennas;

    obj->numAdcSamples = sensorConfig->numAdcSamples;
    obj->numRangeBins = MmwDemo_pow2roundup(obj->numAdcSamples);
    obj->numTxAntennas = sensorConfig->numTxAntennas;
    obj->numAngleBins = sensorConfig->numAngleBins;
    obj->numChirpsPerFrame = sensorConfig->numChirpsPerFrame;
    obj->numDopplerBins = obj->numChirpsPerFrame/obj->numTxAntennas;

    obj->numVirtualAntAzim   = obj->numTxAntennas * obj->numRxAntennas;
    obj->numVirtualAntElev   = 0;
    obj->numVirtualAntennas  = obj->numVirtualAntAzim + obj->numVirtualAntElev;

    for (i = 0; i < obj->numVirtualAntennas; i++)
    {
        obj->compRxChanCfg.rxChPhaseComp[i] = obj->cliCommonCfg->compRxChanCfg.rxChPhaseComp[i];
    }

    /*For Debugging only, eventually will take valuse from input configuration*/
    obj->rangeResolution = 3e8 /*light speed*/ * 4000e3 /*Fsamp*/  / (2 * 4e12 /*Slope*/ * obj->numRangeBins);

    cliCfg->cfarCfgDoppler.averageMode = MMW_NOISE_AVG_MODE_CFAR_CA;
    cliCfg->cfarCfgDoppler.cyclicMode = 0;
    cliCfg->cfarCfgDoppler.guardLen = 4;
    cliCfg->cfarCfgDoppler.noiseDivShift = 4;
    cliCfg->cfarCfgDoppler.thresholdScale = obj->numVirtualAntAzim*500;
    cliCfg->cfarCfgDoppler.winLen = 8; /* 2^(noiseDivShift-1)*/
    if ( obj->numDopplerBins == 16  )
    {
        cliCfg->cfarCfgDoppler.guardLen = 3;
        cliCfg->cfarCfgDoppler.noiseDivShift = 3;
        cliCfg->cfarCfgDoppler.winLen = 4; /* 2^(noiseDivShift-1)*/
    }

    cliCfg->cfarCfgRange.averageMode = MMW_NOISE_AVG_MODE_CFAR_CASO;
    cliCfg->cfarCfgRange.cyclicMode = 0;
    cliCfg->cfarCfgRange.guardLen = 4;
    cliCfg->cfarCfgRange.noiseDivShift = 4;
    cliCfg->cfarCfgRange.thresholdScale = obj->numVirtualAntAzim*700;
    cliCfg->cfarCfgRange.winLen = 8;

    cliCfg->multiObjBeamFormingCfg.enabled = 1;
    cliCfg->multiObjBeamFormingCfg.multiPeakThrsScal = 0.5;

    cliCfg->peakGroupingCfg.scheme = MMW_PEAK_GROUPING_DET_MATRIX_BASED;
    cliCfg->peakGroupingCfg.inDopplerDirectionEn = 1;
    cliCfg->peakGroupingCfg.inRangeDirectionEn = 1;
    cliCfg->peakGroupingCfg.maxRangeIndex = obj->numRangeBins - 1;
    cliCfg->peakGroupingCfg.minRangeIndex = 0;

    cliCfg->calibDcRangeSigCfg.enabled = 0;

    cliCfg->extendedMaxVelocityCfg.enabled = 0;

    cliCfg->clutterRemovalCfg.enabled = 0;

    /*disable BPM in all subframes*/
    cliCfg->bpmCfg.isEnabled = 0;
    cliCfg->bpmCfg.chirp0Idx = 0; 
    cliCfg->bpmCfg.chirp1Idx = 1;
    
    /* Presently cannot support multi-chirp test data generation,
       hence setting below to 1 */
    obj->numChirpsPerChirpEvent = 1;

    System_printf("Number of antennas: Ntx=%d, Nrx=%d\n",obj->numTxAntennas, obj->numRxAntennas);
}

#ifdef USE_BUILT_IN_GENERATOR
void Test_initGenerator(MmwDemo_DSS_DataPathObj *obj, sceneConfig_t *sceneConfig)
{
    /* Initialize ref data generator*/
    initFrameData (obj, &gGenFrameDataObj, sceneConfig);
}
#endif

uint32_t Test_CompareToRef(MmwDemo_DSS_DataPathObj *obj)
{
    uint32_t isOk = 1;
    uint32_t refIdx;
    uint32_t j;
    uint32_t objFound;
    int32_t dopplerIndex;

    for (refIdx = 0; refIdx < gGenFrameDataObj.numTargets; refIdx++)
    {
        objFound = 0;
        for (j = 0; j < obj->numDetObj; j++)
        {

            dopplerIndex = obj->detObj2D[j].dopplerIdx;
            if (obj->numVirtualAntAzim > 1)
            {
                if ((obj->detObj2D[j].rangeIdx == gGenFrameDataObj.targetObj[refIdx].rngPhyBin) &&
                        (dopplerIndex == gGenFrameDataObj.targetObj[refIdx].doppPhyBin) &&
                   ((obj->detObj2dAzimIdx[j] == gGenFrameDataObj.targetObj[refIdx].azimPhyBin) ||
                    ((obj->numVirtualAntAzim ==4) &&
                    (((obj->detObj2dAzimIdx[j]+2)&0x3F) == gGenFrameDataObj.targetObj[refIdx].azimPhyBin))||
                    ((obj->numVirtualAntAzim ==4) &&
                    (((obj->detObj2dAzimIdx[j]+1)&0x3F) == gGenFrameDataObj.targetObj[refIdx].azimPhyBin))||
                    ((obj->numVirtualAntAzim ==8) &&
                    (((obj->detObj2dAzimIdx[j]+1)&0x3F) == gGenFrameDataObj.targetObj[refIdx].azimPhyBin))))
                {
                    objFound = 1;
                    break;
                }
            }
            else
            {
                if ((obj->detObj2D[j].rangeIdx == gGenFrameDataObj.targetObj[refIdx].rngPhyBin) &&
                        (dopplerIndex == gGenFrameDataObj.targetObj[refIdx].doppPhyBin))
                {
                    objFound = 1;
                    break;
                }
            }
        }

        if (!objFound)
        {
            isOk = 0;
            break;
        }
    }

    return isOk;
}

void Test_printResults(MmwDemo_DSS_DataPathObj *obj, char* feature)
{
    
    printf("\nCycle profiling: interChirpProcessingTime = %d\n", gCycleLog.interChirpProcessingTime);
    printf("Cycle profiling: interFrameProcessingTime = %d\n", gCycleLog.interFrameProcessingTime);
    printf("Cycle profiling: subFrameSwitchingTime = %d\n\r", gSubFrameSwitchingCycles);
    
    printf("2D calculation Done!! Obj: %d\n\r", obj->numDetObj);
    {
        uint32_t i;
        int32_t dopplerIndex;
        uint32_t testStatus;

        printf("    Peak, Range, Doppler, Azimuth\n");
        for (i = 0; i < obj->numDetObj; i++)
        {
            dopplerIndex = obj->detObj2D[i].dopplerIdx;
            printf("[%2d]: %5d %4d %4d  %4d\n",i ,
                    obj->detObj2D[i].peakVal,
                    obj->detObj2D[i].rangeIdx,
                    dopplerIndex,
                    obj->detObj2dAzimIdx[i]);

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

void Test_getChirpData(MmwDemo_DSS_DataPathObj *obj)
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
    genChirpData (obj, &gGenFrameDataObj);
#endif
}

void Test_processFrame(MmwDemo_DSS_DataPathObj *obj)
{
    volatile uint32_t startTime;

    do 
    {
        Test_getChirpData(obj);
        MmwDemo_processChirp(obj, 0);        
    } while (obj->chirpCount != 0);

    MmwDemo_waitEndOfChirps(obj);
    startTime = Cycleprofiler_getTimeStamp();
    MmwDemo_interFrameProcessing(obj);
    obj->timingInfo.interFrameProcCycles = Cycleprofiler_getTimeStamp() - startTime;
}

subFrameConfig_t gSubFrameConfig[RL_MAX_SUBFRAMES] = 
{
    {
        .sensorConfig.numRxAntennas = 4,
        .sensorConfig.numAdcSamples = 256,
        .sensorConfig.numTxAntennas = 2,
        .sensorConfig.numAngleBins = 64,
        .sensorConfig.numChirpsPerFrame = 32,
        
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
    },
    {   
        .sensorConfig.numRxAntennas = 4,
        .sensorConfig.numAdcSamples = 512,
        .sensorConfig.numTxAntennas = 1,
        .sensorConfig.numAngleBins = 64,
        .sensorConfig.numChirpsPerFrame = 64,
        
        .sceneConfig.snrdB = 20,
        .sceneConfig.numTargets = 4,
        
        .sceneConfig.sceneObj[0].amplitude = 1000,
        .sceneConfig.sceneObj[0].azimPhyBin = 15,
        .sceneConfig.sceneObj[0].rngPhyBin = 200,
        .sceneConfig.sceneObj[0].doppPhyBin = 10,
        .sceneConfig.sceneObj[0].elevationDeg = -5,
        
        .sceneConfig.sceneObj[1].amplitude = 800,
        .sceneConfig.sceneObj[1].azimPhyBin = 7,
        .sceneConfig.sceneObj[1].rngPhyBin = 70,
        .sceneConfig.sceneObj[1].doppPhyBin = -2,
        .sceneConfig.sceneObj[1].elevationDeg = 0,       

        .sceneConfig.sceneObj[2].amplitude = 700,
        .sceneConfig.sceneObj[2].azimPhyBin = 20,
        .sceneConfig.sceneObj[2].rngPhyBin = 43,
        .sceneConfig.sceneObj[2].doppPhyBin = -12,
        .sceneConfig.sceneObj[2].elevationDeg = 11,

        .sceneConfig.sceneObj[3].amplitude = 600,
        .sceneConfig.sceneObj[3].azimPhyBin = 55,
        .sceneConfig.sceneObj[3].rngPhyBin = 8,
        .sceneConfig.sceneObj[3].doppPhyBin = 7,
        .sceneConfig.sceneObj[3].elevationDeg = -9    
    },
    {   
        .sensorConfig.numRxAntennas = 4,
        .sensorConfig.numAdcSamples = 1024,
        .sensorConfig.numTxAntennas = 2,
        .sensorConfig.numAngleBins = 64,
        .sensorConfig.numChirpsPerFrame = 32,
        
        .sceneConfig.snrdB = 15,
        .sceneConfig.numTargets = 4,
        
        .sceneConfig.sceneObj[0].amplitude = 1000,
        .sceneConfig.sceneObj[0].azimPhyBin = 15,
        .sceneConfig.sceneObj[0].rngPhyBin = 1000,
        .sceneConfig.sceneObj[0].doppPhyBin = 7,
        .sceneConfig.sceneObj[0].elevationDeg = -5,
        
        .sceneConfig.sceneObj[1].amplitude = 800,
        .sceneConfig.sceneObj[1].azimPhyBin = 7,
        .sceneConfig.sceneObj[1].rngPhyBin = 100,
        .sceneConfig.sceneObj[1].doppPhyBin = -2,
        .sceneConfig.sceneObj[1].elevationDeg = 0,       

        .sceneConfig.sceneObj[2].amplitude = 700,
        .sceneConfig.sceneObj[2].azimPhyBin = 20,
        .sceneConfig.sceneObj[2].rngPhyBin = 500,
        .sceneConfig.sceneObj[2].doppPhyBin = -7,
        .sceneConfig.sceneObj[2].elevationDeg = 11,

        .sceneConfig.sceneObj[3].amplitude = 600,
        .sceneConfig.sceneObj[3].azimPhyBin = 55,
        .sceneConfig.sceneObj[3].rngPhyBin = 1023,
        .sceneConfig.sceneObj[3].doppPhyBin = 3,
        .sceneConfig.sceneObj[3].elevationDeg = -9    
    },
    {   
        .sensorConfig.numRxAntennas = 4,
        .sensorConfig.numAdcSamples = 64,
        .sensorConfig.numTxAntennas = 2,
        .sensorConfig.numAngleBins = 64,
        .sensorConfig.numChirpsPerFrame = 512,
        
        .sceneConfig.snrdB = 25,
        .sceneConfig.numTargets = 4,
        
        .sceneConfig.sceneObj[0].amplitude = 1000,
        .sceneConfig.sceneObj[0].azimPhyBin = 15,
        .sceneConfig.sceneObj[0].rngPhyBin = 63,
        .sceneConfig.sceneObj[0].doppPhyBin = 100,
        .sceneConfig.sceneObj[0].elevationDeg = -5,
        
        .sceneConfig.sceneObj[1].amplitude = 800,
        .sceneConfig.sceneObj[1].azimPhyBin = 7,
        .sceneConfig.sceneObj[1].rngPhyBin = 10,
        .sceneConfig.sceneObj[1].doppPhyBin = -20,
        .sceneConfig.sceneObj[1].elevationDeg = 0,       

        .sceneConfig.sceneObj[2].amplitude = 700,
        .sceneConfig.sceneObj[2].azimPhyBin = 20,
        .sceneConfig.sceneObj[2].rngPhyBin = 20,
        .sceneConfig.sceneObj[2].doppPhyBin = -120,
        .sceneConfig.sceneObj[2].elevationDeg = 11,

        .sceneConfig.sceneObj[3].amplitude = 600,
        .sceneConfig.sceneObj[3].azimPhyBin = 55,
        .sceneConfig.sceneObj[3].rngPhyBin = 2,
        .sceneConfig.sceneObj[3].doppPhyBin = 7,
        .sceneConfig.sceneObj[3].elevationDeg = -9    
    }
};

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
    FILE * fileId;    
    uint32_t numTests;
    uint32_t testIndx;
    char tempMsg[20]; 
    char featureName[RL_MAX_SUBFRAMES][200];
    uint8_t subFrameIndx;
    uint32_t sceneObjIndx;
    volatile uint32_t startTime;

    MmwDemo_DSS_DataPathObj *dataPathObj;

    Test_testDataInit();
    MmwDemo_dataPathInitEdma(&gMmwDemo_dataPathContext);
    
    MmwDemo_CliCommonCfgInit();

    for(subFrameIndx = 0; subFrameIndx < gNumSubFrames; subFrameIndx++)
    { 
        dataPathObj = &gDataPathObj[subFrameIndx];
        MmwDemo_dataPathObjInit(&gDataPathObj[subFrameIndx],
                                &gMmwDemo_dataPathContext,
                                &gCliCfg[subFrameIndx],
                                &gCliCommonCfg,
                                &gCfg);
    }
        
    if(gReadTestConfigFromBinFile)
    {
        fileId = fopen("..\\testdata\\xwr16xx_data_path_test_config.bin", "rb");
        if (fileId == NULL)
        {
            printf("Error:  Cannot open xwr16xx_data_path_test_config.bin!\n");
            exit(0);
        }
        /* read in number of tests to be run */
        fread(&numTests, sizeof(uint32_t),1,fileId);
    }
    else
    {
        numTests = 4;
    }
    printf("%d Tests to be run\n\r", numTests);

    if (numTests % gNumSubFrames)
    {
        printf("numTests = %d must be a multiple of gNumSubFrames = %d\n", numTests, gNumSubFrames);
        BIOS_exit(0);
    }

    /* process each test */
    for (testIndx = 0, subFrameIndx = 0; testIndx < numTests; testIndx++)
    {
        sensorConfig_t *sensorConfig;
        sceneConfig_t *sceneConfig;
        
        sensorConfig = &gSubFrameConfig[subFrameIndx].sensorConfig;
        sceneConfig = &gSubFrameConfig[subFrameIndx].sceneConfig;    

        dataPathObj = &gDataPathObj[subFrameIndx];

        printf("Test #%d start\r", testIndx);
        if (gReadTestConfigFromBinFile)
        {
            /* read in test config */
            fread(&sensorConfig->numRxAntennas, sizeof(uint32_t),1,fileId);
            fread(&sensorConfig->numAdcSamples, sizeof(uint32_t),1,fileId);
            fread(&sensorConfig->numTxAntennas, sizeof(uint32_t),1,fileId);
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
            }
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
        sprintf(featureName[subFrameIndx], "%d%s%d%s%d%s%d%s%d%s",testIndx,
            ":Tx",sensorConfig->numTxAntennas,
            " Rx",sensorConfig->numRxAntennas,
            " R",sensorConfig->numAdcSamples,
            " D",sensorConfig->numChirpsPerFrame/sensorConfig->numTxAntennas,
            tempMsg);
     
        MmwDemo_dataPathInit1Dstate(dataPathObj);    
        Test_setProfile(dataPathObj, &gSubFrameConfig[subFrameIndx].sensorConfig);

        MmwDemo_dataPathConfigBuffers(dataPathObj, NULL);
        MmwDemo_dataPathComputeDerivedConfig(dataPathObj);

        subFrameIndx++;        
        if (subFrameIndx == gNumSubFrames)
        {
            uint32_t indx;
            for(indx = 0; indx < gNumSubFrames; indx++)
            {
                sensorConfig_t *sensorConfig;
                sceneConfig_t *sceneConfig;
        
                sensorConfig = &gSubFrameConfig[indx].sensorConfig;
                sceneConfig = &gSubFrameConfig[indx].sceneConfig;
                
                printf("numRxAntennas = %d\r", sensorConfig->numRxAntennas);      
                printf("numAdcSamples = %d\r", sensorConfig->numAdcSamples);                   
                printf("numTxAntennas = %d\r", sensorConfig->numTxAntennas);                   
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
                }
                printf("\n");
            
                dataPathObj = &gDataPathObj[indx];

                startTime = Cycleprofiler_getTimeStamp();
                    MmwDemo_dataPathConfigFFTs(dataPathObj);
                    MmwDemo_dataPathConfigEdma(dataPathObj);
                gSubFrameSwitchingCycles = Cycleprofiler_getTimeStamp() - startTime;
            
                #ifdef USE_BUILT_IN_GENERATOR    
                Test_initGenerator(dataPathObj, &gSubFrameConfig[indx].sceneConfig);
                #endif
                Test_processFrame(dataPathObj);

                Test_printResults(dataPathObj, featureName[indx]);
                
                gCycleLog.interChirpProcessingTime = 0;
                gCycleLog.interChirpWaitTime = 0;
                
                gCycleLog.interFrameProcessingTime = 0;
                gCycleLog.interFrameWaitTime = 0;
                printf("Test #%d finish!\n\r", testIndx - gNumSubFrames + indx + 1);
            }
            MmwDemo_dataPathDeleteSemaphore(dataPathObj->context);

            subFrameIndx = 0;
        }
    }

    printf("All %d Tests finish!\n\r", testIndx);

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
void main (void)
{
    Task_Params taskParams;

    /* Initialize test logger */
    MCPI_Initialize();

    Cycleprofiler_init();

#if (defined(SOC_XWR14XX) || (defined(SOC_XWR16XX) && defined(SUBSYS_MSS)))
    SOC_Handle  socHandle;
    int32_t     errCode;
    SOC_Cfg     socCfg;

    /* Initialize the ESM: Dont clear errors as TI RTOS does it */
    ESM_init(0U);

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
        return;
    }

#endif

#ifdef SUBSYS_DSS


/* map event combiners to vectors 4-7 */
{
    Hwi_Params params;
    uint32_t i;

    Hwi_Params_init(&params);
    params.enableInt = TRUE;
    for (i = 0; i < 4; i++)
    {
        params.arg = i;
        params.eventId = i;
        if (Hwi_create(4 + i, &EventCombiner_dispatch, &params, NULL) == NULL)
        {
            System_printf("failed to create Hwi interrupt %d\n",4 + i);
        }
    }
}
#endif

    /* Initialize the Task Parameters. */
    Task_Params_init(&taskParams);
    taskParams.stackSize = 4*1024;
    Task_create(Test_task, &taskParams, NULL);

    /* Start BIOS */
    BIOS_start();
    return;
}


