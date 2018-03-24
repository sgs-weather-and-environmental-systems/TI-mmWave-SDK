/****************************************************************************/
/*  multibyte v16.9.6                                                       */
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
/*                                                                          */
/*  This file provides a minimal implementation of the multi-byte           */
/*  character functions declared in <stdlib.h>.  In this implementation     */
/*  a "multi" byte character is actually a single character, we assume      */
/*  a 'char' can represent anything in a 'wide char', and there are         */
/*  no shift states.                                                        */
/****************************************************************************/
#include <stdlib.h>

/*--------------------------------------------------------------------------*/
/* MBLEN() - Return length of multi-byte character                          */
/*--------------------------------------------------------------------------*/
_CODE_ACCESS int mblen(const char *s, size_t n)
{
   if (s == NULL) return 0;    /* mb encodings are not state dependent */
       
   return *s ? 1 : 0;          /* all mb chars are 1 byte long */
}

/*--------------------------------------------------------------------------*/
/* MBTOWC() - Convert multi-byte character to wide char                     */
/*--------------------------------------------------------------------------*/
_CODE_ACCESS int mbtowc(wchar_t *pwc, const char *s, size_t n)
{
   wchar_t wc; 

   if (s == NULL) return 0;    /* mb encodings are not state dependent */

   if (n == 0) return -1;      /* can't convert 0 chars */

   wc = *s;                    /* conversion is simple char-to-char */
   if (pwc) *pwc = wc;         /* return result */
   return wc ? 1 : 0;          /* number of converted chars */
}

/*--------------------------------------------------------------------------*/
/* WCTOMB() - Convert wide char to multi-byte character                     */
/*--------------------------------------------------------------------------*/
_CODE_ACCESS int wctomb(char *s, wchar_t wchar)
{
   if (s == NULL) return 0;    /* mb encodings are not state dependent */
   *s = wchar;                 /* conversion is simple char-to-char */
   return 1;                   /* result mb string has 1 char */
}

/*--------------------------------------------------------------------------*/
/* MBSTOWCS() - Convert multi-byte string into wide char string             */
/*--------------------------------------------------------------------------*/
_CODE_ACCESS size_t mbstowcs(wchar_t *pwcs, const char *s, size_t n)
{
   size_t nconv = 0;

   while (n-- > 0 && (*pwcs++ = *s++) != 0) ++nconv;

   return nconv;
}

/*--------------------------------------------------------------------------*/
/* WCSTOMBS() - Convert wide char string to multi-byte string               */
/*--------------------------------------------------------------------------*/
_CODE_ACCESS size_t wcstombs(char *s, const wchar_t *pwcs, size_t n)
{
   size_t nconv = 0;

   while (n-- > 0 && (*s++ = *pwcs++) != 0) ++nconv;

   return nconv;
}
