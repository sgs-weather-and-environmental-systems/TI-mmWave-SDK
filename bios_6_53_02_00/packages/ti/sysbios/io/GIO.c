/* 
 * Copyright (c) 2015 Texas Instruments Incorporated
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * */
/*
 *  ======== GIO.c ========
 */

#include <string.h>
#include <stdlib.h>

#include <xdc/std.h>
#include <xdc/runtime/Memory.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Log.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Startup.h>

#include <xdc/runtime/knl/ISync.h>
#include <xdc/runtime/knl/Sync.h>
#include <xdc/runtime/knl/SyncSemThread.h>

#include <ti/sysbios/knl/Queue.h>

#include <ti/sysbios/io/DEV.h>
#include <ti/sysbios/io/IOM.h>

#include <ti/sysbios/hal/Hwi.h>

#include "package/internal/GIO.xdc.h"



/*
 *************************************************************************
 *                      Static functions
 *************************************************************************
 */

/*
 *  ======== callback ========
 *  This function is called by the underlying IOM driver.
 */
static Void callback(Ptr cbArg, IOM_Packet *packet)
{
    GIO_Handle       obj = (GIO_Handle)cbArg;
    GIO_AppCallback  *appCallback = (GIO_AppCallback *)xdc_uargToPtr(packet->misc);
    Int              status;
    Ptr              addr;
    SizeT            size;
    Queue_Handle     list;
    UInt             key;

    key = Hwi_disable();
    obj->submitCount--;
    Hwi_restore(key);

    if (appCallback == NULL) {
        Sync_signal(obj->sync);
    }
    else {
        if (obj->model == GIO_Model_ISSUERECLAIM) {
            /* put packet on doneList where GIO_reclaim() will find it */
            list = GIO_Instance_State_doneList(obj);
    
            key = Hwi_disable();
            obj->doneCount++;
            Queue_enqueue(list, (Queue_Elem *)packet);
            Hwi_restore(key);

            Sync_signal(obj->sync);
        }
        else {
            list = GIO_Instance_State_freeList(obj);

            status = packet->status; 
            addr = packet->addr;
            size = packet->size;    

            key = Hwi_disable();
            obj->freeCount++;
            Queue_enqueue(list, (Queue_Elem *)packet);
            Hwi_restore(key);

            (*appCallback->fxn)(appCallback->arg, status, addr, size);
        }
    }
}

/*
 *************************************************************************
 *                      Module functions
 *************************************************************************
 */

/*
 *  ======== GIO_addDevice ========
 */
Int GIO_addDevice(String name, Ptr fxns, GIO_InitFxn initFxn, Int devid, Ptr deviceParams)
{
    DEV_Handle device;
    DEV_Params params;
    Error_Block eb;

    Error_init(&eb);
    DEV_Params_init(&params);
    params.deviceParams = deviceParams;
    params.initFxn = initFxn;
    params.devid = devid;

    device = DEV_create(name, fxns, &params, &eb);

    if (device != NULL) { 
        return (IOM_COMPLETED);
    }
    else {
        return (IOM_EBADIO);
    }
}
    
/*
 *  ======== GIO_removeDevice ========
 */
Int GIO_removeDevice(String name)
{
    DEV_Handle  device;

    DEV_match(name, &device);
 
    if (device != NULL) {
        DEV_delete(&device);

        return (IOM_COMPLETED);
    }
    else {
        return (IOM_EBADIO);
    }
}

/*
 *************************************************************************
 *                       Instance functions
 *************************************************************************
 */

/*
 *  ======== GIO_Instance_init ========
 */
Int GIO_Instance_init(GIO_Object *obj, String name, UInt mode,
    const GIO_Params *params, Error_Block *eb)
{
    Int                 i, status;
    Queue_Handle        doneList;
    Queue_Handle        freeList;
    DEV_Handle          device;
    IOM_Packet          *packets;
    IOM_Fxns            *iomFxns;
    Ptr                 devp;
    
    obj->name = name;
    obj->numPackets = params->numPackets;
    obj->packets = params->packets;
    obj->doneCount = 0;
    obj->freeCount = 0;
    obj->submitCount = 0;
    obj->mode = mode;
    obj->model = params->model;
    obj->timeout = params->timeout;

    obj->userPackets = (params->packets != NULL) ? TRUE : FALSE;

    if (params->sync == NULL) {       
        obj->userSync = FALSE;
        obj->sync = SyncSemThread_Handle_upCast(SyncSemThread_create(NULL, eb));
        if (obj->sync == NULL) {
            return (1);
        }
    }
    else {
        obj->sync = params->sync;
        obj->userSync = TRUE;
    }

    doneList = GIO_Instance_State_doneList(obj);
    Queue_construct(Queue_struct(doneList), NULL);
    
    freeList = GIO_Instance_State_freeList(obj);
    Queue_construct(Queue_struct(freeList), NULL);

    if (obj->packets == NULL) {
        /* allocate packets */
        obj->packets = Memory_alloc(NULL,
                sizeof(IOM_Packet) * (obj->numPackets), 0, eb);
    }

    if (obj->packets == NULL) {
        return (2);
    }

    obj->freeCount = obj->numPackets;
   
    /* 
     * Split the buffer into packets and add to freeList
     */
    packets = obj->packets;
    for (i = 0; i < obj->numPackets; i++) {
        Queue_enqueue(freeList, (Queue_Elem *)&packets[i]);
    }
    
    name = DEV_match(name, &device);    
        
    if (device == NULL) {
        /* The name was not found */
        Error_raise(eb, GIO_E_notFound, obj->name, 0);
        return (3);
    }

    obj->fxns = DEV_getFxns(device);
    iomFxns = (IOM_Fxns *)obj->fxns;       

    devp = DEV_getDevp(device);

    status = iomFxns->mdCreateChan(&obj->mdChan, devp, name, mode,
        params->chanParams, callback, obj);
  
    if (status != IOM_COMPLETED) {
        Error_raise(eb, GIO_E_createFailed, status, 0);
        return (4);
    }
    
    return (0);
}

/*
 *  ======== GIO_Instance_finalize ========
 */
Void GIO_Instance_finalize(GIO_Object *obj, Int status)
{    
    Queue_Handle            freeList;
    SyncSemThread_Handle    sync;
    IOM_Fxns                *iomFxns;

    iomFxns = (IOM_Fxns *)obj->fxns;

    /* fall through in switch below is intentional */
    switch (status) {
        case 0:        
            /* GIO_delete() */
            if (obj->submitCount > 0) {
                GIO_flush(obj);
            }
            iomFxns->mdDeleteChan(obj->mdChan);

            /* OK to fall through */                 

        case 4:
            /* mdCreateChan failed */

            /* OK to fall through */                 

        case 3:
            /* name not found */
            if (!obj->userPackets) {
                Memory_free(NULL, obj->packets,
                        sizeof(IOM_Packet) * obj->numPackets);
            }

            /* OK to fall through */                 
        
        case 2:
            /* alloc packets failed */
            freeList = GIO_Instance_State_freeList(obj);
            Queue_destruct(Queue_struct(freeList));
            
            if (obj->userSync == FALSE) {
                sync = SyncSemThread_Handle_downCast(obj->sync);
                SyncSemThread_delete(&sync);
            }

            /* OK to fall through */                 

        case 1:
            /* Sync_create failed */

            /* OK to fall through */                 

        default:
            break;
    }
}

/*
 *  ======== GIO_abort ========
 */
Int GIO_abort(GIO_Object *obj)
{
    return (GIO_submit(obj, IOM_ABORT, NULL, NULL, NULL));
}

/*
 *  ======== GIO_control ========
 */
Int GIO_control(GIO_Object *obj, UInt cmd, Ptr arg)
{
    IOM_Fxns *iomFxns;

    iomFxns = (IOM_Fxns *)obj->fxns;

    return (iomFxns->mdControlChan(obj->mdChan, cmd, arg));
}

/*
 *  ======== GIO_flush ========
 */
Int GIO_flush(GIO_Object *obj)
{
    return (GIO_submit(obj, IOM_FLUSH, NULL, NULL, NULL));
}

/*
 *  ======== GIO_read ========
 */
Int GIO_read(GIO_Object *obj, Ptr buf, SizeT *pSize)
{
    Assert_isTrue((obj->model == GIO_Model_STANDARD), GIO_A_badModel);

    return (GIO_submit(obj, IOM_READ, buf, pSize, NULL));
}

/*
 *  ======== GIO_write ========
 */
Int GIO_write(GIO_Object *obj, Ptr buf, SizeT *pSize)
{
    Assert_isTrue((obj->model == GIO_Model_STANDARD), GIO_A_badModel);

    return (GIO_submit(obj, IOM_WRITE, buf, pSize, NULL));
}

/*
 *  ======== GIO_submit ========
 */
Int GIO_submit(GIO_Object *obj, UInt cmd, Ptr buf,
        SizeT *pSize, GIO_AppCallback *appCallback)
{
    IOM_Packet      syncPacket;
    IOM_Packet      *packet;
    SizeT           nullSize; 
    Int             status;
    UInt            key;
    Queue_Handle    list;
    Error_Block     eb;
    IOM_Fxns        *iomFxns;

    iomFxns = (IOM_Fxns *)obj->fxns;

    if (appCallback == NULL) {
        packet = &syncPacket;
    }
    else {
        list = GIO_Instance_State_freeList(obj);

        if (obj->freeCount == 0) { 
            return (IOM_ENOPACKETS);
        }

        key = Hwi_disable();
        obj->freeCount--;
        packet = Queue_dequeue(list);
        Hwi_restore(key);
    }

    if (pSize == NULL) {
        nullSize = 0;
        pSize = &nullSize;
    }

    packet->cmd = cmd;
    packet->addr = buf;
    packet->size = *pSize;
    packet->status = IOM_COMPLETED;

    /*
     * 'appCallback' will be NULL for synchronous calls.
     * 'packet->misc' is used in the callback to call asynch callback
     * or post semaphore (sync).
     */
    packet->misc = (UArg)appCallback;

    status = iomFxns->mdSubmitChan(obj->mdChan, packet);

    if ((status == IOM_COMPLETED) || (status < 0)) {
        if (status == IOM_COMPLETED) {
            *pSize = packet->size;
            status = packet->status;
        }

        /* if asynch, put packet back on freeList */
        if (appCallback != NULL) {
            key = Hwi_disable();
            obj->freeCount++;
            Queue_enqueue(list, (Queue_Elem *)packet);
            Hwi_restore(key);
        }

        return (status);
    }

    /* 
     * call Sync_wait only if synchronous I/O and mdSubmitChan did not
     * return an error (status < 0)
     */
    if (appCallback == NULL) {
        Error_init(&eb);

        if (Sync_wait(obj->sync, obj->timeout, &eb) == 
                Sync_WaitStatus_SUCCESS) {
            *pSize = packet->size;
            status = packet->status;
        }
        else {
            *pSize = 0; 

            /*
             * NOTE: A channel timeout needs special handling. Timeouts are
             * usually due to some serious underlying device or system state
             * and may require the channel, or possibly the device,to be reset.
             * Because the mini-driver may still own the IOM_Packet here
             * driver's will need to perform timeout processing. We will call
             * the mini-driver's control fxn with the IOM_CHAN_TIMEDOUT command
             * code.
             */
            status = iomFxns->mdControlChan(obj->mdChan, 
                IOM_CHAN_TIMEDOUT, NULL);

            if (status != IOM_COMPLETED) {
                return (IOM_ETIMEOUTUNREC);  /* fatal, may have lost packet */
            }

            return (IOM_ETIMEOUT);
        }
    }

    return (status);
}

/*
 *  ======== GIO_prime ========
 */
Int GIO_prime(GIO_Object *obj, Ptr buf, SizeT size, UArg arg)
{
    Queue_Handle        freeList;
    IOM_Packet          *packet;
    UInt                key;

    Assert_isTrue((obj->model == GIO_Model_ISSUERECLAIM), GIO_A_badModel);

    /* GIO_prime() can only be used in output mode */
    if (obj->mode != GIO_OUTPUT) {
        return (IOM_EBADMODE);
    }

    freeList = GIO_Instance_State_freeList(obj);

    if (obj->freeCount == 0) {
        return (IOM_ENOPACKETS);
    }

    key = Hwi_disable();
    obj->freeCount--;
    packet = Queue_dequeue(freeList);
    Hwi_restore(key);

    packet->cmd = IOM_WRITE;
    packet->addr = buf;
    packet->size = size;
    packet->arg = arg;
    packet->status = IOM_COMPLETED;
    packet->misc = 1;   /* used in callback to indicate asynch packet */

    callback((Ptr)obj, packet);

    return (IOM_COMPLETED);
}

/*
 *  ======== GIO_issue ========
 */
Int GIO_issue(GIO_Object *obj, Ptr buf, SizeT size, UArg arg)
{
    IOM_Packet          *packet;
    Queue_Handle        freeList;
    Int                 status;
    UInt                key;
    UInt                cmd;
    IOM_Fxns            *iomFxns;

    iomFxns = (IOM_Fxns *)obj->fxns;

    Assert_isTrue((obj->model == GIO_Model_ISSUERECLAIM), GIO_A_badModel);

    freeList = GIO_Instance_State_freeList(obj);

    if (obj->freeCount == 0) {
        return (IOM_ENOPACKETS);
    }

    if (obj->mode == GIO_INPUT) {
        cmd = IOM_READ;
    }
    else {
        cmd = IOM_WRITE;
    }

    key = Hwi_disable();
    obj->freeCount--;
    packet = Queue_dequeue(freeList);
    Hwi_restore(key);

    packet->cmd = cmd;
    packet->addr = buf;
    packet->size = size;
    packet->arg = arg;
    packet->status = IOM_COMPLETED;
    packet->misc = 1;   /* used in callback to indicate asynch packet */
    
    status = iomFxns->mdSubmitChan(obj->mdChan, packet);

    key = Hwi_disable();
    obj->submitCount++;
    Hwi_restore(key);

    if (status == IOM_COMPLETED) {
        callback(obj, packet);
    }

    return (status);
}

/*
 *  ======== GIO_reclaim ========
 */
Int GIO_reclaim(GIO_Object *obj, Ptr *pBuf, SizeT *pSize, UArg *pArg)
{
    IOM_Packet          *packet;
    Queue_Handle        doneList;
    Queue_Handle        freeList;
    UInt                key;
    Int                 status;
    Error_Block         eb;
    
    doneList = GIO_Instance_State_doneList(obj);
    freeList = GIO_Instance_State_freeList(obj);

    Error_init(&eb);

    while (obj->doneCount == 0) {
        if (Sync_wait(obj->sync, obj->timeout, &eb) == 
                Sync_WaitStatus_TIMEOUT) {

            return (IOM_ETIMEOUT);
        }
    }

    key = Hwi_disable();
    obj->doneCount--;
    packet = Queue_dequeue(doneList);
    Hwi_restore(key);

    if (pArg != NULL) {
        *pArg = packet->arg;
    }

    /* pBuf is set to NULL by GIO_read() and GIO_write() */
    if (pBuf != NULL) {
        *pBuf = packet->addr;
    }

    if (pSize != NULL) {
        *pSize = packet->size;
    }

    status = packet->status;

    /* 
     * re-signal if more buffers are ready
     * This is required in the case of ISyncEvent and ISyncSwi to allow 
     * clients to reclaim a single buffer and not force them to bleed the 
     * stream.
     */
    if (obj->doneCount > 0) {
        Sync_signal(obj->sync);
    }

    /* recycle packet back onto free list */
    key = Hwi_disable();
    obj->freeCount++;
    Queue_enqueue(freeList, (Queue_Elem *)packet);
    Hwi_restore(key);

    return (status);
}
