/*
 *   @file  functional_gtracker_test.c
 *
 *   @brief
 *      Gtrack Application Unit Test code
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
#include <ti/utils/testlogger/logger.h>

/**
 * @brief
 *  Initialize the MCPI Log Message Buffer
 */
MCPI_LOGBUF_INIT(9216);

#define MAXNUMBERMEASUREMENTS 800
#define MAXNUMBERTRACKERS 20
GTRACK_measurementPoint pointCloud[MAXNUMBERMEASUREMENTS];

#define locError 0.76f
#define sinwaveLocError 0.47f   //for sinwave test vector
#define velError 3.33f


GTRACK_targetDesc targetDescr[MAXNUMBERTRACKERS];

GTRACK_gatingParams appGatingParams = {
    12.f, {8.f, 8.f, 0.f}
};
GTRACK_sceneryParams appSceneryParams = {
	0,{{0.f,0.f,0.f,0.f},{0.f,0.f,0.f,0.f}}, 	/* no boundary boxes */
	0,{{0.f,0.f,0.f,0.f},{0.f,0.f,0.f,0.f}} 	/* no static boxes */
};

GTRACK_allocationParams appAllocationParams = {
     -1.f, 0.f, 3U, 4.f, 2.f           // snr, absVelThres, points, distancethres, velthres
};

GTRACK_varParams  appStdSigma = { 2.f / 3.46, 2.f / 3.46, 1.f };




void gtracker_functionality_test()
{

	
	uint16_t mNum;	
	uint16_t tNum;	
	uint16_t testIdx, frameIdx;

	int32_t errCode;

	unsigned int n, k;

	
	
	float xRef, yRef, vxRef, vyRef;
	unsigned int numTests,numFrames,numTrackers;
	unsigned int m;
	float minError;
	unsigned int trackerIdx;
	unsigned int TESTPASS=1;
	float error;
	float locErrThreshold;
	
	void *hTrackModule;
	FILE *fCloud;
	GTRACK_moduleConfig config;
	GTRACK_advancedParameters advParams;


	/* Initialize test logger */
	MCPI_Initialize();

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
	
	xRef = 0.f;
	yRef = 0.f;
	vxRef = 0.f;
	vyRef = 0.f;
	
	
	fCloud = fopen("../../../test/vectors/functional/gtracker_testdata.dat", "r");
	if (fCloud == NULL)
	{
		printf("Can not open file gtracker_testdata.dat\n");
		exit(-1);
	}
	/* read in number of tests, and number of frames per test*/
	fscanf(fCloud, "%u\n", &numTests);
	fscanf(fCloud, "%u\n", &numFrames);

	for(testIdx=0; testIdx<numTests; testIdx++) {
	//for(testIdx=0; testIdx<1; testIdx++) {
		locErrThreshold = locError;
		if (testIdx==3)
		{
			locErrThreshold = sinwaveLocError;
		}
		else if (testIdx==4)
		{
			locErrThreshold = sinwaveLocError;
			
		}
		

		 printf("gTracker test %d\n", testIdx);
	
		/* create tracker module */
		 hTrackModule = gtrack_create(&config, &errCode);
		if (hTrackModule == NULL)
		{
			printf("Can not create the gtracker module, test stops\n");
			exit(-1);
		}

		for(frameIdx=0; frameIdx<numFrames; frameIdx++) 
		{
			
			/* read in number of data per frame */
			fscanf(fCloud, "NUM=%hu\n",&mNum); 
			    
			/* read in data */
			for(n=0; n<mNum; n++) 
			{
				fscanf(fCloud, "%f,%f,%f\n", &pointCloud[n].range, &pointCloud[n].angle, &pointCloud[n].doppler); 
				pointCloud[n].snr=10;  //artificial value
			}
			
			/* run tracker */
			gtrack_step(hTrackModule, pointCloud, NULL, mNum, targetDescr, &tNum, 0, NULL);
	       

			/* check the results*/
			fscanf(fCloud, "%u\n", &numTrackers);
			if (tNum != numTrackers)
			{
				printf("test %d fail in tracker numbers at frame %d, tracker number = %d\n",testIdx, frameIdx, tNum);
				TESTPASS = 0;
			}
			
			/* check the xy */
			for (k = 0; k < tNum; k++)
			{
				//read in reference 
				if (k<numTrackers)
					fscanf(fCloud, "%f,%f,%f,%f\n", &xRef, &yRef, &vxRef, &vyRef);
			//	printf("%f, %f, %f, %f\n", targetDescr[k].S[0], targetDescr[k].S[1], targetDescr[k].S[2], targetDescr[k].S[3]);
				//printf("%f, %f, %f, %f\n", xRef, yRef, vxRef, vyRef);
				
				//find the closest tracker
				trackerIdx = 0;
				if (numTrackers > 1)  /* more than 1 tracker */
				{
					if (testIdx==1)  /* test vector 1 use x location */
					{
						minError = 1000;
						for (m = 0; m < tNum; m++)
						{
							if (fabs(xRef - targetDescr[m].S[0]) < minError)
							{
								minError = fabs(xRef - targetDescr[m].S[0]);
								trackerIdx = m;
							}
						}
					}
					else  //the last one use y to find the matched tracker
					{
						minError = 1000;
						for (m = 0; m < tNum; m++)
						{
							if (fabs(yRef - targetDescr[m].S[1]) < minError)
							{
								minError = fabs(yRef - targetDescr[m].S[1]);
								trackerIdx = m;
							}
						}
					}
				}

				error = fabs(xRef - targetDescr[trackerIdx].S[0]);
				if ( error > locErrThreshold)
				{
					printf("test %d, frame %d, xLocation error is %f\n",testIdx, frameIdx, error);
					TESTPASS=0;
				}

				error = fabs(yRef - targetDescr[trackerIdx].S[1]);
				if ( error > locErrThreshold)
				{
					printf("test %d, frame %d, yLocation error is %f\n", testIdx, frameIdx, error);
					TESTPASS=0;
				}

				{
					error = fabs(vxRef - targetDescr[trackerIdx].S[2]);
					if ( error > velError)
					{
						printf("test %d, frame %d, xVelocity error is %f\n",testIdx, frameIdx, error);
						TESTPASS=0;
					}
					error = fabs(vyRef - targetDescr[trackerIdx].S[3]);
					if (error > velError)
					{
						printf("test %d, frame %d, yVelocity error is %f\n", testIdx, frameIdx, error);
						TESTPASS=0;
					}
				}
			}
		}
	
		gtrack_delete(hTrackModule);

	}

    if (TESTPASS)
    {
    //	printf("GTRACKER tests pass\n");
    	MCPI_setFeatureTestResult("Group Tracker", MCPI_TestResult_PASS);
    }
    else
    {
    //	printf("GTRACKER tests fail\n");
    	MCPI_setFeatureTestResult("Group Tracker", MCPI_TestResult_FAIL);
    }

	fclose(fCloud);

    
    MCPI_setTestResult ();
	
	
}
