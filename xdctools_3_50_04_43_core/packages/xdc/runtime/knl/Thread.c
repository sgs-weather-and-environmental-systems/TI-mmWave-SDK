/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
 *  This program and the accompanying materials are made available under the 
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at 
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
 
/*
 *  ======== Thread.c ========
 */

#include <xdc/std.h>

#include <xdc/runtime/Error.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Memory.h>

#include "package/internal/Thread.xdc.h"

/*
 *  ======== Thread_Instance_init ========
 */
/* ARGSUSED */
Int Thread_Instance_init(Thread_Handle thread, Thread_RunFxn fxn,
         const Thread_Params* params, Error_Block* eb)
{
    Thread_Proxy_Params proxyParams;

    Thread_Proxy_Params_init(&proxyParams);
    proxyParams.arg = params->arg;
    proxyParams.priority = (Thread_Proxy_Priority)params->priority;
    proxyParams.osPriority = params->osPriority;
    if (params->stackSize != 0) {
        proxyParams.stackSize = params->stackSize;
    }
    else if (Thread_defaultStackSize != 0) {
        proxyParams.stackSize = Thread_defaultStackSize;
    }

    proxyParams.instance->name = params->instance->name;

    /* Save thread handle into delegate's tls to retrieve in thread_self() */
    proxyParams.tls = thread;
    thread->tls = params->tls;

    thread->proxyHandle = Thread_Proxy_create(fxn, &proxyParams, eb);

    return (0);
}

/*
 *  ======== Thread_Instance_finalize ========
 */
/* ARGSUSED */
Void Thread_Instance_finalize(Thread_Handle thread, Int status)
{
    /* status is equal to the return code from Instance_init */
    if (thread->proxyHandle != NULL) {
        Thread_Proxy_delete(&thread->proxyHandle);
    }
}

/*
 *  ======== Thread_self ========
 */
Thread_Handle Thread_self(Error_Block *eb)
{
    Thread_Proxy_Handle pHdl =  NULL;
    
    pHdl = Thread_Proxy_self(eb);

    if (pHdl == NULL) {
        return (NULL);
    }
    else {
        return ((Thread_Handle)Thread_Proxy_getTls(pHdl));
    }
}

/*
 *  ======== Thread_yield ========
 */
Bool Thread_yield(Error_Block *eb)
{
    return (Thread_Proxy_yield(eb));
}

/*
 *  ======== Thread_compareOsPriorities ========
 */
Int Thread_compareOsPriorities(Int p1, Int p2, Error_Block *eb)
{
    return (Thread_Proxy_compareOsPriorities(p1, p2, eb));
}

/*
 *  ======== Thread_join ========
 */
Bool Thread_join(Thread_Handle thread, Error_Block *eb)
{
    return (Thread_Proxy_join(thread->proxyHandle, eb));
}

/*
 *  ======== Thread_getPriority ========
 */
Thread_Priority Thread_getPriority(Thread_Handle thread, Error_Block *eb)
{
    return ((Thread_Priority)Thread_Proxy_getPriority(thread->proxyHandle, eb));
}

/*
 *  ======== Thread_setPriority ========
 */
Bool Thread_setPriority(Thread_Handle thread, Thread_Priority newPri, 
    Error_Block *eb)
{
    return (Thread_Proxy_setPriority(thread->proxyHandle, 
           (Thread_Proxy_Priority)newPri, eb));
}

/*
 *  ======== Thread_getOsPriority ========
 */
Int Thread_getOsPriority(Thread_Handle thread, Error_Block *eb)
{
    return (Thread_Proxy_getOsPriority(thread->proxyHandle, eb));
}

/*
 *  ======== Thread_setOsPriority ========
 */
Bool Thread_setOsPriority(Thread_Handle thread, Int newPri, 
    Error_Block *eb)
{
    return (Thread_Proxy_setOsPriority(thread->proxyHandle, newPri, eb));
}

/*
 *  ======== Thread_getOsHandle ========
 */
Ptr Thread_getOsHandle(Thread_Handle thread)
{
    return (Thread_Proxy_getOsHandle(thread->proxyHandle));
}


/*
 *  ======== Thread_getTls ========
 */
Ptr Thread_getTls(Thread_Handle thread)
{
    return (thread->tls);
}

/*
 *  ======== Thread_setTls ========
 */
Void Thread_setTls(Thread_Handle thread, Ptr tls)
{
    if (thread) {
        thread->tls = tls;
    }
}

/*
 *  ======== Thread_stat ========
 */
Bool Thread_stat(Thread_Handle thread, Thread_Stat* buf, Error_Block *eb)
{
    return (Thread_Proxy_stat(thread->proxyHandle, 
           (Thread_Proxy_Stat*)buf, eb));
}

/*
 *  ======== Thread_start ========
 */
Bool Thread_start(Error_Block *eb)
{
    return (Thread_Proxy_start(eb));
}

/*
 *  ======== Thread_sleep ========
 */
Bool Thread_sleep(UInt timeout, Error_Block *eb)
{
    Assert_isTrue((timeout != 0), Thread_A_zeroTimeout);

    return (Thread_Proxy_sleep(timeout, eb));
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

