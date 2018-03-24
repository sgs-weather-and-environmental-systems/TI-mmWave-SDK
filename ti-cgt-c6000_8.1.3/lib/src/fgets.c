/*****************************************************************************/
/*  FGETS.C v8.1.3                                                           */
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
/*    FGETS    -  Get a string from a stream                                 */
/*    GETS     -  Get a string from stdin                                    */
/*    _DOFGETS -  Perform the main FGETS routine                             */
/*****************************************************************************/
#include <string.h>
#include <stdio.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "file.h"

extern _CODE_ACCESS int  __TI_rd_ok(FILE *_fp);
extern _CODE_ACCESS void __TI_buff_read(FILE *_fp);

static char *_dofgets(char *_ptr, register int _size, register FILE *_fp,
                      int _gets_flag);



/*****************************************************************************/
/* FGETS -  Get a string from a stream                                       */
/*                                                                           */
/*    This function calls _DOFGETS, with a 0 for the _GETS_FLAG argument.    */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS char *fgets(char *_ptr, register int _size, register FILE *_fp)
{
   return(_dofgets(_ptr, _size, _fp, 0));
}



/*****************************************************************************/
/* GETS  -  Get a string from stdin                                          */
/*                                                                           */
/*    This function calls FGETS with stdin as the stream argument.           */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS char *gets(char *_ptr) { return (_dofgets(_ptr, 1, stdin, 1)); }



/*****************************************************************************/
/* _DOFGETS -  Perform the main FGETS routine                                */
/*                                                                           */
/*    This function gets a string from the stream _FP.  It returns a pointer */
/*    to the string upon success, or NULL upon failure.                      */
/*                                                                           */
/*****************************************************************************/
static char *_dofgets(char *_ptr, register int _size, register FILE *_fp, 
                      int _gets_flag)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   unsigned    char     *next_nl    = NULL;
               char     *fpos       = _ptr;
               size_t   num_left    = _size -1,
                        num_to_read;
               int      skipped_nl  = 0;

   /*------------------------------------------------------------------------*/
   /* The current thread in a multi-threaded application must protect access */
   /* to the file stream. In this case, _fp may be updated, so we must       */
   /* ensure that the local copy of _fp is flushed to shared memory before   */
   /* leaving the critical section (invalidated if it is not modified).      */
   /*------------------------------------------------------------------------*/
   __TI_file_lock(_fp);

   /*------------------------------------------------------------------------*/
   /* Make sure that the stream is readable.                                 */
   /*------------------------------------------------------------------------*/
   if (!__TI_rd_ok(_fp) || _STCHK(_fp, _STATEOF) || (_size -1) < 0) 
   { 
      __TI_data_synch_INV(_fp, sizeof(FILE));
      __TI_file_unlock(_fp);
      return (NULL);
   }

   /*------------------------------------------------------------------------*/
   /* If the stream is non buffered, read the string in one character at a   */
   /* time, using the lowlevel READ function.                                */
   /*------------------------------------------------------------------------*/
   if (_BUFFMODE(_fp) == _IONBF)
   {
      int errchk = 1;
 
      do 
      {
         if (_STCHK(_fp, _UNGETC))
	 {
	    *fpos = *(_fp->pos++); 
	    _UNSET(_fp, _UNGETC); 
	 }
	 else if ((errchk = read(_fp->fd, fpos, 1)) <= 0) break;

      } while (*fpos++ != '\n' && (fpos-_ptr) < (_size-1)); 

      __TI_data_synch_WBINV(_fp, sizeof(FILE));
      __TI_file_unlock(_fp);

      switch(errchk)
      {
          case  0 : _SET(_fp, _STATEOF); return NULL;
          case -1 : _SET(_fp, _STATERR); return NULL;
      }
 
      *fpos = '\0';
      return (_ptr);
   }
 

   while ((num_left > 0 || _gets_flag) && ! next_nl)
   {
      /*---------------------------------------------------------------------*/
      /* If the buffer is empty or completely read, fill it up.              */
      /*---------------------------------------------------------------------*/
      if (_fp->pos == _fp->buff_stop) __TI_buff_read(_fp);

      if (_STCHK(_fp, (_STATERR | _STATEOF)))
      {
          /*-----------------------------------------------------------------*/
          /* If we've read any characters, fall out of for loop, returning   */
          /* what we've read in.                                             */
          /*-----------------------------------------------------------------*/
          if (fpos != _ptr) break;

          /*-----------------------------------------------------------------*/
          /* Otherwise we have not read anything (some kind of error).       */
          /*-----------------------------------------------------------------*/
          __TI_data_synch_WBINV(_fp, sizeof(FILE));
          __TI_file_unlock(_fp);
          return (NULL);
      }

      /*---------------------------------------------------------------------*/
      /* Determine the location of the next newline character (NEXT_NL).     */
      /*---------------------------------------------------------------------*/
      next_nl = (unsigned char *)memchr(_fp->pos, '\n', (_fp->buff_stop - 
                                        _fp->pos));

      /*---------------------------------------------------------------------*/
      /* Determine how many characters to read from the buffer.  If this     */
      /* function was called from GETS (_GETS_FLAG == 1), read until a       */
      /* newline character, EOF character, or the end of the buffer is       */
      /* encountered.  Do the same otherwise, but do not read any more       */
      /* characters than specified by NUM_LEFT.                              */
      /*---------------------------------------------------------------------*/
      num_to_read =  _fp->buff_stop - _fp->pos;
      num_to_read =  (next_nl) ? (next_nl - _fp->pos + 1) : num_to_read;
      num_to_read =  (_gets_flag) ? num_to_read :
                     (num_left < num_to_read) ? num_left : num_to_read;

      /*---------------------------------------------------------------------*/
      /* If this function was called from GETS (_GETS_FLAG == 1), do not     */
      /* retain a newline character if one is present                        */
      /*---------------------------------------------------------------------*/
      if(next_nl && _gets_flag)
      {
         num_to_read--;
         skipped_nl = 1;
      }

      /*---------------------------------------------------------------------*/
      /* Copy the characters, and update pointers and counters.              */
      /*---------------------------------------------------------------------*/
      memcpy(fpos, _fp->pos, num_to_read);
      _fp->pos += (skipped_nl + num_to_read);
      num_left -= num_to_read;
      fpos += num_to_read;
   }

   /*------------------------------------------------------------------------*/
   /* Tack on the NULL terminator, clear the _UNGETC flag and the _GETS_FLAG.*/
   /*------------------------------------------------------------------------*/
   *fpos = '\0';
   _UNSET(_fp, _UNGETC);
   _gets_flag = 0; 

   __TI_data_synch_WBINV(_fp, sizeof(FILE));
   __TI_file_unlock(_fp);
   return(_ptr);
}

