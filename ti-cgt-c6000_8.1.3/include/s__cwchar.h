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

#ifndef _STLP_INTERNAL_CWCHAR
#define _STLP_INTERNAL_CWCHAR

#if defined (_STLP_WCE_EVC3)
#  ifndef _STLP_INTERNAL_MBSTATE_T
#    include <s__mbstate_t.h>
#  endif
#else

#  if !defined (_STLP_NO_CWCHAR) && defined (_STLP_USE_NEW_C_HEADERS)
#    if defined (_STLP_HAS_INCLUDE_NEXT)
#      include_next <cwchar>
#    else
#      include _STLP_NATIVE_CPP_C_HEADER(cwchar)
#    endif

#  elif defined (_STLP_NO_WCHAR_T) || \
       (defined (__BORLANDC__) && (__BORLANDC__ < 0x570)) || \
        defined (__OpenBSD__) || defined (__FreeBSD__) || \
       (defined (__GNUC__) && (defined (__APPLE__) || defined ( __Lynx__ )))
#    if defined (_STLP_HAS_INCLUDE_NEXT)
#      include_next <stddef.h>
#    else
#      include _STLP_NATIVE_C_HEADER(stddef.h)
#    endif
#  else
#    if defined (_STLP_HAS_INCLUDE_NEXT)
#      define _CPP_STYLE_HEADER /* Place functions in std:: namespace */
#      include <wchar.h>
#      undef _CPP_STYLE_HEADER
#    else
#      include _STLP_NATIVE_C_HEADER(wchar.h)
#    endif

#  endif


#  ifndef _STLP_INTERNAL_MBSTATE_T
#    include <s__mbstate_t.h>
#  endif

#  if !defined (_STLP_NO_WCHAR_T)
#    ifndef WCHAR_MIN
#      define WCHAR_MIN 0
/* SUNpro has some bugs with casts. wchar_t is size of int there anyway. */
#        define WCHAR_MAX ((wchar_t)~0)
#    endif
#    if defined (__DMC__) || (defined (_STLP_MSVC_LIB) && (_STLP_MSVC_LIB < 1400)) || defined(_WIN32_WCE)
/* Compilers that do not define WCHAR_MIN and WCHAR_MAX to be testable at
 * preprocessing time. */
#      undef WCHAR_MIN
#      define WCHAR_MIN 0
#      undef WCHAR_MAX
#      define WCHAR_MAX 0xffff
#    endif
#  endif

#  if defined (_STLP_IMPORT_VENDOR_CSTD)


_STLP_BEGIN_NAMESPACE
#    if defined (_STLP_NO_WCHAR_T)
typedef int wint_t;
#    else
// gcc 3.0 has a glitch : wint_t only sucked into the global namespace if _GLIBCPP_USE_WCHAR_T is defined
// __MWERKS__ has definition in wchar_t.h (MSL C++), but ones differ from definition
// in stdio.h; I prefer settings from last file.
using _STLP_VENDOR_CSTD::wint_t;
#    endif

using _STLP_VENDOR_CSTD::size_t;

#    if !defined (_STLP_NO_NATIVE_MBSTATE_T) && !defined (_STLP_USE_OWN_MBSTATE_T)
using _STLP_VENDOR_MB_NAMESPACE::mbstate_t;

#      if !defined (_STLP_NO_CSTD_FUNCTION_IMPORTS) && !defined(_STLP_WCHAR_BORLAND_EXCLUDE) && \
         (!defined(__MSL__) || __MSL__ > 0x6001)
#        if defined (__MINGW32__) && ((__MINGW32_MAJOR_VERSION > 3) || ((__MINGW32_MAJOR_VERSION == 3) && (__MINGW32_MINOR_VERSION >= 8))) || \
          !(defined (__KCC) || defined (__GNUC__)) && !defined(_STLP_WCE_NET)
using _STLP_VENDOR_MB_NAMESPACE::btowc;
using _STLP_VENDOR_MB_NAMESPACE::mbsinit;
#        endif
#        if defined (__MINGW32__) && ((__MINGW32_MAJOR_VERSION > 3) || ((__MINGW32_MAJOR_VERSION == 3) && (__MINGW32_MINOR_VERSION >= 8))) || \
           !defined (__GNUC__) && !defined(_STLP_WCE_NET)
using _STLP_VENDOR_MB_NAMESPACE::mbrlen;
using _STLP_VENDOR_MB_NAMESPACE::mbrtowc;
using _STLP_VENDOR_MB_NAMESPACE::mbsrtowcs;
using _STLP_VENDOR_MB_NAMESPACE::wcrtomb;
using _STLP_VENDOR_MB_NAMESPACE::wcsrtombs;
#        endif
#      endif /* BORLAND && !__MSL__ || __MSL__ > 0x6001 */

#    endif /* _STLP_NO_NATIVE_MBSTATE_T */

#    if !defined (_STLP_NO_NATIVE_WIDE_FUNCTIONS) && ! defined (_STLP_NO_CSTD_FUNCTION_IMPORTS)

#      if !defined (_STLP_WCHAR_BORLAND_EXCLUDE) && ! defined (_STLP_NO_CSTD_FUNCTION_IMPORTS)
using _STLP_VENDOR_CSTD::fgetwc;
using _STLP_VENDOR_CSTD::fgetws;
using _STLP_VENDOR_CSTD::fputwc;
using _STLP_VENDOR_CSTD::fputws;
#      endif

#      if !(defined (_STLP_WCHAR_SUNPRO_EXCLUDE) || defined (_STLP_WCHAR_BORLAND_EXCLUDE) || \
            defined(_STLP_WCHAR_HPACC_EXCLUDE) )
using _STLP_VENDOR_CSTD::fwide;
using _STLP_VENDOR_CSTD::fwprintf;
using _STLP_VENDOR_CSTD::fwscanf;
using _STLP_VENDOR_CSTD::getwchar;
#      endif

#      if !defined(_STLP_WCHAR_BORLAND_EXCLUDE)
#        ifndef _STLP_WCE_NET
using _STLP_VENDOR_CSTD::getwc;
#        endif
using _STLP_VENDOR_CSTD::ungetwc;
#        ifndef _STLP_WCE_NET
using _STLP_VENDOR_CSTD::putwc;
#        endif
using _STLP_VENDOR_CSTD::putwchar;
#      endif

#      if !(defined (_STLP_WCHAR_SUNPRO_EXCLUDE) || defined (_STLP_WCHAR_BORLAND_EXCLUDE) || \
            defined (_STLP_WCHAR_HPACC_EXCLUDE) )
#        if defined (_STLP_MSVC_LIB) && (_STLP_MSVC_LIB <= 1300) || \
            defined (__MINGW32__)
#          undef swprintf
#          define swprintf _snwprintf
#          undef vswprintf
#          define vswprintf _vsnwprintf
using ::swprintf;
using ::vswprintf;
#        else
using _STLP_VENDOR_CSTD::swprintf;
using _STLP_VENDOR_CSTD::vswprintf;
#        endif
using _STLP_VENDOR_CSTD::swscanf;
using _STLP_VENDOR_CSTD::vfwprintf;
using _STLP_VENDOR_CSTD::vwprintf;

#        if (!defined(__MSL__) || __MSL__ > 0x7001 ) && !defined(_STLP_WCE_NET) && \
             !defined(_STLP_USE_UCLIBC) /* at least in uClibc 0.9.26 */

using _STLP_VENDOR_CSTD::wcsftime;
#        endif
using _STLP_VENDOR_CSTD::wcstok;

#      endif

#      if !defined (_STLP_WCE_NET)
using _STLP_VENDOR_CSTD::wcscoll;
using _STLP_VENDOR_CSTD::wcsxfrm;
#      endif
using _STLP_VENDOR_CSTD::wcscat;
using _STLP_VENDOR_CSTD::wcsrchr;
using _STLP_VENDOR_CSTD::wcscmp;

using _STLP_VENDOR_CSTD::wcscpy;
using _STLP_VENDOR_CSTD::wcscspn;

using _STLP_VENDOR_CSTD::wcslen;
using _STLP_VENDOR_CSTD::wcsncat;
using _STLP_VENDOR_CSTD::wcsncmp;
using _STLP_VENDOR_CSTD::wcsncpy;
using _STLP_VENDOR_CSTD::wcspbrk;
using _STLP_VENDOR_CSTD::wcschr;

using _STLP_VENDOR_CSTD::wcsspn;

#      if !defined (_STLP_WCHAR_BORLAND_EXCLUDE)
using _STLP_VENDOR_CSTD::wcstod;
using _STLP_VENDOR_CSTD::wcstol;
#      endif

#      if !(defined (_STLP_WCHAR_SUNPRO_EXCLUDE) || defined (_STLP_WCHAR_HPACC_EXCLUDE) )
using _STLP_VENDOR_CSTD::wcsstr;
using _STLP_VENDOR_CSTD::wmemchr;

#        if !defined (_STLP_WCHAR_BORLAND_EXCLUDE)
#            if !defined (_STLP_WCE_NET)
using _STLP_VENDOR_CSTD::wctob;
#            endif
using _STLP_VENDOR_CSTD::wmemcmp;
using _STLP_VENDOR_CSTD::wmemmove;
using _STLP_VENDOR_CSTD::wprintf;
using _STLP_VENDOR_CSTD::wscanf;
#        endif

using _STLP_VENDOR_CSTD::wmemcpy;
using _STLP_VENDOR_CSTD::wmemset;
#      endif

#    endif /* _STLP_NO_NATIVE_WIDE_FUNCTIONS */
_STLP_END_NAMESPACE

#  endif /* _STLP_IMPORT_VENDOR_CSTD */

#  undef _STLP_WCHAR_SUNPRO_EXCLUDE
#  undef _STLP_WCHAR_MSL_EXCLUDE

#  endif /* !defined(_STLP_WCE_EVC3) */

#endif /* _STLP_INTERNAL_CWCHAR */
