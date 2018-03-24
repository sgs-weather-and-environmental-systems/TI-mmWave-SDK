/*****************************************************************************/
/*  FOPEN.C v8.1.3                                                           */
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
/* FUNCTIONS:                                                                */
/*    FOPEN       -  Open a file and return a pointer to it                  */
/*    FREOPEN     -  Switch a FILE pointer to a different stream             */
/*    _OPENFILE   -  Set file flags, and call lowlevel OPEN                  */
/*    _SEARCH_FP  -  Find an open slot in the file table                     */
/*****************************************************************************/
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "file.h"
 
extern _DATA_ACCESS int __TI_ft_end;
extern _DATA_ACCESS void (*__TI_cleanup_ptr)(void);

extern _CODE_ACCESS void __TI_cleanup(void);
extern _CODE_ACCESS int  __TI_closefile(FILE *fp);
 
static FILE *_search_fp(void);
static FILE *_openfile(const char *_fname, register FILE *_fp, const char
                       *_mode);


/*****************************************************************************/
/* FOPEN    -  Open a file and return a pointer to it                        */
/*                                                                           */
/*    This function calls _SEARCH_FP to locate an empty slot in the file     */
/*    table (_ftable), and calls _OPENFILE with it to open a stream to the   */
/*    file _FNAME.  It returns a pointer to the stream that was allocated,   */
/*    or NULL if it was not successful.                                      */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS FILE *fopen(const char *_fname, const char *_mode)
{
    FILE *f;

    /*-----------------------------------------------------------------------*/
    /* This is a critical section because search_fp looks for a new file     */
    /* slot in the global table _ftable.				     */
    /*-----------------------------------------------------------------------*/
    __TI_resource_lock(__TI_LOCK_FILE_TBL);
    f = _openfile(_fname, _search_fp(), _mode);
    __TI_data_synch_WBINV(&_ftable, sizeof(_ftable));
    __TI_resource_unlock(__TI_LOCK_FILE_TBL);
    return f;
}

 
/*****************************************************************************/
/* FREOPEN  -  Switch a FILE pointer to a different stream                   */
/*                                                                           */
/*    This function attempts to close any file associated with _FP, and then */
/*    reassigns _FP to the file _FNAME by calling _OPENFILE.  It returns a   */
/*    pointer to the stream if successful, or NULL if the function is not    */
/*    successful.                                                            */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS FILE *freopen(const char *_fname, const char *_mode, register FILE *_fp)
{
    FILE *f;

    /*-----------------------------------------------------------------------*/
    /* This is a critical section because it expects the same slot in the    */
    /* global table _ftable to be available.				     */
    /*-----------------------------------------------------------------------*/
    __TI_resource_lock(__TI_LOCK_FILE_TBL);
    __TI_closefile(_fp); 
    f = _openfile(_fname, _fp, _mode);
    __TI_data_synch_WBINV(&_ftable, sizeof(_ftable));
    __TI_resource_unlock(__TI_LOCK_FILE_TBL);
    return f;
}


/*****************************************************************************/
/* _SEARCH_FP  -  Find an open slot in the file table                        */
/*                                                                           */
/*    This function looks through the array _ftable, searching for a null    */
/*    pointer which indicates an empty slot.  It mallocs a stream for that   */
/*    slot, and assigns a pointer to it there, initializing it and returning */
/*    it to the calling function.                                            */
/*                                                                           */
/*****************************************************************************/
static FILE *_search_fp(void)
{
   static _DATA_ACCESS int init = 0;
   int index;

   /*-----------------------------------------------------------------------*/
   /* Initialize the file table to have 'empty' slots using -1.             */
   /*-----------------------------------------------------------------------*/
   /*------------------------------------------------------------------------*/
   /* init is a shared resource in multi-threaded applications, so           */
   /* the updated value stored in the data cache of the core that the        */
   /* current thread is running on must be flushed to shared memory.         */
   /*------------------------------------------------------------------------*/
   if (!init)
   {
       for (init = 1,index = 3; index < _NFILE; _ftable[index++].fd = -1);
       __TI_data_synch_WBINV(&init, sizeof(init));
   }

   /*------------------------------------------------------------------------*/
   /* Search the file table for an empty slot.  Return a NULL if there       */
   /* aren't any available.                                                  */
   /*------------------------------------------------------------------------*/
   /* __TI_ft_end is a shared resource in multi-threaded applications, so    */
   /* the updated value stored in the data cache of the core that the        */
   /* current thread is running on must be flushed to shared memory.         */
   /*------------------------------------------------------------------------*/
   for(index = 0; (index < __TI_ft_end) && _ftable[index].fd != -1; index++);
   if (index == _NFILE) return (NULL);
   if (index == __TI_ft_end) __TI_ft_end++;
   __TI_data_synch_WBINV(&__TI_ft_end, sizeof(__TI_ft_end));

   /*------------------------------------------------------------------------*/
   /* Initialize the new stream.                                             */
   /*------------------------------------------------------------------------*/
   memset(&_ftable[index], '\0', sizeof(FILE));

   return (&_ftable[index]);
}
 

/*****************************************************************************/
/* _OPENFILE   -  Set file flags, and call lowlevel OPEN                     */
/*                                                                           */
/*    This function sets FILE flags for reading or writing by the character  */
/*    string _MODE.  It then calls the lowlevel OPEN function to open the    */
/*    file, and assigns the file descriptor returned from that function into */
/*    the FD member of the stream.                                           */
/*                                                                           */
/*****************************************************************************/
static FILE *_openfile(const char *_fname, register FILE *_fp, const char 
                       *_mode)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   int         wr, 
               bin = 0, 
               plus = 0;
   unsigned    lflags = 0;

   if (!_fp) return (NULL);
 
   /*------------------------------------------------------------------------*/
   /* SETUP _CLEANUP_PTR SO THAT ALL OPENED FILES WILL BE CLOSED AT EXIT.    */
   /*------------------------------------------------------------------------*/
   /* __TI_cleanup_ptr is considered a shared resource for multi-threaded    */
   /* applications. Access to it is also protected by the __TI_LOCK_FILE_TBL */
   /* mutex which encloses each call to _openfile. The local copy of         */
   /* __TI_cleanup_ptr is flushed to shared memory as soon as it is updated. */
   /*------------------------------------------------------------------------*/
   __TI_cleanup_ptr = __TI_cleanup;
   __TI_data_synch_WBINV(&__TI_cleanup_ptr, sizeof(__TI_cleanup_ptr));
   
   /*------------------------------------------------------------------------*/
   /* Set the flags in the stream to reflect to I/O mode of the stream to be */
   /* opened.                                                                */
   /*------------------------------------------------------------------------*/
   wr    = _mode[0];
   if (_mode[1])
   {
      bin  = ((_mode[1] == 'b') || (_mode[2] == 'b'));
      plus = ((_mode[1] == '+') || (_mode[2] == '+'));
   }

   _fp->flags = 0;

   if (!plus)
      _SET(_fp, (wr == 'r') ? _MODER : 
                (wr == 'w' || wr == 'a') ? _MODEW : 0);

   _SET(_fp, (wr == 'a') ? _MODEA : 0);
   _SET(_fp, (bin)  ? _MODEBIN : 0);
   _SET(_fp, (plus) ? _MODERW  : 0);
 
   if (bin) lflags |= (O_BINARY);

   /*------------------------------------------------------------------------*/
   /* Set the flags in LFLAGS to reflect the flags that will be necessary to */
   /* call the lowlevel OPEN function properly for this stream.              */
   /*------------------------------------------------------------------------*/
   switch (wr)
   {
      case 'r' : lflags |= (plus) ? O_RDWR : O_RDONLY;
                 break;
 
      case 'a' : lflags |= (plus) ? O_RDWR : O_WRONLY;
                 lflags |= (O_APPEND | O_CREAT);
                 break;
 
      case 'w' : lflags |= (plus) ? O_RDWR : O_WRONLY;
                 lflags |= (O_TRUNC | O_CREAT);
                 break;
   }

   /*------------------------------------------------------------------------*/
   /* Call the lowlevel OPEN function, and store the returned file           */
   /* descriptor into the stream.  If the OPEN function fails, return NULL.  */
   /*------------------------------------------------------------------------*/
   if ((_fp->fd = open(_fname, lflags, 0666)) < 0) return (NULL);

   /*------------------------------------------------------------------------*/
   /* Workaround for defect SDSCM00030215.                                   */
   /* Use of ftell and fseek on opened DOS formatted files is not supported  */
   /* in text mode, with buffered I/O.  The run-time library code will       */
   /* adjust the return value from the host ftell call.  This adjustment is  */
   /* not in-sync with an MS C runtime ftell value in the interpretation of  */
   /* carriage-return/line feed pairs.  Use of ftell/fseek on DOS formatted  */
   /* files requires one of the following changes:                           */
   /*  1. Rebuild the rts library with the following macro,                  */
   /*     _TI_FORCE_UNBUFFERED_TEXT_IO, defined.  This will prevent any rts  */
   /*     adjustment of ftell values.                                        */
   /*  2. Open the DOS file in binary mode.                                  */
   /*  3. Use one of many DOS-to-Unix file converters to strip               */
   /*     carriage-returns from the input file.                              */
   /*------------------------------------------------------------------------*/
#ifdef _TI_FORCE_UNBUFFERED_TEXT_IO
   if ((wr == 'r') && (!bin))
       setbuf(_fp, 0);
#endif

   return (_fp);
}


/*****************************************************************************/
/* __TI_cleanup - Close all open streams.  This is called by exit() if a     */
/*                file is ever opened or a buffer is ever created.           */
/*****************************************************************************/
_CODE_ACCESS void __TI_cleanup(void)
{
   int j;

   /*------------------------------------------------------------------------*/
   /* CLOSE ALL STREAMS THAT ARE CURRENTLY OPEN.                             */
   /*------------------------------------------------------------------------*/
   /* This is NOT a critical section because it is called from exit sequence */
   /* which should be executing a single main thread                         */
   /*------------------------------------------------------------------------*/
   __TI_closefile(&_ftable[0]);
   for(j = 1; j < __TI_ft_end; j++) 
       if (_ftable[j].fd > -1) __TI_closefile(&_ftable[j]); 
}
