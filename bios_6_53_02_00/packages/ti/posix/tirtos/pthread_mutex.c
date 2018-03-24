/*
 * Copyright (c) 2015-2017 Texas Instruments Incorporated - http://www.ti.com
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
 *  ======== pthread_mutex.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Diags.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Memory.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Queue.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>

/*
 *  For custom builds, this will always be defined, but it will
 *  not be defined when building just the library.  Make sure
 *  this goes ahead of _pthread.h.
 */
#ifndef ti_posix_tirtos_Settings_enableMutexPriority__D
#define ti_posix_tirtos_Settings_enableMutexPriority__D TRUE
#endif

#include <pthread.h>
#include <sys/types.h>
#include <time.h>
#include <errno.h>

#include "_pthread.h"
#include "pthread_util.h"


/*
 *  ======== pthread_mutex_Obj ========
 */
typedef struct pthread_mutex_Obj {
#if ti_posix_tirtos_Settings_enableMutexPriority__D
    /*
     *  Each thread maintains a list of PTHREAD_PRIO_INHERIT and
     *  PTHREAD_PRIO_PROTECT mutexes it owns.
     */
    Queue_Elem                 qElem;

    int                        protocol;

    /*
     *  The prioceiling will be used by both
     *  PTHREAD_PRIO_INHERIT and PTHREAD_PRIO_PROTECT
     *  mutexes.
     *
     *  For a PTHREAD_PRIO_PROTECT mutex, prioceiling is set at
     *  initialization to the pthread_mutexattr_t prioceiling, and
     *  can be changed at runtime with pthread_mutex_setprioceiling().
     *
     *  For a PTHREAD_PRIO_INHERIT mutex, the prioceiling will be
     *  set to the priority of the highest priority thread waiting on
     *  the mutex.  If no thread is waiting on the mutex, its prioceiling
     *  will be 0.
     *
     *  A thread holding a PTHREAD_PRIO_PROTECT or PTHREAD_PRIO_INHERIT
     *  mutex must run at a priority >= the mutex prioceiling.
     */
    int                        prioceiling;

    /*
     *  For a PTHREAD_PRIO_INHERIT mutex, keep a list of threads
     *  waiting on the mutex.  If the timeout expires for one of
     *  the waiting threads, we may need to lower the priority of
     *  the thread that owns the mutex.
     */
    Queue_Struct               waitList;
#endif

    pthread_Obj               *owner;
    int                        lockCnt;
    int                        type;
    Semaphore_Struct           sem;
} pthread_mutex_Obj;

static int acquireMutex(pthread_mutex_Obj *mutex, UInt32 timeout);
static int acquireMutexNone(pthread_mutex_Obj *mutex, UInt32 timeout);

#if ti_posix_tirtos_Settings_enableMutexPriority__D
static int acquireMutexPriority(pthread_mutex_Obj *mutex, UInt32 timeout);
static void adjustPri(pthread_Obj *thread);
static void removeMutex(pthread_mutex_Obj *mutex);
static void resetInheritPriority(pthread_mutex_Obj *mutex);
static void setInheritPriority(pthread_mutex_Obj *mutex, int priority);
static int setPrioCeiling(pthread_mutex_Obj *mutex);
#endif

/*
 *  Default mutex attrs.
 */
static pthread_mutexattr_t defAttrs = {
    PTHREAD_MUTEX_DEFAULT, /* type */
    PTHREAD_PRIO_NONE,     /* protocol */
    1,                     /* prioceiling */
};

/*
 *************************************************************************
 *                      pthread_mutexattr
 *************************************************************************
 */
/*
 *  ======== pthread_mutexattr_destroy ========
 */
int pthread_mutexattr_destroy(pthread_mutexattr_t *attr)
{
    return (0);
}

/*
 *  ======== pthread_mutexattr_getprioceiling ========
 */
int pthread_mutexattr_getprioceiling(const pthread_mutexattr_t *attr,
        int *prioceiling)
{
#if ti_posix_tirtos_Settings_enableMutexPriority__D
    *prioceiling = attr->prioceiling;
    return (0);
#else
    return (ENOSYS);
#endif
}

/*
 *  ======== pthread_mutexattr_gettype ========
 */
int pthread_mutexattr_gettype(const pthread_mutexattr_t *attr,
        int *type)
{
    *type = attr->type;
    return (0);
}

/*
 *  ======== pthread_mutexattr_getprotocol ========
 */
int pthread_mutexattr_getprotocol(const pthread_mutexattr_t *attr,
        int *protocol)
{
#if ti_posix_tirtos_Settings_enableMutexPriority__D
    *protocol = attr->protocol;
    return (0);
#else
    return (ENOSYS);
#endif
}

/*
 *  ======== pthread_mutexattr_init ========
 */
int pthread_mutexattr_init(pthread_mutexattr_t *attr)
{
    *attr = defAttrs;
    return (0);
}

/*
 *  ======== pthread_mutexattr_setprioceiling ========
 */
int pthread_mutexattr_setprioceiling(pthread_mutexattr_t *attr,
        const int prioceiling)
{
#if ti_posix_tirtos_Settings_enableMutexPriority__D
    if ((prioceiling >= (int)Task_numPriorities) || (prioceiling < 1)) {
        /* Bad priority value */
        return (EINVAL);
    }

    attr->prioceiling = prioceiling;
    return (0);
#else
    return (ENOSYS);
#endif
}

/*
 *  ======== pthread_mutexattr_setprotocol ========
 */
int pthread_mutexattr_setprotocol(pthread_mutexattr_t *attr, int protocol)
{
#if ti_posix_tirtos_Settings_enableMutexPriority__D
    if ((protocol != PTHREAD_PRIO_NONE) &&
            (protocol != PTHREAD_PRIO_INHERIT) &&
            (protocol != PTHREAD_PRIO_PROTECT)) {
        return (EINVAL);
    }

    attr->protocol = protocol;
    return (0);
#else
    return (ENOSYS);
#endif
}

/*
 *  ======== pthread_mutexattr_settype ========
 */
int pthread_mutexattr_settype(pthread_mutexattr_t *attr, int type)
{
    if ((type != PTHREAD_MUTEX_NORMAL) && (type != PTHREAD_MUTEX_RECURSIVE) &&
            (type != PTHREAD_MUTEX_ERRORCHECK)) {
        return (EINVAL);
    }

    attr->type = type;
    return (0);
}

/*
 *************************************************************************
 *                      pthread_mutex
 *************************************************************************
 */


/*
 *  ======== pthread_mutex_destroy ========
 */
int pthread_mutex_destroy(pthread_mutex_t *mutex)
{
    pthread_mutex_Obj *mutexObj = (pthread_mutex_Obj *)*mutex;

    if (mutexObj->owner != NULL) {
        return (EBUSY);
    }

#if ti_posix_tirtos_Settings_enableMutexPriority__D
    if (!Queue_empty(Queue_handle(&(mutexObj->waitList)))) {
        return (EBUSY);
    }

    Queue_destruct(&mutexObj->waitList);
#endif

    Semaphore_destruct(&mutexObj->sem);
    Memory_free(Task_Object_heap(), mutexObj, sizeof(pthread_mutex_Obj));

    *mutex = NULL;

    return (0);
}

/*
 *  ======== pthread_mutex_getprioceiling ========
 *
 *  Retuns:
 *    0      - Success.
 *    EINVAL - Mutex protocol is not PTHREAD_PRIO_PROTECT
 */
int pthread_mutex_getprioceiling(const pthread_mutex_t *mutex,
        int *prioceiling)
{
#if ti_posix_tirtos_Settings_enableMutexPriority__D
    pthread_mutex_Obj *mutexObj = (pthread_mutex_Obj *)*mutex;

    if (mutexObj->protocol != PTHREAD_PRIO_PROTECT) {
        return (EINVAL);
    }

    *prioceiling = mutexObj->prioceiling;
    return (0);
#else
    return (ENOSYS);
#endif
}

/*
 *  ======== pthread_mutex_init ========
 */
int pthread_mutex_init(pthread_mutex_t *mutex, const pthread_mutexattr_t *attr)
{
    pthread_mutex_Obj   *mutexObj;
    Semaphore_Params     semParams;
    Error_Block          eb;
    pthread_mutexattr_t *mAttrs;

    Error_init(&eb);

    *mutex = NULL;

    mutexObj = (pthread_mutex_Obj *)Memory_alloc(Task_Object_heap(),
            sizeof(pthread_mutex_Obj), 0, &eb);

    if (mutexObj == NULL) {
        return (ENOMEM);
    }

    mutexObj->owner = NULL;
    mutexObj->lockCnt = 0;

    mAttrs = (attr == NULL) ? &defAttrs : (pthread_mutexattr_t *)attr;

    mutexObj->type = mAttrs->type;

#if ti_posix_tirtos_Settings_enableMutexPriority__D
    mutexObj->protocol = mAttrs->protocol;
    mutexObj->prioceiling = (mAttrs->protocol == PTHREAD_PRIO_PROTECT) ?
            mAttrs->prioceiling : 0;

    Queue_elemClear((Queue_Elem *)mutexObj);
    Queue_construct(&(mutexObj->waitList), NULL);
#endif

    Semaphore_Params_init(&semParams);
    semParams.mode = Semaphore_Mode_BINARY;
    Semaphore_construct(&(mutexObj->sem), 1, &semParams);

    *mutex = (pthread_mutex_t)mutexObj;

    return (0);
}

/*
 *  ======== pthread_mutex_lock ========
 *
 *  Retuns:
 *    0      - Lock was successfully acquired.
 *    EINVAL - Mutex protocol is PTHREAD_PRIO_PROTECT and mutex prioceiling
 *             is lower than calling thread's priority
 *    EDEADLK - Mutex type is PTHREAD_MUTEX_ERRORCHECK and calling thread
 *              already owns the mutex.
 */
int pthread_mutex_lock(pthread_mutex_t *mutex)
{
    pthread_mutex_Obj *mutexObj = (pthread_mutex_Obj *)*mutex;

    return (acquireMutex(mutexObj, BIOS_WAIT_FOREVER));
}

/*
 *  ======== pthread_mutex_setprioceiling ========
 *
 *  Retuns:
 *    0      - Success.
 *    EINVAL - Mutex protocol is not PTHREAD_PRIO_PROTECT
 *           - prioceiling is out of range.
 */
int pthread_mutex_setprioceiling(pthread_mutex_t *mutex, int prioceiling,
        int *oldceiling)
{
#if ti_posix_tirtos_Settings_enableMutexPriority__D
    pthread_mutex_Obj *mutexObj = (pthread_mutex_Obj *)*mutex;
    int                ret;
    int                priority;

    if (mutexObj->protocol != PTHREAD_PRIO_PROTECT) {
        return (EINVAL);
    }

    if ((prioceiling >= (int)Task_numPriorities) || (prioceiling < 1)) {
        /* Bad priority value */
        return (EINVAL);
    }

    /*
     *  TODO: Check if new ceiling is lower than thread's priority
     *  Scheduled or running?  The thread's priority may have been
     *  boosted because it owns a PTHREAD_PRIO_INHERIT or another
     *  PTHREAD_PRIO_PROTECT mutex with a higher ceiling.
     */

    /*
     *  Lock the mutex (may block), then change the mutex
     *  priority ceiling and unlock the mutex.  Don't need to
     *  adhere to the PTHREAD_PRIO_PROTECT protocol when locking
     *  the mutex.  If we already own the mutex, check to see if
     *  this thread's priority needs to be bumped up.
     *  This call will deadlock if the mutex type is PTHREAD_MUTEX_NORMAL
     *  and we already own it.
     *
     *  TODO: If the calling thread has priority greater than
     *  the current priority ceiling of the mutex, we don't want
     *  to return an error.
     */
    if ((ret = pthread_mutex_lock(mutex)) == 0) {
        *oldceiling = mutexObj->prioceiling;
        mutexObj->prioceiling = prioceiling;

        if (mutexObj->lockCnt > 1) {
            /*
             *  Set this thread's priority to the new ceiling, if
             *  higher than the thread's priority
             */
            priority = Task_getPri(Task_self());
            if (priority < prioceiling) {
                Task_setPri(Task_self(), prioceiling);
            }
        }

        pthread_mutex_unlock(mutex);
    }

    return (ret);
#else
    return (ENOSYS);
#endif
}

/*
 *  ======== pthread_mutex_timedlock ========
 *
 *  Retuns:
 *    0      - Lock was successfully acquired.
 *    EINVAL - Mutex protocol is PTHREAD_PRIO_PROTECT and mutex prioceiling
 *             is lower than calling thread's priority
 *           - Bad nanoseconds value: < 0 or > 1000000000
 *    ETIMEDOUT - timeout expired before mutex could be acquired
 *    EDEADLK - Mutex type is PTHREAD_MUTEX_ERRORCHECK and calling thread
 *              already owns the mutex.
 */
int pthread_mutex_timedlock(pthread_mutex_t *mutex,
        const struct timespec *abstime)
{
    pthread_mutex_Obj *mutexObj = (pthread_mutex_Obj *)*mutex;
    UInt32             timeout;
    int                retc;

    /* must attempt operation before validating abstime */
    retc = acquireMutex(mutexObj, 0);

    if (retc != EBUSY) {
        return (retc);
    }

    if (_pthread_abstime2ticks(CLOCK_REALTIME, abstime, &timeout) != 0) {
        return (EINVAL);
    }

    /* requested abstime has already passed */
    if (timeout == 0) {
        return (ETIMEDOUT);
    }

    return (acquireMutex(mutexObj, timeout));
}

/*
 *  ======== pthread_mutex_trylock ========
 *  Retuns:
 *    0      - Lock was successfully acquired.
 *    EINVAL - Mutex protocol is PTHREAD_PRIO_PROTECT and mutex prioceiling
 *             is lower than calling thread's priority
 *    EBUSY  - The mutex is already locked and mutex is owned by another
 *             thread or not recursive.
 *    EDEADLK - Mutex type is PTHREAD_MUTEX_ERRORCHECK and calling thread
 *              already owns the mutex.
 */
int pthread_mutex_trylock(pthread_mutex_t *mutex)
{
    pthread_mutex_Obj *mutexObj = (pthread_mutex_Obj *)*mutex;

    return (acquireMutex(mutexObj, 0));
}

/*
 *  ======== pthread_mutex_unlock ========
 *  Retuns:
 *    0      - The mutex was successfully released.
 *    EPERM  - Calling thread does not own the mutex.
 */
int pthread_mutex_unlock(pthread_mutex_t *mutex)
{
    pthread_mutex_Obj *mutexObj = (pthread_mutex_Obj *)*mutex;
    UInt               key;

    key = Task_disable();

    if (mutexObj->owner != (pthread_Obj *)pthread_self()) {
        Task_restore(key);
        return (EPERM);
    }

    mutexObj->lockCnt--;

    if (mutexObj->lockCnt == 0) {
        mutexObj->owner = NULL;

#if ti_posix_tirtos_Settings_enableMutexPriority__D
        if (mutexObj->protocol == PTHREAD_PRIO_INHERIT) {
            mutexObj->prioceiling = 0;
        }

        /* This may change the thread's priority */
        if ((mutexObj->protocol == PTHREAD_PRIO_PROTECT) ||
                (mutexObj->protocol == PTHREAD_PRIO_INHERIT)) {
            removeMutex(mutexObj);
        }
#endif
        Semaphore_post(Semaphore_handle(&(mutexObj->sem)));
    }

    Task_restore(key);

    return (0);
}

/*
 *************************************************************************
 *                      Internal functions
 *************************************************************************
 */

#if ti_posix_tirtos_Settings_enableMutexPriority__D
/*
 *  ======== _pthread_getMaxPrioCeiling ========
 *  Return the maximum of the priority ceilings of the PTHREAD_PRIO_PROTECT
 *  and PTHREAD_PRIO_INHERIT mutexes owned by the thread.
 */
int _pthread_getMaxPrioCeiling(pthread_Obj *thread)
{
    pthread_mutex_Obj  *mutex;
    int                 maxPri = 0;
    int                 pri;
    UInt                key;

    /*
     *  If the thread is holding a PTHREAD_PRIO_PROTECT mutex and
     *  running at its ceiling, we don't want to set its priority
     *  to a lower value.  Instead, we save the new priority to set
     *  it to, once the mutexes of higher priority ceilings are
     *  released.
     */
    key = Task_disable();

    mutex = Queue_head(Queue_handle(&(thread->mutexList)));

    while (mutex != (pthread_mutex_Obj *)Queue_handle(&thread->mutexList)) {
        pri = mutex->prioceiling;
        maxPri = (pri > maxPri) ? pri : maxPri;
        mutex = (pthread_mutex_Obj *)Queue_next((Queue_Elem *)mutex);
    }

    Task_restore(key);

    return (maxPri);
}
#endif

/*
 *  ======== acquireMutex ========
 */
static int acquireMutex(pthread_mutex_Obj *mutex, UInt32 timeout)
{
#if ti_posix_tirtos_Settings_enableMutexPriority__D
    if ((mutex->protocol == PTHREAD_PRIO_PROTECT) ||
            (mutex->protocol == PTHREAD_PRIO_INHERIT)) {
        return (acquireMutexPriority(mutex, timeout));
    }
    else {
        return (acquireMutexNone(mutex, timeout));
    }
#else
    return (acquireMutexNone(mutex, timeout));
#endif
}

/*
 *  ======== acquireMutexNone ========
 */
static int acquireMutexNone(pthread_mutex_Obj *mutex, UInt32 timeout)
{
    UInt               key;
    pthread_Obj       *thisThread;

    thisThread = (pthread_Obj *)pthread_self();

    /* Return if the thread already owns the mutex */
    if (mutex->owner == thisThread) {
        if (mutex->type == PTHREAD_MUTEX_ERRORCHECK) {
            return (EDEADLK);
        }
        if (mutex->type == PTHREAD_MUTEX_RECURSIVE) {
            mutex->lockCnt++;
            return (0);
        }

        /*
         *  If we get here, the mutex type is PTHREAD_MUTEX_NORMAL, so
         *  deadlock will occur (with an infinite timeout).
         */
        Assert_isTrue(mutex->type != PTHREAD_MUTEX_NORMAL, 0);
    }

    /* See if the lock is available first */
    if (!Semaphore_pend(Semaphore_handle(&(mutex->sem)), 0)) {
        if (timeout == 0) {
            return (EBUSY);
        }

        if (!Semaphore_pend(Semaphore_handle(&(mutex->sem)), timeout)) {
            return (ETIMEDOUT);
        }

        /*
         *  At this point, we have the semaphore, but a higher priority
         *  task could preempt and try to acquire the mutex.  The owner
         *  of the mutex is still NULL.
         */
    }

    /* Got the semaphore, now set the owner, etc. */
    key = Task_disable();

    Assert_isTrue(mutex->owner == NULL, 0);
    Assert_isTrue(mutex->lockCnt == 0, 0);

    mutex->owner = thisThread;
    mutex->lockCnt = 1;

    Task_restore(key);

    return (0);
}

#if ti_posix_tirtos_Settings_enableMutexPriority__D
/*
 *  ======== acquireMutexPriority ========
 */
static int acquireMutexPriority(pthread_mutex_Obj *mutex, UInt32 timeout)
{
    UInt               key;
    Int                thisThreadPri;
    pthread_Obj       *thisThread;
    Queue_Handle       waitList;

    thisThread = (pthread_Obj *)pthread_self();

    key = Task_disable();

    thisThreadPri = Task_getPri(thisThread->task);

    if ((mutex->protocol == PTHREAD_PRIO_PROTECT) &&
            (mutex->prioceiling < thisThread->priority)) {
        Task_restore(key);
        return (EINVAL);
    }

    /* Return if the thread already owns the mutex */
    if (mutex->owner == thisThread) {
        if (mutex->type == PTHREAD_MUTEX_ERRORCHECK) {
            Task_restore(key);
            return (EDEADLK);
        }
        if (mutex->type == PTHREAD_MUTEX_RECURSIVE) {
            mutex->lockCnt++;
            Task_restore(key);

            return (0);
        }

        /*
         *  If we get here, the mutex type is PTHREAD_MUTEX_NORMAL, so
         *  deadlock will occur with an infinite timeout.
         */
        Assert_isTrue(timeout != BIOS_WAIT_FOREVER, 0);
    }

    /* See if the lock is available first */
    if (!Semaphore_pend(Semaphore_handle(&(mutex->sem)), 0)) {
        if (timeout == 0) {
            Task_restore(key);
            return (EBUSY);
        }

        /*
         *  Another thread owns the mutex (or this one does and type is
         *  NORMAL).
         *  For PTHREAD_PRIO_INHERIT mutex, bump the priority of the
         *  mutex owner, if it is lower than the calling thread's priority.
         */
        if (mutex->protocol == PTHREAD_PRIO_INHERIT) {

            /*
             *  Boost the mutex owner's priority
             *  Note: The calling thread may own a PTHREAD_PRIO_PROTECT
             *  mutex with prioceiling less than the calling thread's
             *  priority.
             */
            setInheritPriority(mutex, thisThreadPri);

            /*
             *  Put this thread at the end of the queue.  Priorty
             *  can be changed (eg, if this thread owns a mutex that
             *  a higher priority thread tries to acquire), so there
             *  is no point in sorting the queue.
             */
            waitList = Queue_handle(&(mutex->waitList));
            Queue_enqueue(waitList, (Queue_Elem *)thisThread);
            thisThread->blockedMutex = (pthread_mutex_t)mutex;
        }

        Task_restore(key);

        if (!Semaphore_pend(Semaphore_handle(&(mutex->sem)), timeout)) {

            /* Adjust prioceiling if mutex protocol is PTHREAD_PRIO_INHERIT */
            if (mutex->protocol == PTHREAD_PRIO_INHERIT) {

                key = Task_disable();

                thisThread->blockedMutex = NULL;

                /* Remove thread from mutex wait queue */
                Queue_remove((Queue_Elem *)thisThread);

                /* Re-adjust inherited priorities, if necessary. */
                resetInheritPriority(mutex);

                Task_restore(key);
            }

            return (ETIMEDOUT);
        }

        /*
         *  At this point, we have the semaphore, but a higher priority
         *  task could preempt and try to acquire the mutex.  The owner
         *  of the mutex is still NULL.
         */

        /* Got the semaphore, now set the owner, etc. */
        key = Task_disable();

        thisThread->blockedMutex = NULL;

        if (mutex->protocol == PTHREAD_PRIO_INHERIT) {
            /* Remove thread from mutex wait queue */
            Queue_remove((Queue_Elem *)thisThread);
        }
    }

    Assert_isTrue(mutex->owner == NULL, 0);
    Assert_isTrue(mutex->lockCnt == 0, 0);

    mutex->owner = thisThread;
    mutex->lockCnt = 1;

    if (mutex->protocol == PTHREAD_PRIO_INHERIT) {
        /*
         *  Check the waitList.  The owner would have set the priority
         *  ceiling to 0 when unlocking the mutex, but there may still
         *  be threads waiting.  The waitList could also have been
         *  modified after this thread got the semaphore, but before
         *  we called Task_disable() to set the owner.
         */
        setPrioCeiling(mutex);
    }

    /* Add the mutex to this thread's list of owned mutexes */
    if ((mutex->protocol == PTHREAD_PRIO_PROTECT) ||
            (mutex->protocol == PTHREAD_PRIO_INHERIT)) {

        Queue_enqueue(Queue_handle(&(thisThread->mutexList)),
                (Queue_Elem *)mutex);

        thisThreadPri = Task_getPri(thisThread->task);

        if (mutex->prioceiling > thisThreadPri) {
            Task_setPri(Task_self(), mutex->prioceiling);
        }
    }

    Task_restore(key);

    return (0);
}
#endif

#if ti_posix_tirtos_Settings_enableMutexPriority__D
/*
 *  ======== adjustPri ========
 *  Adjust thread's priorty to the max of the priority ceilings of the
 *  mutexes it owns and its scheduled priority.  Must be called with
 *  Task scheduling disabled.
 */
static void adjustPri(pthread_Obj *thread)
{
    int                 maxCeiling;
    int                 priority = thread->priority;

    maxCeiling = _pthread_getMaxPrioCeiling(thread);

    priority = (maxCeiling > priority) ? maxCeiling : priority;
    Task_setPri(thread->task, priority);
}
#endif

#if ti_posix_tirtos_Settings_enableMutexPriority__D
/*
 *  ======== removeMutex ========
 *  Remove a PTHREAD_PRIO_PROTECT or PTHREAD_PRIO_INHERIT mutex from the
 *  queue and restore priority, if necessary.
 *  Call with Task scheduling disabled.
 */
static void removeMutex(pthread_mutex_Obj *mutex)
{
    pthread_Obj        *thread = (pthread_Obj *)pthread_self();

    Queue_remove((Queue_Elem *)mutex);
    adjustPri(thread);
}
#endif

#if ti_posix_tirtos_Settings_enableMutexPriority__D
/*
 *  ======== resetInheritPriority ========
 *  Called after a timeout, to recalculate inherited priorities
 */
static void resetInheritPriority(pthread_mutex_Obj *mutex)
{
    pthread_Obj       *owner;
    pthread_mutex_Obj *next;
    int                priority;
    int                ownerPri;

    owner = mutex->owner;
    next = mutex;

    while (owner != NULL) {
        ownerPri = _pthread_getRunningPriority(owner);

        /*
         *  Set the priority ceiling of the mutex to the priority of the
         *  highest priority thread blocked on the mutex.
         */
        priority = setPrioCeiling(next);

        /*
         *  We only need to adjust the owning thread's priority if
         *  it is higher than the mutex priority ceiling.
         */
        if (ownerPri <= priority) {
            break;
        }

        /*
         *  The owner will set its priority to the maximum of its priority
         *  and the priority ceilings of all the mutexes it owns.
         */
        adjustPri(owner);

        next = ((pthread_Obj *)(owner))->blockedMutex;
        owner = (next == NULL) ? NULL : (pthread_Obj *)(next->owner);
    }
}
#endif

#if ti_posix_tirtos_Settings_enableMutexPriority__D
/*
 *  ======== setInheritPriority ========
 */
static void setInheritPriority(pthread_mutex_Obj *mutex, int priority)
{
    pthread_Obj       *owner;
    pthread_mutex_Obj *next;
    int                ownerPri;

    owner = mutex->owner;
    next = mutex;

    while (owner != NULL) {
        ownerPri = _pthread_getRunningPriority((pthread_t)owner);

        if (ownerPri < priority) {
            /* Boost the mutex owner's priority */
            _pthread_setRunningPriority((pthread_t)owner, priority);
            next->prioceiling = priority;
        }
        else {
            /*
             *  The chain of threads will have increasing (>=) priorities,
             *  due to inheritence, so there is no reason to continue
             *  when we reach an owner with priority >= this thread's
             *  priority.  We also don't want to loop forever, in case
             *  there is a cyclic dependency on the mutexes.
             */
            break;
        }

        next = ((pthread_Obj *)(owner))->blockedMutex;
        owner = (next == NULL) ? NULL : (pthread_Obj *)(next->owner);
    }
}
#endif

#if ti_posix_tirtos_Settings_enableMutexPriority__D
/*
 *  ======== setPrioCeiling ========
 */
static int setPrioCeiling(pthread_mutex_Obj *mutex)
{
    pthread_t          pthread;
    Queue_Handle       waitList;
    int                priority = 0;

    Assert_isTrue(mutex->protocol == PTHREAD_PRIO_INHERIT, 0);

    waitList = Queue_handle(&(mutex->waitList));
    pthread = (pthread_t)Queue_head(waitList);
    mutex->prioceiling = 0;

    while (pthread != (pthread_t)waitList) {
        priority = _pthread_getRunningPriority(pthread);
        if (priority > mutex->prioceiling) {
            mutex->prioceiling = priority;
        }
        pthread = (pthread_t)Queue_next((Queue_Elem *)pthread);
    }

    return (priority);
}
#endif
