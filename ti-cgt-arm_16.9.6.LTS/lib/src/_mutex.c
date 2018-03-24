/****************************************************************************/
/*  _mutex.c v16.9.6                                                        */
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
#include <_mutex.h>
#include <_pthread.h>

#include <stdio.h>
#include <stdlib.h>
#include "file.h"

/****************************************************************************/
/* To enable use of recursive resource mutexes, the library builder must    */
/* define the "__TI_RECURSIVE_RESOURCE_MUTEXES" compile-time symbol.        */
/****************************************************************************/
#if defined(__TI_RECURSIVE_RESOURCE_MUTEXES)


/****************************************************************************/
/* Recursive Mutex Implementation                                           */
/*                                                                          */
/* This file contains an implementation of recursvie mutexes. This          */
/* implementation is used by the public interface for locking and unlocking */
/* accesses to RTS-owned global resources (__TI_resource_lock() and         */
/* __TI_resource_unlock() below). The implementation uses a subset of the   */
/* POSIX Threads API that supplies the underlying OS-provided mutex         */
/* functionality.                                                           */
/****************************************************************************/

/****************************************************************************/
/* Recursive Mutex Object Specification                                     */
/****************************************************************************/
typedef struct {
   unsigned int    count;	/* recursive nesting level                  */
   pthread_t       owner;	/* unique thread ID of mutex owner          */
   pthread_mutex_t mutex;	/* handle to underlying mutex (OS-provided) */
} recursive_mutex_t;

/****************************************************************************/
/* Statically Allocated Array of Recursive Mutexes                          */
/****************************************************************************/
#define TI_NLOCKS	(__TI_LOCK_MAX + _NFILE)
static recursive_mutex_t ti_locks[TI_NLOCKS];
static size_t            ti_lockno = 0;

/****************************************************************************/
/* resource_mutexes[]                                                       */
/*                                                                          */
/* Array of unique opaque mutex handles for each global shared resource     */
/* that the TI RTS source owns. These mutexes are used to prevent possible  */
/* race conditions that may arise if two or more threads attempt to access  */
/* a shared resource at the same time.                                      */
/****************************************************************************/
static void *resource_mutexes[__TI_LOCK_MAX];

/****************************************************************************/
/* file_mutexes[]                                                           */
/*                                                                          */
/* Array of unique opaque mutex handles for each file that is managed by    */
/* the RTS. These mutexes are used to prevent possible race conditions that */
/* may arise if two or more threads attempt to access a file stream at the  */
/* same time. file_mutexes[i] is the mutex for file _ftable[i].             */
/****************************************************************************/
static void *file_mutexes[_NFILE];

/****************************************************************************/
/* Recursive Mutex Implementation - Function Prototypes                     */
/****************************************************************************/
static void create_resource_mutexes(void);
static void destroy_resource_mutexes(void);

static void init_mutexes(void);
static void delete_mutexes(void);

static void mutex_init(void **mtx);
static void mutex_destroy(void *mtx);
static void mutex_lock(void *mtx);
static void mutex_unlock(void *mtx);

/****************************************************************************/
/* Control Variable - used by TI RTS as argument to pthread_once() function */
/* to ensure that mutex creation / initialization only happens once during  */
/* the execution of an application.                                         */
/****************************************************************************/
static pthread_once_t ti_mutex_control = PTHREAD_ONCE_INIT;

/****************************************************************************/
/* Resource Mutex - Public Interface                                        */
/*                                                                          */
/* __TI_resource_lock() and __TI_resource_unlock() are the only two         */
/* functions used by the RTS to protect access to RTS-owned global shared   */
/* objects. The only other part of the public interface is the list of      */
/* available resource IDs.                                                  */
/****************************************************************************/

/****************************************************************************/
/* __TI_resource_lock()                                                     */
/*                                                                          */
/* Acquire a lock on a global shared resource using the unique mutex handle */
/* stored in the resource_mutexes[] array. The array is indexed by the      */
/* resource_type provided.                                                  */
/****************************************************************************/
_CODE_ACCESS void __TI_resource_lock(int resource_type)
{
   /*-----------------------------------------------------------------------*/
   /* Do we have a legal resource ID?                                       */
   /*-----------------------------------------------------------------------*/
   if (resource_type >= __TI_LOCK_MAX) abort();

   /*-----------------------------------------------------------------------*/
   /* The "once" function guarantees that the mutex initialization          */
   /* function, init_mutexes(), will only be called once during the life of */
   /* the application.                                                      */
   /*-----------------------------------------------------------------------*/
   pthread_once(&ti_mutex_control, init_mutexes);
   
   /*-----------------------------------------------------------------------*/
   /* Get the handle of the recursive mutex associated with the specified   */
   /* resource ID, and request a lock on it.                                */
   /*-----------------------------------------------------------------------*/
   if (resource_mutexes[resource_type]) 
      mutex_lock(resource_mutexes[resource_type]);
}

/****************************************************************************/
/* __TI_resource_unlock()                                                   */
/*                                                                          */
/* Release a lock on a global shared resource using the unique mutex handle */
/* stored in the resource_mutexes[] array. The array is indexed by the      */
/* resourc_type provided.                                                   */
/****************************************************************************/
_CODE_ACCESS void __TI_resource_unlock(int resource_type)
{
   /*-----------------------------------------------------------------------*/
   /* Do we have a legal resource ID?                                       */
   /*-----------------------------------------------------------------------*/
   if (resource_type >= __TI_LOCK_MAX) abort();

   /*-----------------------------------------------------------------------*/
   /* Get the handle of the recursive mutex associated with the specified   */
   /* resource ID, and release the lock on it.                              */
   /*-----------------------------------------------------------------------*/
   if (resource_mutexes[resource_type]) 
      mutex_unlock(resource_mutexes[resource_type]);
}

/****************************************************************************/
/* __TI_file_lock()                                                         */
/*                                                                          */
/* Acquire a lock on a file using the unique mutex handle stored in the     */
/* file_mutexes[] array. The array is indexed by FILE's index in _ftable.   */
/****************************************************************************/
_CODE_ACCESS void __TI_file_lock(FILE *_fp)
{
   int idx = _fp - _ftable; 
   /*-----------------------------------------------------------------------*/
   /* The "once" function guarantees that the mutex initialization          */
   /* function, init_mutexes(), will only be called once during the life of */
   /* the application.                                                      */
   /*-----------------------------------------------------------------------*/
   pthread_once(&ti_mutex_control, init_mutexes);

   /*-----------------------------------------------------------------------*/
   /* Get the handle of the recursive mutex associated with the specified   */
   /* file stream and request a lock on it. mutex_lock() will only be       */
   /* called on valid file streams.                                         */
   /*-----------------------------------------------------------------------*/
   if (_fp && idx < _NFILE && idx >= 0 && file_mutexes[idx])
      mutex_lock(file_mutexes[idx]);
}

/****************************************************************************/
/* __TI_file_unlock()                                                       */
/*                                                                          */
/* Release a lock on a file using the unique mutex handle stored in the     */
/* file_mutexes[] array. The array is indexed by FILE's index in _ftable.   */
/****************************************************************************/
_CODE_ACCESS void __TI_file_unlock(FILE *_fp)
{
   int idx = _fp - _ftable; 
   /*-----------------------------------------------------------------------*/
   /* Get the handle of the recursive mutex associated with the specified   */
   /* file stream and release the lock on it. mutex_unlock() will only be   */
   /* called on valid file streams.                                         */
   /*-----------------------------------------------------------------------*/
   if (_fp && idx < _NFILE && idx >= 0 && file_mutexes[idx])
      mutex_unlock(file_mutexes[idx]);
}

/****************************************************************************/
/* create_resource_mutexes()                                                */
/*                                                                          */
/* Create a mutex for each global shared resource that the TI RTS source    */
/* owns. These are global objects that are used to manage things like heap  */
/* memory or device I/O. Accesses to these global shared objects must be    */
/* protected to avoid race conditions in a multi-threaded environment.      */
/* For a full list of the resource types, see __TI_LOCK_* in _mutex.h.      */
/****************************************************************************/
static void create_resource_mutexes()
{
   int i;
   for (i = 0; i < __TI_LOCK_MAX; i++)
      mutex_init(&resource_mutexes[i]);
   
   for (i = 0; i < _NFILE; i++)
      mutex_init(&file_mutexes[i]);
}

/****************************************************************************/
/* delete_resource_mutexes()                                                */
/*                                                                          */
/* Delete all resource mutexes that were created by the TI RTS to guard     */
/* accesses to global shared objects.                                       */
/****************************************************************************/
static void destroy_resource_mutexes()
{
   int i;
   for (i = 0; i < __TI_LOCK_MAX; i++)
      if (resource_mutexes[i])
      {
         mutex_destroy(&resource_mutexes[i]);
         resource_mutexes[i] = NULL;
      }
   
   for (i = 0; i < _NFILE; i++)
      if (file_mutexes[i])
      {
         mutex_destroy(&file_mutexes[i]);
         file_mutexes[i] = NULL;
      }
}


/****************************************************************************/
/* Recursive Mutex Implementation                                           */
/****************************************************************************/

/****************************************************************************/
/* Creation and Deletion of Mutexes (Initialization / Termination).         */
/****************************************************************************/

/****************************************************************************/
/* Global function pointer to delete_mutexes() setup if/when resource       */
/* mutexes are initialized.                                                 */
/****************************************************************************/
extern _DATA_ACCESS void (*__TI_delete_mutexes_ptr)(void);

/****************************************************************************/
/* init_mutexes()                                                           */
/*                                                                          */
/* Create all mutexes that are needed by the TI RTS to protect accesses to  */
/* shared global resources.                                                 */ 
/*                                                                          */
/* This function may only be called once during the life of an application. */
/* To enforce this constraint, we use the pthread_once() function interface */
/* to call it (from __TI_resource_lock()). The first time pthread_once() is */
/* called on behalf of init_mutexes(), the pthread_once() function will     */
/* actually call init_mutexes() to set up the resource_mutexes[] array.     */
/* Each subsequent call to pthread_once() will observe that the init        */
/* function has already been executed and return without calling it again.  */
/****************************************************************************/
static void init_mutexes()
{
   /*-----------------------------------------------------------------------*/
   /* Create a mutex for each global shared resource that the TI RTS source */
   /* owns.                                                                 */
   /*-----------------------------------------------------------------------*/
   create_resource_mutexes();

   /*-----------------------------------------------------------------------*/
   /* We maintain a function pointer in exit.c as part of the resource      */
   /* mutexes implementation. It allows delete_mutexes() to be called       */
   /* indirectly from exit() only if the resource mutexes infrastructure    */
   /* has been initialized.                                                 */
   /*-----------------------------------------------------------------------*/
   /* Note that the recursive resource mutex API is intended for use ONLY   */
   /* within the RTS.                                                       */
   /*-----------------------------------------------------------------------*/
   __TI_delete_mutexes_ptr = delete_mutexes;
}

/****************************************************************************/
/* delete_mutexes()                                                         */
/*                                                                          */
/* Delete all mutexes that were created by the TI RTS to protect accesses   */
/* to shared global resources.                                              */
/****************************************************************************/
static void delete_mutexes()
{
   /*-----------------------------------------------------------------------*/
   /* Delete any resource mutex that was created by the TI RTS.             */
   /*-----------------------------------------------------------------------*/
   destroy_resource_mutexes();
}

/****************************************************************************/
/* mutex_init()                                                             */
/*                                                                          */
/* Initialize a mutex structure with a default owner thread ID, and get a   */
/* handle for the underlying OS-provided mutex.                             */
/****************************************************************************/
static void mutex_init(void **mtx)
{
   recursive_mutex_t *mp;

   if (ti_lockno < TI_NLOCKS)
      mp = *(recursive_mutex_t **)mtx = &ti_locks[ti_lockno++];
   else
      abort();

   mp->count = 0;
   mp->owner = 0;
   pthread_mutex_init(&mp->mutex, NULL);
}

/****************************************************************************/
/* mutex_destroy()                                                          */
/*                                                                          */
/* Destroy the underlying mutex associated with this mutex.                 */
/****************************************************************************/
static void mutex_destroy(void *mtx)
{
   recursive_mutex_t *mp = (recursive_mutex_t *)mtx;
   pthread_mutex_destroy(&mp->mutex);
}

/****************************************************************************/
/* mutex_lock()                                                             */
/*                                                                          */
/* Request to lock a recursive mutex via pthread_mutex_lock(). If noone is  */
/* currently using the lock or the current thread is not the owner of the   */
/* mutex, then we'll use pthread_mutex_lock() to acquire a lock on the      */
/* underlying OS-provided mutex. The call to pthread_mutex_lock() will      */
/* block until the lock is acquired.                                        */
/*                                                                          */
/* If the current thread already owns this mutex, then we simply bump the   */
/* use count to keep track of the nesting level of this lock request.       */
/****************************************************************************/
static void mutex_lock(void *mtx)
{
   pthread_t cur_thread_id = pthread_self();
   recursive_mutex_t *mp = (recursive_mutex_t *)mtx;

   if (!mp) return;

   /*-----------------------------------------------------------------------*/
   /* If lock is not being used or the lock request is being made on behalf */
   /* of a thread that is not the current owner of the lock, then we will   */
   /* use pthread_mutex_lock() to acquire the underlying OS-provided lock.  */
   /*-----------------------------------------------------------------------*/
   /* An OS-provided lock function underlies the pthread_mutex_lock() and   */
   /* will block until the requested resource lock is acquired. A thread    */
   /* that newly acquires a lock on a resource becomes the owner of the     */
   /* lock.                                                                 */
   /*-----------------------------------------------------------------------*/
   if ((mp->count == 0) || !pthread_equal(mp->owner, cur_thread_id))
   {
      pthread_mutex_lock(&mp->mutex);
      mp->owner = cur_thread_id;
   }

   ++mp->count;
}

/****************************************************************************/
/* mutex_unlock()                                                           */
/*                                                                          */
/* Request to release a lock on a mutex. Assuming that the request is       */
/* coming from the current owner of the mutex, we decrement the use count,  */
/* which indicates the nesting level of this unlock request, and if it hits */
/* zero (top-level lock/unlock) we use pthread_mutex_unlock() to release    */
/* the lock on the underlying OS-provided mutex.                            */
/****************************************************************************/
static void mutex_unlock(void *mtx)
{
   pthread_t cur_thread_id = pthread_self();
   recursive_mutex_t *mp = (recursive_mutex_t *)mtx;

   /*-----------------------------------------------------------------------*/
   /* If request to unlock a mutex comes from a different thread than the   */
   /* thread that currently owns the mutex, then we have some invalid       */
   /* nesting of critical sections somewhere in the RTS source. Panic!      */
   /*-----------------------------------------------------------------------*/
   if (!mp || (mp->count && !pthread_equal(mp->owner, cur_thread_id)))
      abort();

   /*-----------------------------------------------------------------------*/
   /* Decrement the recursive mutex's count to zero before releasing the    */
   /* lock on the underlying OS-provided mutex.                             */
   /*-----------------------------------------------------------------------*/
   if (--mp->count == 0) pthread_mutex_unlock(&mp->mutex);
}

#endif /* defined(__TI_RECURSIVE_RESOURCE_MUTEXES) */

