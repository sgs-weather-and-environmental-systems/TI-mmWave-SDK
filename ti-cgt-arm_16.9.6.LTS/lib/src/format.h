/*****************************************************************************/
/*  FORMAT.H v16.9.6                                                         */
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

/*****************************************************************************/
/* Structures and macros used in printf and scanf                            */
/*****************************************************************************/
#ifndef __FORMAT_H
#define __FORMAT_H
#include <stdarg.h>


#if defined (MINIMAL)
#define FORMAT_CONVERSION_BUFSIZE 32
#else
/****************************************************************************/
/*   The minimum max conversion size to be C89 compliant is 509             */
/****************************************************************************/
#define FORMAT_CONVERSION_BUFSIZE 510
#define F_CONVERSION_BUFSIZE      510
#define FLOAT_VALUE_BUFSIZE       100
#endif

#ifdef __cplusplus
extern "C" namespace std {
#else 
extern
#endif

  int __TI_scanfi(void *inp, const char *_format, va_list _ap,
                  int (*_chkmbc)(void **inp, char **_format, int *num_read),
                  int (*_inpchar)(void **inp),
                  void (*_uninpchar)(void **inp, int outchar));
 
  /**************************************************************************/
  /* _FIELD STRUCTURE AND MACROS USED FOR PRINTF AND SCANF                  */
  /**************************************************************************/
  typedef struct {
    unsigned int flags;         /* Format flags */
    int          fwidth;        /* Field width */
    int          precision;     /* Field precision */
    char         conv;          /* Conversion specifier */
  } _PFIELD;
  
  typedef struct {
    unsigned int flags;         /* Format flags */
    int          fwidth;        /* Field width */
    int          precision;     /* Field precision */
    char         scanset[96];   /* Scanset used for '[' conversion */
    char         conv;          /* Conversion specifier */
  } _SFIELD;

#ifdef __cplusplus
}
#endif /* __cplusplus */

/****************/
/* PRINTF FLAGS */
/****************/

#define _PFMINUS  0x01
#define _PFPLUS   0x02
#define _PFSPACE  0x04
#define _PFPOUND  0x08
#define _PFZERO   0x10
 
/***************/
/* SCANF FLAGS */
/***************/

#define _SFSTAR   0x01
#define _SFCIRC   0x02

/****************/
/* MUTUAL FLAGS */
/****************/

#define _MFH      0x20
#define _MFL      0x40
#define _MFLD     0x80
#define _MFLL     0x100
#define _MFHH     0x200
#define _MFI40    0x400

#endif
