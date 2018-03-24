/*****************************************************************************/
/*  OPEN.C v16.9.6                                                           */
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

/*****************************************************************************/
/*                                                                           */
/* IMPORTANT!                                                                */
/*                                                                           */
/*   For multi-threaded applications, accesses to shared resources MUST be   */
/*   protected. _device[], _stream[] and stream_init are shared resources in */
/*   this file. In the function  below, __TI_LOCK_DEVICE_TBL,                */
/*   __TI_LOCK_STREAM_TBL are used to define critical regions to protect     */
/*   accesses to these shared resources.                                     */
/*   Additionally, copies of _device[], _stream[] will need to be made       */
/*   coherent between a given local data cache(s) and shared memory. The     */
/*   data synchronization API functions __TI_data_synch_INV() and            */
/*   __TI_data_synch_WBINV() are used when necessary to update the shared    */
/*   memory copy of the object and invalidate the local data cache copy of   */
/*   the object before leaving a given critical region.                      */
/*                                                                           */
/*****************************************************************************/

#include <lowlev.h>

/*****************************************************************************/
/*  OPEN() - open file/device specified by path and assign file descriptor   */
/*****************************************************************************/
_CODE_ACCESS int open(const char *path, unsigned flags, int mode)
{
   static _DATA_ACCESS int stream_init = 0;
   struct stream_info *ptr;
   _DEVICE    	      *dev;
   int        	      dev_fd;
   int        	      llv_fd;

   /*-------------------------------------------------------------------------*/
   /* CRITICAL REGION PROTECTS ACCESS TO _stream[] (see file header comment). */
   /*-------------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_STREAM_TBL);

   /*-------------------------------------------------------------------------*/
   /* INITIALIZE STREAM TABLE FIRST TIME AROUND                               */
   /*-------------------------------------------------------------------------*/
   if (!stream_init)
   {
      for (stream_init = 1, ptr = &_stream[3]; ptr != &_stream[_NSTREAM]; 
            (ptr++)->dev = NULL);
       __TI_data_synch_WBINV(&stream_init, sizeof(stream_init));
   }

   /*-------------------------------------------------------------------------*/
   /* GET THE NEXT AVAILABLE FILE DESCRIPTOR - RETURN -1 IF NONE AVAILABLE    */
   /*-------------------------------------------------------------------------*/
   for (ptr = &_stream[3]; ptr != &_stream[_NSTREAM] && ptr->dev; ++ptr);
   if (ptr == &_stream[_NSTREAM]) 
   { 
      __TI_data_synch_INV(&_stream, sizeof(_stream));
      __TI_resource_unlock(__TI_LOCK_STREAM_TBL);
      return -1;
   }

   llv_fd = ptr - &_stream[0];

   /*------------------------------------------------------------------------*/
   /* GET DEVICE AND PEFORM OPEN - SET STREAM TABLE ENTRY AND FLAGS          */
   /*------------------------------------------------------------------------*/
   /* CRITICAL REGION PROTECTS _device[] ACCESS THAT OCCURS IN getdevice()   */
   /* (see file header comment for more on mutex and data coherence).        */
   /*------------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_DEVICE_TBL);

   dev    = getdevice(&path);
   dev_fd = (dev->flags & _BUSY) ? -1 : (*(dev->OPEN))(path,flags,llv_fd);

   if (dev_fd < 0) 
   { 
      __TI_data_synch_INV(&_stream, sizeof(_stream));
      __TI_data_synch_INV(&_device, sizeof(_device));
      __TI_resource_unlock(__TI_LOCK_DEVICE_TBL);
      __TI_resource_unlock(__TI_LOCK_STREAM_TBL);
      return dev_fd;
   }
   
   _stream[llv_fd].dev = dev;
   _stream[llv_fd].dfd = dev_fd;
   if (!(dev->flags & _MSA)) dev->flags |= _BUSY;

   __TI_data_synch_WBINV(&_stream, sizeof(_stream));
   __TI_data_synch_WBINV(&_device, sizeof(_device));
   __TI_resource_unlock(__TI_LOCK_DEVICE_TBL);
   __TI_resource_unlock(__TI_LOCK_STREAM_TBL);

   return llv_fd;
}
