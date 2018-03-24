/****************************************************************************/
/*  acoshf_i.h         v8.1.3                                               */
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

/* _CODE_ACCESS REAL acoshf(REAL x) */

   /* Taken from "Handbook of Mathematical Functions with Formulas, Graphs,  */
   /* and Mathematical Tables",                                              */
   /* Milton Abramowitz and Irene A. Stegun,                                 */
   /* National Bureau of Standards (Applied Mathematics Series 55),          */
   /* Washington D.C., 1964 (reprinted 1970). 4.6.21, page 87.               */

   if LSSF(x, ONE) { errno = EDOM; return ZERO; }

   /* Apply the identity: acosh(x) = log(x + sqrt(x*x - 1.0)).               */
   /* We need not compute sqrt(x*x - 1.0) if x*x is so big that the          */
   /* 1.0 term is lost.                                                      */
   /* The biggest positive number that can be held in REAL                   */
   /* that still has a 1's digit is RADIX**REAL_MANTISSA-1,                  */
   /* so the cut-off is about sqrt(2**REAL_MANTISSA) or                      */
   /* RADIX**(REAL_MANTISSA/2)                                               */
   if LSSF(x, RADIX_to_Hlf_MANTISSA)
      return LOGF(ADDF(x,SQRTF(SUBF(SQRF(x),ONE))));

   return ADDF(LOGF(x), Ln_2);
