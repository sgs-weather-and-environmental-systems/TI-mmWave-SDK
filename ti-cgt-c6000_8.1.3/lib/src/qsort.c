/****************************************************************************/
/*  qsort v8.1.3                                                            */
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

static void swap_item(register char *src, 
                      register char *dest, 
                      register size_t size);

_CODE_ACCESS void qsort(void *base, size_t nmemb, size_t size, 
			int (*compar)(const void *, const void *))
{
   register char     *basep  = base;         /* POINTER TO ARRAY OF ELEMENTS */
   register unsigned  i      = 0;            /* left scan index  */
   register unsigned  j      = nmemb - 1;    /* right scan index */
   register unsigned  pivot  = (nmemb / 2);
   register char     *pivp   = basep + (pivot * size);

   if (nmemb <= 1) return;

   while( i < j )
   {
      while( (*compar) (basep + (i * size), pivp) < 0 ) ++i;
      while( (*compar) (basep + (j * size), pivp) > 0 ) --j;
      if( i < j )
      {
	 swap_item(basep + (i * size), basep + (j * size), size);
	 if     ( pivot == i ) { pivot = j; pivp = basep + (pivot * size); }
	 else if( pivot == j ) { pivot = i; pivp = basep + (pivot * size); } 
	 ++i; --j;
      }
      else if ( i == j ) { ++i; --j;  break; }
   }

   if( j > 0)       qsort(basep, j + 1, size, compar);
   if( i < nmemb-1) qsort(basep + (i * size), nmemb - i, size, compar);
}


static void swap_item(register char *src, 
                      register char *dest, 
                      register size_t size)
{
    while (size--)
    {
        register int temp = *src;       
        *src++            = *dest;
        *dest++           = temp;
    }
}

