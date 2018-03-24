/*****************************************************************************/
/* runtime.h v16.9.6                                                         */
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

Miscellaneous declarations for all runtime routines.

*/

#ifndef RUNTIME_H
#define RUNTIME_H 1

#include "config.h"
#include <stdlib.h>
#include <stdio.h>
#include <new>
#include "error.h"
#ifdef __EDG_IA64_ABI
#include "cxxabi.h"
#endif /* ifdef __EDG_IA64_ABI */

#ifdef __linux__
/* Linux improperly defined NULL as "(void*)0".  Undefine it if it has
   already been defined, and define it to the proper value. */
#ifdef NULL
#undef NULL
#endif /* ifdef NULL */
#define NULL 0
#endif /* ifdef __linux__ */

#ifndef DEBUG
/* Include debugging code. */
#define DEBUG 0
#endif /* ifndef DEBUG */
#if DEBUG
EXTERN int	__debug_level /* = 0 */;
			/* Debug level.  0 means no debug output, 1 - 5
                            means increasing amounts. */
#endif /* DEBUG */
#if DEBUG || CHECKING
#define __f_debug stderr
			/* Debug output file.  This is a macro and not a
			   variable because the initialization of a variable
			   with the value "stderr" cannot be done as a static
			   initialization on some systems. */
#endif /* DEBUG || CHECKING */

/*
Error routines.
*/
#if CHECKING
/* Macro to test an assertion and generate an internal error if
   the condition is not TRUE.  The macro expands to nothing when checking
   code is not being used. */
#define assert_msg() \
  {									\
    (void)fprintf(__f_debug, "Assertion failed in file \"%s\", line %d\n", \
                  __FILE__, __LINE__);				\
    abort();								\
  }

#define check_assertion(test)						\
  if (!(test)) {							\
    assert_msg()							\
  }
#define unexpected_condition()						\
  assert_msg()
#else /* !CHECKING */
#define check_assertion(test) /* Nothing */
#define unexpected_condition()    /* Nothing */
#endif /* CHECKING */

/*
Define the qualifier that should be used to access something defined
in the namespace of the runtime.  This is "std" if the runtime
uses namespaces or "" otherwise.
*/
#ifdef __EDG_RUNTIME_USES_NAMESPACES
#define STD_NAMESPACE std
#ifdef __EDG_IA64_ABI
#define ABI_NAMESPACE abi
#endif /* ifdef __EDG_IA64_ABI */
#else /* ifndef __EDG_RUNTIME_USES_NAMESPACES */
#define STD_NAMESPACE /* nothing */
#ifdef __EDG_IA64_ABI
#define ABI_NAMESPACE /* nothing */
#endif /* ifdef __EDG_IA64_ABI */
#endif /* ifdef __EDG_RUNTIME_USES_NAMESPACES */

/*
a_sizeof_t is used as a synonym for size_t by the runtime.
*/
#if __cplusplus
typedef size_t a_sizeof_t;
#else /* __cplusplus */
typedef unsigned int a_sizeof_t;
#endif /* __cplusplus */

/*
If bool is not supported, use a typedef for bool.
*/
#ifdef _BOOL
typedef bool __bool;
#else /* ifndef _BOOL */
typedef int __bool;
#endif /* ifdef _BOOL */

typedef void (*a_void_function_ptr)();
			/* Type used to store a generic function pointer. */

#ifndef __EDG_IA64_ABI
typedef void (*a_destructor_ptr)(void*, int);
#else /* defined(__EDG_IA64_ABI) */
/* Explicit "C" linkage is required for compatibility with the declaration in
   cxxabi.h. */
#ifdef __EDG_IA64_ABI_VARIANT_CTORS_AND_DTORS_RETURN_THIS
/* The variant form of destructor returns the this pointer. */
EXTERN_C typedef void* (*a_destructor_ptr)(void*);
#else /* ifndef __EDG_IA64_ABI_VARIANT_CTORS_AND_DTORS_RETURN_THIS */
EXTERN_C typedef void (*a_destructor_ptr)(void*);
#endif /* ifdef __EDG_IA64_ABI_VARIANT_CTORS_AND_DTORS_RETURN_THIS */
/* A special typedef is used for the destructor pointer passed to cxa_atexit
   as it must always have the expected type even when the variant form of
   destructor is being used. */
EXTERN_C typedef void  (*a_cxa_dtor_ptr)(void*);
#endif /* defined(__EDG_IA64_ABI) */
			/* Type used to store a pointer a destructor. */

typedef void (*a_destructor_with_vtable_param_ptr)(void*, void*);
			/* Type used for the kind of destructor that is used
			   to when information about the construction vtable
			   to be used must be provided. */

#ifdef __EDG_IA64_ABI
/* Explicit "C" linkage is required for compatibility with the declaration in
   cxxabi.h. */
EXTERN_C
#endif /* ifdef __EDG_IA64_ABI */
typedef void* (*a_new_ptr)(size_t);
			/* Type used to store a pointer to an operator new
			   routine. */

#ifdef __EDG_IA64_ABI
/* Explicit "C" linkage is required for compatibility with the declaration in
   cxxabi.h. */
EXTERN_C
#endif /* ifdef __EDG_IA64_ABI */
typedef void (*a_delete_ptr)(void*);
			/* Type used to store a pointer to an operator delete
			   routine. */

#ifdef __EDG_IA64_ABI
/* Explicit "C" linkage is required for compatibility with the declaration in
   cxxabi.h. */
EXTERN_C
#endif /* ifdef __EDG_IA64_ABI */
typedef void (*a_two_operand_delete_ptr)(void *, a_sizeof_t);
			/* Type used to store a pointer to a two operand
			   operator delete routine. */

#if CFRONT_COMPATIBILITY_MODE
typedef void (*a_cfront_constructor_ptr)(void*, void* b1, void* b2, void*b3,
                                         void* b4, void* b5, void* b6,
					 void* b7, void* b8);
			/* Type of a constructor called from vec_new in
			   cfront mode. */
#endif /* CFRONT_COMPATIBILITY_MODE */

/*
In the Cfront ABI, constructors return an object pointer.  In the
IA-64 ABI, they return void.
*/
#ifdef __EDG_IA64_ABI
#ifdef __EDG_IA64_ABI_VARIANT_CTORS_AND_DTORS_RETURN_THIS
typedef void *a_ctor_return_type;
#else /* ifndef __EDG_IA64_ABI_VARIANT_CTORS_AND_DTORS_RETURN_THIS */
typedef void a_ctor_return_type;
#endif /* ifdef __EDG_IA64_ABI_VARIANT_CTORS_AND_DTORS_RETURN_THIS */
#else /* ifndef __EDG_IA64_ABI */
typedef void *a_ctor_return_type;
#endif /* ifdef __EDG_IA64_ABI */

#ifdef __EDG_IA64_ABI
/* Explicit "C" linkage is required for compatibility with the declaration in
   cxxabi.h. */
EXTERN_C
#endif /* ifdef __EDG_IA64_ABI */
typedef a_ctor_return_type (*a_constructor_ptr)(void*);
			/* Type of a default constructor called from
			   vec_new. */
#ifdef __EDG_IA64_ABI
/* Explicit "C" linkage is required for compatibility with the declaration in
   cxxabi.h. */
EXTERN_C
#endif /* ifdef __EDG_IA64_ABI */
typedef a_ctor_return_type (*a_copy_constructor_ptr)(void*, void*);
			/* Type of a copy constructor called from
			   vec_cctor. */

extern void __default_new_handler(void);
			/* The default new handler routine. */

EXTERN_C STD_NAMESPACE::new_handler
		_new_handler
		  initial_value((a_void_function_ptr)NULL);
			/* Pointer to the new handler routine to be called. */

#ifdef __EDG_IA64_ABI

typedef void *a_dso_handle;
			/* Type of a DSO handle. */

/*
Guard variables are 64 bits in the IA-64 ABI but only 32 bits in the ARM EABI.
This definition must match the type selected in
lower_init.c:add_first_time_test.
*/
#ifdef __EDG_IA64_ABI_USE_INT_STATIC_INIT_GUARD
typedef int an_ia64_guard;
/*** START TI ADD ***/
/*
Both ARM ABI and C6x ELF ABI use 32-bit guard variables. However, ARM ABI 
requires type int for guard variable whereas C6x ELF ABI requires unsigned
int.
*/
#elif defined(__EDG_IA64_ABI_USE_VARIANT_INT_STATIC_INIT_GUARD)
typedef unsigned int an_ia64_guard;
/*** END TI ADD ***/
#else /* ifndef __EDG_IA64_ABI_USE_INT_STATIC_INIT_GUARD */
typedef unsigned long long an_ia64_guard;
#endif /* ifdef __EDG_IA64_ABI_USE_INT_STATIC_INIT_GUARD */
  
typedef an_ia64_guard *an_ia64_guard_ptr;
			/* A pointer to a guard variable. */

#endif /* defined(__EDG_IA64_ABI) */

#endif /* RUNTIME_H */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
