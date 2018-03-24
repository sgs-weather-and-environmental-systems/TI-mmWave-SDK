/****************************************************************************/
/*  pthread.c v16.9.6                                                       */
/*                                                                          */
/* Copyright (c) 2012-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/
#include <stdlib.h>
#include <_reg_mutex_api.h>
#include <_pthread.h>
#include <_lock.h>

/****************************************************************************/
/* The pthread functions implemented by the TI RTS are intended only for    */
/* use by the implementation of the recursive resource mutexes. To enable   */
/* these, the library builder must define the                               */
/* "__TI_RECURSIVE_RESOURCE_MUTEXES" compile-time symbol.                   */
/****************************************************************************/
#if !defined(__TI_RECURSIVE_RESOURCE_MUTEXES)
#define _register_mutex_api(p1,p2,p3,p4,p5)

#else
/****************************************************************************/
/* Mutex API Registration - Called by OS to identify mutex services that    */
/* can be used by the pthreads API to support TI RTS mutex objects.         */
/****************************************************************************/
static void *(*mutex_api_create)(void)    = NULL;
static void  (*mutex_api_destroy)(void *) = NULL;
static void  (*mutex_api_lock)(void *)    = NULL;
static void  (*mutex_api_unlock)(void *)  = NULL;
static int   (*mutex_api_thread_id)(void) = NULL;

_CODE_ACCESS void _register_mutex_api(void *(*create)   (void),
                                      void  (*destroy)  (void *),
                                      void  (*lock)     (void *),
                                      void  (*unlock)   (void *),
                                      int   (*thread_id)(void))

{
   mutex_api_create    = create;
   mutex_api_destroy   = destroy;
   mutex_api_lock      = lock;
   mutex_api_unlock    = unlock;
   mutex_api_thread_id = thread_id;
}

/****************************************************************************/
/* POSIX Threads API Subset - Use OS-provided mutex API functions to        */
/* implement underlying mutex that is used by the TI RTS mutex objects.     */
/* This subset of the POSIX Threads API provides support for creating,      */
/* destroying, locking, and unlocking an OS-provided mutex.                 */
/****************************************************************************/
/****************************************************************************/
/* pthread_mutex_init()                                                     */
/*                                                                          */
/* Request the creation of a new mutex and store a handle to it at the      */
/* location provided by the caller.                                         */
/*--------------------------------------------------------------------------*/
/* NOTE: The POSIX Threads API specification calls for an 'attr' argument,  */
/*       but we don't use it. All calls into this function should pass a    */
/*       NULL value in for the 'attr' argument.                             */
/****************************************************************************/
_CODE_ACCESS int pthread_mutex_init(pthread_mutex_t           *mutex, 
                                    const pthread_mutexattr_t *attr)
{
   *mutex = NULL;
   if (SYSTEM_WIDE_LOCK_REGISTERED || SYSTEM_WIDE_UNLOCK_REGISTERED) return 0;
   if (mutex_api_create) *mutex = (*mutex_api_create)();
   return 0;
}

/****************************************************************************/
/* pthread_mutex_destroy()                                                  */
/*                                                                          */
/* Given a handle to a mutex that needs to be deleted, delete it.           */
/****************************************************************************/
_CODE_ACCESS int pthread_mutex_destroy(pthread_mutex_t *mutex)
{
   if (mutex && mutex_api_destroy) (*mutex_api_destroy)(*mutex);
   return 0;
}

/****************************************************************************/
/* pthread_mutex_lock()                                                     */
/*                                                                          */
/* Request a lock on a mutex. Thread will block until it acquires the lock. */
/****************************************************************************/
_CODE_ACCESS int pthread_mutex_lock(pthread_mutex_t *mutex)
{
   if (SYSTEM_WIDE_LOCK_REGISTERED) (_lock)();
   else if (mutex && mutex_api_lock) (*mutex_api_lock)(*mutex);
   return 0;
}

/****************************************************************************/
/* pthread_mutex_unlock()                                                   */
/*                                                                          */
/* Release a lock on a mutex.                                               */ 
/****************************************************************************/
_CODE_ACCESS int pthread_mutex_unlock(pthread_mutex_t *mutex)
{
   if (SYSTEM_WIDE_UNLOCK_REGISTERED) (_unlock)();
   else if (mutex && mutex_api_unlock) (*mutex_api_unlock)(*mutex);
   return 0;
}

/****************************************************************************/
/* Thread Identification - A multi-threaded application that uses the RTS   */
/* must register a thread id function which returns a unique thread ID in   */
/* order to enforce that a lock cannot be nested unless all of the requests */
/* to lock a mutex come from the same thread. That is, only the thread that */
/* owns the lock on a mutex can make a nested lock request on the same      */
/* mutex without blocking.                                                  */
/****************************************************************************/
/****************************************************************************/
/* pthread_self()                                                           */
/*                                                                          */
/* If the RTS-user has registered a thread id function in the mutex API,    */
/* then use it to get a unique thread id that can be used to indicate       */
/* which thread owns a lock on a mutex.                                     */
/****************************************************************************/
_CODE_ACCESS pthread_t pthread_self(void)
{
   if (mutex_api_thread_id) return (pthread_t)(*mutex_api_thread_id)();
   return ((pthread_t)0);
}

/****************************************************************************/
/* pthread_equal()                                                          */
/*                                                                          */
/* Check equivalence between two thread IDs. This function is used to check */
/* whether the thread that is currently requesting a lock on a mutex is the */
/* same thread that owns the lock on the mutex.                             */
/****************************************************************************/
_CODE_ACCESS int pthread_equal(pthread_t thread1, pthread_t thread2)
{
   return (thread1 == thread2);
}

/****************************************************************************/
/* One-Time Execution Guaranteed - the creation of all of the mutexes that  */
/* are needed by the TI RTS to support thread safety should only happen     */
/* once during the execution of an application. To ensure this, the         */
/* initialization function is called via the pthread_once() interface.      */
/****************************************************************************/
/****************************************************************************/
/* pthread_once()                                                           */
/*                                                                          */
/* Use the caller provided 'once_control' argument to decide whether or not */
/* to actually call the 'init_routine'. The idea is that the 'init_routine' */
/* should only be called once during the execution of an application.       */
/*                                                                          */
/* This function should be the only place where a new value is written to   */
/* the control variable. That write is protected via a critical section.    */
/****************************************************************************/
static pthread_mutex_t once_mutex = NULL;
_CODE_ACCESS int pthread_once(pthread_once_t *once_control,
                              void (*init_routine)(void))
{
   /*-----------------------------------------------------------------------*/
   /* This is a quick return that avoids the need for using the mutex API   */
   /* to create a critical section around the access to the 'once_control'. */
   /*-----------------------------------------------------------------------*/
   if (!once_control || (*once_control != PTHREAD_ONCE_INIT)) return 0;

   /*-----------------------------------------------------------------------*/
   /* If the initialization routine has not been executed yet, use a        */
   /* critical section to guard accesses to the 'once_control' argument     */
   /* from this point on.                                                   */
   /*-----------------------------------------------------------------------*/
   /* This will work even if two or more threads arrive here at the exact   */
   /* same time. Only one thread can acquire the mutex that guards the      */
   /* write to the once control variable. If it is the first thread to      */
   /* execute this code, it will write the PTHREAD_ONCE_EXECUTED value to   */
   /* the once control variable. Each successive thread that goes through   */
   /* here will be directed around the write via the check of the once      */
   /* control variable vs. PTHREAD_ONCE_INIT.                               */
   /*-----------------------------------------------------------------------*/
   if (!once_mutex) pthread_mutex_init(&once_mutex, NULL);
   pthread_mutex_lock(&once_mutex);

   /*-----------------------------------------------------------------------*/
   /* This extra check of the 'once_control' is needed in case two or more  */
   /* threads make it past the first check. Only one thread will actually   */
   /* call the initialization routine and write to the 'once_control'.      */
   /*-----------------------------------------------------------------------*/
   if (*once_control == PTHREAD_ONCE_INIT)
   {
      *once_control = PTHREAD_ONCE_EXECUTED;
      (*init_routine)();
   }
							     
   /*-----------------------------------------------------------------------*/
   /* End of critical section.                                              */
   /*-----------------------------------------------------------------------*/
   pthread_mutex_unlock(&once_mutex);
   return 0;
}

#endif
