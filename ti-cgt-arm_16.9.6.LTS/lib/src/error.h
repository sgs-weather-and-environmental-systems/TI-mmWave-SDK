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

Declarations relating to error.c - runtime error handling.

*/

#ifndef ERROR_H
#define ERROR_H 1

typedef enum /* an_error_code */ {
  ec_none,
  ec_abort_header,
  ec_terminate_called,
  ec_terminate_returned,
  ec_already_marked_for_destruction,
  ec_main_called_more_than_once,  /* No longer used. */
  ec_pure_virtual_called,
  ec_bad_cast,
  ec_bad_typeid,
  ec_array_not_from_vec_new,
  ec_terminate_called_more_than_once,
  ec_negative_vla_size,
  ec_vla_allocation_failed,
  ec_deleted_virtual_called,
  ec_last
} an_error_code;

EXTERN_C void __abort_execution(an_error_code err_code);

#endif /* ERROR_H */

/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
