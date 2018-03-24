/****************************************************************************/
/*  etsi_funcs v16.9.6                                                      */
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
#include <etsi.h>

/******************************************************************************/
/* _SHL16 - Saturating left shift of a short int.                             */
/******************************************************************************/
short _shl16(short var1, short var2)
{
   int result;

   if (var1 ==   0)  return 0;
   if (var2 >=  15)  return (var1 < 0) ? MIN_16 : MAX_16;
   if (var2 <= -15)  return (var1 < 0) ? -1     : 0;
   if (var2 <    0)  return _shr16(var1, -var2);

   result = var1 << var2;

   if (result != (short)result)  return (var1 < 0) ? MIN_16 : MAX_16;
   return result;
}

/******************************************************************************/
/* _SHR16 - Saturating right shift of a short int.                            */
/******************************************************************************/
short _shr16(short var1, short var2)
{
   if (var1 ==   0)  return 0;
   if (var2 >=  15)  return (var1 < 0) ? -1 : 0;
   if (var2 <= -15)  return (var1 < 0) ? MIN_16 : MAX_16;
   if (var2 <    0)  return _shl16(var1, -var2);

   return var1 >> var2;
}

/******************************************************************************/
/* _SHL - Saturating left shift.                                              */
/******************************************************************************/
int _shl(int var1, short var2)
{
   int tmp;

   if (var1 ==   0)  return 0;
   if (var2 >=  31)  return (var1 < 0) ? MIN_32 : MAX_32;
   if (var2 <= -31)  return (var1 < 0) ? -1     : 0;
   if (var2 <    0)  return _shr(var1, -var2);

   tmp = var1 >> (31 - var2);
   if (var1 < 0) { if (tmp != -1)  return MIN_32; }
   else            if (tmp !=  0)  return MAX_32;

   return var1 << var2;
}

/******************************************************************************/
/* _SHR - Saturating right shift.                                             */
/******************************************************************************/
int _shr(int var1, short var2)
{
   if (var1 ==   0)  return 0;
   if (var2 >=  31)  return (var1 < 0) ? -1 : 0;
   if (var2 <= -31)  return (var1 < 0) ? MIN_32 : MAX_32;
   if (var2 <    0)  return _shl(var1, -var2);

   return var1 >> var2;
}

/******************************************************************************/
/* _ABS16_S - Saturating absolute value of a short int.                       */
/******************************************************************************/
short _abs16_s(short var1)
{
   if (var1 == MIN_16)  return MAX_16;
   return (var1 < 0) ? -var1 : var1;
}

/******************************************************************************/
/* _ABS_S - Saturating absolute value.                                        */
/******************************************************************************/
int _abs_s(int var1)
{
   if (var1 == MIN_32)  return MAX_32;
   return (var1 < 0) ? -var1 : var1;
}


