/*****************************************************************************/
/*  _IO_PERM.C v8.1.3                                                        */
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
/*    __TI_rd_ok   -  Check to make sure that the stream is readable         */
/*    __TI_wrt_ok  -  Check to make sure that the stream is writeable        */
/*****************************************************************************/
#include <stdio.h>

_CODE_ACCESS int __TI_rd_ok(FILE *_fp);
_CODE_ACCESS int __TI_wrt_ok(FILE *_fp);


/*****************************************************************************/
/* __TI_rd_ok   -  Check to make sure that the stream is readable.           */
/*                                                                           */
/*    This function checks to make sure that the stream _FP has been opened  */
/*    for reading, and allocates a buffer for the stream if one hasn't been  */
/*    already.  The function returns a 1 if it is alright to write to this   */
/*    stream, otherwise it returns a 0.                                      */
/*                                                                           */
/*    For multi-threaded applications, this function should always be called */
/*    within a critical section that guarantees single-threaded access to    */
/*    the file stream.                                                       */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int __TI_rd_ok(FILE *_fp)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   int   result   =  0;

   /*------------------------------------------------------------------------*/
   /* If the current stream is not associated with a file, return an error.  */
   /*------------------------------------------------------------------------*/
   if(_fp->fd == -1) return (0);

   /*------------------------------------------------------------------------*/
   /* If this stream is currently being written to, return a 0.              */
   /*------------------------------------------------------------------------*/
   if(_STCHK(_fp, _MODEW)) 
   { 
      _SET(_fp, _STATERR); 
      return (0);
   }
 
   /*------------------------------------------------------------------------*/
   /* If this stream was opened in update mode, and is able to either read   */
   /* or write currently, put it in read mode.                               */
   /*------------------------------------------------------------------------*/
   if(!_STCHK(_fp, _MODER) && _STCHK(_fp, _MODERW)) _SET(_fp, _MODER);
 
   /*------------------------------------------------------------------------*/
   /* Allocate a buffer for the stream if needed, and none exist.            */
   /*------------------------------------------------------------------------*/
   if(_fp->buf == NULL && !_STCHK(_fp, _IONBF))
      result |= setvbuf(_fp, NULL, _BUFFMODE(_fp), BUFSIZ);
 
   return (! result);
 
}


/*****************************************************************************/
/* __TI_wrt_ok() - Check to make sure that a stream is writeable             */
/*                                                                           */
/*    This function takes the FILE pointer _FP, and makes sure that it is ok */
/*    to write to it.  It also allocates a buffer if one is needed.  The     */
/*    function returns a 1 if it is ok to write to this stream, otherwise it */
/*    returns a 0.                                                           */
/*                                                                           */
/*    For multi-threaded applications, this function should always be called */
/*    within a critical section that guarantees single-threaded access to    */
/*    the file stream.                                                       */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int __TI_wrt_ok(FILE *_fp)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   int   result   = 0;
 
   /*------------------------------------------------------------------------*/
   /* If the current stream is not associated with a file, return an error.  */
   /*------------------------------------------------------------------------*/
   if(_fp->fd == -1) return (0);

   /*------------------------------------------------------------------------*/
   /* If this stream is currently being read return a 0.                     */
   /*------------------------------------------------------------------------*/
   if(_STCHK(_fp, _MODER)) 
   {
      _SET(_fp, _STATERR);
      return (0);
   } 

   /*------------------------------------------------------------------------*/
   /* If the stream is in append mode, move the file pointer to the end of   */
   /* the file.                                                              */
   /*------------------------------------------------------------------------*/
   if(_STCHK(_fp, _MODEA)) fseek(_fp, 0L, SEEK_END);
 
   /*------------------------------------------------------------------------*/
   /* If this stream was opened in update mode, and is able to either read   */
   /* or write currently, put it in write mode.                              */
   /*------------------------------------------------------------------------*/
   if(!_STCHK(_fp, _MODEW) && _STCHK(_fp, _MODERW)) _SET(_fp, _MODEW);
 
   /*------------------------------------------------------------------------*/
   /* Allocate a buffer for the stream if needed, and none exist.            */
   /*------------------------------------------------------------------------*/
   if(_fp->buf == NULL && !_STCHK(_fp, _IONBF))
      result |= setvbuf(_fp, NULL, _BUFFMODE(_fp), BUFSIZ);

   /*------------------------------------------------------------------------*/
   /* In writing mode, buff_stop is used to mark the end of the buffer.      */
   /*------------------------------------------------------------------------*/
   _fp->buff_stop = _fp->bufend;
 
   return (! result);
}

