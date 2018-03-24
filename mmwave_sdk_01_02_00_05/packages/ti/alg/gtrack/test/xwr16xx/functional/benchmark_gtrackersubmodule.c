/*
 *   @file  benchmark_gtracksubmodule.c
 *
 *   @brief
 *      Gtrack submoudle benchmark
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


#include <ti/alg/gtrack/gtrack.h>


#define MAXNUMBERMEASUREMENTS 800
#define MAXNUMBERTRACKERS 20
extern GTRACK_measurementPoint pointCloud[MAXNUMBERMEASUREMENTS];
extern GTRACK_targetDesc targetDescr[MAXNUMBERTRACKERS];
uint32_t benchmarks[6];

GTRACK_measurementPoint pointCloudTemp[MAXNUMBERMEASUREMENTS];

void gtracker_submodule_benchmark(GTRACK_moduleConfig config, FILE *fCloud)
{

	uint16_t mNum,numData;
	uint16_t tNum;
	uint16_t ii,kk,jj;
	int32_t errCode;

	void *hTrackModule;

	
	uint32_t  cycles;

	
	
	/* allocation module benchmark */
	fscanf(fCloud, "NUM=%hu\n",&mNum);
	for(ii=0; ii<mNum; ii++)
	{
		fscanf(fCloud, "%f,%f,%f\n",
				&pointCloud[ii].range, &pointCloud[ii].angle, &pointCloud[ii].doppler);
		pointCloud[ii].snr=10;  //artificial value
	}


	printf("Allocation Module for one tracker benchmark\n");
	printf("number of measurements, cycles\n");
	for (ii = 100;ii<mNum;ii+=100)
	{

		hTrackModule = gtrack_create(&config,&errCode);
		if (hTrackModule == NULL)
		{
			printf("Can not create the gtracker module, test stops\n");
			exit(-1);
		}
			
		gtrack_step(hTrackModule, pointCloud, NULL, ii, targetDescr, &tNum, 0, benchmarks);
		cycles = benchmarks[GTRACK_BENCHMARK_ALLOCATE]-benchmarks[GTRACK_BENCHMARK_ASSOCIATE];
		gtrack_delete(hTrackModule);
		printf("%d,%d\n", ii, cycles);
	}

	/* association module benchmark */
	printf("Associate Module for one tracker benchmark\n");
	printf("number of measurements, cycles\n");
	
	fscanf(fCloud, "NUM=%hu\n",&mNum);

	for(ii=0; ii<mNum; ii++)
	{
		fscanf(fCloud, "%f,%f,%f\n",
				&pointCloudTemp[ii].range, &pointCloudTemp[ii].angle, &pointCloudTemp[ii].doppler);
		pointCloudTemp[ii].snr=10;  //artificial value
	}
	
	for (ii = 100;ii<mNum;ii+=100)
	{

		hTrackModule = gtrack_create(&config,&errCode);
		if (hTrackModule == NULL)
		{
			printf("Can not create the gtracker module, test stops\n");
			exit(-1);
		}
			
		/* first frame */
		gtrack_step(hTrackModule, pointCloud, NULL, mNum, targetDescr, &tNum, 0, NULL);
		//printf("number of tracker is %d\n",tNum);
		/* second frame */
		gtrack_step(hTrackModule, pointCloudTemp, NULL, ii, targetDescr, &tNum, 0, benchmarks);
		
		cycles = benchmarks[GTRACK_BENCHMARK_ASSOCIATE]-benchmarks[GTRACK_BENCHMARK_PREDICT];
		//printf("number of tracker is %d\n",tNum);
		printf("%d,%d\n", ii, cycles);
		gtrack_delete(hTrackModule);
	}

	

	/* tracker predict module benchmark */
	printf("Predict Module benchmark\n");
	printf("number of Trackers, cycles\n");

	/* first frame */
	fscanf(fCloud, "NUM=%hu\n",&mNum);
	for(ii=0; ii<mNum; ii++)
	{
		fscanf(fCloud, "%f,%f,%f\n",
				&pointCloud[ii].range, &pointCloud[ii].angle, &pointCloud[ii].doppler);
		pointCloud[ii].snr=10;  
	}

	for (ii = 0; ii < 16; ii++ )
	{
		hTrackModule = gtrack_create(&config,&errCode);
		if (hTrackModule == NULL)
		{
			printf("Can not create the gtracker module, test stops\n");
			exit(-1);
		}
		gtrack_step(hTrackModule, pointCloud, NULL, (ii+1)*mNum/16, targetDescr, &tNum, 0, NULL);
		//printf("number of trackers %d\n",tNum);
		gtrack_step(hTrackModule, pointCloud, NULL, (ii+1)*mNum/16, targetDescr, &tNum, 0, benchmarks);
		//printf("number of trackers %d\n",tNum);
		cycles = benchmarks[GTRACK_BENCHMARK_PREDICT]-benchmarks[GTRACK_BENCHMARK_SETUP];
		printf("%d,%d\n", ii+1, cycles);
		gtrack_delete(hTrackModule);


	}

	/* update module benchmark */
	printf("Update Module benchmark\n");
	printf("number of Trackers, number of measurements, cycles\n");

	for (ii = 0; ii <16; ii++ ) /* tracker loop */
	{

		fscanf(fCloud, "NUM=%hu\n",&mNum);
		//printf("total number of data is %d\n",mNum);
		for(kk=0; kk< mNum; kk++)
		{
			fscanf(fCloud, "%f,%f,%f\n",
					&pointCloud[kk].range, &pointCloud[kk].angle, &pointCloud[kk].doppler);
			pointCloud[kk].snr=10;  
		}

		/* number of observation 6 tests per tracker */
		for (jj = 0; jj < 6; jj ++ )
		{
			hTrackModule = gtrack_create(&config,&errCode);
			if (hTrackModule == NULL)
			{
				printf("Can not create the gtracker module, test stops\n");
				exit(-1);
			}
			numData = (jj+1)*mNum/6;
			gtrack_step(hTrackModule, pointCloud, NULL, numData, targetDescr, &tNum, 0, benchmarks);
		
			cycles = benchmarks[GTRACK_BENCHMARK_UPDATE]-benchmarks[GTRACK_BENCHMARK_ALLOCATE];
	
			//check the number of tracker
			//printf("number of tracker is %d, number of data is %d\n",tNum, numData);

			printf("%d,%d,%d\n", ii+1, numData, cycles);
			gtrack_delete(hTrackModule);
		}

	}


}


