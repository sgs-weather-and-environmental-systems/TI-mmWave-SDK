/*****************************************************************************/
/*  ERRNO.H  v16.9.6                                                         */
/*                                                                           */
/* Copyright (c) 1995-2017 Texas Instruments Incorporated                    */
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

#ifndef _ERRNO
#define _ERRNO


#pragma diag_push
#pragma CHECK_MISRA("-6.3") /* standard types required for standard headers */
#pragma CHECK_MISRA("-19.1") /* #includes required for implementation */
#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */
#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */

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
// <cerrno> IS RECOMMENDED OVER <errno.h>.  <errno.h> IS PROVIDED FOR
// COMPATIBILITY WITH C AND THIS USAGE IS DEPRECATED IN C++
//----------------------------------------------------------------------------
extern "C" namespace std
{
#endif /* __cplusplus */

#include <linkage.h>
#include <_tls.h>

#if defined(__TMS470__) && defined(__TI_EABI_SUPPORT__) && \
    defined(_AEABI_PORTABILITY_LEVEL) && _AEABI_PORTABILITY_LEVEL != 0 
    extern const int __aeabi_EDOM;
    extern const int __aeabi_ERANGE;
    extern const int __aeabi_EILSEQ;
    #define EDOM   (__aeabi_EDOM)
    #define ERANGE (__aeabi_ERANGE)
    #define EILSEQ (__aeabi_EILSEQ)
#else

   /* Values defined by the C standard */

    #define EDOM           0x0021
    #define ERANGE         0x0022      
    #define EILSEQ         0x0058

   /* Values defined by POSIX. Unsupported macros are commented out */
   
    #define E2BIG          0x0007  
    #define EACCES         0x000D
    /* EADDRINUSE */
    /* EADDRNOTAVAIL */
    /* EAFNOSUPPORT */
    #define EAGAIN         0x000B
    /* EALREADY */
    #define EBADF          0x0009     
    #define EBADMSG        0x004D
    #define EBUSY          0x0010
    #define ECANCELED      0x002F  
    #define ECHILD         0x000A  
    /* ECONNABORTED */
    /* ECONNREFUSED */
    #define EDEADLK        0x002D     
    /* EDESTADDRREQ */
    /* EDOM defined above */
    /* EDQUOT */
    #define EEXIST         0x0011
    #define EFAULT         0x000E   
    #define EFBIG          0x001B
    /* EHOSTUNREACH */
    /* EIDRM */
    /* EILSEQ defined above */
    #define EINPROGRESS    0x0096
    #define EINTR          0x0004  
    #define EINVAL         0x0016  
    #define EIO            0x0005
    /* EISCONN */
    #define EISDIR         0x0015
    /* ELOOP */
    #define EMFILE         0x0018     
    #define EMLINK         0x001F
    #define EMSGSIZE       0x0061  
    /* EMULTIHOP */
    #define ENAMETOOLONG   0x004E     
    /* ENETDOWN */
    /* ENETREST */
    /* ENETUNREACH */
    #define ENFILE         0x0017
    /* ENOBUFS */
    /* ENODATA */
    #define ENODEV         0x0013
    #define ENOENT         0x0002
    #define ENOEXEC        0x0008  
    #define ENOLCK         0x002E
    /* ENOLINK */
    #define ENOMEM         0x000C
    /* ENOMSG */
    /* ENOPROTOOPT */
    #define ENOSPC         0x001C   
    /* ENOSR */
    /* ENOSTR */
    #define ENOSYS         0x0059
    /* ENOTCONN */
    #define ENOTDIR        0x0014     
    #define ENOTEMPTY      0x005D
    /* ENOTSOCK */
    #define ENOTSUP        0x0030
    #define ENOTTY         0x0019
    #define ENXIO          0x0006
    /* EOPNOTSUPP */
    /* EOVERFLOW */
    #define EPERM          0x0001
    #define EPIPE          0x0020
    /* EPROTO */
    /* EPROTONOSUPPORT */
    /* EPROTOTYPE */
    /* ERANGE defined above */
    #define EROFS          0x001E
    #define ESPIPE         0x001D
    #define ESRCH          0x0003
    /* ESTALE */
    /* ETIME */
    #define ETIMEDOUT      0x0091
    /* ETXTBSY */
    /* EWOULDBLOCK */
    #define EXDEV          0x0012

    /* TI specific value used in ftell() and fgetpos() */
    #define EFPOS          0x0098
#endif

#if defined(__TMS470__) && defined(__TI_EABI_SUPPORT__) && defined(__TI_EABI__) && \
    defined(_AEABI_PORTABILITY_LEVEL) && _AEABI_PORTABILITY_LEVEL != 0
    extern volatile int *__aeabi_errno_addr(void);
    #ifdef __cplusplus
      #define errno (* ::std::__aeabi_errno_addr())
    #else
      #define errno (* __aeabi_errno_addr())
    #endif
#else
    extern _DATA_ACCESS int errno;
    #pragma diag_push
    /* errno is not allowed under MISRA, anyway */
    #pragma CHECK_MISRA("-5.6") /* duplicated name in another scope (errno) */
    #pragma CHECK_MISRA("-19.4") /* macro expands to parenthesized */
    #ifdef __cplusplus
      #define errno ::std::errno
    #else
      #define errno errno
    #endif
    #pragma diag_pop
#endif

#ifdef __cplusplus
} /* extern "C" namespace std */
#endif /* __cplusplus */

#pragma diag_pop

#endif  /* _ERRNO */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)

#if _AEABI_PORTABILITY_CHECK
using std::__aeabi_errno_addr;
using std::__aeabi_EDOM;
using std::__aeabi_ERANGE;
using std::__aeabi_EILSEQ;
#endif

#endif /* _CPP_STYLE_HEADER */

#pragma diag_pop
