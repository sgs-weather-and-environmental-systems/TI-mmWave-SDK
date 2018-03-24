/*****************************************************************************/
/*  SETVBUF.C  v8.1.3                                                        */
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
/*    SETVBUF  -  Set the buffering mode for a stream                        */
/*****************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <_mutex.h>
#include <_data_synch.h>

extern void   __TI_cleanup();
extern _DATA_ACCESS void (*__TI_cleanup_ptr)(void);


/*****************************************************************************/
/* SETVBUF  -  Set the buffering mode for a stream                           */
/*                                                                           */
/*    This function sets the buffering mode for a stream, and allocates a    */
/*    buffer for it if necessary.                                            */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int setvbuf(register FILE *_fp, register char *_buf,
			 register int _type, register size_t _size)
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
   if (_fp->fd == -1 || (_type != _IONBF && _size <= 0)) 
   { 
      __TI_data_synch_INV(_fp, sizeof(FILE));
      __TI_file_unlock(_fp);
      return (EOF);
   }

   /*------------------------------------------------------------------------*/
   /* If a buffer already exists, free it if it was malloc'd, and reset all  */
   /* of the stream's buffer pointers.                                       */
   /*------------------------------------------------------------------------*/
   if (_fp->buf)
   {
      if(_STCHK(_fp, _BUFFALOC)) free((_fp->buf)-1);
      _UNSET(_fp, _BUFFALOC);
      _fp->buf = NULL;
      _fp->pos = NULL;
      _fp->bufend = NULL;
      _fp->buff_stop = NULL;
   }

   /*------------------------------------------------------------------------*/
   /* If NULL was used for the buffering mode, default to fully-buffered.    */
   /*------------------------------------------------------------------------*/
   if (!_type) _type = _IOFBF;

   /*------------------------------------------------------------------------*/
   /* Clear any previous buffering flags, and set the new one.               */
   /*------------------------------------------------------------------------*/
   _UNSET(_fp, (_IOLBF | _IOFBF | _IONBF));
   _SET(_fp, _type);

   /*------------------------------------------------------------------------*/
   /* If a buffer was provided, but its size is only one byte, allocate a    */
   /* different one.  Also, do not allow a buffer size greater than BUFSIZ.  */
   /* The buffer will always have one space at the beginning that is         */
   /* for UNGETC, in the event that an UNGETC is performed on an empty file, */
   /* or when the buffer is full, but unread.                                */
  /*------------------------------------------------------------------------*/
   if (_size == 1) _buf = NULL;
   if (_size > BUFSIZ) _size = BUFSIZ;

   if (_buf) _fp->buf = (unsigned char*)_buf+1;
   else
   {
      /*---------------------------------------------------------------------*/
      /* If allocating a buffer, provide _size bytes of usable space by      */
      /* incrementing _size, unless it is greater than BUFSIZ.               */
      /*---------------------------------------------------------------------*/
      if (_size <= BUFSIZ) _size++;
      if (! (_fp->buf = (unsigned char*)malloc(_size))) 
      {
         _SET(_fp, _STATERR);
         __TI_data_synch_WBINV(_fp, sizeof(FILE));
         __TI_file_unlock(_fp);
         return (EOF);
      }
      _fp->buf++;
      _SET(_fp, _BUFFALOC);
   }

   _fp->pos = _fp->buff_stop = _fp->buf;
   _fp->bufend = _fp->buf + _size -1;
   
   __TI_data_synch_WBINV(_fp, sizeof(FILE));
   __TI_file_unlock(_fp);

   /*------------------------------------------------------------------------*/
   /* SETUP _CLEANUP_PTR SO ALL BUFFERS WILL BE FLUSHED AT EXIT.             */
   /*------------------------------------------------------------------------*/
   /* __TI_cleanup_ptr is also a shared resource in multi-threaded           */
   /* applications, so accesses to it are also protected by the              */
   /* __TI_LOCK_FILE_TBL mutex.  The current thread will also invalidate any */
   /* local copy of __TI_cleanup_ptr in the data cache of the core that it   */
   /* is running on before leaving the critical section.                     */
   /*------------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_FILE_TBL);
   __TI_cleanup_ptr = __TI_cleanup;
   __TI_data_synch_WBINV(&__TI_cleanup_ptr, sizeof(__TI_cleanup_ptr));
   __TI_resource_unlock(__TI_LOCK_FILE_TBL);

   return (0);
}

