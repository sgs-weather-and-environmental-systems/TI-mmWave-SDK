/*****************************************************************************/
/*  FPUTC.C v8.1.3                                                           */
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
/*    PUTC     -  Write a character to a stream                              */
/*    PUTCHAR  -  Write a character to stdout                                */
/*    FPUTC    -  Write a character to a stream                              */
/*****************************************************************************/
#include <stdio.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "file.h"

extern _CODE_ACCESS int __TI_wrt_ok(FILE *_fp);
extern _CODE_ACCESS int __TI_doflush(FILE *_fp);



/*****************************************************************************/
/* PUTC  -  Write a character to a stream                                    */
/*                                                                           */
/*    This function is equivalent to FPUTC.                                  */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int putc(int _x, FILE *_fp) { return(fputc(_x, _fp)); }



/*****************************************************************************/
/* PUTCHAR  -  Write a character to stdout                                   */
/*                                                                           */
/*    This function calls a macro defined in STDIO.H, which in turn calls    */
/*    FPUTC, with stdout as its stream argument.                             */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int putchar(int _x) { return(_putchar(_x)); }



/*****************************************************************************/
/* FPUTC -  Write a character to a stream                                    */
/*                                                                           */
/*    This function writes character _C into the stream specified by _FP.    */
/*    Upon success, it returns the character written.  Upon failure, it      */
/*    returns an EOF.                                                        */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int fputc(int _c, register FILE *_fp)
{
   /*------------------------------------------------------------------------*/
   /* The current thread in a multi-threaded application must protect access */
   /* to the file stream. In this case, _fp may be updated, so we must       */
   /* ensure that the local copy of _fp is flushed to shared memory before   */
   /* leaving the critical section (invalidated if it is not modified).      */
   /*------------------------------------------------------------------------*/
   __TI_file_lock(_fp);

   /*------------------------------------------------------------------------*/
   /* Make sure that the stream is writeable.                                */
   /*------------------------------------------------------------------------*/
   if (!__TI_wrt_ok(_fp)) 
   { 
      __TI_data_synch_INV(_fp, sizeof(FILE));
      __TI_file_unlock(_fp);
      return EOF; 
   }

   /*------------------------------------------------------------------------*/
   /* If the stream is non-buffered, call the lowlevel WRITE function.       */
   /*------------------------------------------------------------------------*/
   if(_BUFFMODE(_fp) == _IONBF)
   {
      char cbuf = (char)_c;

      if ((write(_fp->fd, &cbuf, 1)) == -1)
      {
         _SET(_fp, _STATERR);
         __TI_data_synch_WBINV(_fp, sizeof(FILE));
         __TI_file_unlock(_fp);
         return (EOF);
      }

      else 
      { 
         __TI_data_synch_WBINV(_fp, sizeof(FILE));
         __TI_file_unlock(_fp);
	 return ((unsigned char)_c);
      }
   }

   /*------------------------------------------------------------------------*/
   /* Check for room in the buffer. If room, add the character. Must         */
   /* check before writing because C++ library fills the buffer to           */
   /* capacity, then calls fputc() from overflow() (CQXXXXX).                */
   /*------------------------------------------------------------------------*/
   if ((_fp->pos >= _fp->bufend) && __TI_doflush(_fp))
   {
      _SET(_fp, _STATERR);
      __TI_data_synch_WBINV(_fp, sizeof(FILE));
      __TI_file_unlock(_fp);
      return (EOF);
   }

   *(_fp->pos++) = (unsigned char)_c;

   /*------------------------------------------------------------------------*/
   /* If a line-buffered stream reached a newline character, flush it.       */
   /*------------------------------------------------------------------------*/
   if ((_STCHK(_fp, _IOLBF) && _c == '\n') && __TI_doflush(_fp))
   {
      _SET(_fp, _STATERR);
      __TI_data_synch_WBINV(_fp, sizeof(FILE));
      __TI_file_unlock(_fp);
      return (EOF);
   }

   __TI_data_synch_WBINV(_fp, sizeof(FILE));
   __TI_file_unlock(_fp);
   return ((unsigned char)_c);
}

