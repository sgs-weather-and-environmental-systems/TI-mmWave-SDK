/****************************************************************************/
/*  ieeef.h          v8.1.3                                                 */
/*                                                                          */
/* Copyright (c) 1997-2017 Texas Instruments Incorporated                   */
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

#ifndef __ieeef__
#define __ieeef__

#include <limits.h>
#include "linkage.h"

_CODE_ACCESS float _absf(float x);
_CODE_ACCESS float _negf(float x);

_CODE_ACCESS float _addf(float left, float right);
_CODE_ACCESS float _subf(float left, float right);
_CODE_ACCESS float _mpyf(float left, float right);
_CODE_ACCESS float _divf(float left, float right);

_CODE_ACCESS int _cmpf(float left,
                 float right); /* <0 if LT, 0 if EQ, >0 if GT     */
                               /* no correct result if NaN source */

_CODE_ACCESS int _eqf(float left, float right);
_CODE_ACCESS int _neqf(float left, float right);
_CODE_ACCESS int _lef(float left, float right);
_CODE_ACCESS int _gef(float left, float right);
_CODE_ACCESS int _ltf(float left, float right);
_CODE_ACCESS int _gtf(float left, float right);


/* char <-> float */
_CODE_ACCESS float         _fltcf(  signed char x);
_CODE_ACCESS float         _fltbf(unsigned char x);
_CODE_ACCESS   signed char _fixfc(float x);
_CODE_ACCESS unsigned char _fixfb(float x);

/* short <-> float */
_CODE_ACCESS float          _fltsif(         short x);
_CODE_ACCESS float          _fltusf(unsigned short x);
_CODE_ACCESS short          _fixfsi(float x);
_CODE_ACCESS unsigned short _fixfus(float x);

/* int <-> float */
_CODE_ACCESS float    _fltif(int      x);
_CODE_ACCESS float    _fltuf(unsigned x);
_CODE_ACCESS int      _fixfi(float x);
_CODE_ACCESS unsigned _fixfu(float x);

/* long <-> float */
_CODE_ACCESS float         _fltlif(         long x);
_CODE_ACCESS float         _fltulf(unsigned long x);
_CODE_ACCESS long          _fixfli(float x);
_CODE_ACCESS unsigned long _fixful(float x);

#endif /* __ieeef__*/
