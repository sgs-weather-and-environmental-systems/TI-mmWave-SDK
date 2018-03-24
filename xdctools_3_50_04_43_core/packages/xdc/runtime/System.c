/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
 *  This program and the accompanying materials are made available under the 
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at 
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
/*
 *  ======== System.c ========
 */

#include <xdc/runtime/Startup.h>

#include <xdc/runtime/Gate.h>

#include "package/internal/System.xdc.h"
#include "System__internal.h"

#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

/*
 *  ======== OUTMAX ========
 *  The maximum length of the output of a base 8 number produced by formatNum
 *  plus 5 to accomodate the decimal point and 4 digits after the decimal
 *  point.
 */
#if ((xdc_target__bitsPerChar * xdc_target__sizeof_Ptr) > 32)
#define OUTMAX      ((64 + 2) / 3) + 5
#define PTRZPAD     16
#else
#define OUTMAX      ((32 + 2) / 3) + 5
#define PTRZPAD     8
#endif

/* convenience aliases to avoid use of long System names */
#define formatNum   xdc_runtime_System_formatNum__I
typedef xdc_runtime_System_UNum UIntMax;
typedef xdc_runtime_System_INum IntMax;

/*
 *  ======== vaRef ========
 *  Return the address of a VaList (aka va_list)
 *  
 *  If va_list is an array type, taking the address of the va_list va simply
 *  returns va itself.  Moreover, when such a va_list is passed to a
 *  function, C implicitly passes the address rather than the va_list array
 *  "value" itself.  Taken together, this means we can "safely" cast a
 *  va_list value passed to a function as a (va_list *) when passing it on
 *  to functions expecting a (va_list *).
 *
 *  Ignoring performance concerns, we can be squeaky clean and copy the 
 *  va_list value to a local variable and pass the address of this local
 *  variable; for example:
 *    void vprint(String fmt, VaList va)
 *    {
 *        Int ret;
 *        va_list nva;
 *        va_copy(nva, va);
 *        ret = System_doPrint(NULL, (SizeT)-1, fmt, &nva, TRUE);
 *        va_end(nva);
 *        return (ret);
 *    }
 *  But this wastes stack space and CPU time to initialize a copy of something
 *  that already exists and for which we already have a legitimate reference.
 *
 *  Of course, if va_list is not an array type, we must use the '&' operator.
 */
#if xdc_target__arraytype_VaList
# define vaRef(va)    ((VaList *)(va))
#else
# define vaRef(va)    (&(va))
#endif

/*
 *  ======== System_Module_startup ========
 */
Int System_Module_startup(Int stat)
{
    return (Startup_DONE);
}

/*
 *  ======== System_abort ========
 */
Void System_abort(CString str)
{
    Gate_enterSystem();

    System_SupportProxy_abort(str);

    System_abortFxn();
}

/*
 *  ======== System_atexit ========
 */
Bool System_atexit(System_AtexitHandler handler)
{
    IArg key;
    Bool status = TRUE;
    
    key = Gate_enterSystem();

    if (module->numAtexitHandlers < System_maxAtexitHandlers) {
        module->atexitHandlers[module->numAtexitHandlers] = handler;
        module->numAtexitHandlers++;
    }
    else {
        status = FALSE;
    }

    Gate_leaveSystem(key);
    
    return (status);
}

/*
 *  ======== System_exit ========
 */
Void System_exit(Int stat)
{
    System_processAtExit(stat);

    System_exitFxn(stat);
}

/*
 *  ======== System_abortStd ========
 */
Void System_abortStd(Void)
{
    abort();
}

/*
 *  ======== System_abortSpin ========
 */
Void System_abortSpin(Void)
{
    for (;;) {
    }
}

/*
 *  ======== System_exitStd ========
 */
Void System_exitStd(Int stat)
{
    exit(stat);
}

/*
 *  ======== System_exitSpin ========
 */
Void System_exitSpin(Int stat)
{
    for (;;) {
    }
}

/*
 *  ======== System_processAtExit ========
 */
Void System_processAtExit(Int stat)
{
    Int i;

    Gate_enterSystem();

    for (i = module->numAtexitHandlers; i > 0; i--) {
        (module->atexitHandlers[i - 1])(stat);
    }

    System_SupportProxy_exit(stat);
}

/*
 *  ======== System_flush ========
 */
Void System_flush(Void)
{
    System_SupportProxy_flush();
}


/*
 *  ======== System_putch ========
 */
Void System_putch(Char ch)
{
    if (System_SupportProxy_ready()) {
        System_SupportProxy_putch(ch);
    }
}

/*
 *  ======== System_aprintf_va ========
 */
Int System_aprintf_va(CString fmt, VaList va)
{
    return (System_avprintf(fmt, va));
}

/*
 *  ======== System_avprintf ========
 *  -1 indicates infinite output
 */
Int System_avprintf(CString fmt, VaList va)
{
    return (System_SupportProxy_ready()
            ? System_doPrint(NULL, (SizeT)-1, fmt, vaRef(va), TRUE) : -1);
}

/*
 *  ======== System_asprintf_va ========
 */
Int System_asprintf_va(Char buf[], CString fmt, VaList va)
{
    return (System_avsprintf(buf, fmt, va));
}

/*
 *  ======== System_avsprintf ========
 *  -1 indicates infinite output
 */
Int System_avsprintf(Char buf[], CString fmt, VaList va)
{
    return (System_doPrint(buf, (SizeT)-1, fmt, vaRef(va), TRUE));
}

/*
 *  ======== System_printf_va ========
 */
Int System_printf_va(CString fmt, VaList va)
{
    return (System_vprintf(fmt, va));
}

/*
 *  ======== System_vprintf ========
 *  -1 indicates infinite output
 */
Int System_vprintf(CString fmt, VaList va)
{
    return (System_SupportProxy_ready()
            ? System_doPrint(NULL, (SizeT)-1, fmt, vaRef(va), FALSE) : -1);
}

/*
 *  ======== System_sprintf_va ========
 */
Int System_sprintf_va(Char buf[], CString fmt, VaList va)
{
    return (System_vsprintf(buf, fmt, va));
}

/*
 *  ======== System_vsprintf ========
 *  -1 indicates infinite output
 */
Int System_vsprintf(Char buf[], CString fmt, VaList va)
{
    return (System_doPrint(buf, (SizeT)-1, fmt, vaRef(va), FALSE));
}

/*
 *  ======== System_snprintf_va ========
 */
Int System_snprintf_va(Char buf[], SizeT n, CString fmt, VaList va)
{
    return (System_vsnprintf(buf, n, fmt, va));
}

/*
 *  ======== System_vsnprintf ========
 */
Int System_vsnprintf(Char buf[], SizeT n, CString fmt, VaList va)
{
    return (System_doPrint(buf, n, fmt, vaRef(va), FALSE));
}

/*
 *  ======== System_doPrint ========
 *  Internal function
 *
 *  If buf == NULL, characters are sent to System_SupportProxy_putch();
 *  otherwise, they are written into buf. Atmost `n` - 1 characters are written
 *  excluding '\0'. 
 *
 *  The return value is the number of characters that would have 
 *  been written had `n` been sufficiently large, not counting the terminating 
 *  '\0' character.
 */
Int System_doPrint(Char *buf, SizeT n, CString fmt, VaList *pva, Bool aFlag)
{
    /* temp vars */
    Int     base;
    Char    c;
    Int     res;
    Char    outbuf[OUTMAX];
   
    /* vars passed to System_extendFxn. Also keep track in while loop */
    struct System_ParseData parse;

    parse.aFlag = aFlag;

    res = 0;

    if (fmt == (Char *)NULL) {
        return (res);
    }

    while ((c = *fmt++) != '\0') {
        if (c != '%') {
            System_putchar(&buf, c, &n);
            res++;
        }
        else {
            c = *fmt++;
            /* check for - flag (pad on right) */
            if (c == '-') {
                parse.lJust = TRUE;
                c = *fmt++;
            }
            else {
                parse.lJust = FALSE;
            }
            /* check for leading 0 pad */
            if (c == '0') {
                parse.zpad = 1;
                c = *fmt++;
            }
            else {
                parse.zpad = 0;
            }

            /* allow optional field width/precision specification */
            parse.width = 0;
            parse.precis = -1;

            /* note: dont use isdigit (very large for C30) */
            if (c == '*') {
                parse.width = parse.aFlag
                    ? (int)va_arg(*pva, IArg) : (int)va_arg(*pva, int);
                c = *fmt++;
                if (parse.width < 0) {
                    parse.lJust = TRUE;
                    parse.width = -parse.width;
                }
            }
            else {
                while (c >= '0' && c <= '9') {
                    parse.width = parse.width * 10 + c - '0';
                    c = *fmt++;
                }
            }

            /* allow optional field precision specification */
            if (c == '.') {
                parse.precis = 0;
                c = *fmt++;
                if (c == '*') {
                    parse.precis = parse.aFlag ? (int)va_arg(*pva, IArg) :
                                     (int)va_arg(*pva, int);
                    if (parse.precis < 0) {
                        parse.precis = 0;
                    }
                    
                    c = *fmt++;
                }
                else {
                    while (c >= '0' && c <= '9') {
                        parse.precis = parse.precis * 10 + c - '0';
                        c = *fmt++;
                    }
                }
            }

            /* setup for leading zero padding */
            if (parse.zpad) {
                parse.zpad = parse.width;
            }
            
            /* check for presence of l flag (e.g., %ld) */
            if (c == 'l' || c == 'L') {
                parse.lFlag = TRUE;
                c = *fmt++;
            }
            else {
                parse.lFlag = FALSE;
            }

            parse.ptr = outbuf;
            parse.end = outbuf + OUTMAX;
            parse.len = 0;

            if (c == 'd' || c == 'i') {
                /* signed decimal */
                IntMax val =
                    parse.aFlag ? (IntMax)va_arg(*pva, IArg) :
                    parse.lFlag ? (IntMax)va_arg(*pva, long int) :
                    (IntMax)va_arg(*pva, int);
				
                if (parse.precis > parse.zpad) {
                    parse.zpad = parse.precis;
                }
                parse.ptr = formatNum(parse.end, val, parse.zpad, -10);
                parse.len = parse.end - parse.ptr;
            }
            /* use comma operator to optimize code generation! */
            else if (((base = 10), (c == 'u')) ||       /* unsigned decimal */
                     ((base = 16), (c == 'x')) ||       /* unsigned hex */
                     ((base = 8),  (c == 'o'))) {       /* unsigned octal */

                UIntMax val =
                    parse.aFlag ? (UIntMax)va_arg(*pva, IArg) :
                    parse.lFlag ? (UIntMax)va_arg(*pva, unsigned long) :
                    (UIntMax)va_arg(*pva, unsigned);

                if (parse.precis > parse.zpad) {
                    parse.zpad = parse.precis;
                }
                parse.ptr = formatNum(parse.end, val, parse.zpad, base);
                parse.len = parse.end - parse.ptr;
            }
            else if ((base = 16), (c == 'p')) {
                parse.zpad = PTRZPAD;                   /* ptrs are 0 padded */
                parse.ptr = formatNum(
                    parse.end,
                    parse.aFlag
                        ? (UIntMax)va_arg(*pva, IArg) : (UIntMax)(UArg)va_arg(*pva, Ptr),
                    parse.zpad, base);
                *(--parse.ptr) = '@';
                parse.len = parse.end - parse.ptr;
            }
            else if (c == 'c') {
                /* character */
                *parse.ptr = parse.aFlag
                    ? (Char)va_arg(*pva, IArg) : (Char)va_arg(*pva, int);
                parse.len = 1;
            }
            else if (c == 's') {
                /* string */
                parse.ptr = parse.aFlag ? (String)iargToPtr(va_arg(*pva, IArg)) :
                              (String)va_arg(*pva, void *);

                /* substitute (null) for NULL pointer */
                if (parse.ptr == (char *)NULL) {
                    parse.ptr = "(null)";
                }
                parse.len = strlen(parse.ptr);
                if (parse.precis != -1 && parse.precis < parse.len) {
                    parse.len = parse.precis;
                }
            }
            else {
                fmt--;

                 /* check if enough buffer space available */
                if (n > 1) {
                    /* parse.precis should account for the buffer size */
                    if ((parse.precis == -1) || ((SizeT)parse.precis >= n)) {
                         parse.precis = n; 
                    }
                    else {
                         /* Have enough space, increment to account for '\0' */
                         parse.precis++; 
                    }
                    res += System_extendFxn(&buf, &fmt, pva, &parse);
                }
            }

            /* compute number of characters left in field */
            parse.width -= parse.len;

            if (!parse.lJust) {
                /* pad with blanks on left */
                while (--parse.width >= 0) {
                    System_putchar(&buf, ' ', &n);
                    res++;
                }
            }

            /* output number, character or string */
            while (parse.len--) {
                System_putchar(&buf, *parse.ptr++, &n);
                res++;
            }
            /* pad with blanks on right */
            if (parse.lJust) {
                while (--parse.width >= 0) {
                    System_putchar(&buf, ' ', &n);
                    res++;
                }
            }
        } /* if */
    } /* while */

    if (buf) {
        *buf = '\0';
    }

    return (res);
}

/*
 *  ======== formatNum ========
 *  Internal function
 *
 *  Format unsigned long number in specified base, returning pointer to
 *  converted output.
 *
 *  Note: ptr points PAST end of the buffer, and is decremented as digits
 *  are converted from right to left!
 *
 *  Note: base is negative if n is signed else n unsigned!
 *
 *  ptr  - Pointer to the end of the working buffer where the string version
 *         of the number will be placed.
 *  un   - The unsigned number to be formated
 *  base - The base to format the number into. TODO - signed?
 */
Char *formatNum(Char *ptr, UIntMax un, Int zpad, Int base)
{
    Int i = 0;
    Char sign = 0;

    UIntMax n;
    n = un;

    if (base < 0) {
        /* handle signed long case */
        base = -base;
        if ((IntMax)n < 0) {
            n = -(IntMax)n;

            /* account for sign '-': ok since zpad is signed */
            --zpad;
            sign = '-';
        }
    }

    /* compute digits in number from right to left */
    do {
        *(--ptr) = "0123456789abcdef"[(Int)(n % base)];
        n = n / base;
        ++i;
    } while (n);

    /* pad with leading 0s on left */
    while (i < zpad) {
        *(--ptr) = '0';
        ++i;
    }

    /* add sign indicator */
    if (sign) {
        *(--ptr) = sign;
    }
    return (ptr);
}

/*
 *  ======== System_putchar ========
 *  Internal function
 *
 *  Write character `c` to the buffer and, if the buffer pointer is
 *  non-NULL, update the buffer pointer.
 *  
 *  Keeps track of the number of characters written into the buffer by 
 *  modifying bufsize `n`. Atmost, `n` - 1 characters are written.  
 */
Void System_putchar(Char **bufp, Char c, SizeT *n)
{
    /* if the size == 1, don't write so we can '\0' terminate buffer */
    if ((*n) <= 1) {
        return;
    }
         
    /* decrement n to keep track of the number of chars written */
    (*n)--;

    /*
     *  If the buffer is non-NULL, use it, otherwise call the
     *  proxy's putch function (if it is ready).
     */
    if (*bufp) {
        *((*bufp)++) = c;
        return;
    }

    if (System_SupportProxy_ready()) {
        System_SupportProxy_putch(c);
    }
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

