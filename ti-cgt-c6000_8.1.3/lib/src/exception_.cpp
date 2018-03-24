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

Functions that implement the "exception" and "bad_exception" classes (18.6).

*/

#include "basics.h"
#include "runtime.h"

/* The definition of the exception classes can be disabled. */
#if USE_EDG_EXCEPTION_CLASSES

#if EXCEPTION_HANDLING

#include <exception>

/*
If the runtime should be defined in the std namespace, open
the std namespace.
*/
#ifdef __EDG_RUNTIME_USES_NAMESPACES
namespace std {
#endif /* ifdef __EDG_RUNTIME_USES_NAMESPACES */

#if !defined(DNKLIB)
exception::exception() THROW_NOTHING()
/*
Constructor for exception.
*/
{
}  /* exception::exception */


exception::exception(const exception&) THROW_NOTHING()
/*
Copy constructor for exception.
*/
{
}  /* exception::exception */


exception& exception::operator=(const exception&) THROW_NOTHING()
/*
Assignment operator for exception.  Currently does nothing.
*/
{
  return *this;
}  /* exception::operator= */


exception::~exception() THROW_NOTHING()
/*
Destructor for exception.
*/
{
}  /* exception::~exception */


const char* exception::what() const THROW_NOTHING()
/*
Return a string providing information about the exception.  Currently,
no additional information is available.
*/
{
  return "";
}  /* exception::~exception */
#endif /* !defined(DNKLIB) */

#if !defined(DNKLIB)
bad_exception::bad_exception() THROW_NOTHING()
/*
Constructor for bad_exception.
*/
{
}  /* bad_exception::bad_exception */

bad_exception::bad_exception(const bad_exception& rhs)
THROW_NOTHING() : exception(rhs)
/*
Copy constructor for bad_exception.  Currently does nothing.
*/
{
}  /* bad_exception::bad_exception */


bad_exception& bad_exception::operator=(const bad_exception& rhs)
THROW_NOTHING()
/*
Assignment operator for bad_exception.  Currently does nothing.
*/
{
  /* Call the base class assignment operator. */
  exception::operator=(rhs);
  return *this;
}  /* bad_exception::operator= */


bad_exception::~bad_exception() THROW_NOTHING()
/*
Destructor for bad_exception.
*/
{
}  /* bad_exception::~bad_exception */


const char* bad_exception::what() const THROW_NOTHING()
/*
Return a string providing information about the exception.  Currently,
no additional information is available.
*/
{
  return "";
}  /* bad_exception::what */
#endif /* defined(DNKLIB) */


/*
If the runtime should be defined in the std namespace, close
the std namespace.
*/
#ifdef __EDG_RUNTIME_USES_NAMESPACES
}  /* namespace std */
#endif /* ifdef __EDG_RUNTIME_USES_NAMESPACES */

#endif /* EXCEPTION_HANDLING */

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
