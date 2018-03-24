/**
 *   @file  gtrack_unit_update.c
 *
 *   @brief
 *      Unit level update function for the GTRACK Algorithm
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

#include <string.h>
#include <math.h>

#include <ti/alg/gtrack/gtrack.h>
#include <ti/alg/gtrack/include/gtrack_int.h>

#define GTRACK_MIN_DISPERSION_ALPHA	            (0.1f)  /* 10 percent */
#define GTRACK_EST_POINTS                       (10)    /* 10 points */
#define GTRACK_MIN_POINTS_TO_UPDATE_DISPERSION  (3)     /* 3 points */
#define GTRACK_KNOWN_TARGET_POINTS_THRESHOLD    (50)    /* 50 points */

/**
*  @b Description
*  @n
*		GTRACK Module calls this function to perform an update step for the tracking unit. 
*
*  @param[in]  handle
*		This is handle to GTRACK unit
*  @param[in]  point
*		This is an array of measurement points
*  @param[in]  var
*      Pointer to an array of input measurment variances. Shall be set to NULL if variances are unknown
*  @param[in]  pInd
*		This is an array of associated UIDs. After association and allocation steps, each measurment shall have a UID assigned.
*  @param[in]  num
*		Number of measurement points
*
*  \ingroup GTRACK_ALG_UNIT_FUNCTION
*
*  @retval
*      None
*/

TrackState gtrack_unitUpdate(void *handle, GTRACK_measurementPoint *point, GTRACK_measurementVariance *var, uint8_t *pInd, uint16_t num)
{
    GtrackUnitInstance *inst;
	uint16_t n;

	uint32_t myPointNum; 
	float alpha;
	float J[3*6];
	float PJ[6*3];
	float JPJ[3*3];
	float U[3];
	float u_tilda[3];
	float cC[9], cC_inv[9]; /* centroid Covariance and centroid Covariance inverse */
	float K[6*3];
    uint16_t mlen; /* Measurement vector length */
    uint16_t slen; /* Current state vector length */
	float rvPilot, rvCurrent;
	float angleStd;

	GTRACK_measurementPoint 	u_mean = {0.f};

	MATRIX3x3 D =   {0.f};  /* Dispersion Matrix */
	MATRIX3x3 Rm =  {0.f};  /* Measurement error covariance matrix */
	MATRIX3x3 Rc =  {0.f};  /* Measurment error covariance matrix for the centroid used for Kalman update */

	float dRangeVar, dDopplerVar; /* default values for Range and Doppler variances */
	float temp1[36];

    inst = (GtrackUnitInstance *)handle;
	
    mlen = inst->measurementVectorLength;
    slen = inst->stateVectorLength;
	
	myPointNum = 0;

	/* Compute means of associated measurement points */
	for(n = 0; n < num; n++) {
		if(pInd[n] == inst->uid) {
			myPointNum++;
			u_mean.range += point[n].range;
			u_mean.angle += point[n].angle;

			if(var != 0) {
				/* If we got variances, we compute mean */
				Rm.e11 += var[n].rangeVar;
				Rm.e22 += var[n].angleVar;
				Rm.e33 += var[n].dopplerVar;
			}

			if(myPointNum == 1) {
				rvPilot = point[n].doppler;
				u_mean.doppler = rvPilot;
			}
			else {	
				rvCurrent = gtrack_unrollRadialVelocity(inst->maxRadialVelocity, rvPilot, point[n].doppler); /* Unroll using rvPilot */
				point[n].doppler = rvCurrent;
				u_mean.doppler += rvCurrent;
			}
		}
	}

	if(myPointNum == 0) {
		/* No measurements available */
        if( (fabs(inst->S_hat[2]) < inst->radialVelocityResolution) && 
			(fabs(inst->S_hat[3]) < inst->radialVelocityResolution) ) 
		{
			/* Target is static => force zero velocity/zero acceleration */
			memset(inst->S_hat, 0, sizeof(inst->S_hat));
			/* Keep position equal to predicted */
			inst->S_hat[0] = inst->S_apriori_hat[0];
			inst->S_hat[1] = inst->S_apriori_hat[1];
			/* Keep process covariance equal to predicted */
			memcpy(inst->P_hat, inst->P_apriori_hat, sizeof(inst->P_hat));
			/* Set processVariance to zero */
			inst->processVariance = 0;
		}
		else {
			/* Stay dynamic, set estimations equal to preductions */
			memcpy(inst->S_hat, inst->S_apriori_hat, sizeof(inst->S_hat));
			memcpy(inst->P_hat, inst->P_apriori_hat, sizeof(inst->P_hat));
		}
		/* Report miss event and exit */
		goto exit;
	}

	inst->associatedPoints += myPointNum;

	/* Getting back to dynamicity */
	if(inst->processVariance == 0)
		inst->processVariance = (0.5f*inst->maxAcceleration)*(0.5f*inst->maxAcceleration);

	u_mean.range /= myPointNum;
	u_mean.angle /= myPointNum;
	u_mean.doppler /= myPointNum;

	/* Compute Rm, Measurement Noise covariance matrix */
	if(var != 0) {
		Rm.e11 /= myPointNum;
		Rm.e22 /= myPointNum;
		Rm.e33 /= myPointNum;
	} 
	else {
		/* When we don't have variances, we use configured parameters */
	    dRangeVar = inst->variationParams->lengthStd*inst->variationParams->lengthStd;
		dDopplerVar = inst->variationParams->dopplerStd*inst->variationParams->dopplerStd;

		Rm.e11 = dRangeVar;
		angleStd = 2*atanf(0.5f*inst->variationParams->widthStd/inst->H_s[0]);	
		Rm.e22 = angleStd*angleStd;
		Rm.e33 = dDopplerVar;
	}
	
	/* U is a measuremnt centroid */
	U[0] = u_mean.range; 
	U[1] = u_mean.angle;

	/* Velocity handling */
	U[2] = u_mean.doppler;
	gtrack_velocityStateHandling(inst, U);

#ifdef GTRACK_LOG_ENABLED
	if(inst->verbose & VERBOSE_DEBUG_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: Update U={%3.1f, %3.1f, %3.1f=>%3.1f}\n", inst->heartBeatCount, inst->uid, U[0], U[1], u_mean.doppler, U[2]);
	}
#endif
	
	/* Update Group Dispersion gD matrix */
	if(myPointNum > GTRACK_MIN_POINTS_TO_UPDATE_DISPERSION) {
		/* D is the new dispersion matrix, 3x3 */
		for(n = 0; n < num; n++) {
			if(pInd[n] == inst->uid)
			{
				D.e11 += (point[n].range - u_mean.range)*(point[n].range - u_mean.range);
				D.e22 += (point[n].angle - u_mean.angle)*(point[n].angle - u_mean.angle);
				D.e33 += (point[n].doppler - u_mean.doppler)*(point[n].doppler - u_mean.doppler);
				D.e12 += (point[n].range - u_mean.range)*(point[n].angle - u_mean.angle);
				D.e13 += (point[n].range - u_mean.range)*(point[n].doppler - u_mean.doppler);
				D.e23 += (point[n].angle - u_mean.angle)*(point[n].doppler - u_mean.doppler);
			}
		}
				
		D.e11 /= myPointNum;
		D.e22 /= myPointNum;
		D.e33 /= myPointNum;
		D.e12 /= myPointNum;
		D.e13 /= myPointNum;
		D.e23 /= myPointNum;
			
		/* The factor alpha goes from maximum (1.f) at the first allocation down to minimum of 0.1f once the target is observed for the long time */ 
        alpha = ((float)myPointNum)/inst->associatedPoints;
		if(alpha < GTRACK_MIN_DISPERSION_ALPHA)
			alpha = GTRACK_MIN_DISPERSION_ALPHA;

		inst->gD[0] = (1.0f-alpha)*inst->gD[0] + alpha*D.e11; 
		inst->gD[1] = (1.0f-alpha)*inst->gD[1] + alpha*D.e12; 
		inst->gD[2] = (1.0f-alpha)*inst->gD[2] + alpha*D.e13; 
		inst->gD[3] = inst->gD[1];
		inst->gD[4] = (1.0f-alpha)*inst->gD[4] + alpha*D.e22; 
		inst->gD[5] = (1.0f-alpha)*inst->gD[5] + alpha*D.e23; 
		inst->gD[6] = inst->gD[2];
		inst->gD[7] = inst->gD[5];
		inst->gD[8] = (1.0f-alpha)*inst->gD[8] + alpha*D.e33; 
	}


	/* Compute centroid measurement noise covariance matrix Rc used for Kalman updates */
    /* fpoints is weighting factor that is the function of the number of observed poionts versus total number of reflections in a group */
	if(myPointNum > GTRACK_EST_POINTS)	
		alpha = 0;
	else
		alpha = ((float)(GTRACK_EST_POINTS-myPointNum))/((GTRACK_EST_POINTS-1)*myPointNum);
	
	Rc.e11 = Rm.e11/myPointNum + alpha*inst->gD[0]; 
	Rc.e22 = Rm.e22/myPointNum + alpha*inst->gD[4]; 
	Rc.e33 = Rm.e33/myPointNum + alpha*inst->gD[8]; 

#ifdef GTRACK_LOG_ENABLED
	if(inst->verbose & VERBOSE_MATRIX_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: Rm\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(3, 3, Rm.a);
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: D\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(3, 3, D.a);
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: gD\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(3, 3, inst->gD);
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: Rc\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(3, 3, Rc.a);
	}
#endif

	/* Compute state vector partial derivatives (Jacobian matrix) */
	gtrack_computeJacobian(inst->currentStateVectorType, inst->S_apriori_hat, J);

#ifdef GTRACK_LOG_ENABLED
	if(inst->verbose & VERBOSE_MATRIX_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: J\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(mlen, slen, J);
	}
#endif

	/* Compute innovation */
	gtrack_matrixSub(mlen, 1, U, inst->H_s, u_tilda);

#ifdef GTRACK_LOG_ENABLED
	if(inst->verbose & VERBOSE_MATRIX_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: u_tilda\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(mlen, 1, u_tilda);
	}
#endif

	/* Compute centroid covariance cC = [3x6]x[6x6]x[6x3]+[3x3] */
    /* cC = J(:,1:mSize) * obj.P_apriori(1:mSize,1:mSize) * J(:,1:mSize)' + Rc */
	gtrack_matrixComputePJT(inst->P_apriori_hat, J, PJ);
	gtrack_matrixMultiply(mlen, slen, mlen, J, PJ, JPJ);
	gtrack_matrixAdd(mlen, mlen, JPJ, Rc.a, cC);

	/* Compute inverse of cC */
	gtrack_matrixInv3(cC, cC_inv);

#ifdef GTRACK_LOG_ENABLED
	if(inst->verbose & VERBOSE_MATRIX_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: P\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(slen, slen, inst->P_apriori_hat);
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: cC\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(mlen, mlen, cC);
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: cC_inv\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(mlen, mlen, cC_inv);
	}
#endif

	/* Compute Kalman Gain K[6x3] = P[6x6]xJ[3x6]'xIC_inv[3x3]=[6x3] */
    /* K = obj.P_apriori(1:mSize,1:mSize) * J(:,1:mSize)' * iC_inv */
	gtrack_matrixMultiply(slen, mlen, mlen, PJ, cC_inv, K);

#ifdef GTRACK_LOG_ENABLED
	if(inst->verbose & VERBOSE_MATRIX_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: K\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(slen, mlen, K);
	}
#endif

	/* State estimation */
	/* obj.S_hat(1:mSize) = obj.S_apriori_hat(1:mSize) + K * u_tilda */
	gtrack_matrixMultiply(slen, mlen, 1, K, u_tilda, temp1);
	gtrack_matrixAdd(slen,1, inst->S_apriori_hat, temp1, inst->S_hat);

#ifdef GTRACK_LOG_ENABLED
	if(inst->verbose & VERBOSE_MATRIX_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: S-hat\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(slen, 1, inst->S_hat);
	}
#endif

	/* Covariance estimation */
    /* obj.P(1:mSize,1:mSize) = obj.P_apriori(1:mSize,1:mSize) - K * J(:,1:mSize) * obj.P_apriori(1:mSize,1:mSize) */
	gtrack_matrixTransposeMultiply(slen, mlen, slen, K, PJ, temp1);
	gtrack_matrixSub(slen, slen, inst->P_apriori_hat, temp1, inst->P_hat);

#ifdef GTRACK_LOG_ENABLED
	if(inst->verbose & VERBOSE_MATRIX_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: P-hat\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(slen, slen, inst->P_hat);
	}
#endif

	/* Compute groupCovariance gC (will be used in gating) */
    /* gC = gD + JPJ + Rm */

	gtrack_matrixAdd(mlen, mlen, JPJ, Rm.a, temp1);	
	gtrack_matrixAdd(mlen, mlen, temp1, inst->gD, inst->gC);

	/* Compute inverse of group innovation */
	gtrack_matrixInv3(inst->gC, inst->gC_inv);

#ifdef GTRACK_LOG_ENABLED
	if(inst->verbose & VERBOSE_MATRIX_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: gC\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(mlen, mlen, inst->gC);
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: gC_inv\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(mlen, mlen, inst->gC_inv);
	}
#endif

#ifdef GTRACK_LOG_ENABLED
	if(inst->verbose & VERBOSE_DEBUG_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: Update S=", inst->heartBeatCount, inst->uid);
        gtrack_log(GTRACK_VERBOSE_DEBUG, "{%3.1f, %3.1f, %3.1f, %3.1f, %3.1f, %3.1f}\n",
			inst->S_hat[0], inst->S_hat[1], inst->S_hat[2], inst->S_hat[3], inst->S_hat[4], inst->S_hat[5]);
	}
#endif

exit:
	gtrack_unitEvent(inst, myPointNum);
	return(inst->state);
}

void gtrack_velocityStateHandling(void *handle, float *um)
{
	GtrackUnitInstance *inst;
	float instanteneousRangeRate;
	float rrError;
	float rvError;
	float rvIn;

	inst = (GtrackUnitInstance *)handle;
	rvIn = um[2];

	switch(inst->velocityHandling) {

		case VELOCITY_INIT:
			um[2] = inst->rangeRate;
			inst->velocityHandling = VELOCITY_RATE_FILTER;
#ifdef GTRACK_LOG_ENABLED
			if(inst->verbose & VERBOSE_UNROLL_INFO) {
				gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: Update vState VINIT=>VFILT, %3.1f=>%3.1f\n", inst->heartBeatCount, inst->uid, rvIn, um[2]);
			}
#endif
			break;

		case VELOCITY_RATE_FILTER:
			/* In this state we are using filtered Rate Range to unroll radial velocity, stabilizing Range rate */
			instanteneousRangeRate = (um[0] - inst->allocationRange)/((inst->heartBeatCount-inst->allocationTime)*inst->dt);

			inst->rangeRate = inst->unrollingParams->alpha * inst->rangeRate + (1-inst->unrollingParams->alpha) * instanteneousRangeRate;
			um[2] = gtrack_unrollRadialVelocity(inst->maxRadialVelocity, inst->rangeRate, rvIn);

			rrError = (instanteneousRangeRate - inst->rangeRate)/inst->rangeRate;
		
			if(fabs(rrError) < inst->unrollingParams->confidence) {
				inst->velocityHandling = VELOCITY_TRACKING;
#ifdef GTRACK_LOG_ENABLED
				if(inst->verbose & VERBOSE_UNROLL_INFO) {
					gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: Update vState VFILT=>VTRACK, Unrolling with RangeRate=%3.1f: %3.1f=>%3.1f\n", inst->heartBeatCount, inst->uid, inst->rangeRate, rvIn, um[2]);
				}
#endif
			}
			else {	
#ifdef GTRACK_LOG_ENABLED
				if(inst->verbose & VERBOSE_UNROLL_INFO) {
					gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: Update vState VFILT, RangeRate=%3.1f, H-s=%3.1f, rvIn=%3.1f=>%3.1f\n", inst->heartBeatCount, inst->uid, inst->rangeRate, inst->H_s[2], rvIn, um[2]);
				}
#endif
			}
			break;

		case VELOCITY_TRACKING:
			/* In this state we are using filtered Rate Range to unroll radial velocity and monitoring Hs error */
			instanteneousRangeRate = (um[0] - inst->allocationRange)/((inst->heartBeatCount-inst->allocationTime)*inst->dt);

			inst->rangeRate = inst->unrollingParams->alpha * inst->rangeRate + (1-inst->unrollingParams->alpha) * instanteneousRangeRate;
			um[2] = gtrack_unrollRadialVelocity(inst->maxRadialVelocity, inst->rangeRate, rvIn);

			rvError = (inst->H_s[2] - um[2])/um[2];
			if(fabs(rvError) < 0.1f) {
				inst->velocityHandling = VELOCITY_LOCKED;

#ifdef GTRACK_LOG_ENABLED
				if(inst->verbose & VERBOSE_UNROLL_INFO) {
					gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: Update vState VTRACK=>VLOCK, Unrolling with RangeRate=%3.1f, H-s=%3.1f: %3.1f=>%3.1f\n", inst->heartBeatCount, inst->uid, inst->rangeRate, inst->H_s[2], rvIn, um[2]);
				}
#endif
			}
			else {

#ifdef GTRACK_LOG_ENABLED
				if(inst->verbose & VERBOSE_UNROLL_INFO) {
					gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d]: Update vState VTRACK, Unrolling with RangeRate=%3.1f, H-s=%3.1f: %3.1f=>%3.1f\n", inst->heartBeatCount, inst->uid, inst->rangeRate, inst->H_s[2], rvIn, um[2]);
				}
#endif
			}
			break;

		case VELOCITY_LOCKED:
			um[2] = gtrack_unrollRadialVelocity(inst->maxRadialVelocity, inst->H_s[2], um[2]);
			break;
	}
}
