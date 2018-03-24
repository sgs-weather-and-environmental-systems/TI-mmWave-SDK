/****************************************************************************/
/*  strftime v8.1.3                                                         */
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

/*--------------------------------------------------------------------------*/
/* UNDEF INLINE CONTROL MACRO TO DISABLE INLINE OF ANY STRING FUNCTION      */
/* FOR CODESIZE CONSIDERATION.                                              */
/*--------------------------------------------------------------------------*/
#undef _INLINE
#undef        _IDECL
#define       _IDECL
#include <string.h>

#define TRUE 1
#define FALSE 0

extern const char *__TI_tvaltostr(unsigned int val, int width, int pad, char delim);

static const _DATA_ACCESS char *const fday[] =
           { "Sunday","Monday","Tuesday","Wednesday",
	     "Thursday","Friday","Saturday" };

static const _DATA_ACCESS char *const fmon[] =
	   { "January","February","March","April","May",
	     "June", "July","August","September",
	     "October","November", "December" };

_CODE_ACCESS size_t strftime(char            *out,
	                     size_t           maxsize, 
	                     const char      *format,
	                     const struct tm *time)
{
    int       count = 0;
    char      buf[37];

    for (;;)
    {
	while ((count < maxsize) && *format && (*format != '%'))
	{
	    count++;
	    *out++ = *format++;
	}

	if (count >= maxsize) return 0;
	if (*format == '\0')  { *out = 0; return count; }

	switch (*++format)
	{
	    case '%' : strcpy(buf, "%");                              break;
	    case 'z' : strcpy(buf, _tz.dstname);                      break;
	    case 'Z' : strcpy(buf, _tz.tzname);                       break;

	    case 'A' : strcpy (buf, fday[time->tm_wday]);                break;
	    case 'a' : strncpy(buf, fday[time->tm_wday], 3); buf[3] = 0; break;
	    case 'B' : strcpy (buf, fmon[time->tm_mon]);                 break;
	    case 'b' : strncpy(buf, fmon[time->tm_mon], 3);  buf[3] = 0; break;
	    case 'c' : strncpy(buf,fday[time->tm_wday], 3);  buf[3] = 0;
		       strcat(buf," ");
		       strncpy(buf+4,fmon[time->tm_mon],3);  buf[7] = 0; 
		       strcat(buf,__TI_tvaltostr(time->tm_mday,3,FALSE,' '));
		       strcat(buf,__TI_tvaltostr(time->tm_hour,2,TRUE,':'));
		       strcat(buf,__TI_tvaltostr(time->tm_min,2,TRUE,':'));
		       strcat(buf,__TI_tvaltostr(time->tm_sec,2,TRUE,' '));
		       strcat(buf,__TI_tvaltostr(time->tm_year + 1900,1,FALSE,0));
                       break;
	    case 'I' : strcpy(buf,__TI_tvaltostr(((time->tm_hour != 0) &&
			                     (time->tm_hour != 12)) ? 
					    time->tm_hour % 12 : 12,2,TRUE,0));
		       break;

	    case 'H' : strcpy(buf, __TI_tvaltostr(time->tm_hour, 2, TRUE, 0));   break;
	    case 'M' : strcpy(buf, __TI_tvaltostr(time->tm_min, 2, TRUE, 0));    break;
	    case 'S' : strcpy(buf, __TI_tvaltostr(time->tm_sec, 2, TRUE, 0));    break;
	    case 'j' : strcpy(buf, __TI_tvaltostr(time->tm_yday + 1, 3, TRUE, 0)); 
		                                                          break;
	    case 'd' : strcpy(buf, __TI_tvaltostr(time->tm_mday, 2, TRUE, 0));   break;
	    case 'e' : strcpy(buf, __TI_tvaltostr(time->tm_mday, 2, FALSE, 0));  break;
	    case 'w' : strcpy(buf, __TI_tvaltostr(time->tm_wday, 1, TRUE, 0));  break;
	    case 'm' : strcpy(buf, __TI_tvaltostr(time->tm_mon + 1, 2, TRUE, 0));break;
	    case 'y' : strcpy(buf, __TI_tvaltostr(time->tm_year%100, 2, TRUE, 0)); 
		                                                          break;
	    case 'Y' : strcpy(buf, __TI_tvaltostr(1900+time->tm_year,1,FALSE,0));break;
	    case 'p' : strcpy(buf, time->tm_hour >= 12 ? "PM":"AM");         break;
	    case 'W' : strcpy(buf, __TI_tvaltostr(time->tm_yday / 7 +
			     (time->tm_yday % 7 >= (time->tm_wday + 6) % 7), 
					    2, TRUE, 0));                 break;

	    case 'U' : strcpy(buf, __TI_tvaltostr(time->tm_yday / 7 +
			    (time->tm_yday % 7 >= time->tm_wday), 2, TRUE, 0)); break;

	    case 'x' : strcpy(buf,fmon[time->tm_mon]);
		       strcat(buf," ");
		       strcat(buf,__TI_tvaltostr(time->tm_mday,1,FALSE,','));
		       strcat(buf," ");
		       strcat(buf,__TI_tvaltostr(time->tm_year + 1900,1,FALSE,0));
		       break;
			
	    case 'X' : strcpy(buf,__TI_tvaltostr(time->tm_hour,2,TRUE,':'));
                       strcat(buf,__TI_tvaltostr(time->tm_min,2,TRUE,':'));
                       strcat(buf,__TI_tvaltostr(time->tm_sec,2,TRUE,0));
		       break;

	}

	/*-------------------------------------------------------------*/
	/* IF THIS STRING WILL FIT IN BUFFER, APPEND IT.               */
	/*-------------------------------------------------------------*/
	if ((count += strlen(buf)) > maxsize) return 0;
	strcpy(out, buf);
	out += strlen(buf);
	format++;
    }
}

