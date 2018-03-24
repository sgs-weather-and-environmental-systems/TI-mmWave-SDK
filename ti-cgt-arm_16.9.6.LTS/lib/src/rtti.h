/*****************************************************************************/
/* rtti.h v16.9.6                                                            */
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

Declarations for run-time type identification used by RTTI and
exception handling.

*/

#ifndef _RTTI_H
#define _RTTI_H

#include <typeinfo>

#ifndef NULL
#define NULL (0)
#endif /* NULL */

typedef void (*a_function_ptr)();
			/* A pointer type that can be used to store a
                           pointer to a destructor or an operator delete
			   function. */

typedef a_byte a_unique_id;
			/* The thing pointed to by the unique ID in a
			   type_info record. */

typedef a_unique_id *a_unique_id_ptr;
			/* A pointer to a unique ID. */

typedef __EDG_DELTA_TYPE an_object_offset;
			/* Type used to store an offset into an object. */

/* Definitions of the values in the flags field of the base class
   specification entry. */
#ifndef __EDG_IA64_ABI
typedef a_byte a_base_class_spec_flag_set;
#else /* defined(__EDG_IA64_ABI) */
typedef unsigned int a_base_class_spec_flag_set;
#endif /* defined(__EDG_IA64_ABI) */

#define BCS_NO_FLAGS	0x00
			/* Value when no flags are set. */
#define BCS_VIRTUAL	0x01
			/* The offset provides the position of a pointer
			   to the base class.  Used for virtual base
			   classes. */
#ifndef __EDG_IA64_ABI
#define BCS_LAST	0x02
			/* TRUE if this is the last base class specifier
			   in the array. */
#endif /* ifndef __EDG_IA64_ABI */

#ifndef __EDG_IA64_ABI
#define BCS_PUBLIC      0x04
#else /* !defined(__EDG_IA64_ABI) */
#define BCS_PUBLIC      0x02
#endif /* !defined(__EDG_IA64_ABI) */
			/* TRUE if the base class is public.  For non-direct
			   base classes, TRUE if the cumulative access across
			   the all derivation steps gives public access. */

#ifndef __EDG_IA64_ABI
#define BCS_AMBIGUOUS	0x08
			/* TRUE if this base class is ambiguous. */

#define BCS_DIRECT	0x10
			/* TRUE if this is a direct base class.  Ambiguous
			   base classes are always put out at the top level.
			   This flag can be used to determine which ones
			   are really top level bases. */
#endif /* ifndef __EDG_IA64_ABI */

#ifndef __EDG_IA64_ABI

/* Forward declaration of a type_info pointer. */
typedef 
/*** START TI ADD ***/
const 
/*** END TI ADD ***/
struct a_type_info_impl *a_type_info_impl_ptr;

#else /* defined(__EDG_IA64_ABI) */

/* Declare a_type_info_impl_ptr -- even though there is no separate
   implementation type -- to make it possible to use the same code in various
   places in the library. */
typedef const
/*** START TI REPLACE ***/
#if __EDG_RUNTIME_USES_NAMESPACES
              __cxxabiv1::
#endif /* __EDG_RUNTIME_USES_NAMESPACES */
                   __class_type_info *a_type_info_impl_ptr;
/*** END TI REPLACE ***/ 
#endif /* defined(__EDG_IA64_ABI) */

/*
Given a pointer to a type_info_impl, return the type_info pointer.
*/
#ifdef __EDG_IA64_ABI
#define type_info_for_impl(impl) (impl)
#else /* ifndef __EDG_IA64_ABI */
#define type_info_for_impl(impl) (&((impl)->user_type_info))
#endif /* ifndef __EDG_IA64_ABI */

#ifndef __EDG_IA64_ABI

/* Describes the base classes of a class.  Pointed to by the type_info
   of the class. */
typedef 
/*** START TI ADD ***/
const 
/*** END TI ADD ***/ 
struct a_base_class_spec *a_base_class_spec_ptr;

typedef struct a_base_class_spec {
  a_type_info_impl_ptr		 
                type_info;
			/* The type_info for the base class. */
  an_object_offset
		offset;
			/* The offset of the base class in the derived
			   class. */
  a_base_class_spec_flag_set
		flags;
			/* A collection of bits that specify how the
			   base class specification entry is to be used.
			   See the descriptions of the BCS flags above. */
} a_base_class_spec;

/* Type description information for objects that are thrown or
   caught. */
typedef struct a_type_info_impl {
#if ABI_CHANGES_FOR_RTTI
  STD_NAMESPACE::type_info
		user_type_info;
			/* This is the user visible type_info object,
			   a reference to which is returned by the
			   typeid runtime routine.  The runtime assumes
			   that this is the first field in a_type_info_impl. */
  const char
                *name;
                       /* Pointer to a null-terminated character string
			  containing the name of the type. */
#endif /* ABI_CHANGES_FOR_RTTI */
  a_unique_id_ptr
		unique_id;
			/* When this field is non-NULL two type_info
			   structures describe the same type if their
			   unique IDs are the same. */
/*** START TI ADD ***/
   unsigned int            flags;             /* Flags                     */
/*** END TI ADD ***/
#if ABI_COMPATIBILITY_VERSION <= 237
  a_destructor_ptr
		destructor;
			/* Pointer to the destructor for the object.  This is
			   only present in ABI versions up to and including
			   2.37. */
#endif /* ABI_COMPATIBILITY_VERSION <= 237 */
/*** START TI ADD ***/
  const struct 
/*** END TI ADD ***/
  a_base_class_spec
		*base_class_entries;
			/* Pointer to an array of type_info entries for
			   direct base classes of a class. */
} a_type_info_impl;



/* Determine whether two type_info entries refer to the same type.  They
   match if their pointers are the same or if the unique ID pointed to
   by the entries is the same (and nonzero). */
#define matching_type_info(type1, type2)				\
  ((type1) == (type2) || (((type1)->unique_id == (type2)->unique_id) &&  \
                          (type1)->unique_id != 0))

#else /* defined(__EDG_IA64_ABI) */

/* Determine whether two type_info entries refer to the same type.  They
   match if their name pointers are the same. */
#define matching_type_info(type1, type2)				\
  ((type1) == (type2) || ((type1)->name() == (type2)->name()))

typedef abi::__base_class_type_info *a_base_class_spec_ptr;

#endif /* defined(__EDG_IA64_ABI) */

typedef char*	an_access_flag_string;
			/* Type of the string used to specify the access
			   of base classes of the throw object. */

/*
Values used in an access string to specify whether a given base class
is accessible or not.
*/

#define BASE_ACCESSIBLE     'Y'
			/* Value in an access list if the class is
			   accessible. */
#define BASE_NOT_ACCESSIBLE 'N'
			/* Value in an access list if the class is
			   not accessible.  Could be caused by a base
                           being ambiguous. */

EXTERN_C
a_boolean __derived_to_base_conversion(void**		   p_ptr,
				       void**                p_new_ptr,
				       a_type_info_impl_ptr  class_info,
				       a_type_info_impl_ptr  base_info,
				       an_access_flag_string *access_flags,
				       a_boolean             use_access_flags);
#endif /* ifndef _RTTI_H */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
