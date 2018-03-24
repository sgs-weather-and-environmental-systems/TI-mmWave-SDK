/******************************************************************************/
/* This file was taken from STLport <www.stlport.org> and modified by         */
/* Texas Instruments.                                                         */
/******************************************************************************/

/*
 * Copyright (c) 1999
 * Silicon Graphics Computer Systems, Inc.
 *
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

#ifndef _STLP_STDIO_FILE_H
#define _STLP_STDIO_FILE_H

/* This file provides a low-level interface between the internal
 * representation of struct FILE, from the C stdio library, and
 * the C++ I/O library. */

#ifndef _STLP_CSTDIO
#  include <cstdio>
#endif
#ifndef _STLP_CSTDDEF
#  include <cstddef>
#endif


_STLP_BEGIN_NAMESPACE

#if defined (_STLP_WCE)

inline int _FILE_fd(const FILE *__f) {
  /* Check if FILE is one of the three standard streams
     We do this check first, because invoking _fileno() on one of them
     causes a terminal window to be created. This also happens if you do
     any IO on them, but merely retrieving the filedescriptor shouldn't
     already do that.

     Obviously this is pretty implementation-specific because it requires
     that indeed the first three FDs are always the same, but that is not
     only common but almost guaranteed. */
  for (int __fd = 0; __fd != 3; ++__fd) {
    if (__f == _getstdfilex(__fd))
      return __fd;
  }

  /* Normal files. */
  return (int)::_fileno((FILE*)__f); 
}

# elif defined (_STLP_SCO_OPENSERVER) || defined (__NCR_SVR)

inline int _FILE_fd(const FILE *__f) { return __f->__file; }

#elif defined (__hpux) /* && defined(__hppa) && defined(__HP_aCC)) */ || \
      defined (__MVS__) || \
      defined (_STLP_USE_UCLIBC) /* should be before _STLP_USE_GLIBC */

inline int _FILE_fd(const FILE *__f) { return fileno(__CONST_CAST(FILE*, __f)); }

#elif defined (_STLP_USE_GLIBC)

inline int _FILE_fd(const FILE *__f) { return __f->_fileno; }

#else

inline int _FILE_fd(const FILE *__f) { return __f->fd; }

#endif

_STLP_END_NAMESPACE

#endif /* _STLP_STDIO_FILE_H */

/* Local Variables:
 * mode:C++
 * End: */
