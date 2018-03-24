/*****************************************************************************/
/*  FPUTS.C v8.1.3                                                           */
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
/*    PUTS  -  Write a string to stdout                                      */
/*    FPUTS -  Write a string to a stream                                    */
/*****************************************************************************/
#include <string.h>
#include <stdio.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "file.h"

extern _CODE_ACCESS int __TI_wrt_ok(FILE *_fp);
extern _CODE_ACCESS int __TI_doflush(FILE *_fp);



/*****************************************************************************/
/* PUTS  -  Write a string + newline to stdout.                              */
/*                                                                           */
/*    This function calls FPUTS, with stdout as the stream argument.         */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int puts(const char *_ptr) 
{ 
    int count = fputs(_ptr, stdout);
    count += fputs("\n", stdout); 
    return count;
}



/*****************************************************************************/
/* FPUTS -  Write a string to a stream                                       */
/*                                                                           */ 
/*    This function writes string _PTR to stream _FP, returning the number   */
/*    of characters written upon success, or an EOF upon failure.            */
/*                                                                           */ 
/*****************************************************************************/
_CODE_ACCESS int fputs(const char *_ptr, register FILE *_fp)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   size_t   num_left, ptr_strlen;
   char     *fpos          = (char *)_ptr;
   int      room_left,
            flush_flag     = 0,
            num_to_write;

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
      return (EOF);
   }
 
   room_left = (int)(_fp->bufend - _fp->pos);
   ptr_strlen = num_left = strlen(_ptr);

   /*------------------------------------------------------------------------*/
   /* If the stream is non-buffered, call the lowlevel WRITE function.       */
   /*------------------------------------------------------------------------*/
   if (_BUFFMODE(_fp) == _IONBF) 
   {
       int num_written = 0;

       while (num_left > 0)
       {
	   int write_return = write(_fp->fd, _ptr + num_written, num_left);
	   if (write_return < 0) 
	   { 
	       _SET(_fp, _STATERR); 
               __TI_data_synch_WBINV(_fp, sizeof(FILE));
               __TI_file_unlock(_fp);
	       return (EOF);
	   }
	   else
	   {
	       num_written += write_return;
	       num_left    -= write_return;
	   }
       }

       __TI_data_synch_WBINV(_fp, sizeof(FILE));
       __TI_file_unlock(_fp);
       return ptr_strlen;
   }
 
   /*------------------------------------------------------------------------*/
   /* Write the string into the buffer, flushing it when full.               */
   /*------------------------------------------------------------------------*/
   while (num_left > 0)
   {
      num_to_write = (num_left > room_left) ? room_left : num_left;
      if ((_BUFFMODE(_fp) == _IOLBF) && memchr(fpos, '\n', num_to_write))
      { 
         num_to_write = (char *)memchr(fpos, '\n', num_to_write) - fpos + 1;
         flush_flag = 1;
      }
      memcpy(_fp->pos, fpos, num_to_write);

      /*---------------------------------------------------------------------*/
      /* Update pointers and counters.                                       */
      /*---------------------------------------------------------------------*/
      _fp->pos  += num_to_write;
      fpos      += num_to_write;
      num_left  -= num_to_write;
      room_left -= num_to_write;

      /*---------------------------------------------------------------------*/
      /* If the buffer is full, flush it.  Any I/O errors cause this         */
      /* function to exit, returning an EOF.                                 */
      /*---------------------------------------------------------------------*/
      if (room_left == 0 || flush_flag)
      {
         if (__TI_doflush(_fp))
         {
            _SET(_fp, _STATERR);
            __TI_data_synch_WBINV(_fp, sizeof(FILE));
            __TI_file_unlock(_fp);
            return (EOF);
         }
         room_left = (int)(_fp->bufend - _fp->pos);
         _SET(_fp, _MODEW);
         flush_flag = 0;
      }
   }

   __TI_data_synch_WBINV(_fp, sizeof(FILE));
   __TI_file_unlock(_fp);
   return ptr_strlen;
}

