/****************************************************************************/
/*  divf_i.h           v8.1.3                                               */
/*                                                                          */
/* Copyright (c) 2007-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/

/* _CODE_ACCESS REAL DIVF(REAL left, REAL right) */

/*---------------------------------------------------------------------------*/
/* IEEE floating divide.  return left / right                                */
#ifdef Support_INFNAN
/* Handles +/- INFINITY, NAN.                                                */
#else
/* Does *NOT* handle +/- INFINITY, NAN.                                      */
#endif
#ifdef Support_DENORM
/* Handles denormalized numbers.                                             */
#else
/* Does *NOT* handle denormalized numbers.                                   */
#endif
/*---------------------------------------------------------------------------*/


  realnum real_x, real_y, quotient;
  int exp_diff;

/*----------------------------------------------------------------------------*/
/* Single precision for C67xx                                                 */
/*----------------------------------------------------------------------------*/
#if (defined(_TMS320C6700) && BPREAL == BPbigint) 
  REAL      recip_f;
  double    recip_d;
  DOUBLE2FORM dividend;
#else

  mantissa_t inverse = 0, temp, product, qexp;

/*----------------------------------------------------------------------------*/
/* Double precision for C67xx                                                 */
/*----------------------------------------------------------------------------*/
#if (defined(_TMS320C6700) && BPREAL == BPbigint * 2) 
  REAL r0;
  realnum real_z;
  int exp_sum;

/*----------------------------------------------------------------------------*/
/* For others                                                                 */
/*----------------------------------------------------------------------------*/
#else
  static const uint_least8_t initial_approx[] = {0x0, 0xE3, 0xCC, 0xBA,
                                                 0xAA, 0x9B, 0x92,0x88};
  int i;
#endif

#endif

  REAL_TO_REALNUM(left, real_x);
  REAL_TO_REALNUM(right, real_y);

#ifdef Support_INFNAN
  /*--------------------------------------------------------------------------*/
  /* Catch the case where either operand is not normalized.                   */
  /*    (NaN/ZERO/INF/Subnormal)                                              */
  /*                                                                          */
  /*    - NaN, INF       : exp = MAX + 1                                      */
  /*    - ZERO, Subnormal: exp = -MIN - 1(= -BIAS)                            */
  /*--------------------------------------------------------------------------*/
  if (real_x.exp == (uint32_t)-REAL_EXP_BIAS || real_x.exp == REAL_EMAX + 1 || 
      real_y.exp == (uint32_t)-REAL_EXP_BIAS || real_y.exp == REAL_EMAX + 1)
  {
      /*----------------------------------------------------------------------*/
      /* Set the sign bit                                                     */
      /*----------------------------------------------------------------------*/
      quotient.sign = real_x.sign ^ real_y.sign;

      /*----------------------------------------------------------------------*/
      /* Returning NaN:                                                       */
      /*    1. Either operand is NaN                                          */
      /*    2. INF  / INF                                                     */
      /*    3. ZERO / ZERO                                                    */
      /*----------------------------------------------------------------------*/
      if ((REAL_IS_NAN(real_x)  || REAL_IS_NAN(real_y) )    ||
          (REAL_IS_INF(real_x)  && REAL_IS_INF(real_y) )    || 
          (REAL_IS_ZERO(real_x) && REAL_IS_ZERO(real_y))      )  
      {
          quotient.exp      = REAL_EMAX + 1;
          quotient.mantissa = ~(mantissa_t)0;
          left = 0.0;
          REALNUM_TO_REAL(quotient, left);
          return left;
      }

      /*----------------------------------------------------------------------*/
      /* Returning INF:                                                       */
      /*    1. INF  / any                                                     */
      /*    2. any  / ZERO                                                    */
      /*----------------------------------------------------------------------*/
      if (REAL_IS_INF(real_x) || REAL_IS_ZERO(real_y))      
      {
          quotient.exp      = REAL_EMAX + 1;
          quotient.mantissa = REAL_FIXED_POINT_ONE;
          REALNUM_TO_REAL(quotient, left);
          return left;
      }

      /*----------------------------------------------------------------------*/
      /* Returning ZERO:                                                      */
      /*    1. ZERO / any                                                     */
      /*    2. any  / INF                                                     */
      /*----------------------------------------------------------------------*/
      if (REAL_IS_ZERO(real_x) || REAL_IS_INF(real_y))
      {
          quotient.exp      = (uint32_t)(-REAL_EXP_BIAS);
          quotient.mantissa = REAL_FIXED_POINT_ONE;
          REALNUM_TO_REAL(quotient, left);
          return left;
      }

      /*----------------------------------------------------------------------*/
      /* Subnormal numbers can be scaled here.                                */
      /*----------------------------------------------------------------------*/
  }

#endif

#ifndef Support_DENORM
  /*Checking if exponent == EMIN - 1, which if denormals are not supported
   *means checking if x is zero, if it is then return zero */
 if(real_x.exp == (uint32_t)(REAL_EMIN - 1)){
     quotient.mantissa = 0;
     quotient.exp = (uint32_t) -REAL_EXP_BIAS;
     quotient.sign = real_x.sign ^ real_y.sign;
     REALNUM_TO_REAL(quotient, left);
     return left;
  }
#else
#error This division routine does not support denormalized numbers
#endif

  /*--------------------------------------------------------------------------*/
  /* Catch the case where the result overflows/underflows.                    */
  /*--------------------------------------------------------------------------*/
  exp_diff = real_x.exp - real_y.exp;

  /*--------------------------------------------------------------------------*/
  /* exp_diff might decrease by one below depending on the mantissa bits.     */
  /* So, check for the case where exp_diff equals to REAL_EMIN.               */
  /*--------------------------------------------------------------------------*/
  if (exp_diff > REAL_EMAX || exp_diff <= REAL_EMIN)
  {
      /*----------------------------------------------------------------------*/
      /* Set the sign bit                                                     */
      /*----------------------------------------------------------------------*/
      quotient.sign = real_x.sign ^ real_y.sign;

      if (real_x.mantissa < real_y.mantissa)
          exp_diff -= 1;

      /*----------------------------------------------------------------------*/
      /* Returning INF:                                                       */
      /*----------------------------------------------------------------------*/
      if (exp_diff > REAL_EMAX)
      {
          quotient.exp      = REAL_EMAX + 1;
          quotient.mantissa = REAL_FIXED_POINT_ONE;
          REALNUM_TO_REAL(quotient, left);
          return left;
      }
      /*----------------------------------------------------------------------*/
      /* Returning ZERO:                                                      */
      /*----------------------------------------------------------------------*/
      else if (exp_diff < REAL_EMIN)
      {
          quotient.exp      = (uint32_t)(-REAL_EXP_BIAS);
          quotient.mantissa = REAL_FIXED_POINT_ONE;
          REALNUM_TO_REAL(quotient, left);
          return left;
      }
  }

/*----------------------------------------------------------------------------*/
/* Single precision for C67xx: use floating point instructions.               */
/*----------------------------------------------------------------------------*/
#if (defined(_TMS320C6700) && (BPREAL == BPbigint))
    /*------------------------------------------------------------------------*/
    /* Normalize the divisor: if the divisor is too big, its reciprocal can   */
    /*                        become subnormal which is not well supported    */
    /*                        in c6x. Here, the divisor is scaled so that     */
    /*                        its exponent becomes zero.                      */
    /*------------------------------------------------------------------------*/
    real_x.exp -= real_y.exp;
    real_y.exp = 0;
    REALNUM_TO_REAL(real_y, right);

    /*------------------------------------------------------------------------*/
    /* This algorithm uses the original floating point dividend. Adjust it.   */
    /*------------------------------------------------------------------------*/
    dividend.f = (double)left;
    dividend.fp_format.exp = real_x.exp + GET_PRECISION(BPdouble, EXP_BIAS);

    /*------------------------------------------------------------------------*/
    /* Initial approximation:                                                 */
    /* The mantissa is accurate to the eighth binary position (therefore,     */
    /* mantissa error is less than 2 **(-8). (from spru733a)                  */
    /*------------------------------------------------------------------------*/
    recip_f = _rcpsp(right);

    /*------------------------------------------------------------------------*/
    /* First iteration: error is less than 2 ** (-16).                        */
    /*                  can still use single precision.                       */
    /*------------------------------------------------------------------------*/
    recip_f = recip_f * (2.0f - right * recip_f);

    /*------------------------------------------------------------------------*/
    /* Second iteration: error is less than 2 ** (-32).                       */
    /*                   need to use double precision.                        */
    /*------------------------------------------------------------------------*/
    recip_d = (double)recip_f * (2.0 - (double)right * (double)recip_f);

    /*------------------------------------------------------------------------*/
    /* Third iteration: Two iterations of Newton Raphson methond should be    */
    /*                  enough to generate the correct reciprocal(1/y) for    */
    /*                  single precision.                                     */
    /*                                                                        */
    /*                  However, the last multiplication can introduce        */
    /*                  rounding errors. So perform one more iteration so     */
    /*                  we can get maximum number of correct bits.            */
    /*------------------------------------------------------------------------*/
    recip_d = recip_d * (2.0 - (double)right * recip_d);

    return (REAL)(dividend.f * recip_d);
#else

/*----------------------------------------------------------------------------*/
/* Double precision for C67xx: use floating point instructions for first      */
/*                             two iterations of Newton-Raphson method.       */
/*----------------------------------------------------------------------------*/
#if (defined(_TMS320C6700) && (BPREAL == BPbigint * 2))
    /*------------------------------------------------------------------------*/
    /* Normalize the divisor: if the divisor is too big, its reciprocal can   */
    /*                        become subnormal which is not well supported    */
    /*                        in c6x. Here, the divisor is scaled so that     */
    /*                        its exponent becomes zero.                      */
    /*------------------------------------------------------------------------*/
    real_x.exp -= real_y.exp;
    real_y.exp = 0;
    REALNUM_TO_REAL(real_y, right);

    /*------------------------------------------------------------------------*/
    /* Initial approximation:                                                 */
    /* The mantissa is accurate to the eighth binary position (therefore,     */
    /* mantissa error is less than 2 **(-8). (from spru733a)                  */
    /*                                                                        */
    /* As indicated in the CPU and Instruction Set User's Guide,              */
    /* provides the same number of correct mantissa bits as RCPSP.            */
    /*------------------------------------------------------------------------*/
    r0 = _rcpdp(right);

    /*------------------------------------------------------------------------*/
    /* First and second iterations: error is less than 2 ** (-32).            */
    /*                              can still use double precision.           */
    /*------------------------------------------------------------------------*/
    r0 = r0 * (2.0 - right * r0);
    r0 = r0 * (2.0 - right * r0);

    /*------------------------------------------------------------------------*/
    /* Last iteration needs higher precision: use fixed point arithmetic.     */
    /*------------------------------------------------------------------------*/
    REAL_TO_REALNUM(r0, real_z);

    /*------------------------------------------------------------------------*/
    /* Adjust the approximated value so that the product is aligned with 2.0  */
    /*                                                                        */
    /*  - assuming real_y and real_z both are normalized numbers.             */
    /*  - real_y : 1.xxxxx * 2^p, real_z: 1.xxxx * 2^q                        */
    /*  - real_z is an approximated reciprocal of real_y                      */
    /*  - real_y * real_z = 1.xxx * 1.xxx * 2^(p + q) ~= 1.0                  */
    /*  - p + q <= 0 for sure.                                                */
    /*------------------------------------------------------------------------*/
    exp_sum = real_y.exp + real_z.exp;
    real_z.mantissa >>= -exp_sum;

    /*------------------------------------------------------------------------*/
    /* Perform: (2.0 - divisor * approx) (two's complement)                   */
    /*------------------------------------------------------------------------*/
    temp = FRCMPYF_DIV(real_y.mantissa, real_z.mantissa);
    temp <<= 1;
    temp = ~temp;
    temp += 1;

    /*------------------------------------------------------------------------*/
    /* Perform: approx * (2.0 - divisor * approx)                             */
    /*------------------------------------------------------------------------*/
    inverse = FRCMPYF_DIV(real_z.mantissa, temp);
    inverse <<= 1;

/*----------------------------------------------------------------------------*/
/* For others: use fixed point algorithm for the whole Newton-Raphson.        */
/*----------------------------------------------------------------------------*/
#else
    inverse = initial_approx[(real_y.mantissa - REAL_FIXED_POINT_ONE) >> 
                              REAL_FIXED_POINT_MANTISSA_SIZE - 
                              (INV_LOOKUP_BITS + 1)];
    inverse <<= (REAL_FIXED_POINT_MANTISSA_SIZE - (INV_APPROX_BITS+1));
    if(inverse == 0)
        inverse = REAL_FIXED_POINT_ONE;

    for(i = 0; i<5; i++){
        temp = FRCMPYF_DIV(real_y.mantissa, inverse);
        temp <<= 1;
        temp = ~temp;
        temp = temp + 1;
        inverse = FRCMPYF_DIV(inverse, temp);
        inverse <<= 1;
    }
#endif

/*----------------------------------------------------------------------------*/
/* Calculate quotient                                                         */
/*----------------------------------------------------------------------------*/
  product = FRCMPYF_DIV(real_x.mantissa, inverse);
  product <<= 1;

  qexp = real_x.exp - real_y.exp;

  if(product < REAL_FIXED_POINT_ONE){
    product <<= 1;
    qexp = qexp - 1;
  }

/*----------------------------------------------------------------------------*/
/* Perform rounding.                                                          */
/*----------------------------------------------------------------------------*/

  /*Add 2^-(n+2) to the product.  In the case of IEEE single precsion 
   *this requires adding 2^-25 or 0x00000040
   */
  product += (REAL_FIXED_POINT_ONE >> (REAL_MANTISSA + 1));
  if(product < REAL_FIXED_POINT_ONE){
    product = REAL_FIXED_POINT_ONE;
    qexp += 1;
  }

  /*Truncate the product to the 2^-(n+1)'s place */
  product = product >> (REAL_FIXED_POINT_MANTISSA_SIZE - (REAL_MANTISSA+1)) <<
    (REAL_FIXED_POINT_MANTISSA_SIZE - (REAL_MANTISSA+1));

  if(product & (REAL_FIXED_POINT_ONE >> REAL_MANTISSA)){
    uint32_t tempexp;
    temp = FRCMPYF_DIV(real_y.mantissa, product);
    tempexp = real_y.exp + qexp;

    if(temp < REAL_FIXED_POINT_ONE)
      temp <<= 1;
    else
      tempexp += 1;

    if((int32_t)real_x.exp > (int32_t)tempexp || (real_x.exp == tempexp && real_x.mantissa > temp)){
      product += (REAL_FIXED_POINT_ONE >> REAL_MANTISSA);
      if(product < REAL_FIXED_POINT_ONE){
	product = REAL_FIXED_POINT_ONE;
	qexp += 1;
      }
    }
  }

  quotient.mantissa = product;
  quotient.exp = qexp;
  quotient.sign = real_x.sign ^ real_y.sign;

  REALNUM_TO_REAL(quotient, left);
  return left;
#endif

/* endif_IEEE_Hardware */
