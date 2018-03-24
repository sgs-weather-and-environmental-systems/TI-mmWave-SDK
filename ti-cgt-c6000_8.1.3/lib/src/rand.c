/****************************************************************************/
/*  rand.c v8.1.3							    */
/*                                                                          */
/* Copyright (c) 1993-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/
#include <stdlib.h>
#include <_mutex.h>
#include <_tls.h>

/***************************************************************/
/* THIS IS AN IMPLEMENTATION WHICH IS INTENDED TO BE PORTABLE, */
/* AS PER THE ANSI STANDARD C SPECIFICATION                    */
/***************************************************************/

/*--------------------------------------------------------------------------*/
/* rand() and srand() use a static scalar type variable to compute the next */
/* "random" number. 'next' is given thread-local storage here to avoid race */
/* conditions between threads when assigning to 'next'.                     */
/*--------------------------------------------------------------------------*/
__TI_TLS_DATA_DEF(static, unsigned long, next, 1);

_CODE_ACCESS int rand(void)
{
     int r;

     /*---------------------------------------------------------------------*/
     /* To maintain backwards compatibility with releases that do not use   */
     /* TLS, we use a mutex lock to protect accesses to the variable 'next'.*/
     /*---------------------------------------------------------------------*/
#if !defined(__TI_USE_TLS)
     __TI_resource_lock(__TI_LOCK_RAND);
#endif
     next = next * 1103515245 + 12345;
     r = (int)((next/65536) % ((unsigned long)RAND_MAX + 1));
#if !defined(__TI_USE_TLS)
     __TI_resource_unlock(__TI_LOCK_RAND);
#endif
     return r;
}

_CODE_ACCESS void srand(unsigned seed)
{
     /*---------------------------------------------------------------------*/
     /* To maintain backwards compatibility with releases that do not use   */
     /* TLS, we use a mutex lock to protect accesses to the variable 'next'.*/
     /*---------------------------------------------------------------------*/
#if !defined(__TI_USE_TLS)
     __TI_resource_lock(__TI_LOCK_RAND);
#endif
     next = seed;
#if !defined(__TI_USE_TLS)
     __TI_resource_unlock(__TI_LOCK_RAND);
#endif
}
