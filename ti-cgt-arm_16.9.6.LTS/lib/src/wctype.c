/*****************************************************************************/
/* wctype.c    v16.9.6                                                       */
/*                                                                           */
/* Copyright (c) 2007-2017 Texas Instruments Incorporated                    */
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
#include <wctype.h>
#include <ctype.h>
#include <stddef.h>
#include <string.h>

/*------------------------------------------------------------------------*/
/* Built-in classification functions                                      */
/*------------------------------------------------------------------------*/
_CODE_ACCESS int iswalnum(wint_t c)  
   { return (c == WEOF || (char)c != c) ? 0 : _isalnum((char)c); }

_CODE_ACCESS int iswalpha(wint_t c)
   { return (c == WEOF || (char)c != c) ? 0 : _isalpha((char)c); }

_CODE_ACCESS int iswascii(wint_t c)
   { return (c == WEOF || (char)c != c) ? 0 : _isascii((char)c); }

_CODE_ACCESS int iswcntrl(wint_t c)
   { return (c == WEOF || (char)c != c) ? 0 : _iscntrl((char)c); }

_CODE_ACCESS int iswdigit(wint_t c)
   { return (c == WEOF || (char)c != c) ? 0 : _isdigit((char)c); }

_CODE_ACCESS int iswgraph(wint_t c)
   { return (c == WEOF || (char)c != c) ? 0 : _isgraph((char)c); }

_CODE_ACCESS int iswlower(wint_t c)
   { return (c == WEOF || (char)c != c) ? 0 : _islower((char)c); }

_CODE_ACCESS int iswprint(wint_t c)
   { return (c == WEOF || (char)c != c) ? 0 : _isprint((char)c); }

_CODE_ACCESS int iswpunct(wint_t c)
   { return (c == WEOF || (char)c != c) ? 0 : _ispunct((char)c); }

_CODE_ACCESS int iswspace(wint_t c)
   { return (c == WEOF || (char)c != c) ? 0 : _isspace((char)c); }

_CODE_ACCESS int iswupper(wint_t c)
   { return (c == WEOF || (char)c != c) ? 0 : _isupper((char)c); }

_CODE_ACCESS int iswxdigit(wint_t c)
   { return (c == WEOF || (char)c != c) ? 0 : _isxdigit((char)c); }

/*------------------------------------------------------------------------*/
/* Classification based on property lookup                                */
/*------------------------------------------------------------------------*/
typedef struct 
{
   char   *prop;
   int    (*fn)(wint_t); 
} _CTYPE_CATEGORY; 

_CTYPE_CATEGORY _ctype_category_table[] = 
{
   { "alnum",  iswalnum  },
   { "alpha",  iswalpha  },
   { "cntrl",  iswcntrl  },
   { "digit",  iswdigit  },
   { "graph",  iswgraph  },
   { "lower",  iswlower  },
   { "print",  iswprint  },
   { "punct",  iswpunct  },
   { "space",  iswspace  },
   { "upper",  iswupper  },
   { "xdigit", iswxdigit },
   { NULL,     0         }
};

_CODE_ACCESS wctype_t wctype(const char *property)
{
   _CTYPE_CATEGORY *ctc;

   for (ctc = _ctype_category_table; ctc->prop != NULL; ++ctc)
      if (!strcmp(property, ctc->prop)) return (wctype_t)ctc;
   return NULL;
}

_CODE_ACCESS int iswctype(wint_t c, wctype_t category)
{
   _CTYPE_CATEGORY *ctc = (_CTYPE_CATEGORY *)category; 
   return ctc ? (ctc->fn)(c) : 0;
}

/*------------------------------------------------------------------------*/
/* Built-in translation functions.                                        */
/*------------------------------------------------------------------------*/
_CODE_ACCESS wint_t towascii(wint_t c)  
{ 
   return(_toascii(c));
}

_CODE_ACCESS wint_t towlower(wint_t ch)
{
   if ( (unsigned long)(ch - 'A') <= (unsigned long)('Z' - 'A')) ch += 'a' - 'A';
   return ch;
}

_CODE_ACCESS wint_t towupper(wint_t ch)
{
   if ( (unsigned long)(ch - 'a') <= (unsigned long)('z' - 'a')) ch -= 'a' - 'A';
   return ch;
}

/*------------------------------------------------------------------------*/
/* Translation functions based on property lookup                         */
/*------------------------------------------------------------------------*/
typedef struct 
{
   char         *prop;
   wint_t      (*fn)(wint_t);
} _CTYPE_TRANS;


_CTYPE_TRANS _ctype_trans_table[] = 
{
   { "toupper",  towupper },
   { "tolower",  towlower },
   { "toascii",  towascii },
   { NULL, NULL }
};

_CODE_ACCESS wctrans_t wctrans(const char *property)
{
   _CTYPE_TRANS *ctt;

   for (ctt = _ctype_trans_table; ctt->prop != NULL; ++ctt)
      if (!strcmp(property, ctt->prop)) return (wctrans_t)ctt;
   return NULL;
}

_CODE_ACCESS wint_t towctrans(wint_t c, wctrans_t category)
{
   _CTYPE_TRANS *ctt = (_CTYPE_TRANS *)category; 
   return ctt ? (ctt->fn)(c) : 0;
}

