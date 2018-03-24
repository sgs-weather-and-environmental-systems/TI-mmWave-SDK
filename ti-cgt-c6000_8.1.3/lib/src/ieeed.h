/****************************************************************************/
/*  ieeed.h          v8.1.3                                                 */
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

#ifndef __ieeed__
#define __ieeed__

#include <limits.h>
#include "linkage.h"

_CODE_ACCESS double _absd(double x);
_CODE_ACCESS double _negd(double x);

_CODE_ACCESS double _addd(double left, double right);
_CODE_ACCESS double _subd(double left, double right);
_CODE_ACCESS double _mpyd(double left, double right);
_CODE_ACCESS double _divd(double left, double right);

_CODE_ACCESS int _cmpd(double left,
                 double right); /* <0 if LT, 0 if EQ, >0 if GT     */
                                /* no correct result if NaN source */

_CODE_ACCESS int _eqd(double left, double right);
_CODE_ACCESS int _neqd(double left, double right);
_CODE_ACCESS int _led(double left, double right);
_CODE_ACCESS int _ged(double left, double right);
_CODE_ACCESS int _ltd(double left, double right);
_CODE_ACCESS int _gtd(double left, double right);


/* char <-> double */
_CODE_ACCESS double        _fltcd(  signed char x);
_CODE_ACCESS double        _fltbd(unsigned char x);
_CODE_ACCESS   signed char _fixdc(double x);
_CODE_ACCESS unsigned char _fixdb(double x);

/* short <-> double */
_CODE_ACCESS double         _fltsid(         short x);
_CODE_ACCESS double         _fltusd(unsigned short x);
_CODE_ACCESS short          _fixdsi(double x);
_CODE_ACCESS unsigned short _fixdus(double x);

/* int <-> double */
_CODE_ACCESS double   _fltid(int      x);
_CODE_ACCESS double   _fltud(unsigned x);
_CODE_ACCESS int      _fixdi(double x);
_CODE_ACCESS unsigned _fixdu(double x);

/* long <-> double */
_CODE_ACCESS double        _fltlid(         long x);
_CODE_ACCESS double        _fltuld(unsigned long x);
_CODE_ACCESS long          _fixdli(double x);
_CODE_ACCESS unsigned long _fixdul(double x);


/* float <-> double */
_CODE_ACCESS float  _cvtdf(double x); /* slim from double to float  */
_CODE_ACCESS double _cvtfd(float  x); /* grow from float  to double */

#endif /* __ieeed__*/
