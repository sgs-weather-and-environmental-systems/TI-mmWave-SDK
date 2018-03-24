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

C++ operator new() that does not throw an exception.

*/

#include "basics.h"
#include "runtime.h"

extern "C" STD_NAMESPACE::new_handler _new_handler;

/* Note that operator new is not in the std namespace. */

static a_boolean call_new_handler()
/*
Call the new handler routine.  If exception handling is supported, wrap
the call in a try block to see if the new handler throws a bad_alloc
exception.
*/
{
  a_boolean	done = FALSE;
  /* The allocation failed -- call the current new handler routine.  Use
     the routine pointed to by _new_handler.  If this value is NULL, use
     the default new handler. */
  STD_NAMESPACE::new_handler  new_handler;
  new_handler = _new_handler != NULL ? _new_handler : __default_new_handler;
#if EXCEPTION_HANDLING
  try {
    (*new_handler) ();
  }
  catch (STD_NAMESPACE::bad_alloc) {
    done = TRUE;
  }
#else /* !EXCEPTION_HANDLING */
  (*new_handler) ();
  /* A new handler is supposed to make more memory available, or to exit
     via an exception or by calling abort() or exit().  In order to support
     implementations without exception handling, the older protocol of
     returning a NULL value is supported by the default new handler.
     If the default new handler is being used, and exceptions are not
     enabled, return a NULL pointer. */
  if (new_handler == (STD_NAMESPACE::new_handler)__default_new_handler) {
    done = TRUE;
  }  /* if */
#endif /* EXCEPTION_HANDLING */
  return done;
}  /* call_new_handler */


void *operator new(size_t size, const STD_NAMESPACE::nothrow_t&)
THROW_NOTHING()
/*
Allocate the specified memory size from free store.  If the allocation fails,
call *_new_handler() if defined (non-NULL pointer), and try the allocation
again.  The new_handler is permitted to
	- cause more memory to be available,
	- throw an exception, or
	- call exit or abort.

If the size passed by the caller is zero, it is incremented to one
because the behavior of malloc is unspecified when size is zero.
In C++, a call of operator new(0) must return a value distinct from other
calls of operator new.
*/
{
  void *ptr;

  if (size == 0) size = 1;
  while ((ptr = (void *)malloc(size)) == NULL) {
    if (_new_handler != NULL) {
      /* Call the new handler.  The call_new_handler will return TRUE if
         a NULL pointer should be returned to the caller. */
      if (call_new_handler()) return (void*)NULL;
    } else {
      /* There is no new handler -- Just return a NULL. */
      return (void *)NULL;
    }  /* if */
  }  /* while */
  return ptr;
}  /* operator new */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
