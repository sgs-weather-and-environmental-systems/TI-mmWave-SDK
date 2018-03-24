/*****************************************************************************/
/*  REMOVE_DEVICE.C v16.9.6                                                  */
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
/* IMPORTANT!                                                                */
/*                                                                           */
/*   For multi-threaded applications, accesses to shared resources MUST be   */
/*   protected. _device[] is a shared resources in this file.                */
/*   In the functions below, __TI_LOCK_DEVICE_TBL, is used to define         */
/*   critical regions to protect accesses to _device[].                      */
/*   Additionally, copies of _device[], will need to be made coherent        */
/*   between a given local data cache(s) and shared memory. The data         */
/*   synchronization API functions __TI_data_synch_INV() and                 */
/*   __TI_data_synch_WBINV() are used when necessary to update the shared    */
/*   memory copy of the object and invalidate the local data cache copy of   */
/*   the object before leaving a given critical region.                      */
/*                                                                           */
/*****************************************************************************/

#include "lowlev.h"
#include <string.h>

/******************************************************************************/
/*  REMOVEDEVICE() - remove the specified device record from the device table */
/******************************************************************************/
_CODE_ACCESS int remove_device(char *name)
{
   _DEVICE *ptr;

   /*-------------------------------------------------------------------------*/
   /* FIND RECORD AND SET NAME TO NULL                                        */
   /*-------------------------------------------------------------------------*/
   /* CRITICAL REGION PROTECTS ACCESS TO _device[]                            */
   /*-------------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_DEVICE_TBL);

   if (!(ptr = finddevice(name))) 
   { 
      __TI_data_synch_INV(&_device, sizeof(_device));
      __TI_resource_unlock(__TI_LOCK_DEVICE_TBL);
      return -1; 
   }

   ptr->name[0] = '\0';
   
   __TI_data_synch_WBINV(&_device, sizeof(_device));
   __TI_resource_unlock(__TI_LOCK_DEVICE_TBL);

   return 0;
}
