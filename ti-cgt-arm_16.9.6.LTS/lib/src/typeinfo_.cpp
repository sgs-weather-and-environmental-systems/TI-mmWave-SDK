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

Run-time type identification -- user callable functions.

*/

#include "basics.h"
#include "runtime.h"

#if ABI_CHANGES_FOR_RTTI

#include "rtti.h"
#include <typeinfo>

/*
If the runtime should be defined in the std namespace, open
the std namespace.
*/
#ifdef __EDG_RUNTIME_USES_NAMESPACES
namespace std {
#endif /* ifdef __EDG_RUNTIME_USES_NAMESPACES */


__bool type_info::operator==(const type_info& rhs) const
/*
Return TRUE if two type_info structures refer to the same type.
*/
{
  a_type_info_impl_ptr  tiip1;
  a_type_info_impl_ptr  tiip2;

  tiip1 = (a_type_info_impl_ptr)this;
  tiip2 = (a_type_info_impl_ptr)&rhs;
  return matching_type_info(tiip1, tiip2);
}  /* type_info::operator== */


__bool type_info::operator!=(const type_info& rhs) const
/*
Return TRUE if two type_info structures do not refer to the same type.
*/
{
  a_type_info_impl_ptr  tiip1;
  a_type_info_impl_ptr  tiip2;

  tiip1 = (a_type_info_impl_ptr)this;
  tiip2 = (a_type_info_impl_ptr)&rhs;
  return !matching_type_info(tiip1, tiip2);
}  /* type_info::operator!= */


__bool type_info::before(const type_info& rhs) const
/*
Return TRUE if the type_info for *this precedes the type_info for rhs using
some implementation dependent collating sequence.
*/
{
#ifdef __EDG_IA64_ABI
  /* Do the comparison based on the address at which the type name string
     is allocated.  The name string is guaranteed by the ABI to be unique. */
  return __type_name < rhs.__type_name;
#else /* defined(__EDG_IA64_ABI) */
  /* This is implemented by comparing the pointers used to represent the type
     information.  If the type_info_impl has a unique_id, the address of the
     unique_id is used for collation.  If it does not have a unique_id (i.e.,
     we know there is only a single type_info_impl structure for the type) then
     the address of the single type_info_impl is used for collation. */
  a_type_info_impl_ptr  tiip1;
  a_type_info_impl_ptr  tiip2;
  void*                 ptr1;
  void*                 ptr2;

  tiip1 = (a_type_info_impl_ptr)this;
  tiip2 = (a_type_info_impl_ptr)&rhs;
  ptr1 = tiip1->unique_id != NULL ? (void*)tiip1->unique_id : (void*)tiip1;
  ptr2 = tiip2->unique_id != NULL ? (void*)tiip2->unique_id : (void*)tiip2;
  return ptr1 < ptr2;
#endif /* defined(__EDG_IA64_ABI) */
}  /* type_info::before */


const char * type_info::name() const
/*
Returns a pointer to the name string for this type.
*/
{
#ifndef __EDG_IA64_ABI
  a_type_info_impl_ptr  tiip1;

  tiip1 = (a_type_info_impl_ptr)this;
  return tiip1->name;
#else /* defined(__EDG_IA64_ABI) */
  return __type_name;
#endif /* defined(__EDG_IA64_ABI) */
}  /* type_info::name */


type_info::~type_info()
/*
Destructor for type_info.  This should never actually be called.
*/
{
}  /* type_info::~type_info */


/* The definition of the exception classes can be disabled. */
#if USE_EDG_EXCEPTION_CLASSES

#if EXCEPTION_HANDLING

/*
The bad_cast class is only supplied when the runtime supports exception
handling.
*/

bad_cast::bad_cast() THROW_NOTHING()
/*
Constructor for bad_cast.
*/
{
}  /* bad_cast::bad_cast */


bad_cast::bad_cast(const bad_cast& rhs) THROW_NOTHING() : exception(rhs)
/*
Copy constructor for bad_cast.  Currently does nothing.
*/
{
}  /* bad_cast::bad_cast */


bad_cast& bad_cast::operator=(const bad_cast& rhs) THROW_NOTHING()
/*
Assignment operator for bad_cast.  Currently does nothing.
*/
{
  /* Call the base class assignment operator. */
  exception::operator=(rhs);
  return *this;
}  /* bad_cast::operator= */


bad_cast::~bad_cast() THROW_NOTHING()
/*
Destructor for bad_cast.
*/
{
}  /* bad_cast::~bad_cast */


const char* bad_cast::what() const THROW_NOTHING()
/*
Return a string providing information about the exception.  Currently,
no additional information is available.
*/
{
  return "";
}  /* bad_cast::~bad_cast */


bad_typeid::bad_typeid() THROW_NOTHING()
/*
Constructor for bad_typeid.
*/
{
}  /* bad_typeid::bad_typeid */


bad_typeid::bad_typeid(const bad_typeid& rhs) THROW_NOTHING() : exception(rhs)
/*
Copy constructor for bad_typeid.  Currently does nothing.
*/
{
}  /* bad_typeid::bad_typeid */


bad_typeid& bad_typeid::operator=(const bad_typeid& rhs) THROW_NOTHING()
/*
Assignment operator for bad_typeid.  Currently does nothing.
*/
{
  /* Call the base class assignment operator. */
  exception::operator=(rhs);
  return *this;
}  /* bad_typeid::operator= */


bad_typeid::~bad_typeid() THROW_NOTHING()
/*
Destructor for bad_typeid.
*/
{
}  /* bad_typeid::~bad_typeid */


const char* bad_typeid::what() const THROW_NOTHING()
/*
Return a string providing information about the exception.  Currently,
no additional information is available.
*/
{
  return "";
}  /* bad_typeid::~bad_typeid */

#endif /* EXCEPTION_HANDLING */

#endif /* USE_EDG_EXCEPTION_CLASSES */

#ifdef __EDG_IA64_ABI

/*
Define the type_info objects that are supposed to be present in the runtime
library.  Try to work hard enough that the compiler won't eliminate the
generation of the type_info objects.
*/
const type_info *__dummy_typeinfo;
void __gen_dummy_typeinfos()
{
#define gen_typeinfos(type)                 \
  __dummy_typeinfo = &typeid(type),         \
  __dummy_typeinfo = &typeid(type *),       \
  __dummy_typeinfo = &typeid(const type *)
  gen_typeinfos(void); 
  gen_typeinfos(bool); 
  gen_typeinfos(wchar_t);
/*** START TI ADD ***/
/*
The RTS here is intended to be built with --cpp11 mode in the parser so that
these identifiers are found, regardless of if they are supported. Since the
shell currently doesn't have a --cpp11 flag, we guard it with the __cplusplus
macro.
*/
#if __cplusplus >= 201103L
/*** END TI ADD **/
  gen_typeinfos(char16_t);
  gen_typeinfos(char32_t);
/*** START TI ADD ***/
#endif
/*** END TI ADD ***/
  gen_typeinfos(char); 
  gen_typeinfos(signed char); gen_typeinfos(unsigned char); 
  gen_typeinfos(short);       gen_typeinfos(unsigned short); 
  gen_typeinfos(int);         gen_typeinfos(unsigned int); 
  gen_typeinfos(long);        gen_typeinfos(unsigned long); 
/*** START TI REPLACE ***/
#if !defined(__NO_LONG_LONG)
  gen_typeinfos(long long);   gen_typeinfos(unsigned long long);
#endif
#if defined(__TI_INT40_T__)
  gen_typeinfos(__int40_t);   gen_typeinfos(unsigned __int40_t);
#endif
/*** END TI REPLACE ***/
  gen_typeinfos(float); 
  gen_typeinfos(double); 
  gen_typeinfos(long double);
#ifdef __EDG_CPP11_IL_EXTENSIONS_SUPPORTED
  gen_typeinfos(decltype(nullptr));
#endif /* ifdef __EDG_CPP11_IL_EXTENSIONS_SUPPORTED */
#undef gen_typeinfos
}
  
#endif /* ifdef __EDG_IA64_ABI */

/*
If the runtime should be defined in the std namespace, close
the std namespace.
*/
#ifdef __EDG_RUNTIME_USES_NAMESPACES
}  /* namespace std */
#endif /* ifdef __EDG_RUNTIME_USES_NAMESPACES */

#ifdef __EDG_IA64_ABI
#ifdef __EDG_RUNTIME_USES_NAMESPACES
namespace __cxxabiv1 {
#endif /* ifdef __EDG_RUNTIME_USES_NAMESPACES */

__fundamental_type_info::~__fundamental_type_info()
/*
Destructor for __fundamental_type_info.  This should never actually be 
called.  
*/
{
}  /* __fundamental_type_info::~__fundamental_type_info */


__array_type_info::~__array_type_info()
/*
Destructor for __array_type_info.  This should never actually be 
called.  
*/
{
}  /* __array_type_info::~__array_type_info */


__function_type_info::~__function_type_info()
/*
Destructor for __function_type_info.  This should never actually be 
called.  
*/
{
}  /* __function_type_info::~__function_type_info */


__enum_type_info::~__enum_type_info()
/*
Destructor for __enum_type_info.  This should never actually be 
called.  
*/
{
}  /* __enum_type_info::~__enum_type_info */


__class_type_info::~__class_type_info()
/*
Destructor for __class_type_info.  This should never actually be 
called.  
*/
{
}  /* __class_type_info::~__class_type_info */


__si_class_type_info::~__si_class_type_info()
/*
Destructor for __si_class_type_info.  This should never actually be 
called.  
*/
{
}  /* __si_class_type_info::~__si_class_type_info */


__vmi_class_type_info::~__vmi_class_type_info()
/*
Destructor for __vmi_class_type_info.  This should never actually be 
called.  
*/
{
}  /* __vmi_class_type_info::~__vmi_class_type_info */


__pbase_type_info::~__pbase_type_info()
/*
Destructor for __pbase_type_info.  This should never actually be 
called.  
*/
{
}  /* __pbase_type_info::~__pbase_type_info */


__pointer_type_info::~__pointer_type_info()
/*
Destructor for __pointer_type_info.  This should never actually be 
called.  
*/
{
}  /* __pointer_type_info::~__pointer_type_info */


__pointer_to_member_type_info::~__pointer_to_member_type_info()
/*
Destructor for __pointer_to_member_type_info.  This should never actually be 
called.  
*/
{
}  /* __pointer_to_member_type_info::~__pointer_to_member_type_info */


#ifdef __EDG_RUNTIME_USES_NAMESPACES
}  /* namespace __cxxabiv1 */
#endif /* ifdef __EDG_RUNTIME_USES_NAMESPACES */
#endif /* ifdef __EDG_IA64_ABI */

#endif /* ABI_CHANGES_FOR_RTTI */

/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
