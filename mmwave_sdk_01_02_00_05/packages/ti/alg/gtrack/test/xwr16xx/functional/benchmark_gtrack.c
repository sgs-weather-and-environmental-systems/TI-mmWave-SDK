/*
 *   @file  benchmark_gtrack.c
 *
 *   @brief
 *      collect gtrack benchmark
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
#include <string.h>
#include <stdio.h>
#include <float.h>

#include <ti/alg/gtrack/gtrack.h>
#include <ti/utils/testlogger/logger.h>
#include <ti/utils/cycleprofiler/cycle_profiler.h>

uint32_t t1,t2;
uint32_t  cycles;

#define MAXNUMBERMEASUREMENTS 800
#define MAXNUMBERTRACKERS 20
extern GTRACK_measurementPoint pointCloud[MAXNUMBERMEASUREMENTS];



extern GTRACK_targetDesc targetDescr[MAXNUMBERTRACKERS];

extern GTRACK_gatingParams appGatingParams ;
extern GTRACK_sceneryParams appSceneryParams;
extern GTRACK_allocationParams appAllocationParams;
extern GTRACK_varParams  appStdSigma ;



#define GTRACK_SUBMODULE_BENCHMARK 0

extern void gtracker_submodule_benchmark(GTRACK_moduleConfig config, FILE *fCloud);

void gtracker_benchmark()
{

	uint16_t mNum,numData;
	uint16_t tNum;
	uint16_t ii,kk,jj;
	int32_t errCode;
	FILE *fCloud;
	
	void *hTrackModule;

	GTRACK_moduleConfig config;
	GTRACK_advancedParameters advParams;
	
	memset((void *)&config, 0, sizeof(GTRACK_moduleConfig));
	config.stateVectorType = GTRACK_STATE_VECTORS_2DA; // Track two dimensions with acceleration 
	config.verbose = GTRACK_VERBOSE_NONE; //GTRACK_VERBOSE_MATRIX; //GTRACK_VERBOSE_NONE;


	config.deltaT = 0.4f;
	config.maxRadialVelocity = 20; // Radial velocity from sensor is limited to +/- maxURV (in m/s), so the factor is almost 0
	config.maxAcceleration = 12; // Target acceleration is not excedding 20m/s2
	config.maxNumPoints = MAXNUMBERMEASUREMENTS;
	config.maxNumTracks = MAXNUMBERTRACKERS;
	config.initialRadialVelocity = 0; // Expected target radial velocity at the moment of detection, m/s

	memset((void *)&advParams, 0, sizeof(GTRACK_advancedParameters));
	advParams.gatingParams = &appGatingParams;
	advParams.sceneryParams = &appSceneryParams;
	advParams.allocationParams = &appAllocationParams;
	advParams.variationParams = &appStdSigma;
	
	config.advParams = &advParams;

	fCloud = fopen("../../../test/vectors/functional/gtracker_benchmarkdata.dat", "r");
	if (fCloud == NULL)
	{
		printf("Can not open file gtracker_benchmarkdata.dat\n");
		exit(-1);
	}

	/* initialize the benchmark */
	Cycleprofiler_init();

	/* step module bench mark */
	printf("Step Module benchmark\n");
	printf("number of Trackers, number of measurements, cycles\n");
	for (ii = 0; ii <MAXNUMBERTRACKERS; ii++ ) /* tracker loop */
	{

		fscanf(fCloud, "NUM=%hu\n",&mNum); /*numberoftracker * 40 */
		//printf("total number of data is %d\n",mNum);
		for(kk=0; kk< mNum; kk++)
		{
			fscanf(fCloud, "%f,%f,%f\n",
					&pointCloud[kk].range, &pointCloud[kk].angle, &pointCloud[kk].doppler);
			pointCloud[kk].snr=10;  //artificial value
		}


		for (jj = 0; jj < 6; jj ++ )
		{
			numData = (jj+1)*mNum/6;
			hTrackModule = gtrack_create(&config, &errCode);
			if (hTrackModule == NULL)
			{
				printf("Can not create the gtracker module, test stops\n");
				exit(-1);
			}

		
			/* collect cycles for 2 frames */
			t1=Cycleprofiler_getTimeStamp();

			gtrack_step(hTrackModule, pointCloud, NULL, numData, targetDescr, &tNum, 0, NULL);
			t2=Cycleprofiler_getTimeStamp();

			//printf("number of tracker %d, number of data is %d\n",tNum,numData);
			cycles = t2-t1;
			printf("%d,%d,%d\n", ii+1, numData, cycles);
			t1=Cycleprofiler_getTimeStamp();

			gtrack_step(hTrackModule, pointCloud, NULL, numData, targetDescr, &tNum, 0, NULL);
			t2=Cycleprofiler_getTimeStamp();
			//printf("number of tracker %d, number of data is %d\n",tNum,numData);
			cycles = t2-t1;
			printf("%d,%d,%d\n", ii+1, numData, cycles);
			gtrack_delete(hTrackModule);

		}
	}
#if GTRACK_SUBMODULE_BENCHMARK
	gtracker_submodule_benchmark(config,fCloud);
#endif
	fclose(fCloud);
}
