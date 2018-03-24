/*****************************************************************************/
/* STDIO.H v16.9.6                                                           */
/*                                                                           */
/* Copyright (c) 1993-2017 Texas Instruments Incorporated                    */
/* http://www.ti.com/                                                        */
/*                                                                           */
/*  Redistribution and  use in source  and binary forms, with  or without    */
/*  modification,  are permitted provided  that the  following conditions    */
/*  are met:                                                                 */
/*                                                                           */
/*     Redistributions  of source  code must  retain the  above copyright    */
/*     notice, this list of conditions and the following disclaimer.         */
/*                                                                           */
/*     Redistributions in binary form  must reproduce the above copyright    */
/*     notice, this  list of conditions  and the following  disclaimer in    */
/*     the  documentation  and/or   other  materials  provided  with  the    */
/*     distribution.                                                         */
/*                                                                           */
/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
/*     of its  contributors may  be used to  endorse or  promote products    */
/*     derived  from   this  software  without   specific  prior  written    */
/*     permission.                                                           */
/*                                                                           */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
/*                                                                           */
/*****************************************************************************/
#ifndef _STDIO 
#define _STDIO


#include <linkage.h>
#include <stdarg.h>

/*---------------------------------------------------------------------------*/
/* Attributes are only available in relaxed ANSI mode.                       */
/*---------------------------------------------------------------------------*/
#ifndef __ATTRIBUTE
#if __TI_STRICT_ANSI_MODE__
#define __ATTRIBUTE(attr)
#else
#define __ATTRIBUTE(attr) __attribute__(attr)
#endif
#endif

/*---------------------------------------------------------------------------*/
/* A header file conforming to ARM CLIB ABI (GENC-003539), should            */
/* define _AEABI_PORTABLE when _AEABI_PORTABILITY_LEVEL is defined.          */
/*---------------------------------------------------------------------------*/
#if defined(_AEABI_PORTABILITY_LEVEL) && !defined(_AEABI_PORTABLE)
#define _AEABI_PORTABLE
#endif

/*---------------------------------------------------------------------------*/
/* The macro definition that guards CLIB ABI (GENC-003539) requirements.     */
/*---------------------------------------------------------------------------*/
#if defined(__TI_EABI_SUPPORT__)
#define _AEABI_PORTABILITY_CHECK (defined(__TMS470__) && \
                                  defined(__TI_EABI_SUPPORT__) && \
                                  defined(_AEABI_PORTABILITY_LEVEL) && \
                                  _AEABI_PORTABILITY_LEVEL != 0)
#else
#define _AEABI_PORTABILITY_CHECK 0
#endif

#ifdef __cplusplus
//----------------------------------------------------------------------------
// <cstdio> IS RECOMMENDED OVER <stdio.h>.  <stdio.h> IS PROVIDED FOR
// COMPATIBILITY WITH C AND THIS USAGE IS DEPRECATED IN C++
//----------------------------------------------------------------------------
extern "C" namespace std {
#endif

/****************************************************************************/
/* TYPES THAT ANSI REQUIRES TO BE DEFINED                                   */
/****************************************************************************/
#ifndef _SIZE_T
#define _SIZE_T
typedef __SIZE_T_TYPE__ size_t;
#endif

typedef struct {
      int fd;                    /* File descriptor */
      unsigned char* buf;        /* Pointer to start of buffer */
      unsigned char* pos;        /* Position in buffer */
      unsigned char* bufend;     /* Pointer to end of buffer */
      unsigned char* buff_stop;  /* Pointer to last read char in buffer */
      unsigned int   flags;      /* File status flags (see below) */
} FILE;

#ifndef _FPOS_T
#define _FPOS_T
#if _AEABI_PORTABILITY_CHECK
typedef struct __fpos_t_struct {
    unsigned long long __pos;
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
#else
typedef long fpos_t;
#endif /* c6x */
#endif /* _FPOS_T */

/****************************************************************************/
/* DEVICE AND STREAM RELATED MACROS                                         */
/****************************************************************************/
/****************************************************************************/
/* MACROS THAT DEFINE AND USE FILE STATUS FLAGS                             */
/****************************************************************************/
#if _AEABI_PORTABILITY_CHECK
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;
#define stdin  (__aeabi_stdin)
   /* pointer to a FILE object associated with standard input stream */
#define stdout (__aeabi_stdout)
   /* pointer to a FILE object associated with standard output stream */
#define stderr (__aeabi_stderr)
   /* pointer to a FILE object associated with standard error stream */
extern const int __aeabi_IOFBF;
#define _IOFBF (__aeabi_IOFBF)
extern const int __aeabi_IONBF;
#define _IONBF (__aeabi_IONBF)
extern const int __aeabi_IOLBF;
#define _IOLBF (__aeabi_IOLBF)
extern const int __aeabi_BUFSIZ;
#define BUFSIZ (__aeabi_BUFSIZ)
extern const int __aeabi_FOPEN_MAX;
#define FOPEN_MAX (__aeabi_FOPEN_MAX)
extern const int __aeabi_TMP_MAX;
#define TMP_MAX (__aeabi_TMP_MAX)
extern const int __aeabi_FILENAME_MAX;
#define FILENAME_MAX (__aeabi_FILENAME_MAX)
extern const int __aeabi_L_tmpnam;
#define L_tmpnam (__aeabi_L_tmpnam)

#else /* _AEABI_PORTABILITY_CHECK */

#define _IOFBF       0x0001
#define _IOLBF       0x0002
#define _IONBF       0x0004
#define _BUFFALOC    0x0008
#define _MODER       0x0010
#define _MODEW       0x0020
#define _MODERW      0x0040
#define _MODEA       0x0080
#define _MODEBIN     0x0100
#define _STATEOF     0x0200
#define _STATERR     0x0400
#define _UNGETC      0x0800
#define _TMPFILE     0x1000

#define _SET(_fp, _b)      (((_fp)->flags) |= (_b))
#define _UNSET(_fp, _b)    (((_fp)->flags) &= ~(_b))
#define _STCHK(_fp, _b)    (((_fp)->flags) & (_b))
#define _BUFFMODE(_fp)     (((_fp)->flags) & (_IOFBF | _IOLBF | _IONBF))
#define _ACCMODE(_fp)      (((_fp)->flags) & (_MODER | _MODEW))

/****************************************************************************/
/* MACROS THAT ANSI REQUIRES TO BE DEFINED                                  */
/****************************************************************************/
#define BUFSIZ          256 

#define FOPEN_MAX       _NFILE
#define FILENAME_MAX    256  
#define TMP_MAX         65535

#ifdef __cplusplus
#define stdin     (&std::_ftable[0])      
#define stdout    (&std::_ftable[1])
#define stderr    (&std::_ftable[2])
#else
#define stdin     (&_ftable[0])      
#define stdout    (&_ftable[1])
#define stderr    (&_ftable[2])
#endif

#define L_tmpnam  _LTMPNAM

#endif /* _AEABI_PORTABILITY_CHECK */

#define SEEK_SET  (0x0000)
#define SEEK_CUR  (0x0001)
#define SEEK_END  (0x0002)

#ifndef NULL
#define NULL 0
#endif

#ifndef EOF
#define EOF    (-1)
#endif

/******** END OF ANSI MACROS ************************************************/

#define P_tmpdir        ""                   /* Path for temp files         */

/****************************************************************************/
/* DEVICE AND STREAM RELATED DATA STRUCTURES AND MACROS                     */
/****************************************************************************/
#define _NFILE           10                   /* Max number of files open   */
#define _LTMPNAM         16                   /* Length of temp name        */

extern _DATA_ACCESS FILE _ftable[_NFILE];
extern _DATA_ACCESS char __TI_tmpnams[_NFILE][_LTMPNAM];

/****************************************************************************/
/*   FUNCTION DEFINITIONS  - ANSI                                           */
/****************************************************************************/
/****************************************************************************/
/* OPERATIONS ON FILES                                                      */
/****************************************************************************/
extern _CODE_ACCESS int     remove(const char *_file);
extern _CODE_ACCESS int     rename(const char *_old, const char *_new);
extern _CODE_ACCESS FILE   *tmpfile(void);
extern _CODE_ACCESS char   *tmpnam(char *_s);

/****************************************************************************/
/* FILE ACCESS FUNCTIONS                                                    */
/****************************************************************************/
extern _CODE_ACCESS int     fclose(FILE *_fp); 
extern _CODE_ACCESS FILE   *fopen(const char *_fname, const char *_mode);
extern _CODE_ACCESS FILE   *freopen(const char *_fname, const char *_mode,
			            register FILE *_fp);
extern _CODE_ACCESS void    setbuf(register FILE *_fp, char *_buf);
extern _CODE_ACCESS int     setvbuf(register FILE *_fp, register char *_buf, 
			            register int _type, register size_t _size);
extern _CODE_ACCESS int     fflush(register FILE *_fp); 

/****************************************************************************/
/* FORMATTED INPUT/OUTPUT FUNCTIONS                                         */
/****************************************************************************/
extern _CODE_ACCESS int fprintf(FILE *_fp, const char *_format, ...)
               __ATTRIBUTE ((__format__ (__printf__, 2, 3)));
extern _CODE_ACCESS int fscanf(FILE *_fp, const char *_fmt, ...)
               __ATTRIBUTE ((__format__ (__scanf__, 2, 3)));
extern _CODE_ACCESS int printf(const char *_format, ...)
               __ATTRIBUTE ((__format__ (__printf__, 1, 2)));
extern _CODE_ACCESS int scanf(const char *_fmt, ...)
               __ATTRIBUTE ((__format__ (__scanf__, 1, 2)));
extern _CODE_ACCESS int sprintf(char *_string, const char *_format, ...)
               __ATTRIBUTE ((__format__ (__printf__, 2, 3)));
extern _CODE_ACCESS int snprintf(char *_string, size_t _n, 
				 const char *_format, ...)
               __ATTRIBUTE ((__format__ (__printf__, 3, 4)));
extern _CODE_ACCESS int sscanf(const char *_str, const char *_fmt, ...)
               __ATTRIBUTE ((__format__ (__scanf__, 2, 3)));
extern _CODE_ACCESS int vfprintf(FILE *_fp, const char *_format, va_list _ap)
               __ATTRIBUTE ((__format__ (__printf__, 2, 0)));
extern _CODE_ACCESS int vfscanf(FILE *_fp, const char *_fmt, va_list _ap)
               __ATTRIBUTE ((__format__ (__scanf__, 2, 0)));
extern _CODE_ACCESS int vprintf(const char *_format, va_list _ap)
               __ATTRIBUTE ((__format__ (__printf__, 1, 0)));
extern _CODE_ACCESS int vscanf(const char *_format, va_list _ap)
               __ATTRIBUTE ((__format__ (__scanf__, 1, 0)));
extern _CODE_ACCESS int vsprintf(char *_string, const char *_format,
				 va_list _ap)
               __ATTRIBUTE ((__format__ (__printf__, 2, 0)));
extern _CODE_ACCESS int vsnprintf(char *_string, size_t _n, 
				  const char *_format, va_list _ap)
               __ATTRIBUTE ((__format__ (__printf__, 3, 0)));
extern _CODE_ACCESS int vsscanf(const char *_str, const char *_fmt, va_list _ap)
               __ATTRIBUTE ((__format__ (__scanf__, 2, 0)));

/****************************************************************************/
/* CHARACTER INPUT/OUTPUT FUNCTIONS                                         */
/****************************************************************************/
extern _CODE_ACCESS int     fgetc(register FILE *_fp);
extern _CODE_ACCESS char   *fgets(char *_ptr, register int _size,
				  register FILE *_fp);
extern _CODE_ACCESS int     fputc(int _c, register FILE *_fp);
extern _CODE_ACCESS int     fputs(const char *_ptr, register FILE *_fp);
extern _CODE_ACCESS int     getc(FILE *_p);
extern _CODE_ACCESS int     getchar(void);
extern _CODE_ACCESS char   *gets(char *_ptr); 
extern _CODE_ACCESS int     putc(int _x, FILE *_fp);
extern _CODE_ACCESS int     putchar(int _x);
extern _CODE_ACCESS int     puts(const char *_ptr); 
extern _CODE_ACCESS int     ungetc(int _c, register FILE *_fp);

/****************************************************************************/
/* DIRECT INPUT/OUTPUT FUNCTIONS                                            */
/****************************************************************************/
extern _CODE_ACCESS size_t  fread(void *_ptr, size_t _size, size_t _count,
				  FILE *_fp);
extern _CODE_ACCESS size_t  fwrite(const void *_ptr, size_t _size,
				   size_t _count, register FILE *_fp); 

/****************************************************************************/
/* FILE POSITIONING FUNCTIONS                                               */
/****************************************************************************/
extern _CODE_ACCESS int     fgetpos(FILE *_fp, fpos_t *_pos);
extern _CODE_ACCESS int     fseek(register FILE *_fp, long _offset,
				  int _ptrname);
extern _CODE_ACCESS int     fsetpos(FILE *_fp, const fpos_t *_pos);
extern _CODE_ACCESS long    ftell(FILE *_fp);
extern _CODE_ACCESS void    rewind(register FILE *_fp); 

/****************************************************************************/
/* ERROR-HANDLING FUNCTIONS                                                 */
/****************************************************************************/
extern _CODE_ACCESS void    clearerr(FILE *_fp);
extern _CODE_ACCESS int     feof(FILE *_fp);
extern _CODE_ACCESS int     ferror(FILE *_fp);
extern _CODE_ACCESS void    perror(const char *_s);

#define _getchar()      getc(stdin)
#define _putchar(_x)    putc((_x), stdout)
#define _clearerr(_fp)   ((void) ((_fp)->flags &= ~(_STATERR | _STATEOF)))

#define _ferror(_x)     ((_x)->flags & _STATERR)

#define _remove(_fl)    (unlink((_fl)))

#ifdef __cplusplus
} /* extern "C" namespace std */
#endif  /* __cplusplus */

#endif  /* #ifndef _STDIO */

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
using std::size_t;
using std::FILE;
using std::fpos_t;
using std::_ftable;
using std::__TI_tmpnams;
using std::remove;
using std::rename;
using std::tmpfile;
using std::tmpnam;
using std::fclose;
using std::fopen;
using std::freopen;
using std::setbuf;
using std::setvbuf;
using std::fflush;
using std::fprintf;
using std::fscanf;
using std::printf;
using std::scanf;
using std::sprintf;
using std::snprintf;
using std::sscanf;
using std::vfprintf;
using std::vprintf;
using std::vsprintf;
using std::vsnprintf;
using std::fgetc;
using std::fgets;
using std::fputc;
using std::fputs;
using std::getc;
using std::getchar;
using std::gets;
using std::putc;
using std::putchar;
using std::puts;
using std::ungetc;
using std::fread;
using std::fwrite;
using std::fgetpos;
using std::fseek;
using std::fsetpos;
using std::ftell;
using std::rewind;
using std::clearerr;
using std::feof;
using std::ferror;
using std::perror;
#if _AEABI_PORTABILITY_CHECK
using std::__aeabi_stdin;
using std::__aeabi_stdout;
using std::__aeabi_stderr;
using std::__aeabi_IOFBF;
using std::__aeabi_IONBF;
using std::__aeabi_IOLBF;
using std::__aeabi_BUFSIZ;
using std::__aeabi_FOPEN_MAX;
using std::__aeabi_TMP_MAX;
using std::__aeabi_FILENAME_MAX;
using std::__aeabi_L_tmpnam;
#endif

#endif  /* _CPP_STYLE_HEADER */


