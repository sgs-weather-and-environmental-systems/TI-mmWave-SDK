/*****************************************************************************/
/*  TMPFILE.C v8.1.3                                                         */
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
/*    TMPFILE  -  Create a temporary file, and return a pointer to the       */
/*                stream                                                     */
/*****************************************************************************/
#include <stdio.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "file.h"
#include <string.h>


/*****************************************************************************/
/* TMPFILE  -  Create a temporary file, and return a pointer to its FILE     */
/*             structure                                                     */
/*****************************************************************************/
_CODE_ACCESS FILE *tmpfile(void)
{
   char tfname[L_tmpnam];
   FILE *_fp = NULL;
   
   if (tmpnam(tfname)) _fp = fopen(tfname, "wb+");

   /*------------------------------------------------------------------------*/
   /* A non-NULL _fp returned from fopen() is assumed to be a pointer to a   */
   /* file stream which is a shared resource.                                */
   /*------------------------------------------------------------------------*/
   /* The current thread in a multi-threaded application must protect access */
   /* to the file stream and __TI_tmpnams[]. In this case, _fp will be       */
   /* updated, so we must ensure that the local copy of _fp and _tmpnams[]   */
   /* are flushed to shared memory before leaving the critical section       */
   /* (invalidated if it is not modified).                                   */
   /*------------------------------------------------------------------------*/
   if (_fp)
   {
      __TI_file_lock(_fp);
      _SET(_fp, _TMPFILE);
      
      __TI_resource_lock(__TI_LOCK_TMPNAMS);
      
      strcpy(__TI_tmpnams[_fp->fd], tfname);
      
      __TI_data_synch_WBINV(&__TI_tmpnams[_fp->fd], L_tmpnam);
      __TI_data_synch_WBINV(_fp, sizeof(FILE));
      __TI_resource_unlock(__TI_LOCK_TMPNAMS);
      __TI_file_unlock(_fp);
   }


   return (_fp);
}

