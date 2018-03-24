/****************************************************************************/
/*  frcmpyf_div_i.h         v8.1.3                                          */
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

#define HALF_MANTISSA_T_SIZE (REAL_FIXED_POINT_MANTISSA_SIZE / 2)

#define LO(x) ((x << HALF_MANTISSA_T_SIZE) >> HALF_MANTISSA_T_SIZE)
#define HI(x) (x >> HALF_MANTISSA_T_SIZE)

  mantissa_t xlo, xhi, ylo, yhi;
  mantissa_t lolo, hilo, lohi, hihi;
  mantissa_t temp, carry, product;

  xhi = HI(x);
  xlo = LO(x);
  yhi = HI(y);
  ylo = LO(y);

  lolo = xlo * ylo;
  hilo = xhi * ylo;
  lohi = xlo * yhi;
  hihi = xhi * yhi;

  /*--------------------------------------------------------------------------*/
  /*                xxxx|xxxx   : lolo                                        */
  /*           xxxx|xxxx        : lohi                                        */
  /*           xxxx|xxxx        : hilo                                        */
  /*      xxxx|xxxx             : hihi                                        */
  /*                                                                          */
  /*      xxxx|xxxx             : product                                     */
  /*--------------------------------------------------------------------------*/

  /*--------------------------------------------------------------------------*/
  /* It will never overflow.                                                  */
  /*                                                                          */
  /*    n: mantissa size(in bits)                                             */
  /*    HI(lolo) <= (2^n - 1)                                                 */
  /*    lohi <= (2^n - 1) * (2^n - 1)                                         */
  /*                                                                          */
  /*    HI(lolo) + lohi <= (2^n - 1) * 2^n = 2^2n - 2^n < 2^2n - 1            */
  /*--------------------------------------------------------------------------*/
  temp      = HI(lolo) + lohi;

  carry     = HI(LO(temp) + LO(hilo));

  product   = HI(temp) + HI(hilo) + hihi + carry;

  return product;
