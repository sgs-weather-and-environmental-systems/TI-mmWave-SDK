/*****************************************************************************/
/*  _BUFREAD.C v8.1.3                                                        */
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
/*    __TI_buff_read  -  Fill a stream's buffer from its file                */
/*****************************************************************************/
#include <stdio.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "file.h"

extern _DATA_ACCESS int  __TI_ft_end;
extern _CODE_ACCESS int  __TI_doflush(FILE *_fp);

_CODE_ACCESS void __TI_buff_read(FILE *_fp);


/*****************************************************************************/
/* __TI_buff_read  -   Fill a stream's buffer from its file                  */
/*                                                                           */
/*    This function fills stream _FP's buffer with the contents of the file  */
/*    it is associated with.  It returns nothing, but sets flags in the      */
/*    stream if any I/O errors occur.                                        */
/*                                                                           */
/*    For multi-threaded applications, this function should always be called */
/*    within a critical section that guarantees single-threaded access to    */
/*    the file stream.                                                       */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS void __TI_buff_read(FILE *_fp)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   int   errchk,
         j,
         buffer_size    = _fp->bufend - _fp->buf;

   /*------------------------------------------------------------------------*/
   /* If this is a line buffered stream, flush all line buffered streams.    */
   /* The current thread in a multi-threaded application must protect access */
   /* to __TI_LOCK_FILE_TBL shared resources (_ftable[] and __TI_ft_end) and */
   /* each file stream that is flushed. Ensure that the local copy of        */
   /* _ftable[] is flushed to shared memory and the local copy of            */
   /* __TI_ft_end is invalidated before leaving the critical section.        */
   /*------------------------------------------------------------------------*/
   if (_BUFFMODE(_fp) == _IOLBF)
   {
      __TI_resource_lock(__TI_LOCK_FILE_TBL);
      for (j=0; j < __TI_ft_end; j++)
	 if (_BUFFMODE(&_ftable[j]) == _IOLBF)
         {
            __TI_file_lock(&_ftable[j]);
	    __TI_doflush(&_ftable[j]);
            __TI_data_synch_WBINV(&_ftable[j], sizeof(FILE));
            __TI_file_unlock(&_ftable[j]);
         }
      __TI_data_synch_WBINV(&_ftable, sizeof(_ftable));
      __TI_data_synch_INV(&__TI_ft_end, sizeof(__TI_ft_end));
      __TI_resource_unlock(__TI_LOCK_FILE_TBL);
   }

   /*------------------------------------------------------------------------*/
   /* Read in the next characters from the file.                             */
   /*------------------------------------------------------------------------*/
   errchk = read(_fp->fd, (char *)_fp->buf, buffer_size);

   /*------------------------------------------------------------------------*/
   /* Adjust the buffer pointers.                                            */
   /*------------------------------------------------------------------------*/
   _fp->buff_stop = _fp->buf + errchk;
   _fp->pos = _fp->buf;

   /*------------------------------------------------------------------------*/
   /* Set any error flags if necessary.                                      */
   /*------------------------------------------------------------------------*/
   switch (errchk)
   {
      case -1 : _SET(_fp, _STATERR);
                break;
 
      case 0  : _SET(_fp, _STATEOF);
                break;
   }

   return;
 
}
 
