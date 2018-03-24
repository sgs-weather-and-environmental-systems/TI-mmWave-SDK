/*****************************************************************************/
/*  _SCANFI.C v16.9.6                                                        */
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
/*    This file contains the main routines that all three variations of the  */
/*    scanf function use.  The main function in the file is __TI_scanfi, and */
/*    the other functions here are called by it.                             */
/*                                                                           */
/* FUNCTIONS:                                                                */
/*    __TI_scanfi        -  The main scanf handling routine                  */
/*    _sget_conv     -  Read the format flags into the _SFIELD pointer sfield*/
/*    _sget_scanset  -  Read in the scanset from the format statement        */
/*    _sproc_int     -  Read an integer string into a temporary string       */
/*    _sproc_float   -  Read a float string into a temporary string          */
/*    _sproc_str     -  Copy a string from the input source to a temporary   */
/*                      string                                               */
/*    _sproc_lb      -  Process the %[ conversion                            */
/*    _sset_arg      -  Assign the converted value to the next argument      */
/*****************************************************************************/
#include <stdio.h>
#include "format.h"
#include <stdarg.h>
#include <stdlib.h>
#include <stdint.h>
#include <ctype.h>
#include <string.h>
#include <limits.h>

#ifdef LLONG_MAX
_CODE_ACCESS long long strtoll(const char *_st, char **_endptr, int _base);
_CODE_ACCESS unsigned long long strtoull(const char *_st, char **_endptr,
					 int _base);
#endif

_CODE_ACCESS long double strtold(const char *st, char **endptr);

static int _sget_conv(char **_format, _SFIELD *sfield);
#if !defined(MINIMAL)
static int _sget_scanset(_SFIELD *sfield, char **_format);
#endif
static int _sproc_int(int w_counter, int (*_inpchar)(void **inp),
                       void (*_uninpchar)(void **inp, int outchar),
                       char *tmpptr, char conv, void **inp, int *num_read);
#if !defined(NOFLOAT) && !defined(MINIMAL)
static int _sproc_float(int w_counter, int (*_inpchar)(void **inp),
                         void (*_uninpchar)(void **inp, int outchar),
                         char *tmpptr, char conv, void **inp, int *num_read);
#endif
static int _sproc_str(int w_counter, int (*_inpchar)(void **inp),
                       void (*_uninpchar)(void **inp, int outchar),
                       char *tmpptr, char conv, void **inp, int *num_read);
#if !defined(MINIMAL)
static int _sproc_lb(int (*_inpchar)(void **inp),
                      void (*_uninpchar)(void **inp, int outchar),
                      char *tmpptr, _SFIELD *sfield, void **inp, int *num_read);
#endif
static void _sset_arg(_SFIELD *sfield, va_list *_ap, char *tmpbuf);

#if !defined(NOFLOAT) && !defined(MINIMAL)
#define _SCANFI __TI_scanfi
#elif defined(NOFLOAT)
#define _SCANFI __TI_scanfi_nofloat
#elif defined(MINIMAL)
#define _SCANFI __TI_scanfi_minimal
#endif

/*****************************************************************************/
/* _SCANFI  -  The main scanf handling routine                               */
/*                                                                           */
/*    This function parses all non-conversion characters in the format       */
/*    string, passes control to the appropriate function when a '%' is       */
/*    encountered, then calls _SSET_ARG, which assignes the result to the    */
/*    next argument.                                                         */
/*                                                                           */
/*    For multi-threaded applications, when this function is called on       */
/*    behalf of scanf, fscanf, vscanf, or vfscanf, the call site should be   */
/*    enclosed in a critical section that guarantees single-threaded access  */
/*    to the file stream.                                                    */
/*                                                                           */
/*****************************************************************************/
int _SCANFI(void *inp, const char *_format, va_list _ap, 
            int (*_chkmbc)(void **inp, char **_format, int *num_read),
            int (*_inpchar)(void **inp), 
            void (*_uninpchar)(void **inp, int outchar))
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   _SFIELD  sfield;
   char     tmpbuf[256],
           *tmpptr,
           *f_ptr        = (char *)_format;
   int      num_assigned =  0,
            inchar,
            num_read     =  0,
            stat         =  0;

   /*------------------------------------------------------------------------*/
   /* If the first character in the format string is a white space character */
   /* parse the format string until a non-white space character is found.    */
   /* Do the same for the input, but put the first non-white space character */
   /* back onto the input stream when finished.                              */
   /*------------------------------------------------------------------------*/
   if (isspace(*f_ptr))
   {
      for (;isspace(*f_ptr);f_ptr++);

      inchar = _inpchar(&inp);
      if (inchar == EOF) return EOF;
      num_read++;

      for (;isspace(inchar); inchar = _inpchar(&inp), num_read++);

      _uninpchar(&inp, inchar);
      num_read--;

      if (inchar == EOF) return EOF;
   }

   while (1)
   {
      /*---------------------------------------------------------------------*/
      /* Initialize sfield                                                   */
      /*---------------------------------------------------------------------*/
      memset(&sfield, 0, sizeof(_SFIELD));
      sfield.fwidth = -1;

      /*---------------------------------------------------------------------*/
      /* Call _chkmbc to compare the ordinary characters in the format       */
      /* string to the input.  If the end of the format string is reached,   */
      /* or a mismatch occurs, return the number of successful conversions.  */
      /* If an input error occurs before any conversions, return EOF.        */
      /* Otherwise a '%' has been seen, so call _sget_conv to process it.    */
      /*---------------------------------------------------------------------*/
      switch (_chkmbc(&inp, &f_ptr, &num_read))
      {
         case  EOF   : return num_assigned ? num_assigned : EOF;
   
         case  0     : return num_assigned;
   
         case  1     :  _sget_conv(&f_ptr, &sfield);
      }
   
      tmpptr = tmpbuf;

      /*---------------------------------------------------------------------*/
      /* Unless the conversion specifier is a [, c, or n, skip to the next   */
      /* non-white space character in the input.                             */
      /*---------------------------------------------------------------------*/
#if !defined(MINIMAL)
      if (sfield.conv != '[' && sfield.conv != 'c' && sfield.conv != 'n')
#else
      if (sfield.conv != 'c')
#endif
      {
         inchar = _inpchar(&inp);
         num_read++;
    
         for (;isspace(inchar); inchar = _inpchar(&inp), num_read++);
    
         _uninpchar(&inp, inchar);
         num_read--;

         /*---------------------------------------------------------------*/
         /* If we've encountered the end of the stream AND we haven't     */
         /* matched anything yet, return EOF.                             */
         /*---------------------------------------------------------------*/
         if (inchar == EOF && num_read == 0) return EOF;
      }
      else
      {
         /*---------------------------------------------------------------*/
         /* If we've encountered the end of the stream AND we haven't     */
         /* matched anything yet, return EOF.                             */
         /*---------------------------------------------------------------*/
         inchar = _inpchar(&inp);
         _uninpchar(&inp, inchar);
         if (inchar == EOF && num_read == 0) return EOF;
      }
      
      /*---------------------------------------------------------------------*/
      /* The flags have been set in sfield, so process the conversion by     */
      /* calling the appropriate function.                                   */
      /*---------------------------------------------------------------------*/
      switch (sfield.conv)
      {
#if !defined(MINIMAL)
         case  'X'   :  /* Change X to x because _sproc_int checks sfield.conv,
                           and we can save two bytes by doing this.  Surely 
                           this instruction will take at least that many 
                           bytes... */
                        sfield.conv = 'x';
         case  'i'   :
         case  'p'   :  
         case  'u'   :
#endif
         case  'x'   :
         case  'o'   :
         case  'd'   :  stat = _sproc_int(sfield.fwidth, _inpchar, _uninpchar, 
                                         tmpptr, sfield.conv, &inp, &num_read); 
                        break;

#if !defined(NOFLOAT) && !defined(MINIMAL)
         case  'f'   :
         case  'e'   :
         case  'E'   :
         case  'g'   :
         case  'G'   :  stat = _sproc_float(sfield.fwidth, _inpchar, _uninpchar,
                                     tmpptr, sfield.conv, &inp, &num_read);
                        break;
#endif

         case  'c'   :  
         case  's'   : {
                          char *stptr = (sfield.flags & _SFSTAR) ?
                                         NULL : va_arg(_ap, char*);

                          stat = _sproc_str(sfield.fwidth, _inpchar, _uninpchar,
                                     stptr, sfield.conv, &inp, &num_read);
                       }
                       break;

#if !defined(MINIMAL)
         case  '['   :  stat = _sproc_lb(_inpchar, _uninpchar, tmpptr, &sfield,
                                         &inp, &num_read);
                        break;
#endif

         case  '%'   :  inchar = _inpchar(&inp);
                        if (inchar == '%')
                        {
                            stat = 1;
                            num_read++;
                        }
                        else
                        {
                            _uninpchar(&inp, inchar);
                            stat = inchar == EOF ? EOF : 0;
                        }
                        break;

#if !defined(MINIMAL)
         case  'n'   :  stat = 1; /* %n cannot fail */
#endif
      }

      /*---------------------------------------------------------------------*/
      /* When an error occurs, return now.  Failures are either input        */
      /* failures (due to running out of input) or matching failures (due to */
      /* inappropriate input for that directive).  If an input error occured */
      /* before any conversion, return EOF.  Otherwise, return the number of */
      /* conversions performed (possibly 0).  (%%, %n, and normal characters */
      /* in the format don't count, and neither do any conversions for which */
      /* the assignment has been suppressed.)                                */
      /*---------------------------------------------------------------------*/
      if (stat == 0 || stat == EOF)
          return num_assigned ? num_assigned : stat;

      /*---------------------------------------------------------------------*/
      /* Now, call the function to handle the actual assignment, or if there */
      /* is no assignment to take place, process it here.                    */
      /*---------------------------------------------------------------------*/
      switch (sfield.conv)
      {
#if !defined(MINIMAL)
         case  'i'   :
         case  'p'   : 
         case  'u'   :
#endif
         case  'd'   :  
         case  'x'   :
         case  'o'   :  
#if !defined(NOFLOAT) && !defined(MINIMAL)
         case  'e'   :
         case  'f'   :
         case  'g'   :
         case  'E'   :
         case  'G'   :
#endif
                        _sset_arg(&sfield, &_ap, tmpbuf);
                        /* fallthrough */

         case  'c'   :
         case  's'   :
                        if ((!(sfield.flags & _SFSTAR))) num_assigned++;
                        break;
 
#if !defined(MINIMAL)
         case  'n'   :  if (!(sfield.flags & _SFSTAR))
                           switch(sfield.flags & 
                                  (_MFH | _MFHH | _MFL | _MFLL | _MFI40))
                           {
                              case  _MFH  :  *(va_arg(_ap, short int*)) =
                                             (short int)num_read;
                                             break;
 
                              case  _MFHH :  *(va_arg(_ap, char*)) =
                                             (char)num_read;
                                             break;
 
                              case _MFL   :  *(va_arg(_ap, long int*)) =
                                             (long int)num_read;
                                             break;
#ifdef LLONG_MAX
                              case _MFLL  :  *(va_arg(_ap, long long int*)) =
                                             (long long int)num_read;
                                             break;
#endif
#ifdef __TI_INT40_T__
                              case _MFI40 :  *(va_arg(_ap, __int40_t*)) =
                                             (__int40_t)num_read;
                                             break;
#endif
                              default     :  *(va_arg(_ap, int*)) =
                                             num_read;
                                             break;
                           }
                        break;

         case  '['   :  if (!(sfield.flags & _SFSTAR))
                        {
                           strcpy(va_arg(_ap, char *), tmpbuf);
                           num_assigned++;
                        }
#endif
      }
   }

}

/*****************************************************************************/
/* _SGET_CONV  -  Read the format flags into the _SFIELD pointer sfield      */
/*                                                                           */
/*    This function reads the characters directly after the '%' character,   */
/*    and stores them as flags in sfield, a pointer to a _SFIELD structure.  */
/*    These flags will later be used to process the conversion.              */
/*                                                                           */
/*****************************************************************************/
static int _sget_conv(char **_format, _SFIELD *sfield)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   char *strend = (*_format) + strlen(*_format);

   (*_format)++;                        /* Go to the character after the '%' */

#if !defined(MINIMAL)
   /*------------------------------------------------------------------------*/
   /* If the next character in the format statement is a '*', set the        */
   /* _SFSTAR flag in sfield                                                 */
   /*------------------------------------------------------------------------*/
   if (**_format == '*')
   {
      _SET(sfield, _SFSTAR);
      (*_format)++;
   }
 
   /*------------------------------------------------------------------------*/
   /* If numerical characters follow, read them into a temporary string,     */
   /* convert it into a number, and store it as the field width in sfield    */
   /*------------------------------------------------------------------------*/
   {
       char  tmpbuf[8], *tmpptr = tmpbuf;

       for (;**_format>='0' && **_format<='9'; *(tmpptr++) = *((*_format)++));
       *tmpptr = '\0';
       
       if (strlen(tmpbuf)) sfield->fwidth = atoi(tmpbuf);
   }
 
   /*------------------------------------------------------------------------*/
   /* Set the h, l, or L flags if they were specified                        */
   /*------------------------------------------------------------------------*/
   switch (**_format)
   {
#if !defined(NOFLOAT)
       case 'L': _SET(sfield, _MFLD); (*_format)++; break;
#endif
       case 'h':
       {
           (*_format)++;
           if (**_format == 'h') { _SET(sfield, _MFHH); (*_format)++; }
           else _SET(sfield, _MFH);
           break;
       }
       case 'l': 
       {
	   (*_format)++;
	   if (**_format == 'l') { _SET(sfield, _MFLL); (*_format)++; }
	   else _SET(sfield, _MFL);
       }
#if __TI_INT40_T__
          case 'I':
          {
             if ((*(*_format+1)) == '4' && (*(*_format+2)) == '0')
             { _SET(sfield, _MFI40); (*_format) += 3; }
             break;
          }
#endif
   }
#endif

   /*------------------------------------------------------------------------*/
   /* Read in the last character as the conversion specifier                 */
   /*------------------------------------------------------------------------*/
   sfield->conv = *((*_format)++);

#if !defined(MINIMAL)
   /*------------------------------------------------------------------------*/
   /* For the '[' conversion, read in the scanset.  Return an EOF if         */
   /* _SGET_SCANSET fails.                                                   */
   /*------------------------------------------------------------------------*/
   if ((sfield->conv == '[') && _sget_scanset(sfield, _format)) return (EOF);
#endif

   /*------------------------------------------------------------------------*/
   /* If we read past the end of the format string, return an error          */
   /*------------------------------------------------------------------------*/
   if (*_format > strend) return (EOF);
   else return (0);
}

#if !defined(MINIMAL)
/*****************************************************************************/
/* _SGET_SCANSET  -  Read in the scanset from the format statement           */
/*                                                                           */
/*    This function is called when the '[' conversion specifier has been     */
/*    encountered.  It reads in the scanset from the format statement,       */
/*    and stores it in sfield for later reference during the conversion.     */
/*                                                                           */
/*****************************************************************************/
static int _sget_scanset(_SFIELD *sfield, char **_format)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   char  *tmpptr  =  sfield->scanset;

   if (**_format == '^')
   {
      _SET(sfield, _SFCIRC);
      (*_format)++;
   }

   if (**_format == ']') *(tmpptr++) = *((*_format)++);

   while (**_format != ']' && **_format != '\0') *(tmpptr++) = *((*_format)++);

   *tmpptr = '\0';
   if (**_format == ']') (*_format)++;
   if (**_format == '\0') return (EOF);

   return(0);
}
#endif

/*****************************************************************************/
/* _SPROC_INT  -  Read an integer string into a temporary string             */
/*                                                                           */
/*    This function takes the next integer in character form from the        */
/*    current input source, and copies it into a temporary string, where     */
/*    it can later be converted into a numerical value.                      */
/*                                                                           */
/*    Returns:                                                               */
/*                                                                           */
/*        EOF if end-of-file was reached before a matching input sequence    */
/*            (well-formed input item) was found (this is an input failure)  */
/*                                                                           */
/*        1   if an input item was found                                     */
/*                                                                           */
/*        0   if an input item was not found (this is a matching failure)    */
/*                                                                           */
/*****************************************************************************/
static int _sproc_int(int w_counter, int (*_inpchar)(void **inp), 
                       void (*_uninpchar)(void **inp, int outchar), 
                       char *tmpptr, char conv, void **inp, int *num_read) 
{
   /*------------------------------------------------------------------------*/
   /* Note: w_counter is a parameter that holds the field width.  When       */
   /*       the number of digits specified by w_counter has been read from   */
   /*       input, the function finishes.  w_counter is checked before each  */
   /*       read to make sure that it is not equal to zero, and it is        */
   /*       decremented after each read.  If no field width was specified,   */
   /*       w_counter will be equal to -1, in which case it will never       */
   /*       equal zero, and the function will read from input until it       */
   /*       encounters the first invalid character.                          */
   /*------------------------------------------------------------------------*/

   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   int inchar, look_ahead_char;
   int bnum_read = *num_read;
   int seen_leading_zero = 0, seen_num = 0, base;
   int hex_conv = 0;
   int inchar_is_x = 0;

   static const _DATA_ACCESS char flit[] = "diouxp";
   static const _DATA_ACCESS char barr[] = {10, 0, 8, 10, 16, 16}; 
   
   /*------------------------------------------------------------------------*/
   /* Read in the next character                                             */
   /*------------------------------------------------------------------------*/
   inchar = _inpchar(inp);
   (*num_read)++;

   /*------------------------------------------------------------------------*/
   /* Accept the next character if it is a sign for the number               */
   /*------------------------------------------------------------------------*/
   if (w_counter != 0 && (inchar == '+' || inchar == '-'))
   {
      *(tmpptr++) = inchar;
      inchar = _inpchar(inp);
      (*num_read)++;
      w_counter--;
   }

   if (w_counter != 0)
   {
      /*---------------------------------------------------------------------*/
      /* Decide number base according to the conversion specifier            */
      /*---------------------------------------------------------------------*/
      base = barr[(const char *)strchr(&flit[0], conv) - flit];

      /*---------------------------------------------------------------------*/
      /* Resolve base == 0 "%i" case according to the next 2 input characters*/
      /* we cannot decide if base is 16 here. Delay it later when we see 'x".*/
      /*---------------------------------------------------------------------*/
      if (base == 0)
      {
         if (inchar == '0')
         {	 
            /*---------------------------------------------------------------*/
            /* Look ahead at the next characters                             */
            /*---------------------------------------------------------------*/
            look_ahead_char = _inpchar(inp); 
            _uninpchar(inp, look_ahead_char);
#if !defined(MINIMAL)
	    if ((look_ahead_char != 'x' && look_ahead_char != 'X'))
#else
            if (look_ahead_char != 'x')
#endif
	       base = 8;
         }
         else /* inchar is not a 0 */
	    base = 10;
      }

      /*---------------------------------------------------------------------*/
      /* hex_conv shows if this number could be interpreted as a hex number. */
      /*---------------------------------------------------------------------*/
#if !defined(MINIMAL)
      hex_conv = (conv == 'i' || conv =='x' || conv == 'p');
#else
      hex_conv = (conv == 'x');
#endif
   }

   /*------------------------------------------------------------------------*/
   /* Accept a leading '0' for an octal number, or it could be a leading zero*/
   /* for hex number "0x".                                                   */
   /*------------------------------------------------------------------------*/
   if (w_counter != 0 && (conv == 'o' || hex_conv) && inchar == '0')

   {
      seen_leading_zero = 1;
      *(tmpptr++) = inchar;
      inchar = _inpchar(inp);
      (*num_read)++;
      w_counter--;
   }

   /*------------------------------------------------------------------------*/
   /* Decide if we can accept a following "x"                                */
   /* To accept this "x",                                                    */
   /* 1) need a leading zero,                                                */
   /* 2) need the curernt input char to be "x",                              */
   /* 3) the look_ahead_char has to be hex number.                           */
   /*------------------------------------------------------------------------*/
#if !defined(MINIMAL)
   inchar_is_x = (inchar == 'x' || inchar == 'X');
#else
   inchar_is_x = (inchar == 'x');
#endif

   if (w_counter != 0  && hex_conv && seen_leading_zero == 1 && inchar_is_x)
   {
      /*---------------------------------------------------------------------*/
      /* Look ahead at the next characters                                   */
      /*---------------------------------------------------------------------*/
      look_ahead_char = _inpchar(inp); 
      _uninpchar(inp, look_ahead_char); 
      if (isxdigit(look_ahead_char))
      {
         base = 16;
	 *(tmpptr++) = inchar;
	 inchar = _inpchar(inp);
	 (*num_read)++;
	 w_counter--;
	 if (w_counter == 0)
	 {
            /*---------------------------------------------------------------*/
            /* Now we consumed a leading 0(outer IF), we also consumed a 'x' */
	    /* (inner IF), but we have no width left for any more number,ex: */
	    /* rv = _sscanf("0x3", "%2x%c", &i, &c);                         */
	    /* we need to quit from here, no more further scanning. According*/
	    /* to Plauger of Dinkumware. The return value should be -1.      */
            /*---------------------------------------------------------------*/
	    (*num_read) = 0;
	    return EOF;
	 }
      }
   }

   /*------------------------------------------------------------------------*/
   /* Accept digits 0-7 for octal, digits 0-9 for decimal numbers, or 0-F for*/
   /* hexadecimal numbers based on the base we calcuated before.             */
   /*------------------------------------------------------------------------*/
   while (w_counter != 0 &&
	  (((base == 8) && (inchar >= '0' && inchar <= '7')) ||
	   ((base == 10) && (inchar >= '0' && inchar <= '9')) ||    
	   ((base == 16) && isxdigit(inchar))))
   {
      seen_num = 1;  
      *(tmpptr++) = inchar;
      inchar = _inpchar(inp);
      (*num_read)++;
      w_counter--;
   }

   /*------------------------------------------------------------------------*/
   /* Put the last unqualified char back to the input buffer.                */
   /*------------------------------------------------------------------------*/
   _uninpchar(inp, inchar);
   (*num_read)--;

   /*------------------------------------------------------------------------*/
   /* Append the terminating NULL character.                                 */
   /*------------------------------------------------------------------------*/
   *tmpptr = '\0';

   /*------------------------------------------------------------------------*/
   /* If no number seen, return EOF if EOF is encountered, otherwise, 0      */
   /*------------------------------------------------------------------------*/
   if (seen_leading_zero == 0 && seen_num == 0)
	return (bnum_read == *num_read && inchar == EOF )? EOF :0;

   /*------------------------------------------------------------------------*/
   /* Return 1 if a number is seem and successfully copied to output buffer  */
   /*------------------------------------------------------------------------*/
   return(1);
}

#if !defined(NOFLOAT) && !defined(MINIMAL)
/*****************************************************************************/
/* _SPROC_FLOAT   -  Read a float string into a temporary string             */
/*                                                                           */
/*    This function takes the next float in character form from the          */
/*    current input source, and copies it into a temporary string, where     */
/*    it can later be converted into a numerical value.                      */
/*                                                                           */
/*    Returns:                                                               */
/*                                                                           */
/*        EOF if end-of-file was reached before a matching input sequence    */
/*            (well-formed input item) was found (this is an input failure)  */
/*                                                                           */
/*        1   if an input item was found                                     */
/*                                                                           */
/*        0   if an input item was not found (this is a matching failure)    */
/*                                                                           */
/*****************************************************************************/
static int _sproc_float(int w_counter, int (*_inpchar)(void **inp), 
                         void (*_uninpchar)(void **inp, int outchar), 
                         char *tmpptr, char conv, void **inp, int *num_read)
{
   /*------------------------------------------------------------------------*/
   /* Note: w_counter is a parameter that holds the field width.  When       */
   /*       the number of digits specified by w_counter has been read from   */
   /*       input, the function finishes.  w_counter is checked before each  */
   /*       read to make sure that it is not equal to zero, and it is        */
   /*       decremented after each read.  If no field width was specified,   */
   /*       w_counter will be equal to -1, in which case it will never       */
   /*       equal zero, and the function will read from input until it       */
   /*       encounters the first invalid character.                          */
   /*------------------------------------------------------------------------*/
 
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   int inchar;
   int invalid   = 0;
   int bnum_read = *num_read;
   int dec_flag  =  0;
   int e_flag    =  0;

   /*------------------------------------------------------------------------*/
   /* Read in the next character                                             */
   /*------------------------------------------------------------------------*/
   inchar = _inpchar(inp);
   if (inchar != EOF) (*num_read)++;

   /*------------------------------------------------------------------------*/
   /* Accept the next character if it is a sign                              */
   /*------------------------------------------------------------------------*/
   if ((inchar == '+' || inchar == '-') && w_counter != 0)
   {
      *(tmpptr++) = inchar;
      inchar = _inpchar(inp);
      if (inchar != EOF) (*num_read)++;
      w_counter--;
   }
 
   /*------------------------------------------------------------------------*/
   /* Accept the next character if it is a numerical digit.                  */
   /* The characters '.', 'e', 'E', '+', and '-' are accepted under the      */
   /* following conditions:                                                  */
   /*                                                                        */
   /* '.'         :  a '.', an 'e', or an 'E' has not yet been encountered   */
   /* 'e' or 'E'  :  neither of these characters have been encounterd yet    */
   /* '+' or '-'  :  If the last character read was an 'E' or an 'e'         */
   /*------------------------------------------------------------------------*/
   while ((w_counter != 0) &&
          ((inchar >= '0' && inchar <= '9') || inchar == '.' || inchar == 'e'
           || inchar == 'E' || inchar == '+' || inchar == '-'))
   {

      switch (inchar)
      {
         case  '.'   :  if (dec_flag || e_flag) { invalid = 1; break; } 
                        else dec_flag = 1;
                        break;

         case  'e'   :
         case  'E'   :  if (e_flag) { invalid = 1; break; }
                        else e_flag = 1;
                        break;

         case  '+'   :  
         case  '-'   :  if (*(tmpptr-1) != 'E' && *(tmpptr-1) != 'e')
                        { invalid = 1; break; }
      }

      if (invalid) break;
      *(tmpptr++) = inchar;
      inchar = _inpchar(inp);
      if (inchar != EOF) (*num_read)++;
      w_counter--;
   }

   _uninpchar(inp, inchar);
   if (inchar != EOF) (*num_read)--;

   *tmpptr = '\0';

   if (bnum_read == *num_read)
       return inchar == EOF ? EOF : 0;

   return(1);
}
#endif

/*****************************************************************************/
/* _SPROC_STR  -  Copy a string from the input source to a temporary string  */
/*                                                                           */
/*    This function takes a string from the input source, and copies it      */
/*    into a temporary string, to be later assigned to a scanf argument.     */
/*                                                                           */
/*    Returns:                                                               */
/*                                                                           */
/*        EOF if end-of-file was reached before a matching input sequence    */
/*            (well-formed input item) was found (this is an input failure)  */
/*                                                                           */
/*        1   if an input item was found                                     */
/*                                                                           */
/*        0   if an input item was not found (this is a matching failure)    */
/*                                                                           */
/*****************************************************************************/
static int _sproc_str(int w_counter, int (*_inpchar)(void **inp), 
                       void (*_uninpchar)(void **inp, int outchar), 
                       char *tmpptr, char conv, void **inp, int *num_read)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   int inchar;
   int bnum_read = *num_read;

   /*------------------------------------------------------------------------*/
   /* If no precision was given for the %c conversion, set it to one.        */
   /*------------------------------------------------------------------------*/
   if ((conv == 'c') && (w_counter < 0)) w_counter = 1;

   /*------------------------------------------------------------------------*/
   /* Read in the next character, then while that character is not a white   */
   /* space character, a null terminator, an EOF character, and the field    */
   /* width has not been exceeded, copy it to the temporary string, and      */
   /* get another character.                                                 */
   /*------------------------------------------------------------------------*/
   inchar = _inpchar(inp);
   (*num_read)++;

   while ((conv == 'c' || !isspace(inchar)) && inchar != '\0' &&
          inchar != EOF && w_counter--)
   { 
      if (tmpptr) *(tmpptr++) = inchar;
      inchar = _inpchar(inp);
      (*num_read)++;
   }
   
   _uninpchar(inp, inchar);
   (*num_read)--;

   /*------------------------------------------------------------------------*/
   /* If no characters were read, an input error occurred.  Do not modify    */
   /* the argument.                                                          */
   /*------------------------------------------------------------------------*/
   if (bnum_read == *num_read) return(EOF);

   /*------------------------------------------------------------------------*/
   /* The %s conversion specifies that a null terminator be placed at the    */
   /* end of the conversion.                                                 */
   /*------------------------------------------------------------------------*/
   if (conv == 's' && tmpptr) *tmpptr = '\0';

   return(1);
}

#if !defined(MINIMAL)
/*****************************************************************************/
/* _SPROC_LB   -  Process the %[ conversion                                  */
/*                                                                           */
/*    This function copies characters from the input stream into a           */
/*    temporary string until it satisfies the field width, or encounters a   */
/*    character that is not in the scanset.  The scanset is defined as the   */
/*    characters passed between the left and right brackets.  If a '^' is    */
/*    first character after the left bracket, then the scanset is every      */
/*    character that is not listed between the two brackets.                 */
/*                                                                           */
/*    Returns:                                                               */
/*                                                                           */
/*        EOF if end-of-file was reached before a matching input sequence    */
/*            (well-formed input item) was found (this is an input failure)  */
/*                                                                           */
/*        1   if an input item was found                                     */
/*                                                                           */
/*        0   if an input item was not found (this is a matching failure)    */
/*                                                                           */
/*****************************************************************************/
static int _sproc_lb(int (*_inpchar)(void **inp), 
                      void (*_uninpchar)(void **inp, int outchar),
                      char *tmpptr, _SFIELD *sfield, void **inp, int *num_read)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   int bnum_read = *num_read;
   int w_counter =  sfield->fwidth;
   int negate = (_STCHK(sfield, _SFCIRC) != 0);

   /*------------------------------------------------------------------------*/
   /* This loop iterates until one of the following conditions occurs:       */
   /* 1) EOF is reached                                                      */
   /* 2) the input character doesn't match the scan set                      */
   /* 3) sfield->fwidth (field width) characters were read.                  */
   /*------------------------------------------------------------------------*/
   for (; w_counter != 0; w_counter--)
   {
      int inchar = _inpchar(inp);

      if (inchar != EOF &&
          (negate ^ (strrchr(sfield->scanset, inchar) != NULL)))
      {
         *(tmpptr++) = inchar;
         (*num_read)++;
      }
      else
      {
         _uninpchar(inp, inchar);

         /*------------------------------------------------------------------*/
         /* If we haven't successfully read any characters, this is either a */
         /* matching failure (input character didn't match scan set) or      */
         /* input failure (EOF reached). In both cases, the conversion fails */
         /* and the output buffer is not null-terminated.                    */
         /*------------------------------------------------------------------*/
         if (bnum_read == *num_read)
            return inchar == EOF ? EOF : 0;

         break;
      }
   }

   *tmpptr = '\0';
   return(1);
}
#endif

/*****************************************************************************/
/* _SSET_ARG   -  Assign the converted value to the next argument            */
/*                                                                           */
/*    This function takes a pointer to the result conversion string, and     */
/*    assigns it to the next argument.  The type of argument to be assigned  */
/*    is determined by the conversion specifier, and the h, l, or L flags    */
/*    if they were used.                                                     */
/*                                                                           */
/*****************************************************************************/
static void _sset_arg(_SFIELD *sfield, va_list *_ap, char *tmpbuf)
{
   /*------------------------------------------------------------------------*/
   /* Local variables                                                        */
   /*------------------------------------------------------------------------*/
   int base = 0; /* assumes %i until otherwise set */

   /*------------------------------------------------------------------------*/
   /* Do the assignment only if the result string has a length greater than  */
   /* zero, and the '*' flag was not used                                    */
   /*------------------------------------------------------------------------*/
   if (tmpbuf[0] != '\0' && !_STCHK(sfield, _SFSTAR))
      switch (sfield->conv)
      {
         case  'd'   :  base = 10;
#if !defined(MINIMAL)
         case  'i'   :
#endif
   
#if !defined(MINIMAL)
                        switch (_STCHK(sfield, 
                                      (_MFH | _MFHH | _MFL | _MFLL | _MFI40)))
                        {
                           case  _MFH  :  *(va_arg(*_ap, short int*)) =
                                          (short int)strtol(tmpbuf, NULL,
                                          base);
                                          break;

                           case  _MFHH :  *(va_arg(*_ap, char*)) =
                                          (char)strtol(tmpbuf, NULL, base);
                                          break;

                           case _MFL   :  *(va_arg(*_ap, long int*)) =
                                          strtol(tmpbuf, NULL, base);
                                          break;
#ifdef LLONG_MAX
                           case _MFLL  :  *(va_arg(*_ap, long long int*)) =
                                          strtoll(tmpbuf, NULL, base);
                                          break;
#endif
#ifdef __TI_INT40_T__
                           case _MFI40 :  *(va_arg(*_ap, __int40_t*)) =
                                          strtoll(tmpbuf, NULL, base);
                                          /* use strtoll as we don't have
                                           * strtoi40() */
                                          break;
#endif
                           default     :
#endif /* !defined(MINIMAL) */
                                          *(va_arg(*_ap, int*)) =
                                          (int)strtol(tmpbuf, NULL, base);
#if !defined(MINIMAL)
                                          break;
                        }
#endif
                        
                        break;

      /*---------------------------------------------------------------------*/
      /* Suppress "conversion from integer to smaller pointer" warning for   */
      /* the %p case. Also suppress the bad cast from integral to pointer.   */
      /*---------------------------------------------------------------------*/
#if !defined(MINIMAL)
#pragma diag_suppress 1107,173
      case  'p'   :  *(va_arg(*_ap, void **))=(void *)(uintptr_t)strtoul(tmpbuf, NULL, 16);
		     break;
#pragma diag_default 1107,173
#endif

#if !defined(MINIMAL)
      case  'u'   :
      case  'x'   :
      case  'o'   :  
                     base = (sfield->conv == 'u') ? 10 :
                            (sfield->conv == 'x') ? 16 : 8;
#else
      case  'x'   :
      case  'o'   :  
                     base = (sfield->conv == 'x') ? 16 : 8;
#endif

#if !defined(MINIMAL)
                     switch (_STCHK(sfield, 
                                   (_MFH | _MFHH | _MFL | _MFLL | _MFI40)))
                     {
                        case _MFH : *(va_arg(*_ap, unsigned short int*))=
                                    (unsigned short int)strtoul(tmpbuf,
                                    NULL, base);
                                    break;

                        case _MFHH: *(va_arg(*_ap, unsigned char*))=
                                    (unsigned char)strtoul(tmpbuf, NULL, base);
                                    break;

                        case _MFL : *(va_arg(*_ap, unsigned long int*)) =
                                    strtoul(tmpbuf, NULL, base);
                                    break;
#ifdef LLONG_MAX
                        case _MFLL: *(va_arg(*_ap, unsigned long long int*)) =
                                    strtoull(tmpbuf, NULL, base);
                                    break;
#endif
#ifdef __TI_INT40_T__
                        case _MFI40: *(va_arg(*_ap, unsigned __int40_t*)) =
                                    (unsigned __int40_t)
                                             strtoull(tmpbuf, NULL, base);
                                    break;
#endif
                        default   : 
#endif /* !defined(MINIMAL) */
                                    *(va_arg(*_ap, unsigned int*)) =
                                    (unsigned int)strtoul(tmpbuf, NULL,
                                    base);
#if !defined(MINIMAL)
                                    break;
                     }
#endif
                     break;

#if !defined(NOFLOAT) && !defined(MINIMAL)
      case  'e'   :
      case  'f'   :
      case  'g'   :
      case  'E'   :
      case  'G'   :  switch (_STCHK(sfield, (_MFL | _MFLD)))
                     {
                        case _MFL : *(va_arg(*_ap, double*))=
                                    strtod(tmpbuf, NULL);
                                    break;

                        case _MFLD: *(va_arg(*_ap, long double*)) =
                                    strtold(tmpbuf, NULL);
                                    break;

                        default   : *(va_arg(*_ap, float*)) =
                                    (float)strtod(tmpbuf, NULL);
                                    break;
                     }
                     break;
#endif
   }
}
