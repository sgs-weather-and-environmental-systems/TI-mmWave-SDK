/**
 *   @file  gtrack_int.h
 *
 *   @brief
 *      This is the internal header file for GTRACK Algorithm
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


#ifndef GTRACK_INT_H__
#define GTRACK_INT_H__

#include <stdint.h>
#include "gtrack_listlib.h"

/**
 * @brief 
 *  3x3 Matrix Definition
 *
 * @details
 *  The structure describes the 3x3 matrix that can be viewed as an row-wise array OR addressed by individual element.
 */
typedef union {
	float a[9];
	struct
	{
		float e11; float e12; float e13;
		float e21; float e22; float e23;
		float e31; float e32; float e33;
	};
} MATRIX3x3; 

/**
 * @brief 
 *  4x4 Matrix Definition
 *
 * @details
 *  The structure describes the 4x4 matrix that can be viewed as an row-wise array OR addressed by individual element.
 */
typedef union {
	float a[16];
	struct
	{
		float e11; float e12; float e13; float e14;
		float e21; float e22; float e23; float e24;
		float e31; float e32; float e33; float e34;
		float e41; float e42; float e43; float e44;
	};
} MATRIX4x4;

/**
 * @brief 
 *  6x6 Matrix Definition
 *
 * @details
 *  The structure describes the 6x6 matrix that can be viewed as an row-wise array OR addressed by individual element.
 */
typedef union {
	float a[36];
	struct
	{
		float e11; float e12; float e13; float e14; float e15; float e16;
		float e21; float e22; float e23; float e24; float e25; float e26;
		float e31; float e32; float e33; float e34; float e35; float e36;
		float e41; float e42; float e43; float e44; float e45; float e46;
		float e51; float e52; float e53; float e54; float e55; float e56;
		float e61; float e62; float e63; float e64; float e65; float e66;
	};
} MATRIX6x6;


/**
 * @brief 
 *  GTRACK Unit Parameters structure
 *
 * @details
 *  The structure describes the parameters used to instantiate GTRACK unit instance
 */
typedef struct {
	
    /**  @brief  Track Unit Identifier (UID) */
	uint8_t uid;
    /**  @brief  State vector type to use */
	GTRACK_STATE_VECTOR_TYPE stateVectorType;
    /**  @brief  Verbosenes mask to use */
    uint64_t verbose;
    
    /**  @brief Expected target radial velocity at the moment of detection, m/s */
    float initialRadialVelocity;
    /**  @brief Absolute value of maximum radial velocity, m/s*/
    float maxRadialVelocity;
    /**  @brief Radial velocity resolution, m/s */
    float radialVelocityResolution;
    /**  @brief Maximum target acceleration */
    float maxAcceleration;
    /**  @brief Frame rate */
    float deltaT;

    /**  @brief  Gating parameters */    
     GTRACK_gatingParams gatingParams;
     /**  @brief  Allocation parameters */
     GTRACK_allocationParams allocationParams;
     /**  @brief  Unrolling parameters */
     GTRACK_unrollingParams unrollingParams;
     /**  @brief  State parameters */
     GTRACK_stateParams stateParams;
     /**  @brief  Variation parameters */
     GTRACK_varParams   variationParams;    
     /**  @brief  Scenery parameters */
     GTRACK_sceneryParams   sceneryParams;
   
    /**  @brief  2D State Transition Matrix, size is 4x4 */
	float F4[4*4];
    /**  @brief  2DA State Transition Matrix, size is 6x6 */
	float F6[6*6];
    /**  @brief  2D Process Noise Matrix, size is 4x4 */
	float Q4[4*4];
    /**  @brief  2DA Process Noise Matrix, size is 6x6 */
	float Q6[6*6];

} TrackingParams;

/**
 * @brief    Macros that define values to use for \ref TrackingParams::verbose when specifying the required verboseness
 */
#define VERBOSE_ERROR_INFO			0x00000001      /*!< Report Errors */
#define VERBOSE_WARNING_INFO		0x00000002      /*!< Report Warnings */
#define VERBOSE_DEBUG_INFO			0x00000004      /*!< Report Debuging information */
#define VERBOSE_MATRIX_INFO			0x00000008      /*!< Report Matrix math computations */
#define VERBOSE_UNROLL_INFO			0x00000010      /*!< Report velocity unrolling data */
#define VERBOSE_STATE_INFO			0x00000020      /*!< Report state transitions */
#define VERBOSE_ASSOSIATION_INFO	0x00000040      /*!< Report association data */
#define VERBOSE_GATEXY_INFO			0x00000080      /*!< Report gating in XY space */
#define VERBOSE_GATERA_INFO			0x00000100      /*!< Report gating in range/angle space */
#define VERBOSE_GATEG1_INFO			0x00000200      /*!< Report unitary gating */

/**
 * @brief 
 *  GTRACK Unit State
 *
 * @details
 *  The structure describes GTRACK unit states
 */
typedef enum {
    /**  @brief Free (not allocated) */
    TRACK_STATE_FREE = 0,
    /**  @brief INIT */
    TRACK_STATE_INIT,
    /**  @brief DETECTION State */
    TRACK_STATE_DETECTION,
    /**  @brief ACTIVE State */
    TRACK_STATE_ACTIVE
} TrackState;

/**
 * @brief 
 *  GTRACK Unit Velocity Handling State
 *
 * @details
 *  The structure describes GTRACK velocity handling states
 */
typedef enum {
    /**  @brief INIT */
    VELOCITY_INIT = 0,
    /**  @brief Range Rate filtering */
    VELOCITY_RATE_FILTER,
    /**  @brief Stabilizing Velocity Estimation */
    VELOCITY_TRACKING,
    /**  @brief Locked */
    VELOCITY_LOCKED
} VelocityHandlingState;


/** @addtogroup GTRACK_ALG_INTERNAL_DATA_STRUCTURE
 @{ */

/**
 * @brief 
 *  GTRACK Unit instance structure
 *
 * @details
 *  The structure describes the individual GTRACK unit instance
 */

typedef struct
{
    /**  @brief Tracking Unit identifier */
    uint8_t	    uid;
    /**  @brief Target identifier */
    uint32_t	tid;

    /**  @brief TimeStamp */
    uint64_t	heartBeatCount;
    /**  @brief Allocation Time */
    uint64_t	allocationTime;
    /**  @brief Allocation Range */
	float		allocationRange;
    /**  @brief Allocation Radial Velocity */
	float		allocationVelocity;
    /**  @brief Number of Associated Points */
    uint16_t	associatedPoints;

    /**  @brief Current State */
    TrackState	state;
    /**  @brief Requested State Vector type */
	GTRACK_STATE_VECTOR_TYPE	stateVectorType;
    /**  @brief Current State Vector type */
	GTRACK_STATE_VECTOR_TYPE	currentStateVectorType;
    /**  @brief Length of State Vector */
    uint16_t	stateVectorLength;
    /**  @brief Length of Measurement Vector */
    uint16_t	measurementVectorLength;
    /**  @brief Veboseness Mask */
	uint64_t	verbose;    

    /**  @brief Gating Parameters */
	GTRACK_gatingParams		*gatingParams;
    /**  @brief State Changing Parameters */
	GTRACK_stateParams	        *stateParams;
    /**  @brief Allocation Parameters */
	GTRACK_allocationParams	*allocationParams;
    /**  @brief Unrolling Parameters */
	GTRACK_unrollingParams		*unrollingParams;
    /**  @brief Measurement Variation Parameters */
	GTRACK_varParams           *variationParams;
    /**  @brief Scenery Parameters */
    GTRACK_sceneryParams       *sceneryParams;
	
    /**  @brief Current velocity handling State */
	VelocityHandlingState	velocityHandling;
	
    /**  @brief Expected target radial velocity at the moment of detection, m/s */
    float initialRadialVelocity;	
    /**  @brief Absolute value of maximum radial velocity measure by the sensor, m/s */
	float		maxRadialVelocity;
    /**  @brief Radial velocity resolution of the sensor, m/s */
	float		radialVelocityResolution;
    /**  @brief Current Range Rate value*/
    float		rangeRate;

    /**  @brief Detection state count to active */
    uint16_t	detect2activeCount;
    /**  @brief Detection state count to free */
    uint16_t	detect2freeCount;
    /**  @brief Active state count to free */
    uint16_t	active2freeCount;

	/**  @brief Configured target maximum acceleration */
	float		maxAcceleration;
	/**  @brief Current Process Variance */
	float		processVariance;
	/**  @brief Configured Frame rate */
    float		dt;

	/**  @brief Pointer to 2D Transition matrix */
    float		*F4;
	/**  @brief Pointer to 2DA Transition matrix */
    float		*F6;
	/**  @brief Pointer to 2D Process Noise matrix */
    float		*Q4;
	/**  @brief Pointer to 2DA Process Noise matrix */
    float		*Q6;

	/**  @brief Pointer to current Transition matrix */
    float		*F;
	/**  @brief Pointer to current Process Noise matrix */
    float		*Q;

	/**  @brief State matrix, estimated */
    float		S_hat[6];
	/**  @brief State matrix, predicted */
    float		S_apriori_hat[6];
	/**  @brief Process matrix, estimated */
    float		P_hat[36];
	/**  @brief Process matrix, predicted */
    float		P_apriori_hat[36];
	/**  @brief Expected Measurment matrix */
    float		H_s[3];
	/**  @brief Group Dispersion matrix */
    float		gD[9];
	/**  @brief Group Member Covariance matrix (between a member in measurment group and group centroid) */
    float		gC[9];
	/**  @brief Inverse of Group Covariance matrix */
    float		gC_inv[9];
	/**  @brief Gain used in association function */
	float		G;

} GtrackUnitInstance;

/**
 * @brief 
 *  GTRACK Module instance structure
 *
 * @details
 *  The structure describes the GTRACK module instance
 */
typedef struct {

	/**  @brief Maximum number of measurement points per frame */
	uint16_t maxNumPoints;
	/**  @brief Maximum number of Tracking objects */
	uint16_t maxNumTracks;
	/**  @brief Tracking Unit Parameters  */
	TrackingParams params;

	/**  @brief TimeStamp  */
	uint64_t	heartBeat;

    /**  @brief verboseness Mask */
	uint64_t	verbose;
	/**  @brief Array of best scores  */
	float		*bestScore;
	/**  @brief Array of best score authors (UIDs)  */
	uint8_t	    *bestIndex;
	/**  @brief Temporary Array of measurement indices for set-under-construction */
	uint16_t	*allocIndex;
	/**  @brief Array of Tracking Unit handles */
	void		**hTrack;
	/**  @brief List of currently active Tracking Units (UIDs) */
	GTrack_ListObj activeList;
	/**  @brief List of Free Tracking Units (UIDs) */
	GTrack_ListObj freeList;
	/**  @brief Array of UID elements */
	GTrack_ListElem *uidElem;

	/**  @brief Array of Target descriptors */
	GTRACK_targetDesc	*targetDesc;
    /**  @brief Total number of tracked targets */
    uint32_t	        targetNumTotal;
	/**  @brief Number of currently tracked Targets */
	uint16_t			targetNumCurrent;

} GtrackModuleInstance;

/**
 @} */

void gtrack_modulePredict(GtrackModuleInstance *inst);
void gtrack_moduleAssociate(GtrackModuleInstance *inst, GTRACK_measurementPoint *point, uint16_t num);
void gtrack_moduleAllocate(GtrackModuleInstance *inst, GTRACK_measurementPoint *point, uint16_t num);
void gtrack_moduleUpdate(GtrackModuleInstance *inst, GTRACK_measurementPoint *point, GTRACK_measurementVariance *var, uint16_t num);
void gtrack_moduleReport(GtrackModuleInstance *inst, GTRACK_targetDesc *t, uint16_t *tNum);

void *gtrack_unitCreate(TrackingParams *params, int32_t *errCode);
void gtrack_unitDelete(void *handle);
void gtrack_unitStart(void *handle, uint64_t timeStamp, uint32_t tid, float *um);
void gtrack_unitStop(void *handle);
void gtrack_unitPredict(void *handle);
TrackState gtrack_unitUpdate(void *handle, GTRACK_measurementPoint *point, GTRACK_measurementVariance *var, uint8_t *pInd, uint16_t num);
void gtrack_unitScore(void *handle, GTRACK_measurementPoint *point, float *bestScore, uint8_t *bestInd, uint16_t num);
void gtrack_unitEvent(void *handle, uint16_t num);
void gtrack_unitReport(void *handle, GTRACK_targetDesc *target);

void gtrack_velocityStateHandling(void *handle, float *um);
float gtrack_unrollRadialVelocity(float rvMax, float rvExp, float rvIn);
void gtrack_spherical2cartesian(GTRACK_STATE_VECTOR_TYPE format, float *sph, float *cart);
void gtrack_cartesian2spherical(GTRACK_STATE_VECTOR_TYPE format, float *cart, float *sph);
void gtrack_computeJacobian(GTRACK_STATE_VECTOR_TYPE format, float *cart, float *jac);
float gtrack_gateCreateLim (float volume, float *EC, float range, float *gateLim);
void gtrack_computeMahalanobis3(float *d, float *S, float *chi2);
uint8_t isPointInsideBox(float x, float y, GTRACK_boundaryBox *box);

void gtrack_matrixMultiply(uint16_t m1, uint16_t m2, uint16_t m3, float *A, float *B, float *C);
void gtrack_matrixMultiply66(float *A, float *B, float *C);
void gtrack_matrixMultiply66T(float *A, float *B, float *C);
void gtrack_matrixComputePJT(float *P, float *J, float *PJ);
void gtrack_matrixTransposeMultiply(uint16_t rows, uint16_t m, uint16_t cols, float *A, float *B, float *C);
void gtrack_matrixScalerMultiply(uint16_t m1, uint16_t m2, float *A, float C, float *B);
void gtrack_matrixAdd(uint16_t m1, uint16_t m2, float *A, float *B, float *C);
void gtrack_matrixSub(uint16_t m1, uint16_t m2, float *A, float *B, float *C);
void gtrack_matrixDet3(float *A, float *det);
void gtrack_matrixInv3(float *A, float *Ainv);
void gtrack_matrixMakeSymmetrical(uint16_t m, float *A, float *B);

void gtrack_matrixCholesky3(float *A, float *G);
void gtrack_matrixPrint(uint16_t m1, uint16_t m2, float *A);
void gtrack_matrixPrint2(uint16_t rows, uint16_t cols, float *A, float *B);

#endif /* GTRACK_INT_LIB_H__ */
