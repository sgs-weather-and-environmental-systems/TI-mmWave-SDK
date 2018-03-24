/****************************************************************************/
/*  gsmfuncs v8.1.3                                                         */
/*                                                                          */
/* Copyright (c) 1993-2017 Texas Instruments Incorporated                   */
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
#undef _INLINE
#include <gsm.h>

/******************************************************************************/
/* Integer (32-bit) add with carry and overflow testing.                      */
/******************************************************************************/
_CODE_ACCESS int L_add_c (int L_var1, int L_var2)
{   
    unsigned int uv1    = L_var1;       
    unsigned int uv2    = L_var2;
    int          cin    = Carry;
    unsigned int result = uv1 + uv2 + cin;
    
    Carry     = ((~result & (uv1 | uv2)) | (uv1 & uv2)) >> 31;
    Overflow  = ((~(uv1 ^ uv2)) & (uv1 ^ result)) >> 31;

    if (cin && result == 0x80000000) Overflow = 1;

    return (int) result;
}       
 
/******************************************************************************/
/* Saturate any result after L_addc or L_sub_c if overflow is set.            */
/******************************************************************************/
_CODE_ACCESS int L_sat (int L_var1)
{
    int cin = Carry;

    return !Overflow ? L_var1 : (Carry = Overflow = 0, 0x7fffffff+cin);
}

/******************************************************************************/
/* Short (16-bit) divide.                                                     */
/******************************************************************************/
_CODE_ACCESS short div_s (short var1, short var2)
{   
    int          iteration;         
    unsigned int var1int;
    int          var2int;

    if (var1 == 0)    return 0;
    if (var1 == var2) return 0x7fff;
    var1int = var1 << 16;                
    var2int = var2 << 16;
    
    for (iteration = 0; iteration < 16; iteration++)
        var1int = _subc(var1int,var2int);

    return var1int & 0xffff;
}

