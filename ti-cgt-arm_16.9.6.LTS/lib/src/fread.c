/*****************************************************************************/
/*  FREAD.C v16.9.6                                                          */
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
/*    FREAD       -  Read a block of bytes from a stream                     */
/*****************************************************************************/
#include <string.h>
#include <stdio.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "file.h"
 
extern _CODE_ACCESS int  __TI_rd_ok(FILE *_fp);
extern _CODE_ACCESS void __TI_buff_read(FILE *_fp);



/*****************************************************************************/
/* FREAD -  Read a block of bytes from a stream                              */
/*                                                                           */
/*    This function reads _COUNT blocks of _SIZE size from stream _FP, and   */
/*    stores them in string _PTR.  The function returns the number of        */
/*    blocks read.                                                           */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS size_t fread(void *_ptr, size_t _size, size_t _count, FILE *_fp)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   unsigned char     *fpos       = (unsigned char *)_ptr;
            size_t   num_left    = _size * _count,
                     num_read    = 0,
                     num_to_read = 0;
 
   /*------------------------------------------------------------------------*/
   /* The current thread in a multi-threaded application must protect access */
   /* to the file stream. In this case, _fp may be updated, so we must       */
   /* ensure that the local copy of _fp is flushed to shared memory before   */
   /* leaving the critical section (invalidated if it is not modified).      */
   /*------------------------------------------------------------------------*/
   __TI_file_lock(_fp);

   /*------------------------------------------------------------------------*/
   /* Make sure that the file is readable.                                   */
   /*------------------------------------------------------------------------*/
   if (!__TI_rd_ok(_fp) || _size == 0 || _count == 0) 
   { 
      __TI_data_synch_INV(_fp, sizeof(FILE));
      __TI_file_unlock(_fp);
      return (0);
   }
 
   /*------------------------------------------------------------------------*/
   /* If the stream is non-buffered, call the lowlevel READ function.	     */
   /*------------------------------------------------------------------------*/
   if (_BUFFMODE(_fp) == _IONBF)
   {
       int num_read = 0;

       while (num_left > 0)
       {
	   int read_return; 

           if (_STCHK(_fp, _UNGETC))
	   {
	      *fpos = *(_fp->pos++); 
	      _UNSET(_fp, _UNGETC);
	      read_return = 1;
	   }
	   else 
	      read_return = (size_t)(read(_fp->fd, 
					   (char *)fpos + num_read, num_left));
	   if (read_return < 0)
	   {
	       _SET(_fp, _STATERR);
	       break;
	   }
	   else if (read_return == 0) 
	   {
	       _SET(_fp, _STATEOF);
	       break;
	   }
	   else 
	   {
	       num_read += read_return;
	       num_left -= read_return;
	   }
       }

       __TI_data_synch_WBINV(_fp, sizeof(FILE));
       __TI_file_unlock(_fp);
       return (num_read / _size);
   }
   
   while (num_left > 0)
   {
      /*---------------------------------------------------------------------*/
      /* If the buffer has been completely read, fill it up.  Exit the loop  */
      /* if an I/O error occurs, or the end of the file is reached.          */
      /*---------------------------------------------------------------------*/
      if(_fp->pos == _fp->buff_stop)  __TI_buff_read(_fp);
      if(_STCHK(_fp, (_STATERR | _STATEOF))) break;

      /*---------------------------------------------------------------------*/
      /* Determine how many characters can fit in the buffer, and read them  */
      /* in.                                                                 */
      /*---------------------------------------------------------------------*/
      num_to_read = (num_left < (_fp->buff_stop - _fp->pos)) ?
                    num_left : (_fp->buff_stop - _fp->pos);
      memcpy(fpos, _fp->pos, num_to_read);

      /*---------------------------------------------------------------------*/
      /* Update pointers and counters.                                       */
      /*---------------------------------------------------------------------*/
      fpos += num_to_read;
      _fp->pos += num_to_read;
      num_read += num_to_read;
      num_left -= num_to_read; 
   }

   /*------------------------------------------------------------------------*/
   /* Clear the _UNGETC flag in the stream, and return the number of blocks  */
   /* read.                                                                  */
   /*------------------------------------------------------------------------*/
   _UNSET(_fp, _UNGETC);
   __TI_data_synch_WBINV(_fp, sizeof(FILE));
   __TI_file_unlock(_fp);
 
   return (num_read / _size);
}
 
