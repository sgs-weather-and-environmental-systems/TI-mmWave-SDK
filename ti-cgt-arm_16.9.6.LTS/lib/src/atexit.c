/****************************************************************************/
/*  ATEXIT.C v16.9.6                                                        */
/*                                                                          */
/* Copyright (c) 1995-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/
#include <stdlib.h>
#include <_mutex.h>
#include <_data_synch.h>

#if !defined(__TI_EABI_SUPPORT__) && !defined(__TI_EABI__)
/****************************************************************************/
/* __ATEXIT_FUNC_ID__ IS USED AS AN IDENTIFIER TO DISTINGUISH IF A DTOR_LIST*/
/* RECORDS A ATEXIT FUNCTION.                                               */
/****************************************************************************/
_DATA_ACCESS int __atexit_func_id__ = 0x1234;

#include "_dtor_list.h"
extern void __add_dtor(DTOR_LIST *dtor_entry);

/****************************************************************************/
/* STATICALLY ALLOCATE MEMORY FOR ATEXIT FUNCTION REGISTRATION (CQ20012)    */
/*--------------------------------------------------------------------------*/
/* NOTE: The C standard requires that the user may register at least 32     */
/*       functions via atexit(). If any additional atexit() calls are       */
/*       needed during the boot sequence or by any other RTS facility, then */
/*       the MAX_ATEXIT_FUN definition below must be updated accordingly    */
/*       and this comment adjusted to include those details.                */
/****************************************************************************/
#define MAX_ATEXIT_FUN 32
static _DATA_ACCESS int atexit_func_count = 0;
static _DATA_ACCESS DTOR_LIST atexit_func[MAX_ATEXIT_FUN];

/****************************************************************************/
/* ATEXIT - ATTEMPT TO REGISTER A FUNCTION FOR CALLING AT PROGRAM END       */
/*          THE GENERIC C++ ABI (IA64) REQUIRES USING THE CXA_ATEXIT        */
/*          MECHANISM TO IMPL ATEXIT. FUNCTION DEFINED IN VEC_NEWDEL.CPP    */
/****************************************************************************/
int atexit(void (*fun)())
{
   int err_code = 1;

   /*-----------------------------------------------------------------------*/
   /* For multi-threaded applications, access to shared resources must be   */
   /* protected. In this case, both atexit_func_count and atexit_func[] are */
   /* shared resources that may be accessed and updated by this function.   */
   /* Use the __TI_LOCK_ATEXIT mutex to create a critical section and       */
   /* that the local copies of both atexit_func_count and atexit_func[] are */
   /* flushed to shared memory.                                             */
   /*-----------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_ATEXIT);
   
   /*-----------------------------------------------------------------------*/
   /* We allow MAX_ATEXIT_FUN calls to atexit(); see the comment above the  */
   /* definition of MAX_ATEXIT_FUN for more details. BIOS has a specific    */
   /* request that we NOT use malloc here. If anyone requires additional    */
   /* atexit calls for use by RTS or OS, then the MAX_ATEXIT_FUN limit      */
   /* (above) must be adjusted and the library rebuilt (CQ20012, CQ20600).  */
   /*-----------------------------------------------------------------------*/
   if (atexit_func_count < MAX_ATEXIT_FUN)
   {
      /*--------------------------------------------------------------------*/
      /* Choose the next available entry for registering atexit functions.  */
      /*--------------------------------------------------------------------*/
      int allocated_entry = atexit_func_count++;

      /*--------------------------------------------------------------------*/
      /* Populate the allocated entry with the necessary details.           */
      /*--------------------------------------------------------------------*/
      atexit_func[allocated_entry].next     = NULL;
      atexit_func[allocated_entry].object   = &__atexit_func_id__;
      atexit_func[allocated_entry].fun.dfun = fun;

      /*--------------------------------------------------------------------*/
      /* Register the atexit function for processing at exit.               */
      /*--------------------------------------------------------------------*/
      __add_dtor(&(atexit_func[allocated_entry]));

      err_code = 0;
   }
   
   __TI_data_synch_WBINV(&atexit_func_count, sizeof(int));
   __TI_data_synch_WBINV(&atexit_func, sizeof(atexit_func));
   __TI_resource_unlock(__TI_LOCK_ATEXIT);

   return err_code;
}
#endif
