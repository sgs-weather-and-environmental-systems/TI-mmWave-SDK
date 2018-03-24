/*****************************************************************************/
/*  FGETC.C v8.1.3                                                           */
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
/*    GETC     -  Get a character from a stream                              */
/*    GETCHAR  -  Get a character from stdin                                 */
/*    FGETC    -  Get a character from a stream                              */
/*****************************************************************************/
#include <stdio.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "file.h"

extern _CODE_ACCESS void __TI_buff_read(FILE *_fp);
extern _CODE_ACCESS int  __TI_rd_ok    (FILE *_fp);

_CODE_ACCESS int fgetc(register FILE *_fp);



/*****************************************************************************/
/* GETC  -  Get a character from a stream                                    */
/*                                                                           */
/*    This function is equivalent to FGETC.                                  */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int getc(FILE *_fp) { return (fgetc(_fp)); }



/*****************************************************************************/
/* GETCHAR  -  Get a character from stdin                                    */
/*                                                                           */
/*    This function calls a macro defined in STDIO.H, which calls FGETC with */
/*    stdin as its argument.                                                 */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int getchar(void) { return(_getchar()); }



/*****************************************************************************/
/* FGETC -  Get a character from a stream                                    */
/*****************************************************************************/
_CODE_ACCESS int fgetc(register FILE *_fp)
{
   int retval = EOF;

   /*------------------------------------------------------------------------*/
   /* The current thread in a multi-threaded application must protect access */
   /* to the file stream. In this case, _fp may be updated, so we must       */
   /* ensure that the local copy of _fp is flushed to shared memory before   */
   /* leaving the critical section (invalidated if it is not modified).      */
   /*------------------------------------------------------------------------*/
   __TI_file_lock(_fp);

   /*------------------------------------------------------------------------*/
   /* Make sure that it is OK to read from this stream.                      */
   /*------------------------------------------------------------------------*/
   if (!__TI_rd_ok(_fp)) goto fgetc_exit;
   
   /*------------------------------------------------------------------------*/
   /* For non-buffered streams, call the lowlevel READ function.             */
   /*------------------------------------------------------------------------*/
   if (_BUFFMODE(_fp) == _IONBF)
   {
      int   errchk;
      char  result;

      if (_STCHK(_fp, _UNGETC)) 
      {
         _UNSET(_fp, _UNGETC);
	 retval = (int)*(_fp->pos++);
	 goto fgetc_exit;
      }

      errchk = read(_fp->fd, &result, 1);

      if (errchk <= 0)
      {
         _SET(_fp, (errchk == 0) ? _STATEOF : _STATERR);
	 goto fgetc_exit;
      }

      retval = (int)result;
      goto fgetc_exit;
   }

   /*------------------------------------------------------------------------*/
   /* If the buffer has been entirely read, or is empty, call __TI_buff_read */
   /* to fill the buffer.                                                    */
   /*------------------------------------------------------------------------*/
   if (_fp->pos == _fp->buff_stop) __TI_buff_read(_fp);
 
   /*------------------------------------------------------------------------*/
   /* If the buffer read was unsuccessful, return an EOF.  Otherwise, clear  */
   /* the _UNGETC flag in the stream, and return the next character.         */
   /*------------------------------------------------------------------------*/
   if (_STCHK(_fp, (_STATERR | _STATEOF))) goto fgetc_exit;

   _UNSET(_fp, _UNGETC);
   retval = *(_fp->pos++);

fgetc_exit:
   __TI_data_synch_WBINV(_fp, sizeof(FILE));
   __TI_file_unlock(_fp);

   return (retval);
   
}

