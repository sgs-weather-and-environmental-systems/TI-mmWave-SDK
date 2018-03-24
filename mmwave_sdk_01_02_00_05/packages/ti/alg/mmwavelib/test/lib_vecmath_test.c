/*
 *   @file  lib_vecmath_test.c
 *
 *   @brief
 *      Unit Test code for vector math utility mmwavelib library functions
 *
 */
/*
 * (C) Copyright 2017 Texas Instruments, Inc.
 -------------------------------------------------------------------------
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are
 *  met:
 *
 *    Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 *  IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 *  TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 *  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT,  STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <c6x.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <ti/alg/mmwavelib/mmwavelib.h>
#include <ti/utils/testlogger/logger.h>

/**
 * @brief
 *  Initialize the MCPI Log Message Buffer
 */
MCPI_LOGBUF_INIT(9216);

int32_t totalFailed;
int32_t prevFailed;

uint32_t t1, t2;
uint32_t cycles;

#define MAX_LEN 512

/* buffer for input data */
#pragma DATA_SECTION(databuf,".l2data");
#pragma DATA_ALIGN(databuf, 8);
int16_t databuf[MAX_LEN];

/* buffer for reference output data */
#pragma DATA_SECTION(refbuf,".l2data");
#pragma DATA_ALIGN(refbuf, 8);
int16_t refbuf[MAX_LEN];

/* buffer for 32bit data */
#pragma DATA_SECTION(data32buf,".l2data");
#pragma DATA_ALIGN(data32buf, 8);
int32_t data32buf[MAX_LEN];


void test_vecsumabs( )
{
	int32_t i, length = 512;
	int32_t outsum, refsum;

	for ( i=0; i < length; i++ )
	{
		databuf[i] = rand();
	}

	outsum = mmwavelib_vecsumabs(databuf, length);

	refsum = 0;
	for ( i=0; i < length; i++)
	{
		refsum += abs(databuf[i]);
	}

	if ( outsum == refsum )
	{
        MCPI_setFeatureTestResult("Vector SumAbs mmwavelib_vecsumabs", MCPI_TestResult_PASS);
	}
    else
    {
		totalFailed ++;
		printf("\nmmwavelib_vecsumabs output=%d, ref=%d\n", outsum, refsum);
        MCPI_setFeatureTestResult("Vector SumAbs", MCPI_TestResult_FAIL);
    }

	printf("\nBenchmark for mmwavelib_vecsumabs\nlength and cycles:\n");
	for (length = 64; length <=512; length=length*2)
	{
		t1 = TSCL;
		outsum = mmwavelib_vecsumabs(databuf, length);
		t2 = TSCL;
		printf("%d\t%d\n", length, (t2-t1));
	}

}/* test_vecsumabs */


void test_maxpow( )
{
	int32_t i, numCplx = 64;
	int32_t *inptr = (int32_t *)&databuf[0];
	int32_t outMaxIdx, refMaxIdx=0;
	float32_t outMaxPow=0;
	float32_t refMaxPow=0, cplxSamplePow;

	for ( i=0; i < numCplx*2*2; i++ )
	{
		databuf[i] = rand();
	}

	outMaxIdx = mmwavelib_maxpow(inptr, numCplx, &outMaxPow);

	/* reference code */
	for ( i=0; i < numCplx; i++ )
	{
		cplxSamplePow = (float32_t)inptr[2*i]*inptr[2*i] + (float32_t)inptr[2*i+1]*inptr[2*i+1];
		if ( cplxSamplePow > refMaxPow )
		{
			refMaxPow = cplxSamplePow;
			refMaxIdx = i;
		}
	}

	/* compare output with reference */
	if ((outMaxIdx == refMaxIdx) && (outMaxPow == refMaxPow))
	{
		MCPI_setFeatureTestResult("Max power search mmwavelib_maxpow", MCPI_TestResult_PASS);
	}
    else
    {
    	MCPI_setFeatureTestResult("Max power search mmwavelib_maxpow", MCPI_TestResult_FAIL);
		totalFailed ++;

		printf("outMaxIdx=%d, refMaxIdx=%d\n", outMaxIdx, refMaxIdx);
		printf("outMaxPow=%f, refMaxPow=%f\n", outMaxPow, refMaxPow);
		printf("I=%d, Q= %d\n", inptr[2*refMaxIdx], inptr[2*refMaxIdx+1]);
	}

	printf("\nBenchmark for mmwavelib_maxpow\nNcplx and cycles:\n");
	for (numCplx = 16; numCplx <= 64; numCplx *= 2)
	{
		t1 = TSCL;
		outMaxIdx = mmwavelib_maxpow(inptr, numCplx, &outMaxPow);
		t2 = TSCL;
		printf("%d\t%d\n", numCplx, (t2-t1));
	}

} /* test_maxpow */

void test_vecmul16x16()
{
	int32_t i, numCplx = 128;
	int16_t *sptr = &databuf[0];
	int16_t *wptr, *refptr=&refbuf[0];
	int16_t xI, xQ, wI, wQ, refI, refQ;
	int32_t temp;

	wptr = &databuf[numCplx*2];

	/* reference code */
	for ( i=0; i < numCplx; i++ )
	{
		xI = sptr[2*i+1];
		xQ = sptr[2*i];
		wI = wptr[2*i+1];
		wQ = wptr[2*i];
		temp = ((int32_t)xI*wI - (int32_t)xQ*wQ + 0x4000) >>15;
		if ( temp >32767 )
		{ temp = 32767; }
		else if ( temp <-32768 )
		{ temp = -32768; }
		refI = temp;

		temp = ((int32_t)xI*wQ + (int32_t)xQ*wI + 0x4000) >>15;
		if ( temp >32767 )
		{ temp = 32767; }
		else if ( temp <-32768 )
		{ temp = -32768; }
		refQ = temp;

		refptr[2*i] = refQ;
		refptr[2*i+1] = refI;
	}

	/*printf("4th: sI=%d, sQ=%d; wI=%d, wQ=%d;\n", sptr[7], sptr[6], wptr[7], wptr[6]);*/

	mmwavelib_vecmul16x16(sptr, wptr, numCplx);

	/* printf("refI=%d, refQ=%d; \n", refptr[7], refptr[6]);
	printf("outI=%d, outQ=%d; \n", sptr[7], sptr[6]); //for debug */

	/* compare output with reference */
	prevFailed = totalFailed;
	for ( i=0; i<numCplx*2; i++)
	{
		if ( sptr[i] != refptr[i] )
		{
			totalFailed ++;
			printf("i=%d, out=%d, ref=%d; \n", i, sptr[i], refptr[i]);
		}
	}

	if ( totalFailed == prevFailed)
	{
		MCPI_setFeatureTestResult("Multiply Complex Vectors mmwavelib_vecmul16x16", MCPI_TestResult_PASS);
	}
    else
    {
    	MCPI_setFeatureTestResult("Multiply Complex Vectors mmwavelib_vecmul16x16", MCPI_TestResult_FAIL);
    }

	printf("\nBenchmark for mmwavelib_vecmul16x16\nNcplx and cycles:\n");
	for (numCplx = 16; numCplx <= 128; numCplx *= 2)
	{
		t1 = TSCL;
		mmwavelib_vecmul16x16(sptr, wptr, numCplx);
		t2 = TSCL;
		printf("%d\t%d\n", numCplx, (t2-t1));
	}

} /* test_vecmul16x16 */


void test_vecmul16x32()
{
	int32_t i, numCplx = 128;
	int16_t *sptr = &databuf[0];
	int32_t *wptr;
	int32_t *outptr;
	int32_t *refptr=(int32_t*)&refbuf[0];
	int16_t xI, xQ;
	int32_t wI, wQ, refI, refQ;
	int32_t temp;

	wptr   = &data32buf[0];
	outptr = &data32buf[numCplx*2];

	for ( i=0; i < numCplx*2; i++ )
	{
		wptr[i] = (int32_t)(rand())*16;/*left shift 4 bits to Q19 format integer*/
	}

	mmwavelib_vecmul16x32(sptr, wptr, outptr, numCplx);

	/* reference code */
	for ( i=0; i < numCplx; i++ )
	{
		xI = sptr[2*i+1];
		xQ = sptr[2*i];
		wI = wptr[2*i+1];
		wQ = wptr[2*i];

		temp = ((int64_t)xI*wI +0x4000) >>15;
		refI = temp - (int32_t)(((int64_t)xQ*wQ +0x4000)>>15);

		temp = ((int64_t)xI*wQ +0x4000) >>15;
		refQ = temp + (int32_t)(((int64_t)xQ*wI +0x4000)>>15);

		refptr[2*i] = refI;
		refptr[2*i+1] = refQ;
	}

	/* compare output with reference */
	prevFailed = totalFailed;
	for ( i=0; i<numCplx*2; i++)
	{
		if ( outptr[i] != refptr[i] )
		{
			totalFailed ++;
			printf("i=%d, out=%d, ref=%d; \n", i, outptr[i], refptr[i]);
			break;
		}
	}
	/*printf("sI=%d, sQ=%d; wI=%d, wQ=%d;\n", sptr[3], sptr[2], wptr[3], wptr[2]);
	printf("refI=%d, refQ=%d; \n", refptr[2], refptr[3]);
	printf("outI=%d, outQ=%d; \n", outptr[2], outptr[3]);*/

	if ( totalFailed == prevFailed)
	{
		MCPI_setFeatureTestResult("Multiply Complex Vectors mmwavelib_vecmul16x32", MCPI_TestResult_PASS);
	}
    else
    {
    	MCPI_setFeatureTestResult("Multiply Complex Vectors mmwavelib_vecmul16x32", MCPI_TestResult_FAIL);
    }

	printf("\nBenchmark for mmwavelib_vecmul16x32\nNcplx and cycles:\n");
	for (numCplx = 16; numCplx <= 128; numCplx *= 2)
	{
		t1 = TSCL;
		mmwavelib_vecmul16x32(sptr, wptr, outptr, numCplx);
		t2 = TSCL;
		printf("%d\t%d\n", numCplx, (t2-t1));
	}

} /* test_vecmul16x32 */


void main(void)
{
	TSCL = 0;
	t1 = TSCL;
	t2 = TSCL;
	printf("tsc_overhead = %d cycles\n", (t2-t1));

	MCPI_Initialize();

	totalFailed = 0;

	printf("\n===== Test mmwavelib_vecsumabs =====\n");
	test_vecsumabs();

	printf("\n===== Test mmwavelib_maxpow =====\n");
	test_maxpow();

	printf("\n===== Test mmwavelib_vecmul16x32 =====\n");
	test_vecmul16x32();

	printf("\n===== Test mmwavelib_vecmul16x16 =====\n");
	test_vecmul16x16();

	if (totalFailed == 0)
	{
		printf("\n======== Vector math tests passed! ========== \n");
	}
	else
	{
		printf("\n======== Vector math tests Failed! ======= \n");
	}
	printf("======== Testing completed! ==========\n");
	
	MCPI_setTestResult ();

}
