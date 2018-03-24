/*****************************************************************************/
/*  FSEEK.C v8.1.3                                                           */
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
/*    FSEEK -  Reposition the file pointer of a stream                       */
/*****************************************************************************/
#include <stdio.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "file.h"

extern int __TI_doflush(FILE *_fp);



/*****************************************************************************/ 
/* FSEEK -  Reposition the file pointer of a stream                          */
/*                                                                           */ 
/*    This funtion flushes stream _FP, clears the EOF and I/O Error flags,   */
/*    repositions the file pointer of the stream.  It returns a 0 upon       */
/*    success, and an EOF upon failure.                                      */
/*                                                                           */ 
/*****************************************************************************/ 
_CODE_ACCESS int fseek(register FILE *_fp, long _offset, int _ptrname)
{
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

   /*------------------------------------------------------------------------*/
   /* When positioning to a location relative to the current location,       */
   /* adjust for the fact that there may be something in the buffer.         */
   /*------------------------------------------------------------------------*/
   if(_ptrname == SEEK_CUR && _STCHK(_fp, _MODER) && _fp->pos)
      _offset -= (_fp->buff_stop - _fp->pos);

   __TI_doflush(_fp);

   _UNSET(_fp, (_STATEOF | _UNGETC));
   
   if ((lseek(_fp->fd, _offset, _ptrname)) == -1) 
   { 
      __TI_data_synch_WBINV(_fp, sizeof(FILE));
      __TI_file_unlock(_fp);
      return (EOF);
   }
   
   __TI_data_synch_WBINV(_fp, sizeof(FILE));
   __TI_file_unlock(_fp);
   return (0);
}
   
