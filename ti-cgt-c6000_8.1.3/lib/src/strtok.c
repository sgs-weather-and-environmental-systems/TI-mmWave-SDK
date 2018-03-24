/****************************************************************************/
/*  strtok v8.1.3                                                           */
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
#include <string.h>
#include <_tls.h>

/*--------------------------------------------------------------------------*/
/* We give each thread its own copy of 'last_end' to protect threads from   */
/* each other when calls to strtok() from separate threads overlap.         */
/* However, the strtok() is still not re-entrant. Within a single thread,   */
/* the 'last_end' pointer maintains a state which carries over successive   */
/* calls to strtok() from the same thread.                                  */
/*--------------------------------------------------------------------------*/
__TI_TLS_DATA_DEF(static, char *, last_end, NULL);

/****************************************************************************/
/* strtok()                                                                 */
/*                                                                          */
/* This is a non-reentrant function. Within the same thread, multiple calls */
/* to strtok() should not overlap.                                          */
/****************************************************************************/
_CODE_ACCESS char *strtok(char *str1, const char *str2)
{
     char *start; 

     if (str1) last_end = str1;

     last_end += strspn(last_end, str2);
     if (*last_end == '\0') return (NULL);

     start = last_end;
     last_end += strcspn(last_end, str2);

     if (*last_end != '\0') *last_end++ = '\0'; 

     return start;
}

