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

Routine to clear a block of memory.  Used to initialize arrays that
do not have constructors.

*/

#include "basics.h"
#include "runtime.h"
#pragma hdrstop
#include <string.h>

#if __EDG_BSD
/*
Declare the bzero routine because some header files on BSD systems don't
provide a declaration.  Also, the minimal headers provided in the
release include directory don't declare bzero.
*/
EXTERN_C void bzero(void*, int);
#endif /* __EDG_BSD */

EXTERN_C void __memzero(void    *buffer,
                        size_t	size)
/*
Initialize a block of memory.
*/
{
#if __EDG_BSD
  bzero(buffer, size);
#else /* !__EDG_BSD */
  memset(buffer, 0, size);
#endif /* __EDG_BSD */
}  /* __memzero */

/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
