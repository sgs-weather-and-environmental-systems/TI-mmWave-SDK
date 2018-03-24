/******************************************************************************/
/* This file was taken from STLport <www.stlport.org> and modified by         */
/* Texas Instruments.                                                         */
/******************************************************************************/

/*
 * Copyright (c) 1999
 * Boris Fomitchev
 *
 * Copyright (c) 2014-2014 Texas Instruments Incorporated
 *
 * This material is provided "as is", with absolutely no warranty expressed
 * or implied. Any use is at your own risk.
 *
 * Permission to use or copy this software for any purpose is hereby granted
 * without fee, provided the above notices are retained on all copies.
 * Permission to modify the code and to distribute modified code is granted,
 * provided the above notices are retained, and a notice that the code was
 * modified is included with the above copyright notice.
 *
 */

#ifndef _STLP_INTERNAL_MBSTATE_T
#define _STLP_INTERNAL_MBSTATE_T


#if defined (_STLP_NO_NATIVE_MBSTATE_T) || defined (_STLP_CPP_MBSTATE_T) && !defined (_MBSTATE_T)
#  define _STLP_USE_OWN_MBSTATE_T
#  define _MBSTATE_T
#endif

#if defined (_STLP_USE_OWN_MBSTATE_T)
#  if !defined (_STLP_CPP_MBSTATE_T) || !defined (__cplusplus) || !defined (_STLP_USE_NEW_C_HEADERS)
typedef int mbstate_t;
#  endif

#  if !defined (_STLP_CPP_MBSTATE_T) && defined (__cplusplus) && defined (_STLP_USE_NAMESPACES)
_STLP_BEGIN_NAMESPACE
using ::mbstate_t;
_STLP_END_NAMESPACE
#  endif

#endif /* _STLP_USE_OWN_MBSTATE_T */

#endif /* _STLP_INTERNAL_MBSTATE_T */
