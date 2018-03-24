/**
 *   @file  gtrack_unit_score.c
 *
 *   @brief
 *      Unit level scoring function for the GTRACK Algorithm
 *
 *  \par
 *  NOTE:
 *      (C) Copyright 2017 Texas Instruments, Inc.
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

#include <math.h>

#include <ti/alg/gtrack/gtrack.h>
#include <ti/alg/gtrack/include/gtrack_int.h>

#define PI 3.14159265358979323846f

/**
*  @b Description
*  @n
*		GTRACK Module calls this function to obtain the measurement vector scoring from the GTRACK unit perspective
*
*  @param[in]  handle
*		This is handle to GTRACK unit
*  @param[in]  point
*		This is an array of measurement points
*  @param[inout]  bestScore
*		This is a pointer current scoresheet with best scores. Only better scores are updated
*  @param[inout]  bestInd
*		This is a pointer current scoresheet winners. Only better scores winners are updated
*  @param[in]  num
*		Number of measurement points
*
*  \ingroup GTRACK_ALG_UNIT_FUNCTION
*
*  @retval
*      None
*/
void gtrack_unitScore(void *handle, GTRACK_measurementPoint *point, float *bestScore, uint8_t *bestInd, uint16_t num)
{
	GtrackUnitInstance *inst;
	uint16_t n;

	float chi2;
	float u_tilda[3];
	float limits[3];
	float det;
	float score;
	float logdet;

	float rvOut;
	
	inst = (GtrackUnitInstance *)handle;

	limits[0] = inst->gatingParams->limits.length;
	limits[1] = inst->gatingParams->limits.width;
	limits[2] = inst->gatingParams->limits.vel;

	if(inst->processVariance == 0) {
		inst->G = 1;
	}
	else {
		inst->G = gtrack_gateCreateLim(inst->gatingParams->volume, inst->gC_inv, inst->H_s[0], limits);
	}

	gtrack_matrixDet3(inst->gC, &det);
	logdet = logf(det);

#ifdef GTRACK_LOG_ENABLED
	if(inst->verbose & VERBOSE_ASSOSIATION_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: Scoring: G=%5.2f, log(det)=%5.2f\n",inst->heartBeatCount, inst->uid, inst->G, logdet);
	}
#endif

	for(n=0; n < num; n++) {

		if(bestInd[n] == GTRACK_ID_POINT_BEHIND_THE_WALL)
			continue;

	    u_tilda[0] = point[n].range - inst->H_s[0];
		u_tilda[1] = point[n].angle - inst->H_s[1];

		if(inst->velocityHandling < VELOCITY_LOCKED) {
			/* Radial velocity estimation is not yet known, unroll based on velocity measured at allocation time */
			rvOut = gtrack_unrollRadialVelocity(inst->maxRadialVelocity, inst->allocationVelocity, point[n].doppler);
			u_tilda[2] = rvOut - inst->allocationVelocity;
		}
		else {
			/* Radial velocity estimation is known */
			rvOut = gtrack_unrollRadialVelocity(inst->maxRadialVelocity, inst->H_s[2], point[n].doppler);
			u_tilda[2] = rvOut - inst->H_s[2];
		}

		gtrack_computeMahalanobis3(u_tilda, inst->gC_inv, &chi2);
		/* Gating Step */
		if(chi2 < inst->G) {
			/* Scoring */
			score = logdet + chi2;
			if(score < bestScore[n]) {
				/* If we are the best, register our score, and the index */
				bestScore[n] = score;
				bestInd[n] = (uint8_t)inst->uid;
				point[n].doppler = rvOut;
			}
		}
	}
}

float gtrack_gateCreateLim (float volume, float *EC, float range, float *gateLim)
{
	/* Simplified Gate Construction (no need for SVD) */
	/* We build a gate based on a constant volume */
	/* In addition, we impose a limiter: under no circumstances the gate will */
	/* allow to reach points beyond gateLimits */

	float a,b,c, v;
	float gConst;
	float LQ[9]; /* Lower triangular decomposition */


	float W[9];
	float sWidth;
	float gLimit;
	float gMin;

	/* Compute unitary volume */
	a = 1/sqrtf(EC[0]);
	b = 1/sqrtf(EC[4]);
	c = 1/sqrtf(EC[8]);
	v = 4*PI/3*a*b*c;

	/* Compute constant volume expansion factor */
	gConst = powf((float)(volume/v), (float)(2./3.));

	/* Compute limiters */
	gtrack_matrixCholesky3(EC, LQ);
	gtrack_matrixInv3(LQ, W);

	gMin = gConst;

	/* Orthogonal projections onto Range, Angle and Doplper dimentions */

	/* Orthogonal projections onto Range is the RSS of the first column of W */
	/* s[0]=2*sqrtf(w[0]*w[0] + w[3]*w[3] + w[6]*w[6]) */
	/* gLimit = (gateLim[0]/s[0])^2=gateLim[0]^2/(4*(w[0]*w[0] + w[3]*w[3] + w[6]*w[6]) */
	if(gateLim[0] != 0) {
		gLimit = (gateLim[0]*gateLim[0])/(4*(W[0]*W[0] + W[3]*W[3] + W[6]*W[6]));
		if(gMin > gLimit)
			gMin = gLimit;
	}

	/* Orthogonal projections onto Angle is the RSS of the second column of W */
	/* s[1] = 2*sqrtf(w[4]*w[4] + w[7]*w[7]) */
	/* Converitng Angle span to the the width */
	/* sWidth  = 2*Range*tan(0.5*s[1])=2*Range*tan(sqrtf(w[4]*w[4] + w[7]*w[7])) */
	/* gLimit = (gateLim[0]/sWidth)^2 */
	if(gateLim[1] != 0) {
		sWidth = 2*range*tanf(sqrtf(W[4]*W[4] + W[7]*W[7]));
		gLimit = (gateLim[1]*gateLim[1])/(sWidth*sWidth);
		if(gMin > gLimit)
			gMin = gLimit;
	}
	
	/* Orthogonal projections onto Doppler is the last element of W */
	/* s[2] = 2*abs(w[8]) */
	if(gateLim[2] != 0) {
		gLimit = (gateLim[2]*gateLim[2])/(4*(W[8]*W[8]));
		if(gMin > gLimit)
			gMin = gLimit;
	}
	return gMin;
}

void gtrack_computeMahalanobis3(float *d, float *S, float *chi2)
{
	*chi2 = 
		d[0]*(d[0]*S[0]+d[1]*S[3]+d[2]*S[6])+
		d[1]*(d[0]*S[1]+d[1]*S[4]+d[2]*S[7])+
		d[2]*(d[0]*S[2]+d[1]*S[5]+d[2]*S[8]);
}
