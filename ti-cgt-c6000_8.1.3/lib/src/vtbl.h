/*****************************************************************************/
/* vtbl.h v8.1.3                                                             */
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

Virtual function table entry layout.

*/

#ifndef _VTBL_H
#define _VTBL_H

#ifndef __EDG_IA64_ABI
/*** START TI ADD ***/
struct a_vtbl_entry
{
   short   delta;      /* OFFSET TO GET TO THE COMPLETE OBJECT   */
   void  (*func)();    /* VIRTUAL FUNCTION TO BE CALLED          */
};
/*** END TI ADD ***/
/*** START TI REMOVE ***/
/*** END TI REMOVE ***/

#else /* defined(__EDG_IA64_ABI) */

typedef __EDG_IA64_VTABLE_ENTRY_TYPE a_vtbl_entry;

#endif /* defined(__EDG_IA64_ABI) */

typedef
/*** START TI ADD ***/
const
/*** END TI ADD ***/
a_vtbl_entry *a_vtbl_entry_ptr;

#endif /* ifndef _VTBL_H */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
