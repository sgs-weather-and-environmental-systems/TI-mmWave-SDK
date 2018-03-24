/****************************************************************************/
/*  _TVALTOSTR v16.9.6                                                      */
/*                                                                          */
/* Copyright (c) 2005-2017 Texas Instruments Incorporated                   */
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
#include <_tls.h>

/*-------------------------------------------------------------------------*/
/* __TI_tvaltostr() uses a static output buffer that can be modified by    */
/* each caller. To protect against mutliple threads modifying the same     */
/* buffer at the same time, each thread is given its own copy of the       */
/* tstr_out buffer.                                                        */
/*-------------------------------------------------------------------------*/
__TI_TLS_ARR_DEF(static, char, tstr_out, 10);

/*-------------------------------------------------------------------------*/
/* __TI_tvaltostr() - Convert unsigned (time) value into string. Width     */
/* param designates minimum width of output string. Pad designates whether */
/* fill character should be space or '0'. Suffix specifies an optional     */
/* suffix character that acts as a delimiter to any appended string.  The  */
/* value is assumed to be a small unsigned integer value bounded by ranges */
/* legal for the member data of 'struct tm'.                               */
/*                                                                         */
/* NOTE 'width' PARAMETER IS ASSUMED TO BE AT LEAST 1 !!                   */
/*-------------------------------------------------------------------------*/
const char *__TI_tvaltostr(unsigned int value, int width, int pad, char suffix)
{
   unsigned int quot, rem;
   char *bufptr = __TI_TLS_ARR(tstr_out) + 9;
   int i;

   /*---------------------------------------------------------------------*/
   /* Output to buffer in reverse. Begin with string end character.       */
   /*---------------------------------------------------------------------*/
   *bufptr = '\0';

   /*---------------------------------------------------------------------*/
   /* If a suffix character is specified, output it.                      */
   /*---------------------------------------------------------------------*/
   if (suffix != '\0') *(--bufptr) = suffix; 

   /*---------------------------------------------------------------------*/
   /* Output value right to left adding any pad characters if necessary.  */
   /*---------------------------------------------------------------------*/
   for(i = width; i > 0 || value != 0 ; i--)
   {
       quot = value/10;
       rem = value - (quot * 10);
       *(--bufptr) = (!pad && !value && i != width) ? ' ' : rem + '0';
       value = quot;
   }

   /*---------------------------------------------------------------------*/
   /* Return pointer to beginning of the converted string. Note use of    */
   /* local static buffer.                                                */
   /*---------------------------------------------------------------------*/
   return bufptr;
}
