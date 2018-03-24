/* ======================================================================== *
 * MATHLIB -- TI Floating-Point Math Function Library                       *
 *                                                                          *
 *                                                                          *
 * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/   *
 *                                                                          *
 *                                                                          *
 *  Redistribution and use in source and binary forms, with or without      *
 *  modification, are permitted provided that the following conditions      *
 *  are met:                                                                *
 *                                                                          *
 *    Redistributions of source code must retain the above copyright        *
 *    notice, this list of conditions and the following disclaimer.         *
 *                                                                          *
 *    Redistributions in binary form must reproduce the above copyright     *
 *    notice, this list of conditions and the following disclaimer in the   *
 *    documentation and/or other materials provided with the                *
 *    distribution.                                                         *
 *                                                                          *
 *    Neither the name of Texas Instruments Incorporated nor the names of   *
 *    its contributors may be used to endorse or promote products derived   *
 *    from this software without specific prior written permission.         *
 *                                                                          *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     *
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       *
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   *
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT    *
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   *
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        *
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   *
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   *
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT     *
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   *
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    *
 * ======================================================================== */

/* ======================================================================= */
/* drvsp.c - single precision floating point driver utilities              */
/* ======================================================================= */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "drvsp.h"

/* Special Cases */
float a_ext[MTH_MAX_TESTVAL];
float b_ext[MTH_MAX_TESTVAL];
float a_sc[100];
float b_sc[100];

/* Global test result (output) array and pointers */
float output_data[MTH_NUM_OUTPUT][MTH_MAX_TESTVAL];
float * restrict output[MTH_NUM_OUTPUT] = {
  output_data[0],
  output_data[1],
  output_data[2],
  output_data[3],
  output_data[4]
};

/* Global test input array and pointer */
float input_data[MTH_NUM_INPUT][MTH_MAX_TESTVAL];
float * restrict input[MTH_NUM_INPUT] = {
  input_data[0],
  input_data[1]
};


/* Return random value - uniform between OFFSET and RANGE+OFFSET */
float gimme_random (float range, float offset)
{
	return ((float) rand() / (float) RAND_MAX * range + offset);
}


/* Compare two arrays - return 1 if identical, 0 if they differ */
int isequal (float *arg1, float *arg2, int size, double tol, int flags)
{
  double diff, thresh, big = 5E+37, small = 5E-38;
	int equal = 1;	
  int req_percent, req_notzero, req_notnan, ignore_inf, ignore_small;
  int req1, req2, ignr;
  int i;

  /* Set the boolean flags once */
  req_percent = ((flags & MTH_REQ_PERCENT) == MTH_REQ_PERCENT) ? 1 : 0;
  req_notzero = ((flags & MTH_REQ_NOTZERO) == MTH_REQ_NOTZERO) ? 1 : 0;
  req_notnan  = ((flags & MTH_REQ_NOTNAN ) == MTH_REQ_NOTNAN ) ? 1 : 0;
  ignore_inf  = ((flags & MTH_REQ_IGNORE_INF) == MTH_REQ_IGNORE_INF) ? 1 : 0;

  for (i=0; i<size; i++) {
    /* Basic requirement to compare to tolerance */
    diff = fabsf(arg1[i] - arg2[i]);

    ignr = (isinf(arg1[i]) || isnan(arg1[i]) || (fabsf(arg1[i]) >= big)) 
        && (isinf(arg2[i]) || isnan(arg2[i]) || (fabsf(arg2[i]) >= big)) 
        && ignore_inf;
    
    ignore_small = (fabsf(arg1[i]) < (small/tol)) && (fabsf(arg2[i]) < (small/tol));

    /* Check for percentage comparison */
    if (req_percent) {
      thresh = fabsf(arg1[i])*tol;
    }

    /* Check for non-zero requirement */
    req1 = ((arg1[i] != 0) || !req_notzero) ? 1 : 0;

    /* Check for non-NaN requirement */
    req2 = ((!isnan(arg1[i]) && !isnan(arg2[i])) || !req_notnan) ? 1 : 0;

    if ((diff > thresh) && !ignore_small && !ignr && req1 && req2) {
      equal = 0;
    }
  }

  return (equal);
}

/* ======================================================================== */
/*  End of file: drvdp.c                                                    */
/* ======================================================================== */
