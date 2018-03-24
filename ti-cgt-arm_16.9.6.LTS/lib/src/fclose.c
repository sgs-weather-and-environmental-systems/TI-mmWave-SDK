/*****************************************************************************/
/*  FCLOSE.C v16.9.6                                                         */
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
/*    Functions:                                                             */
/*       FCLOSE   -  Close a stream                                          */
/*****************************************************************************/
#include <stdio.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "file.h"
#include <string.h>
#include <stdlib.h>

extern _CODE_ACCESS int __TI_doflush(FILE *_fp);

_CODE_ACCESS int __TI_closefile(FILE *_fp);


/*****************************************************************************/
/* FCLOSE   -  Close a stream                                                */
/*                                                                           */
/*    This function flushes the current stream, deallocates any buffers      */
/*    associated with the stream, and closes it.  This function returns a 0  */
/*    if the close was successful, or an EOF if an error occured.            */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int fclose(FILE *_fp)
{
   int result;

   /*------------------------------------------------------------------------*/
   /* The current thread in a multi-threaded application must protect access */
   /* to the file stream being closed. In this case, __TI_closefile will     */
   /* update the file stream, so ensure that the local copy of the file      */
   /* stream is flushed to shared memory before leaving the critical section.*/
   /*------------------------------------------------------------------------*/
    __TI_resource_lock(__TI_LOCK_FILE_TBL);
   __TI_file_lock(_fp);

   result = __TI_closefile(_fp);

   __TI_data_synch_WBINV(_fp, sizeof(FILE));
   __TI_file_unlock(_fp);
    __TI_resource_unlock(__TI_LOCK_FILE_TBL);

   return result;
}

/*****************************************************************************/
/* __TI_closefile() - Close a stream                                         */
/*                                                                           */
/*    This function flushes the current stream, deallocates any buffers      */
/*    associated with the stream, and closes it.  This function returns a 0  */
/*    if the close was successful, or an EOF if an error occured.            */
/*                                                                           */
/*    For multi-threaded applications, this function should always be called */
/*    within a critical section that guarantees single-threaded access to    */
/*    the file stream.                                                       */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int __TI_closefile(FILE *_fp)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   int fd = _fp->fd;
   int errchk;
   int remove_flag = _STCHK(_fp, _TMPFILE);

   /*------------------------------------------------------------------------*/
   /* If the current stream is not associated with a file, return an error.  */
   /*------------------------------------------------------------------------*/
   if (_fp->fd == -1) return (EOF);

   /*------------------------------------------------------------------------*/
   /* Flush the buffer.                                                      */
   /*------------------------------------------------------------------------*/
   if (__TI_doflush(_fp)) return (EOF);

   /*------------------------------------------------------------------------*/
   /* Free the buffer if there was one, and it was malloc'd by SETVBUF.      */
   /*------------------------------------------------------------------------*/
   if (_STCHK(_fp, _BUFFALOC))
   {
      free((_fp->buf)-1);
      _UNSET(_fp, _BUFFALOC);
   }

   /*------------------------------------------------------------------------*/
   /* Reset the buffer pointers in the stream.                               */
   /*------------------------------------------------------------------------*/
   _fp->buf = NULL;
   _fp->pos = NULL;
   _fp->bufend = NULL;

   /*------------------------------------------------------------------------*/
   /* Close the file, and give the FILE structure an invalid file descriptor */
   /* so it cannot be used until it is assigned to another stream.           */
   /*------------------------------------------------------------------------*/
   errchk = close(_fp->fd);
   _fp->fd = -1;

   /*------------------------------------------------------------------------*/
   /* If the FILE pointer was associated with a temporary file, look up that */
   /* temporary file's filename, and remove it.                              */
   /*------------------------------------------------------------------------*/
   /* For multi-threaded applications, the remove() call must be in a        */
   /* critical section that guarantees single-threaded access to             */
   /* __TI_tmpnams[]. Writeback and invalidate the local copy of             */
   /* __TI_tmpnams[] that resides in the data cache of the core that the     */
   /* current thread is running on so that the next access will be read from */
   /* shared memory.*/      
   /*------------------------------------------------------------------------*/
   if (remove_flag) 
   {
      __TI_resource_lock(__TI_LOCK_TMPNAMS);
      remove(__TI_tmpnams[fd]);  
      __TI_data_synch_WBINV(&__TI_tmpnams, sizeof(__TI_tmpnams));
      __TI_resource_unlock(__TI_LOCK_TMPNAMS);
   }

   return (errchk);
}

