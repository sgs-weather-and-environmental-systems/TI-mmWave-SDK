/*****************************************************************************/
/* GETDEVICE.C   v16.9.6                                                     */
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

#include "lowlev.h"
#include <string.h>

/*****************************************************************************/
/*  FINDDEVICE() - find the device record that matches devname in the device */
/*                     table                                                 */
/*****************************************************************************/
_CODE_ACCESS _DEVICE *finddevice(const char *devname)
{
   _DEVICE *dt;

   if (devname[0] == '\0') return NULL;

   /*------------------------------------------------------------------------*/
   /* SEARCH THE STREAM TABLE FOR THE DEVICE NAME - RETURN NULL IF NOT FOUND */
   /*------------------------------------------------------------------------*/
   for (dt = &_device[1]; dt != &_device[_NDEVICE]; ++dt)
       if (!strcmp(dt->name, devname)) return dt;

   return NULL;
}


/*****************************************************************************/
/*  GETDEVICE() - extract the device name and call finddevice                */
/*****************************************************************************/
_CODE_ACCESS _DEVICE *getdevice (const char **path)
{
   char devname[9];
   char *colon = strchr(*path, ':');
   _DEVICE *dev;

   if (colon != NULL)
   {
       int devnamlen = colon - *path;
       if (devnamlen > 8) devnamlen = 8;

       strncpy(devname, *path, devnamlen);
       devname[devnamlen] = '\0';
       dev = finddevice(devname);

       if (dev) { *path = colon + 1; return dev; }
   }

   return stdevice; /* the "standard" device - host I/O */
}
