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

C++ default new handler.

*/

#include "basics.h"
#include "runtime.h"

extern void __default_new_handler(void)
/*
The default new handler routine that is called when operator new cannot
allocate memory.  When exceptions are enabled, this routine simply throws
a bad_alloc exception.  When exceptions are not enabled, we simply return
to the caller, which detects that the default new handler is being used
and returns a NULL pointer to the caller.
*/
{
#if EXCEPTION_HANDLING
  throw STD_NAMESPACE::bad_alloc();
#else /* !EXCEPTION_HANDLING */
  return;
#endif /* EXCEPTION_HANDLING */
}  /* __default_new_handler */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
