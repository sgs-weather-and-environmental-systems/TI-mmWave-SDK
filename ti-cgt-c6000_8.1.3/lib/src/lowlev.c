/*****************************************************************************/
/*  LOWLEV.C v8.1.3                                                          */
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
/* Low level I/O routines                                                    */
/*                                                                           */
/* Functions:                                                                */
/*   finddevice()      - Search the device table for a device name.          */
/*   getdevice()       - Extract the device name and <find> it.              */
/*   add_device()      - Add a device record to the device table.            */
/*   remove_device()    - Remove the specified device record from the device */
/*                              table.                                       */
/*   open()            - Open file/device and assign file descriptor.        */
/*   read()            - Read data from an open file/device.                 */
/*   write()           - Write to an open file/device.                       */
/*   lseek()           - Perform lseek on open file/device.                  */
/*   close()           - Close an open file/device.                          */
/*   unlink()          - Perform unlink on file/device.                      */
/*   rename()          - Rename file                                         */
/*                                                                           */
/* IMPORTANT!                                                                */
/*                                                                           */
/*   For multi-threaded applications, accesses to shared resources MUST be   */
/*   protected. _device[], device_init, stream[] and stream_init are shared  */
/*   resources in this file. In the functions below, __TI_LOCK_DEVICE_TBL,   */
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
#include <stdio.h>
#include <string.h>
#include <_mutex.h>
#include <_data_synch.h>
#include "file.h"

typedef struct {
   char           name[9];
   unsigned short flags;
   int 	  	  (*OPEN) (const char *path, unsigned flags, int llv_fd);
   int 	  	  (*CLOSE) (int dev_fd);
   int 	  	  (*READ) (int dev_fd, char *buf, unsigned count);
   int 	  	  (*WRITE) (int dev_fd, const char *buf, unsigned count);
   off_t 	  (*LSEEK) (int dev_fd, off_t offset, int origin);
   int 	  	  (*UNLINK) (const char *path);
   int 	  	  (*RENAME) (const char *old_name, const char *new_name);
} _DEVICE;

extern _CODE_ACCESS int HOSTopen(const char *path, unsigned flags, int llv_fd),
                        HOSTclose(int dev_fd),
                        HOSTread(int dev_fd, char *buf, unsigned count),
                        HOSTwrite(int dev_fd, const char *buf, unsigned count),
                        HOSTunlink(const char *path),
                        HOSTrename(const char *old_name, const char *new_name);
extern _CODE_ACCESS off_t HOSTlseek(int dev_fd, off_t offset, int origin);

static _CODE_ACCESS _DEVICE *finddevice(const char *devname);
static _CODE_ACCESS _DEVICE *getdevice (const char **path);

static _DEVICE  
_device[_NDEVICE] = { { "", _MSA, HOSTopen, HOSTclose, HOSTread,
			HOSTwrite, HOSTlseek, HOSTunlink, HOSTrename } };

#define stdevice (&_device[0]) /* Default device (host) */

static struct stream_info { _DEVICE *dev; int dfd; } 
_stream[_NSTREAM] =  { { stdevice, 0 },  
		       { stdevice, 1 }, 
		       { stdevice, 2 } };


/*****************************************************************************/
/*  FINDDEVICE() - find the device record that matches devname in the device */
/*                     table                                                 */
/*****************************************************************************/
static _CODE_ACCESS _DEVICE *finddevice(const char *devname)
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
static _CODE_ACCESS _DEVICE *getdevice (const char **path)
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


/*****************************************************************************/
/*  ADDEVICE() - add a device record to the device table                     */
/*                                                                           */
/*               Return:                                                     */
/*               -1   if there is no empty slot in _device[] for new device  */
/*                0   if the new device was successfully added               */
/*                1   if the named device already exists (not updated)       */
/*****************************************************************************/
_CODE_ACCESS
int add_device(char     *name,
               unsigned  flags,
               int     (*dopen)  (const char *path, unsigned flags, int llv_fd),
               int     (*dclose) (int dev_fd),
               int     (*dread)  (int dev_fd, char *buf, unsigned count),
               int     (*dwrite) (int dev_fd, const char *buf, unsigned count),
               off_t   (*dlseek) (int dev_fd, off_t offset, int origin),
               int     (*dunlink)(const char *path),
               int     (*drename)(const char *old_name, const char *new_name))
{
   static _DATA_ACCESS int device_init = 0;
   _DEVICE *dt;

   /*-------------------------------------------------------------------------*/
   /* CRITICAL REGION PROTECTS ACCESS TO _device[]                            */
   /*-------------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_DEVICE_TBL);

   /*-------------------------------------------------------------------------*/
   /* INITIALIZE DEVICE TABLE FIRST TIME AROUND                               */
   /*-------------------------------------------------------------------------*/
   if (!device_init)
   {
      for (device_init = 1, dt = &_device[1]; dt != &_device[_NDEVICE]; 
            *(dt++)->name = '\0');
       __TI_data_synch_WBINV(&device_init, sizeof(device_init));
   }

   /*-------------------------------------------------------------------------*/
   /* IF DEVICE WITH SPECIFIED 'name' ALREADY EXISTS IN _device[], THEN WE    */
   /* CAN'T ADD A NEW ONE WITH THE SAME NAME (note that the function pointers */
   /* associated with the existing device are not updated).                   */
   /*-------------------------------------------------------------------------*/
   if (finddevice(name)) 
   {
      __TI_data_synch_INV(&_device, sizeof(_device));
      __TI_resource_unlock(__TI_LOCK_DEVICE_TBL);
      return 1;
   }

   /*-------------------------------------------------------------------------*/
   /* SEARCH THE DEVICE TABLE FOR AN EMPTY SLOT, RETURN -1 IF NONE FOUND      */
   /*-------------------------------------------------------------------------*/
   for (dt = &_device[1]; dt != _device+_NDEVICE && dt->name[0] != '\0'; ++dt);
   if (dt == &_device[_NDEVICE]) 
   { 
      __TI_data_synch_INV(&_device, sizeof(_device));
      __TI_resource_unlock(__TI_LOCK_DEVICE_TBL);
      return -1; 
   }

   strncpy(dt->name,name,8);
   dt->name[8] = '\0';
   dt->flags   = flags;
   dt->OPEN    = dopen;
   dt->CLOSE   = dclose;
   dt->READ    = dread;
   dt->WRITE   = dwrite;
   dt->LSEEK   = dlseek;
   dt->UNLINK  = dunlink;
   dt->RENAME  = drename;

   __TI_data_synch_WBINV(&_device, sizeof(_device));
   __TI_resource_unlock(__TI_LOCK_DEVICE_TBL);


   return 0;
}

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


/*****************************************************************************/
/*  READ() - read data from an open device/file                              */
/*****************************************************************************/
_CODE_ACCESS int read(int llv_fd, char *bufptr, unsigned cnt)
{
   int result;

   if (llv_fd < 0 || llv_fd >= _NSTREAM) return -1;

   /*------------------------------------------------------------------------*/
   /* CALL FUNCTION FROM DEVICE TABLE TO PERFORM READ FOR THIS DEVICE/FILE   */
   /*------------------------------------------------------------------------*/

   if (_stream[llv_fd].dev == NULL) 
   { 
      __TI_data_synch_INV(&_stream[llv_fd], sizeof(_stream[llv_fd]));
      return -1;
   }
   else
      result = (*(_stream[llv_fd].dev->READ))(_stream[llv_fd].dfd,bufptr,cnt);

   /*------------------------------------------------------------------------*/
   /* Invalidate both the device table entry that was referenced and the     */
   /* stream table entry associated with the input file descriptor (llv_fd). */
   /* It is possible (though unlikely) that the contents of the device table */
   /* entry and/or the stream table entry could be updated by another thread */
   /* before this thread accesses either of those objects again.             */
   /*------------------------------------------------------------------------*/
   __TI_data_synch_INV(_stream[llv_fd].dev, sizeof(_DEVICE));
   __TI_data_synch_INV(&_stream[llv_fd], sizeof(_stream[llv_fd]));

   return result;
}

/*****************************************************************************/
/*  WRITE() - write data to an open device/file                              */
/*****************************************************************************/
_CODE_ACCESS int write(int llv_fd, const char *bufptr, unsigned cnt)
{
   int result;

   if (llv_fd < 0 || llv_fd >= _NSTREAM) return -1;

   /*------------------------------------------------------------------------*/
   /* CALL FUNCTION FROM DEVICE TABLE TO PERFORM WRITE FOR THIS DEVICE/FILE  */
   /*------------------------------------------------------------------------*/

   if (_stream[llv_fd].dev == NULL) 
   { 
      __TI_data_synch_INV(&_stream[llv_fd], sizeof(_stream[llv_fd]));
      return -1;
   }
   else
      result = (*(_stream[llv_fd].dev->WRITE))(_stream[llv_fd].dfd,bufptr,cnt);

   /*------------------------------------------------------------------------*/
   /* Invalidate both the device table entry that was referenced and the     */
   /* stream table entry associated with the input file descriptor (llv_fd). */
   /* It is possible (though unlikely) that the contents of the device table */
   /* entry and/or the stream table entry could be updated by another thread */
   /* before this thread accesses either of those objects again.             */
   /*------------------------------------------------------------------------*/
   __TI_data_synch_INV(_stream[llv_fd].dev, sizeof(_DEVICE));
   __TI_data_synch_INV(&_stream[llv_fd], sizeof(_stream[llv_fd]));

   return result;
}

/*****************************************************************************/
/*  LSEEK() - lseek on an open device/file                                   */
/*****************************************************************************/
_CODE_ACCESS off_t lseek(int llv_fd, off_t offset, int origin)
{
   off_t result;

   if (llv_fd < 0 || llv_fd >= _NSTREAM) return -1;

   /*------------------------------------------------------------------------*/
   /* CALL FUNCTION FROM DEVICE TABLE TO PERFORM LSEEK FOR THIS DEVICE/FILE  */
   /*------------------------------------------------------------------------*/

   if (_stream[llv_fd].dev == NULL) 
   { 
      __TI_data_synch_INV(&_stream[llv_fd], sizeof(_stream[llv_fd]));
      return -1;
   }
   else
      result = (*(_stream[llv_fd].dev->LSEEK))
                                         (_stream[llv_fd].dfd, offset, origin);

   /*------------------------------------------------------------------------*/
   /* Invalidate both the device table entry that was referenced and the     */
   /* stream table entry associated with the input file descriptor (llv_fd). */
   /* It is possible (though unlikely) that the contents of the device table */
   /* entry and/or the stream table entry could be updated by another thread */
   /* before this thread accesses either of those objects again.             */
   /*------------------------------------------------------------------------*/
   __TI_data_synch_INV(_stream[llv_fd].dev, sizeof(_DEVICE));
   __TI_data_synch_INV(&_stream[llv_fd], sizeof(_stream[llv_fd]));

   return result;
}

/*****************************************************************************/
/*  CLOSE() - close an open device/file                                      */
/*****************************************************************************/
_CODE_ACCESS int close(int llv_fd)
{
   int      result;
#if defined(__TI_SHARED_DATA_SYNCHRONIZATION)
   _DEVICE *dev_ptr = NULL;
#endif

   if (llv_fd < 0 || llv_fd >= _NSTREAM) return -1;

   /*------------------------------------------------------------------------*/
   /* CALL FUNCTION FROM DEVICE TABLE TO PERFORM CLOSE FOR THIS DEVICE/FILE  */
   /* CLEAR STREAM TABLE ENTRY AND DEVICE FLAGS                              */
   /*------------------------------------------------------------------------*/
   /* CRITICAL REGION PROTECTS ACCESS TO _stream[] (see file header comment).*/
   /*------------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_STREAM_TBL);

   if (_stream[llv_fd].dev == NULL) 
   { 
      __TI_data_synch_INV(&_stream[llv_fd], sizeof(_stream[llv_fd]));
      __TI_resource_unlock(__TI_LOCK_STREAM_TBL);
      return -1;
   }

   /*------------------------------------------------------------------------*/
   /* We'll need to invalidate the device table entry that has the address   */
   /* of the CLOSE function in it, so hold on to its address. We guard the   */
   /* definition of dev_ptr here to avoid a "set but never refed" compile    */
   /* time error when building the RTS in a config that doesn't have shared  */
   /* data synchronization turned on.                                        */
   /*------------------------------------------------------------------------*/
#if defined(__TI_SHARED_DATA_SYNCHRONIZATION)
   dev_ptr = _stream[llv_fd].dev;
#endif
   if ( (result = (*(_stream[llv_fd].dev->CLOSE))(_stream[llv_fd].dfd)) != -1 )
   {
      _stream[llv_fd].dev->flags &= ~_BUSY;
      _stream[llv_fd].dev = NULL;
   }

   /*------------------------------------------------------------------------*/
   /* Invalidate both the device table entry that was referenced and the     */
   /* stream table entry associated with the input file descriptor (llv_fd). */
   /* It is possible (though unlikely) that the contents of the device table */
   /* entry and/or the stream table entry could be updated by another thread */
   /* before this thread accesses either of those objects again.             */
   /*------------------------------------------------------------------------*/
   /* For the address of the device table entry, we use a copy of            */
   /* _stream[llv_fd].dev (dev_ptr) that was made before _stream[llv_fd].dev */
   /* gets modified in the above if block.                                   */
   /*------------------------------------------------------------------------*/
   __TI_data_synch_INV(dev_ptr, sizeof(_DEVICE));
   __TI_data_synch_WBINV(&_stream[llv_fd], sizeof(_stream[llv_fd]));
   __TI_resource_unlock(__TI_LOCK_STREAM_TBL);

   return result;
}

/*****************************************************************************/
/*  UNLINK() - unlink an open device/file                                    */
/*****************************************************************************/

_CODE_ACCESS int unlink(const char *path)
{
   _DEVICE *dev;
   int      result;

   /*------------------------------------------------------------------------*/
   /* GET A DEVICE AND CALL FUNCTION FROM DEVICE TABLE TO PERFORM UNLINK     */
   /* FOR THIS DEVICE/FILE                                                   */
   /*------------------------------------------------------------------------*/
   /* CRITICAL REGION PROTECTS _device[] ACCESS THAT OCCURS IN getdevice()   */
   /* (see file header comment for more on mutex and data coherence).        */
   /*------------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_DEVICE_TBL);

   dev = getdevice(&path);
   result = (*(dev->UNLINK)) (path);

   __TI_data_synch_INV(&_device, sizeof(_device));
   __TI_resource_unlock(__TI_LOCK_DEVICE_TBL);

   return result;
}

/*****************************************************************************/
/*  RENAME() - rename a device/file                                          */
/*****************************************************************************/

_CODE_ACCESS int rename(const char *old_name, const char *new_name)
{
   _DEVICE *old_dev, *new_dev;
   int result;

   /*------------------------------------------------------------------------*/
   /* CRITICAL REGION PROTECTS _device[] ACCESS THAT OCCURS IN getdevice()   */
   /* (see file header comment for more on mutex and data coherence).        */
   /*------------------------------------------------------------------------*/
   __TI_resource_lock(__TI_LOCK_DEVICE_TBL);

   old_dev = getdevice(&old_name);
   new_dev = getdevice(&new_name);

   /*------------------------------------------------------------------------*/
   /* IF THE DEVICES ARE NOT THE SAME, RENAME WOULD REQUIRE A FILE COPY.     */
   /*------------------------------------------------------------------------*/
   if (old_dev != new_dev) 
   { 
      __TI_data_synch_INV(&_device, sizeof(_device));
      __TI_resource_unlock(__TI_LOCK_DEVICE_TBL);
      return -1; 
   }

   /*------------------------------------------------------------------------*/
   /* CALL FUNCTION FROM DEVICE TABLE TO PERFORM RENAME FOR THIS DEVICE/FILE */
   /*------------------------------------------------------------------------*/
   result = (*(old_dev->RENAME)) (old_name, new_name);

   __TI_data_synch_INV(&_device, sizeof(_device));
   __TI_resource_unlock(__TI_LOCK_DEVICE_TBL);
   
   return result;
}

