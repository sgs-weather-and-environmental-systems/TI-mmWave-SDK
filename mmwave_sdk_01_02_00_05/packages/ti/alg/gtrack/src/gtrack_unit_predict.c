/**
 *   @file  gtrack_unit_predict.c
 *
 *   @brief
 *      Unit level predict function for the GTRACK Algorithm
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

#include <ti/alg/gtrack/gtrack.h>
#include <ti/alg/gtrack/include/gtrack_int.h>

/**
*  @b Description
*  @n
*		GTRACK Module calls this function to run GTRACK unit prediction step 
*
*  @param[in]  handle
*		This is handle to GTRACK unit
*
*  \ingroup GTRACK_ALG_UNIT_FUNCTION
*
*  @retval
*      None
*/

void gtrack_unitPredict(void *handle)
{
    GtrackUnitInstance *inst;
    uint16_t sLen; /* Current state vector length */

	float temp1[36];
	float temp2[36];
	float temp3[36];

    inst = (GtrackUnitInstance *)handle;
    inst->heartBeatCount++;
	sLen = inst->stateVectorLength;

	if(inst->processVariance != 0) {
		/* obj.S_apriori_hat(1:mSize) = obj.F(1:mSize,1:mSize) * obj.S_hat(1:mSize) */
		gtrack_matrixMultiply(sLen, sLen, 1, inst->F, inst->S_hat, inst->S_apriori_hat);

		/* obj.P_apriori(1:mSize,1:mSize) = obj.F(1:mSize,1:mSize) * obj.P(1:mSize,1:mSize) * obj.F(1:mSize,1:mSize)' + obj.Q(1:mSize,1:mSize)*obj.processVariance */
		gtrack_matrixMultiply66(inst->F, inst->P_hat, temp1);
		gtrack_matrixMultiply66T(temp1, inst->F, temp2);
		gtrack_matrixScalerMultiply(sLen, sLen, inst->Q, inst->processVariance, temp1);
		gtrack_matrixAdd(sLen, sLen, temp1, temp2, temp3);

		gtrack_matrixMakeSymmetrical(sLen, temp3, inst->P_apriori_hat);
	}
	else {
		/* For static object, maintain S and P */
		memcpy(inst->S_apriori_hat, inst->S_hat, sizeof(inst->S_hat));
		memcpy(inst->P_apriori_hat, inst->P_hat, sizeof(inst->P_hat));
	}

	/* Convert from cartesian to spherical */
    /* obj.H_s_apriori_hat = computeH(obj.pComputeFormat, obj.S_apriori_hat) */
	gtrack_cartesian2spherical(inst->stateVectorType, inst->S_apriori_hat, inst->H_s);
	
#ifdef GTRACK_LOG_ENABLED        
	if(inst->verbose & VERBOSE_MATRIX_INFO) {
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d] Predict: S-hat=>S-apriory-hat\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint2(sLen, 1, inst->S_hat, inst->S_apriori_hat);
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d] Predict: P-hat,Q => P-apriori-hat\n", inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(sLen, sLen, inst->P_hat);
		gtrack_matrixPrint(sLen, sLen, temp1);
		gtrack_matrixPrint(sLen, sLen, inst->P_apriori_hat);
		gtrack_log(GTRACK_VERBOSE_DEBUG, "%llu: uid[%d] Predict: H-s =\n",inst->heartBeatCount, inst->uid);
		gtrack_matrixPrint(3, 1, inst->H_s);
	}
#endif
}
