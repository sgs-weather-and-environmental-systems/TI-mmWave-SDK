/*****************************************************************************/
/*  VSNPRINTF.C v16.9.6                                                      */
/*                                                                           */
/* Copyright (c) 2001-2017 Texas Instruments Incorporated                    */
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
/* Functions:                                                                */
/*    VSNPRINTF -  Copy formatted output to a string                         */
/*    _OUTC     -  Put a character in a string                               */
/*    _OUTS     -  Append a string to another string                         */
/*****************************************************************************/
#include <stdio.h>
#include "format.h"
#include <stdarg.h>
#include <string.h>
 
extern _CODE_ACCESS int __TI_printfi(char **_format, va_list _ap, void *_op,
                                     int (*_outc)(char, void *), 
                                     int (*_outs)(char *, void *, int));
 
static int _outc(char c, void *_op);
static int _outs(char *s, void *_op, int len);

struct holder {
    char  *out_end;
    size_t n;
    size_t written;
};


/*****************************************************************************/
/* VSNPRINTF -  Copy formatted output to a string                            */
/*                                                                           */
/*    This function passes a format string and an argument list to           */
/*    __TI_printfi, and writes the result string to the string _STRING.      */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS int vsnprintf(char *_string, size_t _n,
			   const char *_format, va_list _ap)
{
    int    rval;
    char  *fptr = (char *)_format;
    struct holder holder; 

    if (_n == 0)   /* write nothing */
       holder.n = 0;
    else           /* set up buffer */
       holder.n = _n - 1;  
     
    holder.written = 0;
    holder.out_end = _string;

    rval = __TI_printfi(&fptr, _ap, (void *)&holder, _outc, _outs);
    
    if (_n) *holder.out_end = '\0';
    
    return rval;
}


/*****************************************************************************/
/* _OUTC -  Put a character in a string                                      */
/*****************************************************************************/
static int _outc(char c, void *_op)
{
    struct holder *holder = (struct holder *)_op;
    
    if (holder->written < holder->n)
	*holder->out_end++ = c;
    
    holder->written++;
    
    return c;
}
 

/*****************************************************************************/
/* _OUTS -  Append a string to another string                                */
/*****************************************************************************/
static int _outs(char *s, void *_op, int len)
{
    struct holder *holder = (struct holder *)_op;

    if (holder->written < holder->n)
    {
	size_t space = holder->n - holder->written;
	size_t use = len > space ? space : len;
	memcpy(holder->out_end, s, use);
	holder->out_end += use;
    }
    
    holder->written += len;

    return len;
}
 
