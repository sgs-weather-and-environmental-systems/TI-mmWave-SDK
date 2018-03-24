/*****************************************************************************/
/* dtor_list.h v16.9.6                                                       */
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

Declarations relating to dtor_list.c -- destruction list processing.

*/

#ifndef DTOR_LIST_H
#define DTOR_LIST_H 1
/*** START TI REMOVE ***/
/* TI implementation of RTS does not need the definition in main.h 
TI RTS only needs IA64_ABI part of this file. */
/*** END TI REMOVE ***/
/*
Data structure used to build a list of static object destructions
to be performed at the end of execution.  Entries are added to the
list each time a static object is created.  New objects are added
to the front of the list.
*/
typedef struct a_needed_destruction *a_needed_destruction_ptr;
typedef struct a_needed_destruction {
  a_needed_destruction_ptr
		next;
			/* Pointer to the next entry in the list. */
  void		*object;
			/* Pointer to the object to be destroyed if this
			   is a "simple" destruction, or a NULL pointer
		 	   if this is a "complex" destruction.  A simple
			   destruction is one that can be done with
			   a single call to the destructor passing an
			   object pointer and a destruction flag. */
#ifndef __EDG_IA64_ABI
  a_void_function_ptr
#else /* defined(__EDG_IA64_ABI) */
  a_destructor_ptr
#endif /* defined(__EDG_IA64_ABI) */
		destruction_routine;
			/* For a simple destruction, this points to the
			   destructor to be called. For a complex destruction,
                           this is a pointer to a function that when called,
                           will call the necessary destructors. */
#ifdef __EDG_IA64_ABI
  a_dso_handle  dso_handle;
                        /* The DSO handle associated with this destruction, or
                           NULL if this destruction is associated with the
                           main program. */
#endif /* ifdef EDG_IA64_ABI */
} a_needed_destruction;

#ifndef __EDG_IA64_ABI
extern void __process_needed_destructions(void);

EXTERN_C void __record_needed_destruction(a_needed_destruction_ptr ndp);
#endif /* ifndef __EDG_IA64_ABI */

#endif /* DTOR_LIST_H */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
