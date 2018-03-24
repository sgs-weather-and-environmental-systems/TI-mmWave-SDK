/*****************************************************************************/
/*  HOSTREAD.C v16.9.6                                                       */
/*                                                                           */
/* Copyright (c) 2017-2017 Texas Instruments Incorporated                    */
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

/****************************************************************************/
/* IMPORTANT!                                                               */
/*                                                                          */
/*    For multi-threaded applications, accesses to parmbuf[] are protected  */
/*    within critical regions using the __TI_LOCK_HOST_CIO mutex. If a user */
/*    provides their own device or replaces read/write/etc. they need to    */
/*    provide for thread safety.                                            */
/*                                                                          */
/*    In the functions below, data coherence of parmbuf[] is also           */
/*    maintained via call to the data synchronization API function,         */
/*    __TI_data_synch_WBINV(), before leaving a given critical region.      */
/*                                                                          */
/*    Note that _CIOBUF_ is another shared resource that is protected by    */
/*    the __TI_LOCK_HOST_CIO mutex critical regions, but data coherence     */
/*    for _CIOBUF_ is accounted for in the target's implementation of       */
/*    __TI_writemsg() and __TI_readmsg(). Please see the comment near the   */
/*    top of c60_rts/trgmsg.c for more information.                         */
/*                                                                          */
/****************************************************************************/

#include <_mutex.h>
#include <_data_synch.h>
#include "trgcio.h"
#include "trgdrv.h"

/****************************************************************************/
/* HOSTREAD()  -  Pass the read command and its arguments to the host.      */
/****************************************************************************/
_CODE_ACCESS int HOSTread(int dev_fd, char *buf, unsigned count)
{
   int result;

   /*-----------------------------------------------------------------------*/
   /* CRITICAL REGION TO PROTECT ACCESSES TO parmbuf[] AND _CIOBUF_ (see    */
   /* file header comment above for more about mutexes and data coherency). */
   /*-----------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_HOST_CIO);

   if (count > BUFSIZ) count = BUFSIZ;

   LOADSHORT(parmbuf,dev_fd,0);
   LOADSHORT(parmbuf,count,2);

   __TI_writemsg(_DTREAD,parmbuf,NULL,0);
   __TI_readmsg(parmbuf,buf);

   result = (int16_t)UNLOADSHORT(parmbuf,0);

   __TI_data_synch_WBINV(&parmbuf, sizeof(parmbuf));
   __TI_resource_unlock(__TI_LOCK_HOST_CIO);

   return result;
}

