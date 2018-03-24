/*****************************************************************************/
/*  FSCANF.C v16.9.6                                                         */
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
/*    FSCANF      -  Read formatted input from a stream                      */
/*    SCANF       -  Read formatted input from stdin                         */
/*    _INPCHAR    -  Get a character from the stream                         */
/*    _UNINPCHAR  -  Put a character back onto the stream                    */
/*    _CHKMBC     -  Check that the characters match the input               */
/*****************************************************************************/
#include <stdio.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "format.h"
#include <ctype.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

static int _inpchar(void **inp);
static void _uninpchar(void **inp, int outchar);
static int _chkmbc(void **inp, char **_format, int *num_read);

/*****************************************************************************/
/* FSCANF   -  Read formatted input from a stream                            */
/*                                                                           */
/*    This function returns the number of arguments that were assigned a     */
/*    value.                                                                 */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int fscanf(FILE *_fp, const char *_fmt, ...)
{
   int result;
   va_list _ap;
   va_start(_ap, _fmt);
 
   /*------------------------------------------------------------------------*/
   /* The current thread in a multi-threaded application must protect access */
   /* to the file stream. In this case, _fp may be updated, so we must       */
   /* ensure that the local copy of _fp is flushed to shared memory before   */
   /* leaving the critical section (invalidated if it is not modified).      */
   /*------------------------------------------------------------------------*/
   __TI_file_lock(_fp);

   /*------------------------------------------------------------------------*/
   /* If the current stream is not associated with a file, return an error.  */
   /*------------------------------------------------------------------------*/
   if (_fp->fd == -1) 
   { 
      __TI_data_synch_INV(_fp, sizeof(FILE));
      __TI_file_unlock(_fp);
      return (EOF);
   }

   result = (__TI_scanfi((void *)_fp, _fmt, _ap, _chkmbc, _inpchar, _uninpchar));

   __TI_data_synch_WBINV(_fp, sizeof(FILE));
   __TI_file_unlock(_fp);

   va_end(_ap);
   return (result);
}

/*****************************************************************************/
/* VFSCANF   -  Read formatted input from a stream                           */
/*                                                                           */
/*    This function returns the number of arguments that were assigned a     */
/*    value.                                                                 */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int vfscanf(FILE *_fp, const char *_fmt, va_list _ap)
{
   int result;

   /*------------------------------------------------------------------------*/
   /* The current thread in a multi-threaded application must protect access */
   /* to the file stream. In this case, _fp may be updated, so we must       */
   /* ensure that the local copy of _fp is flushed to shared memory before   */
   /* leaving the critical section (invalidated if it is not modified).      */
   /*------------------------------------------------------------------------*/
   __TI_file_lock(_fp);

   /*------------------------------------------------------------------------*/
   /* If the current stream is not associated with a file, return an error.  */
   /*------------------------------------------------------------------------*/
   if (_fp->fd == -1) 
   { 
      __TI_data_synch_INV(_fp, sizeof(FILE));
      __TI_file_unlock(_fp);
      return (EOF);
   }

   result = (__TI_scanfi((void *)_fp, _fmt, _ap, _chkmbc, _inpchar, _uninpchar));

   __TI_data_synch_WBINV(_fp, sizeof(FILE));
   __TI_file_unlock(_fp);

   return (result);
}

/*****************************************************************************/
/* SCANF -  Read formatted input from stdin                                  */
/*                                                                           */
/*    This function returns the number of arguments that were assigned a     */
/*    value.                                                                 */
/*                                                                           */
/*****************************************************************************/ 
int scanf(const char *_fmt, ...)
{
   int result;
   va_list _ap;
   va_start(_ap, _fmt);
 
   /*------------------------------------------------------------------------*/
   /* The current thread in a multi-threaded application must protect access */
   /* to stdin. In this case, stdin may be updated, so we must ensure that   */
   /* the local copy of stdin is flushed to shared memory before leaving the */
   /* critical section (invalidated if it is not modified).                  */
   /*------------------------------------------------------------------------*/
   __TI_file_lock(stdin);

   /*------------------------------------------------------------------------*/
   /* If the current stream is not associated with a file, return an error.  */
   /*------------------------------------------------------------------------*/
   if (stdin->fd == -1) 
   { 
      __TI_data_synch_INV(stdin, sizeof(FILE));
      __TI_file_unlock(stdin);
      return (EOF);
   }

   result = (__TI_scanfi((void *)stdin, _fmt, _ap, _chkmbc, _inpchar, _uninpchar));

   __TI_data_synch_WBINV(stdin, sizeof(FILE));
   __TI_file_unlock(stdin);

   va_end(_ap);
   return (result);
}

/*****************************************************************************/
/* VSCANF -  Read formatted input from stdin                                 */
/*                                                                           */
/*    This function returns the number of arguments that were assigned a     */
/*    value.                                                                 */
/*                                                                           */
/*****************************************************************************/
int vscanf(const char *_fmt, va_list _ap)
{
   int result;

   /*------------------------------------------------------------------------*/
   /* The current thread in a multi-threaded application must protect access */
   /* to stdin. In this case, stdin may be updated, so we must ensure that   */
   /* the local copy of stdin is flushed to shared memory before leaving the */
   /* critical section (invalidated if it is not modified).                  */
   /*------------------------------------------------------------------------*/
   __TI_file_lock(stdin);

   /*------------------------------------------------------------------------*/
   /* If the current stream is not associated with a file, return an error.  */
   /*------------------------------------------------------------------------*/
   if (stdin->fd == -1) 
   { 
      __TI_data_synch_INV(stdin, sizeof(FILE));
      __TI_file_unlock(stdin);
      return (EOF);
   }

   result = (__TI_scanfi((void *)stdin, _fmt, _ap, _chkmbc, _inpchar, _uninpchar));
   
   __TI_data_synch_WBINV(stdin, sizeof(FILE));
   __TI_file_unlock(stdin);

   return (result);
}

/*****************************************************************************/
/* _INPCHAR -  Get a character from the stream                               */
/*****************************************************************************/
static int _inpchar(void **inp) { return (fgetc((FILE *)(*inp))); }

/*****************************************************************************/
/* _UNINPCHAR  -  Put a character back onto the stream                       */
/*****************************************************************************/
static void _uninpchar(void **inp, int outchar)
{ 
   ungetc(outchar, (FILE *)*inp);
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
/*        EOF if end-of-file was reached before the end of the format string */
/*            (this is an input failure)                                     */
/*                                                                           */
/*        0   if the end of the format string was reached or the input       */
/*            doesn't match (the latter is matching failure)                 */
/*                                                                           */
/*        1   if a '%' is encountered                                        */
/*                                                                           */
/*****************************************************************************/
static int _chkmbc(void **inp, char **_format, int *num_read)
{
   FILE *_fp = (FILE *)*inp;
   int c;

   /*------------------------------------------------------------------------*/
   /* If there is a white space character in the format statement, skip to   */
   /* the next non-white space character in the input.                       */
   /*------------------------------------------------------------------------*/
   while (isspace(**_format))
   {
      for(c = fgetc(_fp);isspace(c);c = fgetc(_fp)) (*num_read)++;
      ungetc(c, _fp);
      (*_format)++;
   }

   for (;(**_format != '%') && (**_format != '\0');)
      if (*((*_format)++) != (c = fgetc(_fp))) 
      {
         ungetc(c, _fp);
         return ((c == EOF) ? EOF : 0);
      }
      else (*num_read)++;

   if (**_format == '%') return 1;
   else return (0);
}

