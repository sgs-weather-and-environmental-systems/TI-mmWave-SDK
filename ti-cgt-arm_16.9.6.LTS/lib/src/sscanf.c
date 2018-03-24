/*****************************************************************************/
/*  SSCANF.C v16.9.6                                                         */
/*                                                                           */
/* Copyright (c) 1995-2017 Texas Instruments Incorporated                    */
/* http://www.ti.com/                                                        */
/*                                                                           */
/*  Redistribution and  use in source  and binary forms, with  or without    */
/*  modification,  are permitted provided  that the  following conditions    */
/*  are met:                                                                 */
/*                                                                           */
/*     Redistributions  of source  code must  retain the  above copyright    */
/*     notice, this list of conditions and the following disclaimer.         */
/*                                                                           */
/*     Redistributions in binary form  must reproduce the above copyright    */
/*     notice, this  list of conditions  and the following  disclaimer in    */
/*     the  documentation  and/or   other  materials  provided  with  the    */
/*     distribution.                                                         */
/*                                                                           */
/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
/*     of its  contributors may  be used to  endorse or  promote products    */
/*     derived  from   this  software  without   specific  prior  written    */
/*     permission.                                                           */
/*                                                                           */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
/*                                                                           */
/*****************************************************************************/

/*****************************************************************************/
/* Functions:                                                                */
/*    SSCANF      -  Read formatted input from a string                      */
/*    _INPCHAR    -  Get a character from the string                         */
/*    _UNINPCHAR  -  Put a character back onto the string                    */
/*    _CHKMBC     -  Check that the characters match the input               */
/*****************************************************************************/
#include <stdio.h>
#include "format.h"
#include <ctype.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

static int _inpchar(void **inp);
static void _uninpchar(void **inp, int outchar);
static int _chkmbc(void **inp, char **_format, int *num_read);

/*****************************************************************************/
/* SSCANF   -  Read formatted input from a string                            */
/*                                                                           */
/*    This function returns the number of arguments that were assigned a     */
/*    value.                                                                 */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int sscanf(const char *_str, const char *_fmt, ...)
{
   va_list _ap;
   va_start(_ap, _fmt);

   return (__TI_scanfi((void *)_str, _fmt, _ap, _chkmbc, _inpchar, _uninpchar));
}

/*****************************************************************************/
/* VSSCANF   -  Read formatted input from a string                           */
/*                                                                           */
/*    This function returns the number of arguments that were assigned a     */
/*    value.                                                                 */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int vsscanf(const char *_str, const char *_fmt, va_list _ap)
{
   return (__TI_scanfi((void *)_str, _fmt, _ap, _chkmbc, _inpchar, _uninpchar));
}

/*****************************************************************************/
/* _INPCHAR -  Get a character from the string                               */
/*****************************************************************************/
static int _inpchar(void **inp)
{
   char result;
   char *buf = (char *)(*inp);

   result = *(buf++);
   *inp = (void *)buf;  

   return ((result == '\0') ? EOF : result);
}

/*****************************************************************************/
/* _UNINPCHAR  -  Put a character back into the string                       */
/*                                                                           */
/* Note:  Since sscanf() never modifies the input buffer, we can assume      */
/*        that any calls to "_uninpchar" are merely putting back the same    */
/*        character that it had previously read in.  In this case, ignore    */
/*        the contents of outchar and simply back the buffer pointer up.     */
/*                                                                           */
/*        The parameter "outchar" cannot be removed, however, because        */
/*        the fscanf version of this function uses it.  Both versions        */
/*        of this function must have the same prototype since they are both  */
/*        passed as a function pointer to __TI_scanfi.                       */
/*****************************************************************************/
static void _uninpchar(void **inp, int outchar)
{
   char *buf = (char *)(*inp);
   buf--;
   *inp = (void *)buf;  
   return;
}

/*****************************************************************************/
/* _CHKMBC  -  Check that the characters match the input                     */
/*                                                                           */
/*    Check that all characters in the format string that are not part of a  */
/*    conversion specification match the input, until the next '%' or the    */
/*    end of the format string is reached.                                   */
/*                                                                           */
/*    Returns:                                                               */
/*                                                                           */
/*        EOF if the end of the input string was reached before the end of   */
/*            the format string (this is an input failure)                   */
/*                                                                           */
/*        0   if the end of the format string was reached or the input       */
/*            doesn't match (the latter is matching failure)                 */
/*                                                                           */
/*        1   if a '%' is encountered                                        */
/*                                                                           */
/*****************************************************************************/
static int _chkmbc(void **inp, char **_format, int *num_read)
{
   char *buf = (char *)*inp;
   char c;

   /*------------------------------------------------------------------------*/
   /* If there is a white space character in the format statement, skip to   */
   /* the next non-white space character in the input.                       */
   /*------------------------------------------------------------------------*/
   while (isspace(**_format))
   {
      for (;isspace(*buf); buf++) (*num_read)++;
      (*_format)++;
   }

   for (;(**_format != '%') && (**_format != '\0');)
      if (*((*_format)++) != (c = *(buf++)))
         return ((c == '\0') ? EOF : 0);
      else (*num_read)++;

   if (**_format == '%')
   {
      *inp = (void *)buf;
       return 1;
   }
   else return (0);
}
