/**
 *   @file  gtrack_utilities.c
 *
 *   @brief
 *      This is a set of utility functions used by GTRACK Algorithm
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
*		This function is used to convert a vector from sherical to cartesian
*
*  @param[in]  format
*		Format used
*  @param[in]  sph
*		Pointer to measurements (spheriacl form) vector
*  @param[in]  cart
*		Pointer to state vector (cartesian form)
*
*  \ingroup GTRACK_ALG_UTILITY_FUNCTION
*
*  @retval
*      None
*/
void gtrack_spherical2cartesian(GTRACK_STATE_VECTOR_TYPE format, float *sph, float *cart)
{

	float range = sph[0]; 
	float azimuth = sph[1]; 
	float doppler = sph[2];

	switch (format) {
		case GTRACK_STATE_VECTORS_2DA:
			cart[4] = 0;
			cart[5] = 0;
			/* fall through */
		case GTRACK_STATE_VECTORS_2D:
			cart[0] = range*sinf(azimuth);
			cart[1] = range*cosf(azimuth);
			cart[2] = doppler*sinf(azimuth);
			cart[3] = doppler*cosf(azimuth);
			break;

		default:
		case GTRACK_STATE_VECTORS_3D:
			break;
	}
}
/**
*  @b Description
*  @n
*		This function is used to convert a vector from cartesian to sherical to cartesian
*
*  @param[in]  format
*		Format used
*  @param[in]  cart
*		Pointer to state vector (cartesian form)
*  @param[in] sph 
*		Pointer to measurements (spheriacl form) vector
*
*  \ingroup GTRACK_ALG_UTILITY_FUNCTION
*
*  @retval
*      None
*/

void gtrack_cartesian2spherical(GTRACK_STATE_VECTOR_TYPE format, float *cart, float *sph)
{
	float posx; 
	float posy; 
	float velx; 
	float vely;

	switch (format) {
		case GTRACK_STATE_VECTORS_2D:	
			/* cart = [posx posy velx vely] */
			/* sph = [range azimuth doppler] */
		case GTRACK_STATE_VECTORS_2DA:
			/* cart = [posx posy velx vely accx accy] */
			/* sph = [range azimuth doppler] */
			posx = cart[0]; 
			posy = cart[1]; 
			velx = cart[2]; 
			vely = cart[3];

			/* calc range */
			sph[0] = sqrtf(posx*posx + posy*posy); 
	    
			/* calc azimuth */
			if (posy == 0)
				sph[1] = PI/2;
			else if (posy > 0)
				sph[1] = atanf(posx/posy);
			else
				sph[1] = atanf(posx/posy) + PI;
    
			/* calc doppler */
			sph[2] = (posx*velx+posy*vely)/sph[0];	
			break;

		default:
		case GTRACK_STATE_VECTORS_3D:	
			/* cart = [posx posy posz velx vely velz accx accy accz] */
			/* sph = [range azimuth elevation doppler] */
		case GTRACK_STATE_VECTORS_3DA:	
			/* cart = [posx posy posz velx vely velz] */
			/* sph = [range azimuth elevation doppler] */
			/* NOT SUPPORTED */
			break;
	}
}

/**
*  @b Description
*  @n
*		This function computes partial derivatives of the cartesian vector
*
*  @param[in]  format
*		Format used
*  @param[in]  cart
*		Pointer to state vector (cartesian form)
*  @param[in] jac 
*		Pointer to jacobian parial derivatives) vector
*
*  \ingroup GTRACK_ALG_UTILITY_FUNCTION
*
*  @retval
*      None
*/

void gtrack_computeJacobian(GTRACK_STATE_VECTOR_TYPE format, float *cart, float *jac)
{
	float posx = cart[0]; 
	float posy = cart[1]; 
	float velx = cart[2]; 
	float vely = cart[3];

	float range, range2, range3;

	range2 = (posx*posx + posy*posy);
	range = sqrtf(range2);
	range3 = range*range2;

	switch (format) {
		case GTRACK_STATE_VECTORS_2D:	
			/* cart = [posx posy velx vely] */
			/* jacobian is 3x4 */
			/* dR */
		    jac[0] = posx/range; /* dx */
		    jac[1] = posy/range; /* dy */
			jac[2] = 0; /* dx' */
			jac[3] = 0; /* dy' */
			/* dPhi */
		    jac[4] = posy/range2; /* dx */
		    jac[5] = -posx/range2; /* dy */
			jac[6] = 0; /* dx' */
			jac[7] = 0; /* dy' */
			/* dR' */
		    jac[8] = (posy*(velx*posy - vely*posx))/range3; /* dx */
			jac[9] = (posx*(vely*posx - velx*posy))/range3; /* dy */
			jac[10] = posx/range; /* dx' */
			jac[11] = posy/range; /* dy' */
			break;

		default:
		case GTRACK_STATE_VECTORS_2DA:
			/* cart = [posx posy velx vely accx accy] */
			/* jacobian is 3x6 */
			/* dR */
		    jac[0] = posx/range; /* dx */
			jac[1] = posy/range; /* dy */
			jac[2] = 0; /* dx' */
			jac[3] = 0; /* dy' */
			jac[4] = 0; /* dx'' */
			jac[5] = 0; /* dy'' */
			/* dPhi */
		    jac[6] = posy/range2; /* dx */
		    jac[7] = -posx/range2; /* dy */
			jac[8] = 0; /* dx' */
			jac[9] = 0; /* dy' */
			jac[10] = 0; /*dx'' */
			jac[11] = 0; /* dy'' */
			/* dR' */
		    jac[12] = (posy*(velx*posy - vely*posx))/range3; /* dx */
			jac[13] = (posx*(vely*posx - velx*posy))/range3; /* dy */
			jac[14] = posx/range; /* dx' */
			jac[15] = posy/range; /* dy' */
			jac[16] = 0; /* dx'' */
			jac[17] = 0; /* dy'' */
			break;
	}
}

/**
*  @b Description
*  @n
*		This function is used to unroll radial velocity from +/- rvMax form based on expectation velocity value
*
*  @param[in]  rvMax
*		Unambigious radial velocity
*  @param[in]  rvExp
*		Expected radial velocity value
*  @param[in] rvIn 
*		Measured radial velocity value
*
*  \ingroup GTRACK_ALG_UTILITY_FUNCTION
*
*  @retval
*      rvOut Unrolled radial velocity value
*/

float gtrack_unrollRadialVelocity(float rvMax, float rvExp, float rvIn)
{
	float distance;
	uint16_t factor;
	float rvOut;

	distance = rvExp - rvIn;
	if(distance >= 0) {
		/* going right */
		factor = (int)((distance+rvMax)/(2*rvMax));
		rvOut = rvIn + 2*rvMax*factor;
	} 
	else {
		/* going left */
		factor = (int)((rvMax-distance)/(2*rvMax));
		rvOut = rvIn - 2*rvMax*factor;
	}
	return rvOut;
}

/**
*  @b Description
*  @n
*		This function checks whether the point is inside the box boundary or not
*
*  @param[in]  x
*		x coordinate
*  @param[in]  y
*		y coordinate
*  @param[in] box
*		pointer to a 2D box object
*
*  \ingroup GTRACK_ALG_UTILITY_FUNCTION
*
*  @retval
*      1 if inside, 0 otherwise
*/
uint8_t isPointInsideBox(float x, float y, GTRACK_boundaryBox *box)
{
    if( (x > box->left) &&  (x < box->right) && (y > box->bottom) && (y < box->top) )
        return 1U;
    else
        return 0;
}
