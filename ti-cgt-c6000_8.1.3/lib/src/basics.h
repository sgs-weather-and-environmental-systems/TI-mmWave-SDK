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

Declarations for all runtime routines.

*/

#ifndef BASICS_H
#define BASICS_H 1

/*
Include the header file that supplies the default configuration
parameters for this version.
*/
   
#include "defines.h"

/*
EXTERN is defined usually as "extern"; in the translation unit that
actually defines storage for external variables, it is defined as an
empty string.  EXTERN is used on the declarations of external variables
in .h files.  This scheme makes it easy to define them in only one
place while using the same source in all places.  Likewise, 
VAR_INITIALIZERS is defined to cause inclusion of initializers for those
variables.
*/
#ifndef EXTERN
#define EXTERN extern
#endif /* ifndef EXTERN */
#ifndef VAR_INITIALIZERS
#define VAR_INITIALIZERS 0
#endif /* ifndef VAR_INITIALIZERS */

/* Macro used to provide an initial value for variables declared EXTERN. */
#if VAR_INITIALIZERS
#define initial_value(value) = value
#else /* VAR_INITIALIZERS */
#define initial_value(value) /* nothing */
#endif /* VAR_INITIALIZERS */

#ifndef CHECKING
/* Include consistency-checking code. */
#define CHECKING 1
#endif /* ifndef CHECKING */

/*
EXTERN_C is used to declare an external function with C linkage.  When
compiling with a C compiler this is just set to ``extern'', but when
compiling with a C++ compiler it is set to ``extern "C"''.
*/
#ifdef __cplusplus
#define EXTERN_C extern "C"
#else /* !defined(__cplusplus) */
#define EXTERN_C extern
#endif /* __cplusplus */

/*
Definition of a generic byte.  Always "unsigned char".
*/
typedef unsigned char a_byte;

/* Simple boolean type: */
typedef int	a_boolean;
typedef a_byte	a_byte_boolean;
#define FALSE 0
#define TRUE 1

#endif /* BASICS_H */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
