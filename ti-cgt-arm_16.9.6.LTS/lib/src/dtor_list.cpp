/*****************************************************************************/
/* dtor_list.cpp v16.9.6                                                     */
/* Copyright (c) 1996-2017 Texas Instruments Inc., all rights reserved       */
/*****************************************************************************/
/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
/*
Redistribution and use in source and binary forms are permitted
provided that the above copyright notice and this paragraph are
duplicated in all source code forms.  The name of Edison Design
Group, Inc. may not be used to endorse or promote products derived
from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
Any use of this software is at the user's own risk.
*/
/*

dtor_list.c -- destruction list processing.

*/

#include "basics.h"
#include "runtime.h"
#pragma hdrstop
/*** START TI ADD ***/
/* 
TI implementation of RTS uses __TI_LOCK_ATEXIT mutex to protect access to 
needed_destruction_head, so include _mutex.h. The data synch API is also
used to maintain the consistency of the system-wide value for __TI_dtors_ptr,
so include _data_synch.h as well.
*/
#include <_mutex.h>
#include <_data_synch.h>

/* TI implementation of RTS does not need the definition in static_init.h.
TI RTS only needs IA64_ABI part of this file. */
/*** END TI ADD ***/
#include "dtor_list.h"

#if !defined(__EDG_IA64_ABI) || !SYSTEM_RUNTIME_HAS_IA64_SUPPORT || \
    !SYSTEM_RUNTIME_HAS_IA64_ATEXIT

/*
The list of static objects that require destruction.  An entry is
added to the front of this list each time a new destructible static
object is created.
*/
/*** START TI REPLACE ***/
static _DATA_ACCESS a_needed_destruction_ptr
		needed_destruction_head = NULL;
/*** END TI REPLACE ***/

#endif /* !defined(__EDG_IA64_ABI) || !SYSTEM_RUNTIME_HAS_IA64_SUPPORT
          !SYSTEM_RUNTIME_HAS_IA64_ATEXIT */


#ifndef __EDG_IA64_ABI

void __process_needed_destructions(void)
/*
Go through the needed destructions list and perform the required
destructions.
*/
{
  a_needed_destruction_ptr	ndp;
  while (needed_destruction_head != NULL) {
    void	*object_ptr;
    /* Note that the value of needed_destruction_head may change
       during the execution of the destructor.  Consequently, the
       current entry is removed from the list before the destructor
       routine is called. */
    ndp = needed_destruction_head;
    needed_destruction_head = needed_destruction_head->next;
    object_ptr = ndp->object;
    /* Choose between a simple and complex destruction based on whether
       or not the object pointer is NULL. */
    if (object_ptr != NULL) {
      a_destructor_ptr	dp;
      /* Destroy the object by calling a destructor.  The flag value of 2
         indicates the object should be destroyed, but operator delete
         should not be called. */
      dp = (a_destructor_ptr)ndp->destruction_routine;
      (dp)(object_ptr, 2);
    } else {
      /* Destroy the object by calling a special function that will do the
         destruction of this specific object. */
      (ndp->destruction_routine)();
    }  /* if */
  }  /* while */
}  /* __process_needed_destructions */


EXTERN_C void __already_marked_for_destruction()
/*
This routine is called when a needed destruction is recorded more than
once.  It simply calls abort.  The name is intended to describe the nature
of the problem to the user.
*/
{
  __abort_execution(ec_already_marked_for_destruction);
}


EXTERN_C void __record_needed_destruction(a_needed_destruction_ptr ndp)
/*
Called when a static object has been constructed to register a
destruction that must be done at program termination.  ndp points to
a needed destruction entry that is to be added to the front of the
list of needed destructions.
*/
{
  /* If the entry has already been put on the list, terminate the execution. */
  if (ndp->next != NULL ||
      ndp == needed_destruction_head) __already_marked_for_destruction();
  ndp->next = needed_destruction_head;
  needed_destruction_head = ndp;
}  /* __record_needed_destruction */


#if CFRONT_COMPATIBILITY_MODE
EXTERN_C void __std__needed_destruction_list(void)
/*
This routine is provided for use with a cfront runtime library, including
cfront startup and termination code.  This routine will be called by
the cfront static destruction routines and will ensure that any needed
destructions get done.  The sequence of the destructions will not
be standard conforming, but there is no way to get standard conforming
behavior when using the cfront termination routines.

This routine will only be used when munch is being used.  When patch
is being used, the link structure defined below will result in a call to
__process_needed_destructions.
*/
{
  __process_needed_destructions();
}  /* __std__needed_destruction_list */


/*
Define a link structure that will be used when patch is being used.
*/
struct a_link {
  a_link	*next;
  a_void_function_ptr
		ctor;
  a_void_function_ptr
		dtor;
};

/*** START TI REPLACE ***/
static _DATA_ACCESS_NEAR a_link __link =
                       {(a_link*)NULL,
/*** END TI REPLACE ***/
                        (a_void_function_ptr)NULL,
                        (a_void_function_ptr)__process_needed_destructions};


/*
This declaration is used to force the static definition of __link to be
put out (i.e., to make the compiler think that __link is actually used).
*/
/*** START TI REPLACE ***/
_DATA_ACCESS a_link* 
    __dummy_variable_used_to_force_definition_of__link = &__link;
/*** END TI REPLACE ***/
#endif /* CFRONT_COMPATIBILITY_MODE */

#else /* defined(__EDG_IA64_ABI) */

#if !SYSTEM_RUNTIME_HAS_IA64_SUPPORT
/* Current versions of Linux already define these routines in the C runtime
   library, and if we attempt to redefine them here we end up with multiple
   versions of these symbols. */

/* The DSO handle.  Initialization to NULL indicates that this is the handle
   for the main program.  */
/*** START TI REPLACE ***/
_DATA_ACCESS_NEAR a_dso_handle __dso_handle;
/*** END TI REPLACE ***/

#endif /* !SYSTEM_RUNTIME_HAS_IA64_SUPPORT */

#if !SYSTEM_RUNTIME_HAS_IA64_ATEXIT

/*** START TI ADD ***/
void ABI_NAMESPACE::__cxa_ia64_exit(int status)
{
    ABI_NAMESPACE::__cxa_finalize((a_dso_handle)NULL);
}

EXTERN_C void _DATA_ACCESS (*__TI_dtors_ptr)(int);
/*** END TI ADD ***/

void ABI_NAMESPACE::__cxa_finalize(a_dso_handle dso_handle)
/*
Go through the needed destructions list and perform the required
destructions for the DSO indicated by dso_handle, or all destructions if
dso_handle is NULL.
*/
{
  a_needed_destruction_ptr *ndpp, ndp, old_head;
  
  ndpp = &needed_destruction_head;
  while (*ndpp != NULL) {
    ndp = *ndpp;
    /* Skip destructions that do not apply to this DSO. */
    if (dso_handle != NULL && ndp->dso_handle != dso_handle) {
      ndpp = &ndp->next;
      continue;
    }  /* if */
    /* Note that the value of needed_destruction_head may change
       during the execution of the destructor.  Consequently, the
       current entry is removed from the list before the destructor
       routine is called. */
    *ndpp = ndp->next;
    old_head = needed_destruction_head;
    /* Call the routine. */
    (*ndp->destruction_routine)(ndp->object);
    /* Deallocate the entry. */
    free(ndp);
    /* If the head has changed, start at the beginning of the list 
       again so that we can process the newly added destruction. */
    if (needed_destruction_head != old_head) {
      ndpp = &needed_destruction_head;
    }  /* if */
  }  /* while */
}  /* __cxa_finalize */

/*** START TI REPLACE ***/
/*
Renamed __cxa_atexit to __TI_atexit, __TI_atexit is invoked by both __cxa_atexit
and __aeabi_atexit (inline into both the functions)
*/
static inline int __TI_atexit(a_cxa_dtor_ptr   destruction_routine,
/*** END TI REPLACE ***/
                              void             *object,
                              a_dso_handle     dso_handle)
/* 
Register an action to be taken at program termination (or DSO unload) time.
The action is the calling of destruction_routine with the object parameter.
If dso_handle is non-NULL, the action will be taken when __cxa_finalize
is called for the specific dso_handle value, or when __cxa_finalize
is called to process all objects (i.e., the __cxa_finally dso_handle has
a NULL value).  If dso_handle is NULL, the action will be taken only when
__cxa_finalize is called to process all objects.

This version of __cxa_atexit is only intended to be used when the
system's runtime does not include its own version of __cxa_atexit.  When
the system's runtime includes such a function, the system is responsible
for seeing that __cxa_finalize is invoked at program termination.  When
using our own version of this routine, we need to ensure that __cxa_finalize
is invoked at program termination.  This is accomplished by calling
__register_finalization_routine on the first invocation of this function.
Return zero if the registration is successful, or non-zero otherwise.
*/
{
  int                      success = TRUE;
  a_needed_destruction_ptr ndp;

/*** START TI ADD ***/
  __TI_resource_lock(__TI_LOCK_ATEXIT);
/*** END TI ADD ***/

  ndp = (a_needed_destruction_ptr)malloc(sizeof(a_needed_destruction));
  if (ndp == NULL) {
    success = FALSE;
  }  else {
/*** START TI REMOVE ***/
/*** END TI REMOVE ***/
/*** START TI ADD ***/
  /* Here in IA64_ABI mode, we do not need to register the destructor in
  any other place. The ndp below record all the destructors and the 
  __cxa_finalize will walk through the list to call the destructors
  during exit.

  "__register_finalization_routine()" defined in static_init.c in
  EDGRTS release calls atexit() to record "__call_dtors" function.
  "__call_dtors" is a function in EDGRTS release corresponds to 
  "__call_ctors" which is also from EDGRTS release. As TI RTS does not
  use "__call_Ctors" to do static initialization, here it is also
  unnecessary to call "_call_dtors".

  For non IA64_ABI mode, we have our own way to record the destructors,
  details in __add_dtor() in sinit.c */
extern   void abort(void);

    /*---------------------------------------------------------------------*/
    /* REGISTER __cxa_ia64_exit() SO exit() WILL CALL IT.  __cxa_ia64_exit */
    /* CALLS __cxa_finalize() TO CALL OF THE FUNCTIONS ON THE ATEXIT LIST  */
    /* THE USE OF __TI_dtors_ptr ALLOWS US TO AVOID LINKING IN             */
    /* call_dtors() IF IT ISN'T USED.                                      */
    /*---------------------------------------------------------------------*/
    __TI_dtors_ptr = ABI_NAMESPACE::__cxa_ia64_exit;
    __TI_data_synch_WBINV(&__TI_dtors_ptr, sizeof(__TI_dtors_ptr));
/*** END TI ADD ***/
    ndp->object = object;
    ndp->destruction_routine = (a_destructor_ptr)destruction_routine;
    ndp->dso_handle = dso_handle;
    ndp->next = needed_destruction_head;
    needed_destruction_head = ndp;
  }  /* if */

/*** START TI ADD ***/
  __TI_resource_unlock(__TI_LOCK_ATEXIT);
/*** END TI ADD ***/

  return !success;
}  /* __TI_atexit */

/*** START TI ADD ***/
int ABI_NAMESPACE::__cxa_atexit(a_cxa_dtor_ptr    destruction_routine,
                                void             *object,
                                a_dso_handle      dso_handle)
{
    return __TI_atexit(destruction_routine, object, dso_handle);
}
/*** END TI ADD ***/

#endif /* !SYSTEM_RUNTIME_HAS_IA64_ATEXIT */

#endif /* defined(__EDG_IA64_ABI) */

/*** START TI ADD ***/
#if defined(__TI_EABI_SUPPORT__) || defined(__TI_EABI__)
EXTERN_C int atexit(void (*fun)())
{

   ABI_NAMESPACE::__cxa_atexit((a_cxa_dtor_ptr)fun, NULL, NULL);
   return 0;
}

#if defined(__TMS470__) && defined(__TI_EABI_SUPPORT__)
namespace __aeabiv1 
{
extern "C" int __aeabi_atexit(void *object, 
	                      void (*destroyer) (void *), 
			      void *dso_handle) 
{
    return __TI_atexit(destroyer, object, dso_handle);
}

} //namespace __aeabiv1
#endif /* defined(__TMS470__) && defined(__TI_EABI_SUPPORT__) */

#endif /* __TI_EABI_SUPPORT__ || __TI_EABI__*/
/*** END TI ADD ***/

/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
