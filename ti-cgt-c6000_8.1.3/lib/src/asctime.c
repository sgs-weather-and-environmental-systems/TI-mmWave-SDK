/****************************************************************************/
/*  asctime v8.1.3                                                          */
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
#include <time.h> 
#include <_tls.h>

/*--------------------------------------------------------------------------*/
/* UNDEF INLINE CONTROL MACRO TO DISABLE INLINE OF ANY STRING FUNCTION      */
/* FOR CODESIZE CONSIDERATION.                                              */
/*--------------------------------------------------------------------------*/
#undef _INLINE
#undef        _IDECL
#define       _IDECL
#include <string.h>

extern const char *__TI_tvaltostr(unsigned int val, int width, int pad, char delim);

#define TRUE 1
#define FALSE 0

static const _DATA_ACCESS char *const day[7]  = {
		      "Sun","Mon","Tue","Wed","Thu","Fri","Sat" };
static const _DATA_ACCESS char *const mon[12] = {
		     "Jan","Feb","Mar","Apr","May","Jun", 
                     "Jul","Aug","Sep","Oct","Nov","Dec" };

/*--------------------------------------------------------------------------*/
/* asctime() builds a result string into a static buffer. This means that   */
/* the static buffer can be modified by each caller. The buffer is given    */
/* thread-local storage at file scope in order to maintain thread-safety.   */
/*--------------------------------------------------------------------------*/
__TI_TLS_ARR_DEF(static, char, time_buf, sizeof("Day Mon dd hh:mm:ss yyyy\n"));

_CODE_ACCESS char *asctime(const struct tm *timeptr)
{
    char *tbp = __TI_TLS_ARR(time_buf);

    strcpy(tbp, day[timeptr->tm_wday]);
    strcat(tbp, " ");
    strcat(tbp, mon[timeptr->tm_mon]);
    strcat(tbp, __TI_tvaltostr(timeptr->tm_mday,      3, FALSE, ' ' ));
    strcat(tbp, __TI_tvaltostr(timeptr->tm_hour,      2, TRUE,  ':' ));
    strcat(tbp, __TI_tvaltostr(timeptr->tm_min,       2, TRUE,  ':' ));
    strcat(tbp, __TI_tvaltostr(timeptr->tm_sec,       2, TRUE,  ' ' ));
    strcat(tbp, __TI_tvaltostr(timeptr->tm_year+1900, 1, FALSE, '\n'));

    return (tbp);
}
