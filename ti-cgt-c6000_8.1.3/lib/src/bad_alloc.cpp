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

Member functions of the bad_cast class.

*/

/******************************************************************************/
/* Get configuration options for when we are building with STLport.           */
/******************************************************************************/
#include <s_c__ti.h>

#include "basics.h"
#include "runtime.h"

/* The definition of the exception classes can be disabled. */
#if USE_EDG_EXCEPTION_CLASSES

/*
If the runtime should be defined in the std namespace, open
the std namespace.
*/
#ifdef __EDG_RUNTIME_USES_NAMESPACES
namespace std {
#endif /* ifdef __EDG_RUNTIME_USES_NAMESPACES */

#if EXCEPTION_HANDLING

/*
The bad_alloc class is only supplied when the runtime supports exception
handling.
*/

bad_alloc::bad_alloc() THROW_NOTHING()
/*
Constructor for bad_alloc.
*/
{
}  /* bad_alloc::bad_alloc */


bad_alloc::bad_alloc(const bad_alloc& rhs) THROW_NOTHING() : exception(rhs)
/*
Copy constructor for bad_alloc.  Currently does nothing.
*/
{
}  /* bad_alloc::bad_alloc */


bad_alloc& bad_alloc::operator=(const bad_alloc& rhs) THROW_NOTHING()
/*
Assignment operator for bad_alloc.  Currently does nothing.
*/
{
  /* Call the base class assignment operator. */
  exception::operator=(rhs);
  return *this;
}  /* bad_alloc::operator= */


bad_alloc::~bad_alloc() THROW_NOTHING()
/*
Destructor for bad_alloc.
*/
{
}  /* bad_alloc::~bad_alloc */


const char* bad_alloc::what() const THROW_NOTHING()
/*
Return a string providing information about the exception.  Currently,
no additional information is available.
*/
{
  return "";
}  /* bad_alloc::~bad_alloc */

#endif /* EXCEPTION_HANDLING */


/*
If the runtime should be defined in the std namespace, close
the std namespace.
*/
#ifdef __EDG_RUNTIME_USES_NAMESPACES
}  /* namespace std */
#endif /* ifdef __EDG_RUNTIME_USES_NAMESPACES */

#endif /* USE_EDG_EXCEPTION_CLASSES */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
