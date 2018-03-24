/*****************************************************************************/
/*  TRGDRV.C v8.1.3                                                          */
/*                                                                           */
/* Copyright (c) 1996-2017 Texas Instruments Incorporated                    */
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
/* Functions:                                                               */
/*    HOSTopen()    -    Sends open command with arguments to the host      */
/*    HOSTclose()   -    Sends close command with arguments to the host     */
/*    HOSTread()    -    Sends read command with arguments to the host      */
/*    HOSTwrite()   -    Sends write command with arguments to the host     */
/*    HOSTlseek()   -    Sends lseek command with arguments to the host     */
/*    HOSTunlink()  -    Sends unlink command with arguments to the host    */
/*    HOSTrename()  -    Sends rename command with arguments to the host    */
/*    HOSTgetenv()  -    Get the enviroment value for the passed variable   */
/*                       name                                               */
/*    HOSTtime()    -    Get the time from the host                         */
/*    HOSTtime64()  -    Get the time from the host                         */
/*    HOSTclock()   -    Get the target clock value (CLK register)          */
/*                                                                          */
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
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <_mutex.h>
#include <_data_synch.h>
#include <_tls.h>

#include "file.h"
#include "trgcio.h"

extern _CODE_ACCESS int HOSTopen(const char *path, unsigned flags, int llv_fd),
                        HOSTclose(int dev_fd),
                        HOSTread(int dev_fd, char *buf, unsigned count),
                        HOSTwrite(int dev_fd, const char *buf, unsigned count),
                        HOSTunlink(const char *path),
                        HOSTrename(const char *old_name, const char *new_name);

extern _CODE_ACCESS off_t   HOSTlseek(int dev_fd, off_t offset, int origin);
extern _CODE_ACCESS char   *HOSTgetenv(const char *_string, char *pout);
extern _CODE_ACCESS time_t  HOSTtime(void);
extern _CODE_ACCESS clock_t HOSTclock(void);

extern _CODE_ACCESS void __TI_readmsg(register unsigned char *parm,
                                      register char *data);

extern _CODE_ACCESS void __TI_writemsg(unsigned char  command,
                                       register const unsigned char *parm,
                                       register const          char *data,
                                       unsigned int   length);

static _DATA_ACCESS unsigned char parmbuf[8];

/****************************************************************************/
/* HOSTOPEN()  -  Pass the open command and its arguments to the host.      */
/****************************************************************************/
_CODE_ACCESS int HOSTopen(const char *path, unsigned flags, int llv_fd)
{
   int dev_fd;

   /*-----------------------------------------------------------------------*/
   /* CRITICAL REGION TO PROTECT ACCESSES TO parmbuf[] AND _CIOBUF_ (see    */
   /* file header comment above for more about mutexes and data coherency). */
   /*-----------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_HOST_CIO);


   LOADSHORT(parmbuf,llv_fd,0);
   LOADSHORT(parmbuf,flags,2);
   __TI_writemsg(_DTOPEN,parmbuf,(char *)path,strlen(path)+1);
					 /* SEND NULL ACROSS ALSO */
   __TI_readmsg(parmbuf,NULL);

   dev_fd = (int16_t)UNLOADSHORT(parmbuf,0);

   __TI_data_synch_WBINV(&parmbuf, sizeof(parmbuf));
   __TI_resource_unlock(__TI_LOCK_HOST_CIO);

   return (dev_fd < 0) ? dev_fd : llv_fd;
}

/****************************************************************************/
/* HOSTCLOSE()  -  Pass the close command and its arguments to the host.    */
/****************************************************************************/
_CODE_ACCESS int HOSTclose(int dev_fd)
{
   int result;

   /*-----------------------------------------------------------------------*/
   /* CRITICAL REGION TO PROTECT ACCESSES TO parmbuf[] AND _CIOBUF_ (see    */
   /* file header comment above for more about mutexes and data coherency). */
   /*-----------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_HOST_CIO);

   LOADSHORT(parmbuf,dev_fd,0);

   __TI_writemsg(_DTCLOSE,parmbuf,NULL,0);
   __TI_readmsg(parmbuf,NULL);

   result = (int16_t)UNLOADSHORT(parmbuf,0);

   __TI_data_synch_WBINV(&parmbuf, sizeof(parmbuf));
   __TI_resource_unlock(__TI_LOCK_HOST_CIO);

   return result;
}

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

/****************************************************************************/
/* HOSTWRITE()  -  Pass the write command and its arguments to the host.    */
/****************************************************************************/
_CODE_ACCESS int HOSTwrite(int dev_fd, const char *buf, unsigned count)
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
   __TI_writemsg(_DTWRITE,parmbuf,(char *)buf,count);
   __TI_readmsg(parmbuf,NULL);

   result = (int16_t)UNLOADSHORT(parmbuf,0);

   __TI_data_synch_WBINV(&parmbuf, sizeof(parmbuf));
   __TI_resource_unlock(__TI_LOCK_HOST_CIO);

   return result;
}

/****************************************************************************/
/* HOSTLSEEK()  -  Pass the lseek command and its arguments to the host.    */
/****************************************************************************/
_CODE_ACCESS off_t HOSTlseek(int dev_fd, off_t offset, int origin)
{
   off_t result;

   /*-----------------------------------------------------------------------*/
   /* CRITICAL REGION TO PROTECT ACCESSES TO parmbuf[] AND _CIOBUF_ (see    */
   /* file header comment above for more about mutexes and data coherency). */
   /*-----------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_HOST_CIO);

   LOADSHORT(parmbuf,dev_fd,0);
   LOAD32(parmbuf,offset,2);
   LOADSHORT(parmbuf,origin,6);

   __TI_writemsg(_DTLSEEK,parmbuf,NULL,0);
   __TI_readmsg(parmbuf,NULL);

   result = (int32_t)UNLOAD32(parmbuf,0);

   __TI_data_synch_WBINV(&parmbuf, sizeof(parmbuf));
   __TI_resource_unlock(__TI_LOCK_HOST_CIO);

   return result;
}

_CODE_ACCESS int HOSTunlink(const char *path)
{
   int result;

   /*-----------------------------------------------------------------------*/
   /* CRITICAL REGION TO PROTECT ACCESSES TO parmbuf[] AND _CIOBUF_ (see    */
   /* file header comment above for more about mutexes and data coherency). */
   /*-----------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_HOST_CIO);

   __TI_writemsg(_DTUNLINK,parmbuf,(char *)path,strlen(path) + 1);
   __TI_readmsg(parmbuf,NULL);

   result = (int16_t)UNLOADSHORT(parmbuf,0);

   __TI_data_synch_WBINV(&parmbuf, sizeof(parmbuf));
   __TI_resource_unlock(__TI_LOCK_HOST_CIO);

   return result;
}

_CODE_ACCESS int HOSTrename(const char *old, const char *new)
{
   char combined[100];
   int  length; 
   int  result;

   /*-----------------------------------------------------------------------*/
   /* CRITICAL REGION TO PROTECT ACCESSES TO parmbuf[] AND _CIOBUF_ (see    */
   /* file header comment above for more about mutexes and data coherency). */
   /*-----------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_HOST_CIO);

   strcpy(combined,old);
   length = strlen(old)+1;
   strcpy(combined+length,new);
   length += strlen(new) + 1;

   __TI_writemsg(_DTRENAME,parmbuf,combined,length);
                                                 /*SEND NULL ACROSS ALSO*/
   __TI_readmsg(parmbuf,NULL);

   result = (int16_t)UNLOADSHORT(parmbuf,0);

   __TI_data_synch_WBINV(&parmbuf, sizeof(parmbuf));
   __TI_resource_unlock(__TI_LOCK_HOST_CIO);

   return result;
}

/****************************************************************************/
/* HOSTGETENV()  -  Get the environment value for the passed variable name  */
/****************************************************************************/
_CODE_ACCESS char *HOSTgetenv(const char *_string, char *pout)
{
   /*-----------------------------------------------------------------------*/
   /* CRITICAL REGION TO PROTECT ACCESSES TO parmbuf[] AND _CIOBUF_ (see    */
   /* file header comment above for more about mutexes and data coherency). */
   /*-----------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_HOST_CIO);

   __TI_writemsg(_DTGETENV, parmbuf, (char *)_string, strlen(_string) + 1);
   __TI_readmsg(parmbuf, pout);

   __TI_data_synch_WBINV(&parmbuf, sizeof(parmbuf));
   __TI_resource_unlock(__TI_LOCK_HOST_CIO);

   return strlen(pout) ? pout : 0;
}

/****************************************************************************/
/* HOSTTIME()  -  Get the time from the host                                */
/****************************************************************************/
_CODE_ACCESS time_t HOSTtime(void)
{
   time_t result;

   /*-----------------------------------------------------------------------*/
   /* CRITICAL REGION TO PROTECT ACCESSES TO parmbuf[] AND _CIOBUF_ (see    */
   /* file header comment above for more about mutexes and data coherency). */
   /*-----------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_HOST_CIO);

   __TI_writemsg(_DTGETTIME,parmbuf,NULL,0);
   __TI_readmsg(parmbuf, NULL);

   result = (time_t)(UNLOAD32(parmbuf,0));

   __TI_data_synch_WBINV(&parmbuf, sizeof(parmbuf));
   __TI_resource_unlock(__TI_LOCK_HOST_CIO);

   return result;
}

/****************************************************************************/
/* HOSTTIME()  -  Get the time from the host                                */
/****************************************************************************/
_CODE_ACCESS __time64_t HOSTtime64(void)
{
   __time64_t result;

   /*-----------------------------------------------------------------------*/
   /* CRITICAL REGION TO PROTECT ACCESSES TO parmbuf[] AND _CIOBUF_ (see    */
   /* file header comment above for more about mutexes and data coherency). */
   /*-----------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_HOST_CIO);

   __TI_writemsg(_DTGETTIME,parmbuf,NULL,0);
   __TI_readmsg(parmbuf, NULL);

   result = (__time32_t)(UNLOAD32(parmbuf,0));
   result -= 0x83aa2a20; /* Convert from TI epoch to POSIX epoch */

   __TI_data_synch_WBINV(&parmbuf, sizeof(parmbuf));
   __TI_resource_unlock(__TI_LOCK_HOST_CIO);

   return result;
}

/****************************************************************************/
/* HOSTclock()  -  Get the current number of clock ticks                    */
/****************************************************************************/
_CODE_ACCESS clock_t HOSTclock(void)
{
   clock_t result;

   /*-----------------------------------------------------------------------*/
   /* CRITICAL REGION TO PROTECT ACCESSES TO parmbuf[] AND _CIOBUF_ (see    */
   /* file header comment above for more about mutexes and data coherency). */
   /*-----------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_HOST_CIO);

   __TI_writemsg(_DTGETCLK,parmbuf,NULL,0);
   __TI_readmsg(parmbuf, NULL);

   result = (clock_t)(UNLOAD32(parmbuf,0));

   __TI_data_synch_WBINV(&parmbuf, sizeof(parmbuf));
   __TI_resource_unlock(__TI_LOCK_HOST_CIO);

   return result;
}
