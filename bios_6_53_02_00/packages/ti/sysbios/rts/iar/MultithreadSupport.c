/*
 * Copyright (c) 2013-2017, Texas Instruments Incorporated
 * All rights reserved.
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
 */
/*
 *  ======== MultithreadSupport.c ========
 */

#ifdef __ICC430__
    #define _DLIB_THREAD_SUPPORT 3
    #define TLS "TLS16_I"
#endif

#include <xdc/std.h>

#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Memory.h>
#include <xdc/runtime/Types.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/hal/Hwi.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>

#include "package/internal/MultithreadSupport.xdc.h"

#include <yvals.h>

#if __ICC430__
#pragma segment=TLS
#elif __ICCARM__
#include <DLib_Threads.h>
#endif

#define MultithreadSupport_Lock ti_sysbios_rts_iar_MultithreadSupport_Lock

/* Lock struct definition */
typedef struct {
    Ptr owner;
    Int count;
    Semaphore_Struct sem;
} MultithreadSupport_Lock;

/*
 *  ======== MultithreadSupport_taskRegHook ========
 *  The Task register hook is called once per hookset, before main and before
 *  any Task initialization has been done.
 *
 *  This function allows the MultithreadSupport module to store its hookset id,
 *  which is passed to Task_get/setHookContext. The HookContext can be an
 *  arbitrary structure. The MultithreadSupport module has defined a HookContext
 *  to be of type void _DLIB_TLS_MEMORY *.
 */
Void MultithreadSupport_taskRegHook(Int id)
{
    MultithreadSupport_module->taskHId = id;
}

/*
 *  ======== MultithreadSupport_taskDeleteHook ========
 */
Void MultithreadSupport_taskDeleteHook(Task_Handle task)
{
#ifdef __ICC430__
    void _DLIB_TLS_MEMORY *pStoredContext;

    pStoredContext =
        (void _DLIB_TLS_MEMORY *)Task_getHookContext(task,
                                        MultithreadSupport_module->taskHId);

    if (pStoredContext != NULL) {
        __iar_dlib_perthread_deallocate(pStoredContext);
    }
#elif __ICCARM__
    void *pStoredContext;

    pStoredContext = (void *)Task_getHookContext(task,
                                        MultithreadSupport_module->taskHId);

    __call_thread_dtors();

    if (pStoredContext != NULL) {
        Memory_free(Task_Object_heap(), pStoredContext, __iar_tls_size());
    }
#endif
}

/*
 *  ======== MultithreadSupport_perThreadAccess ========
 */
#ifdef __ICC430__
Void _DLIB_TLS_MEMORY *MultithreadSupport_perThreadAccess(
    Void _DLIB_TLS_MEMORY *symbp)
{
    Task_Handle task;
    char _DLIB_TLS_MEMORY *pCurTaskEnv;
    BIOS_ThreadType type;

    /* Get the thread type */
    type = BIOS_getThreadType();
    Assert_isTrue(((type != BIOS_ThreadType_Hwi) &&
                   (type != BIOS_ThreadType_Swi)),
                    MultithreadSupport_A_badThreadType);

    /* If it is the main thread */
    if (type == BIOS_ThreadType_Main) {
        pCurTaskEnv =
            (char _DLIB_TLS_MEMORY *)__segment_begin(TLS);
        pCurTaskEnv += __IAR_DLIB_PERTHREAD_SYMBOL_OFFSET(symbp);

        return ((void _DLIB_TLS_MEMORY *)pCurTaskEnv);
    }

    task = Task_self();

    pCurTaskEnv = (char _DLIB_TLS_MEMORY *)Task_getHookContext(task,
            MultithreadSupport_module->taskHId);
    if (pCurTaskEnv == NULL) {
        /*
         * In case __iar_dlib_perthread_allocate fails, the heap proxy's alloc
         * function will internally call Error_raise(). Error_raise() logs the
         * error message and if the System proxy is SysStd, it will call
         * this function.
         *
         * In order to prevent an infinite call loop, assign the global
         * reentrancy structure to the current task. If allocation fails
         * and the System proxy is SysStd, it will let Error_raise()
         * print the error message.
         *
         */
        pCurTaskEnv = (char _DLIB_TLS_MEMORY *)__segment_begin(TLS);
        Task_setHookContext(task, MultithreadSupport_module->taskHId,
                            pCurTaskEnv);

        pCurTaskEnv = (char _DLIB_TLS_MEMORY *)__iar_dlib_perthread_allocate();
        if (pCurTaskEnv != NULL) {
            Task_setHookContext(task, MultithreadSupport_module->taskHId,
                            pCurTaskEnv);
        }
    }

    if (pCurTaskEnv != NULL) {
        pCurTaskEnv += __IAR_DLIB_PERTHREAD_SYMBOL_OFFSET(symbp);
    }

    return ((void _DLIB_TLS_MEMORY *)pCurTaskEnv);
}
#elif __ICCARM__
Void *MultithreadSupport_perThreadAccess(Void *symbp)
{
    return (NULL);
}
#endif

/*
 *  ======== MultithreadSupport_getTlsPtr ========
 */
#if __ICCARM__
#pragma section="__iar_tls$$DATA"
void *MultithreadSupport_getTlsPtr()
{
    void *pCurTaskEnv;
    BIOS_ThreadType type;

    /* get the thread type */
    type = BIOS_getThreadType();
    Assert_isTrue(((type != BIOS_ThreadType_Hwi) &&
            (type != BIOS_ThreadType_Swi)), MultithreadSupport_A_badThreadType);

    /* if still in the main thread, use TLS block allocated by linker */
    if (type == BIOS_ThreadType_Main) {
        pCurTaskEnv = (void *)__section_begin("__iar_tls$$DATA");
    }
    else {
        /*  Invoke internal function (generated by template), to get
         *  address of TLS. This function implementation will differ
         *  depending if SYS/BIOS is in ROM or not.
         */
        pCurTaskEnv = MultithreadSupport_getTlsAddr();
    }

    return (pCurTaskEnv);
}
#elif __ICC430__
Void *MultithreadSupport_getTlsPtr(Void)
{
    return (NULL);
}
#endif

/*
 *  ======== MultithreadSupport_initLock ========
 */
Void MultithreadSupport_initLock(Void **ptr)
{
    Semaphore_Params params;
    MultithreadSupport_Lock *p;

    /* Allocate a lock */
    p = (MultithreadSupport_Lock *)Memory_alloc(Task_Object_heap(),
                                   sizeof(MultithreadSupport_Lock), 0, NULL);
    if (p == NULL) {
        return;
    }

    /* Construct a binary semaphore */
    Semaphore_Params_init(&params);
    params.mode = Semaphore_Mode_BINARY;
    Semaphore_construct(&(p->sem), 1, &params);

    /* Initialize owner for this lock */
    p->owner = NULL;
    /* Initialize count for this lock */
    p->count = 0;

    /* Store the pointer to lock */
    *ptr = p;
}

/*
 *  ======== MultithreadSupport_destroyLock ========
 */
Void MultithreadSupport_destroyLock(Void **ptr)
{
    MultithreadSupport_Lock *p;

    /* Get the lock pointer */
    p = (MultithreadSupport_Lock *)*ptr;

    /* Destruct the semaphore */
    Semaphore_destruct(&(p->sem));

    /* Free the lock */
    Memory_free(Task_Object_heap(), p, sizeof(MultithreadSupport_Lock));
}

/*
 *  ======== MultithreadSupport_acquireLock ========
 */
Void MultithreadSupport_acquireLock(Void **ptr)
{
    MultithreadSupport_Lock *p;
    Ptr self;
    BIOS_ThreadType type;

    /* Get the lock pointer */
    p = (MultithreadSupport_Lock *)*ptr;

    /* Get the thread type */
    type = BIOS_getThreadType();
    if (type == BIOS_ThreadType_Main) {
        self = (Ptr)~(0);
    }
    else {
        self = (Ptr)Task_self();
    }

    /* If nested call is detected, increment lock count */
    if (p->owner == self) {
        (p->count)++;
    }
    else {
        /* acquire lock */
        Semaphore_pend(Semaphore_handle(&(p->sem)), BIOS_WAIT_FOREVER);
        p->count = 1;
        p->owner = self;
    }
}

/*
 *  ======== MultithreadSupport_releaseLock ========
 */
Void MultithreadSupport_releaseLock(Void **ptr)
{
    MultithreadSupport_Lock  *p;
    BIOS_ThreadType type;

    /* Get the lock pointer */
    p = (MultithreadSupport_Lock *)*ptr;

    /* Get the thread type */
    type = BIOS_getThreadType();
    /* Assert current task is the  owner */
    if (type == BIOS_ThreadType_Main) {
        Assert_isTrue((p->owner == (Ptr)~(0)),
                      MultithreadSupport_A_badLockRelease);
    }
    else {
        Assert_isTrue((p->owner == (Ptr)Task_self()),
                      MultithreadSupport_A_badLockRelease);
    }

    /* Decrement the counter */
    (p->count)--;

    /* Release lock */
    if (p->count == 0) {
        p->owner = NULL;
        Semaphore_post(Semaphore_handle(&(p->sem)));
    }

}
