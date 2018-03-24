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

#ifndef _STLP_INTERNAL_CSTRING
#define _STLP_INTERNAL_CSTRING

#if defined (_STLP_USE_NEW_C_HEADERS)
#  if defined (_STLP_HAS_INCLUDE_NEXT)
#    include_next <cstring>
#  else
#    include _STLP_NATIVE_CPP_C_HEADER(cstring)
#  endif
#else
#  define _CPP_STYLE_HEADER /* Place functions in std:: namespace */
#  include <string.h>
#  undef _CPP_STYLE_HEADER
#endif

#ifdef _STLP_IMPORT_VENDOR_CSTD
_STLP_BEGIN_NAMESPACE
#  include <u_cstring>
_STLP_END_NAMESPACE
#endif /* _STLP_IMPORT_VENDOR_CSTD */

#endif /* _STLP_INTERNAL_CSTRING */
