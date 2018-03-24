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

C++ runtime routine __pure_virtual_called() -- called when the user
calls a pure virtual function.  This function simply aborts the program.

*/

#include "basics.h"
#include "runtime.h"

#ifdef __EDG_IA64_ABI
#define PURE_VIRTUAL_FUNCTION_NAME ABI_NAMESPACE::__cxa_pure_virtual
#else /* !defined(__EDG_IA64_ABI) */
#define PURE_VIRTUAL_FUNCTION_NAME __pure_virtual_called
#endif /* !defined(__EDG_IA64_ABI) */


EXTERN_C void PURE_VIRTUAL_FUNCTION_NAME(void)
/*
Notify the user that a call to a pure virtual function has been made and
abort the program.
*/
{
  __abort_execution(ec_pure_virtual_called);
}  /* PURE_VIRTUAL_FUNCTION_NAME */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
