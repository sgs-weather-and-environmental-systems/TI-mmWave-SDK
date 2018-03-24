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


#include <fstream>


#include <cstdio>




#  include <_mutex.h>

#if defined (_STLP_MSVC) || defined (__MINGW32__)
#  include <fcntl.h>
#  define S_IREAD _S_IREAD
#  define S_IWRITE _S_IWRITE
#  define S_IFREG _S_IFREG
     // map permission masks
#  ifndef S_IRUSR
#    define S_IRUSR _S_IREAD
#    define S_IWUSR _S_IWRITE
#  endif
#  ifndef S_IRGRP
#    define S_IRGRP _S_IREAD
#    define S_IWGRP _S_IWRITE
#  endif
#  ifndef S_IROTH
#    define S_IROTH _S_IREAD
#    define S_IWOTH _S_IWRITE
#  endif

#  ifndef O_RDONLY
#    define O_RDONLY _O_RDONLY
#    define O_WRONLY _O_WRONLY
#    define O_RDWR   _O_RDWR
#    define O_APPEND _O_APPEND
#    define O_CREAT  _O_CREAT
#    define O_TRUNC  _O_TRUNC
#    define O_TEXT   _O_TEXT
#    define O_BINARY _O_BINARY
#  endif

#  ifndef O_ACCMODE
#    define O_ACCMODE (O_RDONLY|O_WRONLY|O_RDWR)
#  endif
#endif

const _STLP_fd INVALID_STLP_FD = -1;



/****************************************************************************/
/* File flags taken from stdio.h.                                           */
/****************************************************************************/
#  define S_IFREG  0        // Regular file -- unsupported
#  define S_IRUSR  _MODER   // User RW
#  define S_IWUSR  _MODEW
#  define S_IRGRP  _MODER   // Group RW
#  define S_IWGRP  _MODEW
#  define S_IROTH  _MODER   // Others RW
#  define S_IWOTH  _MODEW
#  define S_IREAD  _MODER   // Generic RW
#  define S_IWRITE _MODEW
#  define S_IEXEC  0        // Executable -- unsupported

/****************************************************************************/
/* Access to the current length of the file table.                          */
/****************************************************************************/
extern _DATA_ACCESS int __TI_ft_end;

/****************************************************************************/
/* FILENO                                                                   */
/*   Implementation of the POSIX fileno operation.  Only provided locally   */
/*   to satisfy STLport usage below.                                        */
/****************************************************************************/
static int fileno(std::FILE *f)
{
    return f->fd;
}

_STLP_BEGIN_NAMESPACE

// Compare with streamoff definition in stl/char_traits.h!

#if defined (_STLP_USE_DEFAULT_FILE_OFFSET) || \
    (!defined(_LARGEFILE_SOURCE) && !defined(_LARGEFILE64_SOURCE))
#  define FOPEN fopen
#  define FSEEK fseek
#  define FSTAT fstat
#  define STAT  stat
#  define FTELL ftell
#else
#  define FOPEN fopen64
#  define FSEEK fseeko64
#  define FSTAT fstat64
#  define STAT  stat64
#  define FTELL ftello64
#endif

_STLP_MOVE_TO_PRIV_NAMESPACE

// Helper functions for _Filebuf_base.

/****************************************************************************/
/* GETFILEFROMFD                                                            */
/*   Given a file descriptor, returns the corresponding FILE*.  If no such  */
/*   FILE exists, return NULL.                                              */
/****************************************************************************/
static FILE *getFileFromFD(int fd)
{
    __TI_resource_lock(__TI_LOCK_FILE_TBL);
    FILE *f = NULL;
    for (int index = 0; index < __TI_ft_end; index++)
    {
        if (_ftable[index].fd != -1 &&
            _ftable[index].fd == fd)
        {
            f = &(_ftable[index]);
            break;
        }
    }
    __TI_resource_unlock(__TI_LOCK_FILE_TBL);
    return f;
}

static bool __is_regular_file(_STLP_fd fd) {
  /**************************************************************************/
  /* We have no concept of special files.  Return true in all cases.        */
  /**************************************************************************/
  return true;
}

// Number of characters in the file.
static streamoff __file_size(_STLP_fd fd) {
  streamoff ret = 0;

  /**************************************************************************/
  /* We do not support POSIX stat.  Allow 0 to be returned in all cases.    */
  /**************************************************************************/

  return ret;
}

_STLP_MOVE_TO_STD_NAMESPACE

// All version of Unix have mmap and lseek system calls.  Some also have
// longer versions of those system calls to accommodate 64-bit offsets.
// If we're on a Unix system, define some macros to encapsulate those
// differences.

_DATA_ACCESS size_t _Filebuf_base::_M_page_size = 4096;

_Filebuf_base::_Filebuf_base()
  : _M_file_id(INVALID_STLP_FD),
    _M_openmode(0),
    _M_is_open(false),
    _M_should_close(false)
{}

void _Filebuf_base::_S_initialize()
{

}

// Return the size of the file.  This is a wrapper for stat.
// Returns zero if the size cannot be determined or is ill-defined.
streamoff _Filebuf_base::_M_file_size()
{
  return _STLP_PRIV __file_size(_M_file_id);
}

bool _Filebuf_base::_M_open(const char* name, ios_base::openmode openmode,
                            long permission)
{
  _STLP_fd file_no;

  if (_M_is_open)
    return false;

  // use FILE-based i/o
  const char* flags;

  switch (openmode & (~ios_base::ate)) {
    case ios_base::out:
    case ios_base::out | ios_base::trunc:
      flags = "w";
      break;

    case ios_base::out | ios_base::binary:
    case ios_base::out | ios_base::trunc | ios_base::binary:
      flags = "wb";
      break;

    case ios_base::out | ios_base::app:
      flags = "a";
      break;

    case ios_base::out | ios_base::app | ios_base::binary:
      flags = "ab";
      break;

    case ios_base::in:
      flags = "r";
      break;

    case ios_base::in | ios_base::binary:
      flags = "rb";
      break;

    case ios_base::in | ios_base::out:
      flags = "r+";
      break;

    case ios_base::in | ios_base::out | ios_base::binary:
      flags = "r+b";
      break;

    case ios_base::in | ios_base::out | ios_base::trunc:
      flags = "w+";
      break;

    case ios_base::in | ios_base::out | ios_base::trunc | ios_base::binary:
      flags = "w+b";
      break;

    default:                      // The above are the only combinations of
      return false;               // flags allowed by the C++ standard.
  }

  // fbp : TODO : set permissions !
  (void)permission; // currently unused    //*TY 02/26/2000 - added to suppress warning message
  _M_file = FOPEN(name, flags);

  if (_M_file) {
    file_no = fileno(_M_file);
  } else {
    return false;
  }

  // unset buffering immediately
  setbuf(_M_file, 0);

  _M_is_open = true;

  if (openmode & ios_base::ate) {
    if (FSEEK(_M_file, 0, SEEK_END) != 0)
      _M_is_open = false;
  }

  _M_file_id = file_no;
  _M_should_close = _M_is_open;
  _M_openmode = openmode;

  if (_M_is_open)
    _M_regular_file = _STLP_PRIV __is_regular_file(_M_file_id);

  return (_M_is_open != 0);
}


bool _Filebuf_base::_M_open(const char* name, ios_base::openmode openmode)
{
  // This doesn't really grant everyone in the world read/write
  // access.  On Unix, file-creation system calls always clear
  // bits that are set in the umask from the permissions flag.
  return this->_M_open(name, openmode, S_IRUSR | S_IWUSR | S_IRGRP |
                                       S_IWGRP | S_IROTH | S_IWOTH);
}

// Associated the filebuf with a file descriptor pointing to an already-
// open file.  Mode is set to be consistent with the way that the file
// was opened.
bool _Filebuf_base::_M_open( int file_no, ios_base::openmode )
{
  if (_M_is_open || file_no < 0)
    return false;

  FILE *f = _STLP_PRIV getFileFromFD(file_no);
  /**************************************************************************/
  /* Make sure that we could map the file descriptor back to a FILE.        */
  /**************************************************************************/
  if (f == NULL) return false;
  unsigned int mode = f->flags;

  switch ( mode & (S_IWRITE | S_IREAD) ) {
    case S_IREAD:
      _M_openmode = ios_base::in;
      break;
    case S_IWRITE:
      _M_openmode = ios_base::out;
      break;
    case (S_IWRITE | S_IREAD):
      _M_openmode = ios_base::in | ios_base::out;
      break;
    default:
      return false;
  }
  _M_file_id = file_no;
  _M_is_open = true;
  _M_should_close = false;
  _M_regular_file = _STLP_PRIV __is_regular_file(_M_file_id);
  /**************************************************************************/
  /* BUG FIX: (IMPLEMENTATION SPECIFIC TO TI)                               */
  /*   When we tie this buffer to an already open file, the FILE* needs to  */
  /*   be updated, not just the file descriptor.                            */
  /**************************************************************************/
  _M_file = f;
  return true;
}

bool _Filebuf_base::_M_close()
{
  if (!_M_is_open)
    return false;

  bool ok = _M_should_close ? (fclose(_M_file) == 0) : true;

  _M_is_open = _M_should_close = false;
  _M_openmode = 0;
  return ok;
}

// Read up to n characters into a buffer.  Return value is number of
// characters read.
ptrdiff_t _Filebuf_base::_M_read(char* buf, ptrdiff_t n) {
  return fread(buf, 1, n, _M_file);
}

// Write n characters from a buffer.  Return value: true if we managed
// to write the entire buffer, false if we didn't.
bool _Filebuf_base::_M_write(char* buf, ptrdiff_t n)
{
  for (;;) {
    ptrdiff_t written = fwrite(buf, 1, n, _M_file);

    if (n == written) {
      return true;
    }

    if (written > 0 && written < n) {
      n -= written;
      buf += written;
    } else {
      return false;
    }
  }
}

// Wrapper for lseek or the like.
streamoff _Filebuf_base::_M_seek(streamoff offset, ios_base::seekdir dir)
{
  int whence;

  switch ( dir ) {
    case ios_base::beg:
      if (offset < 0 /* || offset > _M_file_size() */ )
        return streamoff(-1);
      whence = SEEK_SET;
      break;
    case ios_base::cur:
      whence = SEEK_CUR;
      break;
    case ios_base::end:
      if (/* offset > 0 || */  -offset > _M_file_size() )
        return streamoff(-1);
      whence = SEEK_END;
      break;
    default:
      return streamoff(-1);
  }

  if ( FSEEK(_M_file, offset, whence) == 0 ) {
    return FTELL(_M_file);
  }

  return streamoff(-1);
}


// Attempts to memory-map len bytes of the current file, starting
// at position offset.  Precondition: offset is a multiple of the
// page size.  Postcondition: return value is a null pointer if the
// memory mapping failed.  Otherwise the return value is a pointer to
// the memory-mapped file and the file position is set to offset.
void *_Filebuf_base::_M_mmap(streamoff, streamoff )
{
  return 0;
}

void _Filebuf_base::_M_unmap(void*, streamoff)
{
  // precondition : there is a valid mapping at the moment
}

_STLP_END_NAMESPACE
