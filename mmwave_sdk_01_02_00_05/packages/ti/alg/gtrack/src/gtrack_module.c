/**
 *   @file  gtrack_module.c
 *
 *   @brief
 *      Implementation of the GTRACK Algorithm MODULE
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
#include <float.h>
#include <ti/alg/gtrack/gtrack.h>
#include <ti/alg/gtrack/include/gtrack_int.h>

/**
*  @b Description
*  @n
*      This is a MODULE level predict function. The function is called by external step function to perform unit level kalman filter predictions
*
*  @param[in]  inst
*      Pointer to GTRACK module instance
*
*  \ingroup GTRACK_ALG_MODULE_FUNCTION
*
*  @retval
*      None
*/

void gtrack_modulePredict(GtrackModuleInstance *inst)
{
	GTrack_ListElem *tElem;
	uint16_t uid;

	tElem = gtrack_listGetFirst(&inst->activeList);
	while(tElem != 0)
	{
		uid = tElem->data;
		if(uid > inst->maxNumTracks) {
			/* This should never happen */
			gtrack_assert(0);
		}

		gtrack_unitPredict(inst->hTrack[uid]);

		tElem = gtrack_listGetNext(tElem);
	}
}

/**
*  @b Description
*  @n
*      This is a MODULE level associatiation function. The function is called by external step function to associate measurement points with known targets
*
*  @param[in]  inst
*      Pointer to GTRACK module instance
*  @param[in]  point
*      Pointer to an array of input measurments. Each measurement has range/angle/radial velocity information
*  @param[in]  num
*      Number of input measurements
*
*  \ingroup GTRACK_ALG_MODULE_FUNCTION
*
*  @retval
*      None
*/

void gtrack_moduleAssociate(GtrackModuleInstance *inst, GTRACK_measurementPoint *point, uint16_t num)
{
	GTrack_ListElem *tElem;
	uint16_t uid;

	tElem = gtrack_listGetFirst(&inst->activeList);
	while(tElem != 0)
	{
		uid = tElem->data;
		gtrack_unitScore(inst->hTrack[uid], point, inst->bestScore, inst->bestIndex, num);

		tElem = gtrack_listGetNext(tElem);
	}

}

/**
*  @b Description
*  @n
*      This is a MODULE level allocation function. The function is called by external step function to allocate new targets for the non-associated measurement points
*
*  @param[in]  inst
*      Pointer to GTRACK module instance
*  @param[in]  point
*      Pointer to an array of input measurments. Each measurement has range/angle/radial velocity information
*  @param[in]  num
*      Number of input measurements
*
*  \ingroup GTRACK_ALG_MODULE_FUNCTION
*
*  @retval
*      None
*/
void gtrack_moduleAllocate(GtrackModuleInstance *inst, GTRACK_measurementPoint *point, uint16_t num)
{
	uint16_t n, k;

	float un[3], uk[3];
	float unSum[3];
	uint16_t allocNum;
	float dist;
	float allocSNR;
	GTrack_ListElem *tElem;


	for(n=0; n<num; n++) {
		if(inst->bestIndex[n] == GTRACK_ID_POINT_NOT_ASSOCIATED) {
			
			tElem = gtrack_listGetFirst(&inst->freeList);
			if(tElem == 0) {

#ifdef GTRACK_LOG_ENABLED
			    if(inst->verbose & VERBOSE_WARNING_INFO)
			        gtrack_log(GTRACK_VERBOSE_WARNING, "Maximum number of tracks reached!");
#endif
			    return;
			}

			inst->allocIndex[0] = n;
			allocNum = 1;
			allocSNR = point[n].snr;

			un[0] = unSum[0] = point[n].range;
			un[1] = unSum[1] = point[n].angle; 
			un[2] = unSum[2] = point[n].doppler;

			for(k=n+1; k<num; k++) {
				if(inst->bestIndex[k] == GTRACK_ID_POINT_NOT_ASSOCIATED) {

					uk[0] = point[k].range;
					uk[1] = point[k].angle;
					uk[2] = gtrack_unrollRadialVelocity(inst->params.maxRadialVelocity, un[2], point[k].doppler);

					if(fabs(uk[2] - un[2]) < inst->params.allocationParams.maxVelThre) {
						dist = un[0]*un[0] + uk[0]*uk[0] - 2*un[0]*uk[0]*cosf(un[1]-uk[1]);
						if(dist < inst->params.allocationParams.maxDistanceThre) {
								
							inst->allocIndex[allocNum] = k;

							unSum[0] += uk[0];
							unSum[1] += uk[1];
							unSum[2] += uk[2];

							allocNum++;
							allocSNR +=point[k].snr;

							un[0] = unSum[0]/allocNum;
							un[1] = unSum[1]/allocNum;
							un[2] = unSum[2]/allocNum;
						}
					}
				}
			}
			if((allocNum > inst->params.allocationParams.pointsThre) &&
			        (allocSNR > inst->params.allocationParams.snrThre) &&
			        (fabs(un[2]) > inst->params.allocationParams.velocityThre) )
			{
				/* Associate points with new uid  */
				for(k=0; k<allocNum; k++)
					inst->bestIndex[inst->allocIndex[k]] = (uint8_t)tElem->data;

				/* Allocate new tracker */
                inst->targetNumTotal ++;
                inst->targetNumCurrent ++;
				tElem = gtrack_listDequeue(&inst->freeList);
                gtrack_unitStart(inst->hTrack[tElem->data], inst->heartBeat, inst->targetNumTotal, un);
				gtrack_listEnqueue(&inst->activeList, tElem);
			}
		}
	}
}

/**
*  @b Description
*  @n
*      This is a MODULE level update function. The function is called by external step function to perform unit level kalman filter updates
*
*  @param[in]  inst
*      Pointer to GTRACK module instance
*  @param[in]  point
*      Pointer to an array of input measurments. Each measurement has range/angle/radial velocity information
*  @param[in]  var
*      Pointer to an array of input measurment variances. Set to NULL if variances are unknown
*  @param[in]  num
*      Number of input measurements
*
*  \ingroup GTRACK_ALG_MODULE_FUNCTION
*
*  @retval
*      None
*/

void gtrack_moduleUpdate(GtrackModuleInstance *inst, GTRACK_measurementPoint *point, GTRACK_measurementVariance *var, uint16_t num)
{
	GTrack_ListElem *tElem;
	GTrack_ListElem *tElemToRemove;
	uint16_t uid;
	TrackState state;

	tElem = gtrack_listGetFirst(&inst->activeList);
	while(tElem != 0)
	{
		uid = tElem->data;
		state = gtrack_unitUpdate(inst->hTrack[uid], point, var, inst->bestIndex, num);
		if(state == TRACK_STATE_FREE) {
			tElemToRemove = tElem;
			tElem = gtrack_listGetNext(tElem);
			gtrack_listRemoveElement(&inst->activeList, tElemToRemove);

			gtrack_unitStop(inst->hTrack[tElemToRemove->data]);
            inst->targetNumCurrent --;
			gtrack_listEnqueue(&inst->freeList, tElemToRemove);
		}
		else
			tElem = gtrack_listGetNext(tElem);
	}
}
/**
*  @b Description
*  @n
*      This is a MODULE level report function. The function is called by external step function to obtain unit level data
*
*  @param[in]  inst
*      Pointer to GTRACK module instance
*  @param[out]  t
*      Pointer to an array of \ref GTRACK_targetDesc.
*      This function populates the descritions for each of the tracked target
*  @param[out]  tNum
*      Pointer to a uint16_t value.
*      Function returns a number of populated target descriptos 
*
*  \ingroup GTRACK_ALG_MODULE_FUNCTION
*
*  @retval
*      None
*/

void gtrack_moduleReport(GtrackModuleInstance *inst, GTRACK_targetDesc *t, uint16_t *tNum)
{
	GTrack_ListElem *tElem;
	uint16_t uid;
	uint16_t num = 0;


	tElem = gtrack_listGetFirst(&inst->activeList);
	while(tElem != 0)
	{
		uid = tElem->data;
		gtrack_unitReport(inst->hTrack[uid], &t[num++]);
		tElem = gtrack_listGetNext(tElem);
	}
	*tNum = num;
}
