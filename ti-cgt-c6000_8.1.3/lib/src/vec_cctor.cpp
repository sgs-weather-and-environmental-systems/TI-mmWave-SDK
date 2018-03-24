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

C++ runtime routine to execute a copy constructor for each element of an array.

*/

#include "basics.h"
#include "runtime.h"

#ifndef __EDG_IA64_ABI
EXTERN_C void __vec_cctor(void                         *array_ptr,
                          size_t                       number_of_elements,
                          size_t                       element_size,
                          a_copy_constructor_ptr       ctor,
                          void                         *src_array_ptr)
/*
Walk through the array, calling the specified copy constructor for each
array element.  The corresponding element of the array pointed to by
src_array_ptr is the source operand for the copy constructor.  Because
this runtime routine will only be called for constructor initialization
of member arrays, the number_of_elements can never be zero.
*/
{
  size_t	i;
  char		*arr_ptr;
  char		*src_arr;

  if (ctor != NULL) {
    for (i = 0, arr_ptr = (char *)array_ptr, src_arr = (char *)src_array_ptr;
         i < number_of_elements;
         i++, arr_ptr += element_size, src_arr += element_size) {
      (*ctor)((void *)arr_ptr, (void *)src_arr);
    }  /* for */
  }  /* if */
}  /* __vec_ctor */
#endif /* ifndef __EDG_IA64_ABI */

/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
