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

error.c - runtime error handling.

*/

#include "basics.h"
#include "runtime.h"
#pragma hdrstop

#if DISPLAY_ABORT_DESCRIPTION

static char *error_text(an_error_code	err_code)
/*
Return the string associated with the specified error code.
*/
{
  char	*s = NULL;

  switch (err_code) {
    case ec_abort_header:
      s = "C++ runtime abort";
      break;
    case ec_terminate_called:
      s = "terminate() called by the exception handling mechanism";
      break;
    case ec_terminate_returned:
      s = "returned from a user-defined terminate() routine";
      break;
    case ec_already_marked_for_destruction:
      s =
         "internal error: static object marked for destruction more than once";
      break;
    case ec_pure_virtual_called:
      s = "a pure virtual function was called";
      break;
    case ec_bad_cast:
      s = "invalid dynamic cast";
      break;
    case ec_bad_typeid:
      s = "invalid typeid operation";
      break;
    case ec_array_not_from_vec_new:
      s = "freeing array not allocated by an array new operation";
      break;
    case ec_terminate_called_more_than_once:
      s = "terminate() called itself recursively";
      break;
    case ec_negative_vla_size:
      s = "negative size for variable-length array";
      break;
    case ec_vla_allocation_failed:
      s = "VLA allocation failed";
      break;
    case ec_deleted_virtual_called:
      s = "a deleted virtual function was called";
      break;
    case ec_main_called_more_than_once:
    default:
      unexpected_condition();
      break;
  }  /* switch */
  return s;
}  /* error_text */


static void display_abort_message(an_error_code	err_code)
/*
Display the reason that the runtime is aborting execution.
*/
{
  fprintf(stderr, "%s: %s\n", error_text(ec_abort_header),
          error_text(err_code));
}  /* display_abort_message */

#endif /* DISPLAY_ABORT_DESCRIPTION */

#if !DISPLAY_ABORT_DESCRIPTION
/*ARGSUSED*/ /* err_code is only used when displaying abort descriptions. */
#endif /* !DISPLAY_ABORT_DESCRIPTION */
EXTERN_C void __abort_execution(an_error_code	err_code)
/*
*/
{
#if DISPLAY_ABORT_DESCRIPTION
  /* Display the reason for the abort. */
  display_abort_message(err_code);
#endif /* DISPLAY_ABORT_DESCRIPTION */
  abort();
}  /* abort_execution */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
