/*****************************************************************************/
/*  TMPNAM.C v16.9.6                                                         */
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
/*    TMPNAM   -  Generate a unique filename                                 */
/*    _GETNAME -  Generate the character string for the filename             */
/*****************************************************************************/
#include <stdio.h>
#include "file.h"
#include <string.h>
#include <_tls.h>
#include <_mutex.h>
#include <_data_synch.h>

static char *_getname(int cnt, char *result);


/*****************************************************************************/
/* TMPNAM   -  Generate a unique filename                                    */
/*                                                                           */
/*    This function generates a unique filename, and can be called up to     */
/*    TMP_MAX times.                                                         */
/*                                                                           */
/*****************************************************************************/

/*---------------------------------------------------------------------------*/
/* tmpnam() builds up a string result in the static array tfname[] and       */
/* returns a pointer to it. In a multi-threaded application, each thread is  */
/* given its own copy of tfname[] to protect it from being overwritten by    */
/* other threads that are executing tmpnam() at the same time.               */
/*---------------------------------------------------------------------------*/
__TI_TLS_ARR_DEF(static, char, tfname, L_tmpnam);

/*---------------------------------------------------------------------------*/
/* We would like for temporary filenames to be unique, so in a multi-        */
/* threaded application, we assume that 'counter' is shared and is protected */
/* by the __TI_LOCK_TMPNAM_COUNTER mutex. Each time counter is updated, it   */
/* will be flushed to shared memory.                                         */
/*---------------------------------------------------------------------------*/
static _DATA_ACCESS unsigned int counter = 0;

_CODE_ACCESS char *tmpnam(char *_s)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   int  fd;
 
   __TI_resource_lock(__TI_LOCK_TMPNAM_COUNTER);

   /*------------------------------------------------------------------------*/ 
   /* Get a filename from _GETNAME                                           */
   /*------------------------------------------------------------------------*/ 
   _getname(counter++, tfname);

   /*------------------------------------------------------------------------*/ 
   /* Check to see if the filename exists.  Keep getting filenames until     */
   /* a unique one is found, or this function has reached its limit.         */
   /*------------------------------------------------------------------------*/ 
   while (((fd=open(tfname, O_RDONLY, 0666)) >= 0) && (counter < TMP_MAX))
   {
      close(fd);
      _getname(counter++, tfname);
   }
 
   if (counter >= TMP_MAX) 
   {
      __TI_data_synch_WBINV(&counter, sizeof(counter));
      __TI_resource_unlock(__TI_LOCK_TMPNAM_COUNTER);
      return (NULL);
   }

   __TI_data_synch_WBINV(&counter, sizeof(counter));
   __TI_resource_unlock(__TI_LOCK_TMPNAM_COUNTER);
 
   /*------------------------------------------------------------------------*/ 
   /* If _S is not NULL, store the new filename in it.                       */
   /*------------------------------------------------------------------------*/ 
   if (_s)
   {
      strcpy(_s, tfname);
      return (_s);
   }
 
   return (tfname);
}


/*****************************************************************************/
/* _GETNAME -  Generate the character string for the filename                */
/*                                                                           */
/*    This function takes a number passed to it by TMPNAM, and generates a   */
/*    filename from it.  It returns a pointer to the filename.               */
/*                                                                           */
/*****************************************************************************/
static char *_getname(int cnt, char *result)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   char *end   = result + L_tmpnam -1;
   char *spos;
 
   strcpy(result, P_tmpdir);
   spos = (result + strlen(result));
 
   *(spos++) = 'T';
 
   for(;cnt; cnt /= 10) *(spos++) = ((cnt % 10)+ '0');
 
   for(;spos < end; *(spos++)='0');
   *(end--) = '\0';
 
   return (result);
}

