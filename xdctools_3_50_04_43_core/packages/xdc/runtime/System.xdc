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
 *  ======== System.xdc ========
 */

package xdc.runtime;

/*!
 *  ======== System ========
 *  Basic system services
 *
 *  This module provides basic low-level "system" services; e.g.,
 *  character output, `printf`-like output, and exit handling.
 *
 *  This module is gated and other modules use its gate via the
 *  `{@link Gate#enterSystem}` and `{@link Gate#leaveSystem}`. The `System`
 *  gate must be enterable by any thread in a multi-threaded environments.  For
 *  example, in many real-time multi-threaded environments some types of
 *  threads, such as Interrupt Service Routines (ISRs), are not allowed to call
 *  operations that block the caller.  In such an environment, either the
 *  `System` gate must disable all interrupts or ISRs must never call a function
 *  in the `xdc.runtime` package.
 */

@Template("./System.xdt")
@Gated
@ModuleStartup
@DirectCall
module System {

    /*!
     *  ======== AtexitHandler ========
     *  `System`'s atexit function prototype.
     *
     *  Functions of this type can be added to the list of functions that
     *  are executed during application termination.
     *
     *  @see #atexit
     */
    typedef Void (*AtexitHandler)(Int);

    /*!
     *  ======== STATUS_UNKNOWN ========
     *  Unknown exit status value
     *
     *  When the program exits by calling {@link #exit System_exit()} the
     *  `System`'s `atexit` functions are passed the status value passed to
     *  `System_exit()`.  However, if the program exits using 
     *  the ANSI C Standard Library `exit()` function, the `System`'s `atexit`
     *  functions are passed `System_STATUS_UNKNOWN`; ANSI C `atexit`
     *  functions are not passed the exit status.
     */
    const Int STATUS_UNKNOWN = 0xCAFE;

    /*!
     *  ======== AbortFxn ========
     *  System abort function prototype.
     *
     *  Functions of this type can be plugged into `System`'s abort function 
     *  that will be executed during abnormal application termination.
     *
     *  @see #abort
     */
    typedef Void (*AbortFxn)();

    /*!
     *  ======== ExitFxn ========
     *  System exit function prototype.
     *
     *  Functions of this type can be plugged into `System`'s exit function that
     *  will be executed during normal application termination.
     *
     *  @see #exit
     */
    typedef Void (*ExitFxn)(Int);

    /*! @_nodoc */
    @XmlDtd
    metaonly struct Module_View {
        String  atexitHandlers[];
        Int     numAtexitHandlers;
    };

    /*! @_nodoc */
    metaonly struct PathEntryView {
        String entry;
    }

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config xdc.rov.ViewInfo.Instance rovViewInfo = 
        xdc.rov.ViewInfo.create({
            viewMap: [
                ['XDCROOT',
                    {
                        type: xdc.rov.ViewInfo.MODULE_DATA,
                        viewInitFxn: 'viewInitXdcRoot',
                        structName: 'PathEntryView'
                    }
                ],
                ['XDCPATH',
                    {
                        type: xdc.rov.ViewInfo.MODULE_DATA,
                        viewInitFxn: 'viewInitXdcPath',
                        structName: 'PathEntryView'
                    }
                ],
            ]
        });

    /*!
     *  ======== A_cannotFitIntoArg ========
     *  Assert that the target's `Float` type fits in an `IArg`
     *
     *  This assertion is triggered when the `%f` format specifier is used,
     *  the argument treated as an `IArg`, but for the current target
     *  `sizeof(Float)` > `sizeof(IArg)`.
     */
    config Assert.Id A_cannotFitIntoArg = {
        msg: "A_cannotFitIntoArg: sizeof(Float) > sizeof(Arg)"
    };

    /*!
     *  ======== extendedFormats ========
     *  Optional conversions supported by `{@link #printf System_printf}`
     *
     *  This string specifies the set of optional argument conversion
     *  specifiers required by the application.  By reducing the number of
     *  optional conversions understood by the `System {@link #printf}`
     *  methods, it is possible to significantly reduce the code size
     *  footprint of the `System` module.  This configuration parameter
     *  enables one to balance `printf` functionality against code size
     *  footprint.
     *
     *  The format of this string is simply a concatenated list of the desired
     *  conversion specifiers (with the leading `%` character).  For example,
     *  to support both `%f` and `%$L` set `extendedFormats` to `"%$L%f"`.
     *
     *  To disable all optional converstions, set `extendedFormats` to `null`
     *  or the empty string ("").
     *
     *  For a complete list of supported extensions, see the
     *  `{@link #printf System_printf}` "Extended_Format_Specifiers" section.
     *
     *  @a(Note)
     *  If an optional conversion is used by some part of the application and
     *  it is not specified in `extendedFormats`, the conversion character(s)
     *  and leading `%` are treated as ordinary characters to be output.  As
     *  a result, all subsequent arguments will almost certainly be converted
     *  using the wrong conversion specifier!
     *
     *  @see #printf
     */
    metaonly config String extendedFormats = "%$L%$S%$F";

    /*!
     *  ======== SupportProxy ========
     *  The implementation module of the low-level system functions.
     *
     *  This configuration parameter allows one to "bind" a different
     *  implementation of the low-level services required to implement
     *  `System`.
     *  @p(code)
     *      var System = xdc.useModule("xdc.runtime.System");
     *      var SysStd = xdc.useModule("xdc.runtime.SysStd");
     *      System.SupportProxy = SysStd;
     *  @p
     *
     *  If this parameter is not set, it defaults to `{@link SysMin}`.
     */
    proxy SupportProxy inherits ISystemSupport;

    /*!
     *  ======== maxAtexitHandlers ========
     *  Maximum number of dynamic atexit handlers allowed in the system.
     *
     *  Maximum number of `System` `atexit` handlers set during runtime via
     *  the `{@link System#atexit}` function.
     *
     */
    config Int maxAtexitHandlers = 8;

    /*!
     *  ======== abortFxn ========
     *  Abort handler function
     *
     *  This configuration parameter allows user to plug in their own abort
     *  function. By default `{@link #abortStd}` which calls ANSI C Standard 
     *  `abort()` is plugged in. Alternatively `{@link #abortSpin}` can be 
     *  plugged which loops infinitely.
     *
     */
    config AbortFxn abortFxn = System.abortStd;

    /*!
     *  ======== exitFxn ========
     *  Exit handler function
     *
     *  This configuration parameter allows user to plug in their own exit
     *  function. By default `{@link #exitStd}` which calls ANSI C Standard 
     *  `exit()` is plugged in. Alternatively `{@link #exitSpin}` can be 
     *  plugged which loops infinitely.
     *
     */
    config ExitFxn exitFxn = System.exitStd;

    /*!
     *  ======== abort ========
     *  Print a message and abort currently running executable.
     *
     *  This is called when an executable abnormally terminates.  
     *  The `System` gate is entered, the 
     *  `{@link #SupportProxy}`'s `abort` function is called
     *  and then `{@link #abortFxn}` is called.
     *  No exit functions bound via `System_atexit()` or the ANSI C Standard
     *  Library `atexit()` functions are executed. 
     *
     *  @param(str) abort message (not a format string)
     */
    Void abort(CString str);

    /*!
     *  ======== abortStd ========
     *  ANSI C Standard implementation of abortFxn function
     *
     *  This function calls ANSI C Standard `abort()` to terminate currently 
     *  running executable. This function is used by default in 
     *  `{@link #abortFxn}`. 
     *
     */
    Void abortStd();

    /*!
     *  ======== abortSpin ========
     *  Lightweight implementation of abortFxn function
     *
     *  This functions loops indefinitely. This can used as an alternative
     *  `{@link #abortFxn}` when a lightweight implementation is 
     *  required instead of the ANSI C Standard `abort()`.
     */
    Void abortSpin();

    /*!
     *  ======== atexit ========
     *  Add an exit handler
     *
     *  `System_atexit` pushes `handler` onto an internal stack of functions 
     *  to be executed when system is exiting (e.g. `System_exit` is called).
     *  Up to `{@link #maxAtexitHandlers}` functions can be specified in this
     *  manner.  During the exit processing, the functions are popped off the
     *  internal stack and called until the stack is empty.
     *
     *  The `System` gate is entered before the `System_atexit` functions 
     *  are called.
     *
     *  The `SupportProxy`'s `{@link ISystemSupport#exit}` function is called
     *  after all the atexit functions are called.
     *
     *  @param(handler) the `AtexitHandler` to invoke during system
     *                  exit processing.
     *
     *  @a(returns)
     *  If `FALSE` is returned, the exit handler was not added and it will
     *  not be called during an exit.
     */
    Bool atexit(AtexitHandler handler);

    /*!
     *  ======== atexitMeta ========
     *  Add an exit handler during configuration
     *
     *  This is the static counterpart to `System_atexit()`. This method can
     *  be used to add `atexit` handlers at configuration time.  These
     *  handlers do not count against the `maxAtexitHandlers`.
     *
     *  @param(handler) the `AtexitHandler` to invoke during system
     *                  exit processing.
     */
    metaonly Void atexitMeta(AtexitHandler handler);

    /*!
     *  ======== exit ========
     *  Exit currently running executable.
     *
     *  This function is called when an executable needs to terminate
     *  normally.  This function processes all functions bound via
     *  `System_atexit` and then calls `{@link #exitFxn}`. The
     *  `{@link #SupportProxy}`'s `exit` function is called during this time.
     *
     *  @param(stat)    exit status to return to calling environment.
     */
    Void exit(Int stat);

    /*!
     *  ======== exitStd ========
     *  Implements an `exitFxn` function
     *
     *  This function calls ANSI C Standard `exit()` to terminate currently
     *  running executable normally. This function is used by default in
     *  `{@link #exitFxn}`. 
     *
     *  @param(stat)    exit status to return to calling environment.
     */
    Void exitStd(Int stat);

    /*!
     *  ======== exitSpin ========
     *  Implements an `exitFxn` function
     *
     *  This functions loops indefinitely. This can used as an alternative
     *  `{@link #exitFxn}` when a light weight implementation is
     *  required instead of the ANSI C Standard `exit()`.
     *
     *  @param(stat)    exit status to return to calling environment.
     */
    Void exitSpin(Int stat);

    /*!
     *  ======== processAtExit ========
     *  Processes all functions bound via `System_atexit`
     *
     *  This function is called by `System_exit` to process all functions
     *  bound via `System_atexit`. User can add this to ANSI C standard
     *  `atexit` function so that all functions bound via `System_atexit` are
     *  processed when ANSI C standard `exit` function is called.
     *
     *  @param(stat)    exit status which will passed to all functions 
     *                  processed.
     */
    Void processAtExit(Int stat);

    /*!
     *  ======== putch ========
     *  Output a single character
     *
     *  The `{@link #SupportProxy}`'s `putch` function is called
     *  by this function.
     *
     *  @param(ch) character to be output.
     */
    Void putch(Char ch);

    /*!
     *  ======== flush ========
     *  Flush standard System I/O     
     *
     *  This function causes any buffered output characters are "written"
     *  to the output device.
     *
     *  The `{@link #SupportProxy}`'s `flush` function is called
     *  by this function.
     */
    Void flush();

    /*!
     *  ======== printf ========
     *  A smaller faster printf
     *
     *  This function behaves much like the ANSI C Standard `printf`
     *  but does not support the full range of format strings specified by
     *  the C Standard.  In addition, several non-standard format specifiers
     *  are recognized.
     *
     *  @a(Format Strings)
     *  The format string is a character string composed of zero or
     *  more directives: ordinary characters (not %), which are copied
     *  unchanged to the output stream; and conversion specifications, each of
     *  which results in fetching zero or more subsequent arguments.  Each
     *  conversion specification is introduced by the character %, and ends
     *  with a conversion specifier.  In between there may be (in this order)
     *  zero or more flags, an optional minimum field width, an optional
     *  precision and an optional length modifier.
     *
     *  @a(Flags)
     *  The following flags are supported:
     *  @p(dlist)
     *      - `-`
     *          The converted value is to be left adjusted on the field
     *          boundary (the default is right justification.)
     *      - `0`
     *          The value should be zero padded. For d, i, o, u, and x
     *          conversions, the converted value is padded on the left
     *          with zeros rather than blanks.
     *  @p
     *
     *  @a(Field Width)
     *  The optional field width specifier is a decimal digit string (with
     *  nonzero first digit) specifying a minimum field width. If the
     *  converted value has fewer characters than the field width, it will
     *  be padded with spaces on the left (or right, if the left-adjustment
     *  flag has been given).  Instead of a decimal digit string one may
     *  write `*` to specify that the field width is given in the next
     *  argument.  A negative field width is taken as a '-' flag followed
     *  by a positive field width.
     *
     *  @a(Precision)
     *  The optional precision specifier is a period ('.') followed by an
     *  optional decimal digit string.  Instead of a decimal digit string
     *  one may write `*` to specify that the precision is given in the 
     *  next argument which must be of type int.
     *
     *  If the precision is given as just '.', or the precision is
     *  negative, the precision is taken to be zero.  This gives the
     *  minimum number of digits to appear for d, i, o, u, and x
     *  conversions, or the maximum number of characters to be printed from
     *  a string for s conversions.
     *
     *  @a(Length Modifiers)
     *  The optional length modifier is a single character from the following
     *  list.
     *  @p(dlist)
     *      - `l`
     *          A  following integer conversion corresponds to a long int
     *          or unsigned long int argument
     *
     *  @p
     *
     *  @a(Conversion Specifiers)
     *  The following conversion specifiers are supported.
     *  @p(dlist)
     *      - `d`, `i`
     *          signed integer
     *      - `u`
     *          unsigned decimal
     *      - `x`
     *          unsigned hex
     *      - `o`
     *          unsigned octal
     *      - `p`
     *          pointer (@ + hex num)
     *      - `c`
     *          character
     *      - `s`
     *          string
     *  @p
     *  @a(Extended Conversion Specifiers)
     *  The following conversion specifiers are optionally supported.  See
     *  the `{@link #extendedFormats}` configuration parameter for more
     *  information about how to enable these conversion specifiers.
     *
     *  @p(dlist)
     *      - `f`
     *          decimal floating point.
     *      - `$`
     *          non-ANSI conversion prefix.  This prefix indicates that the
     *          next character identifies a non-ANSI standard conversion. See
     *          the next section for details.
     *  @p
     *
     *  @a(Non ANSI Conversion Specifiers)
     *  Among the extended conversion specifiers are unique specifiers which
     *  are not part of ANSI printf. These are specified using a $, for 
     *  example %$L.
     *
     *  These unique specifiers do not support the minimum field width
     *  attribute. Certain specifiers have additional restrictions; see below.
     *  
     *  @p(dlist)
     *      - '$L'
     *          The argument is treated as a pointer to a `{@link Types#Label}`
     *          and is converted to an appropriate string.
     *      - '$F'
     *          Displays a file and line number; used for displaying the call 
     *          site. This specifier consumes two arguments, the file and line 
     *          number, in that order. See an example below.
     *      - '$S'
     *          The argument is treated as a format string, and is recursively
     *          formatted using any following arguments. This specifier does 
     *          not support the use of the "precision" field for specifying 
     *          maximum string length.
     *  @p
     * 
     *  The following are example uses of the %$F and %$S format specifiers.
     *  
     *  In this call using %$F, the compiler recognizes these symbols and
     *  fills in the file and line number.
     *  @p(code)
     *  System_printf("%$F", __FILE__, __LINE__);
     *  @p
     *  This call outputs, for example,
     *  @p(code)
     *  "MyCode.c", line 35: 
     *  @p
     *  Here is an example using %$S, passing a recursive format string.
     *  @p(code)
     *  System_printf("Msg: %$S", "My msg, code: %d", 5);
     *  @p
     *  This outputs:
     *  @p(code)
     *  Msg: My msg, code: 5
     *  @p
     *
     *  @param(fmt) a 'printf-style' format string
     *
     *  @a(returns)
     *  `printf` returns the number of characters printed.
     */
    Int printf(CString fmt, ...);

    /*!
     *  ======== aprintf ========
     *  `{@link #printf}` where all optional arguments are `IArg`s
     *
     *  This function will treat each argument as though it was widened to be 
     *  of type `IArg` prior to being passed to the `{@link #printf}` function
     *
     *  @see #printf
     */
    Int aprintf(CString fmt, ...);

    /*!
     *  ======== sprintf ========
     *  Write formated output to a character buffer
     *
     *  This function is identical to `{@link #printf}` except that the
     *  output is copied to the specified character buffer `buf` followed
     *  by a terminating '\0' character.
     *
     *  @param(buf) a character output buffer
     *  @param(fmt) a 'printf-style' format string
     *
     *  @a(returns)
     *  `sprintf` returns the number of characters output not including the
     *  '\0' termination character.
     */
    Int sprintf(Char buf[], CString fmt, ...);

    /*!
     *  ======== asprintf ========
     *  `{@link #sprintf}` where all optional arguments are `IArg`s
     *
     *  This function will treat each argument as though it was widened to be 
     *  of type `IArg` prior to being passed to the `{@link #sprintf}`
     *  function.
     *
     *  @see #sprintf
     */
    Int asprintf(Char buf[], CString fmt, ...);

    /*!
     *  ======== vprintf ========
     *  A VaList printf
     *
     *  This function is identical to `{@link #printf}` except that its
     *  arguments are passed via a VaList (a "varargs list").
     *
     *  @param(fmt) a standard 'printf-style' format string.
     *  @param(va)  an args list that points to the arguments referenced
     *              by the fmt string
     *
     *  @a(returns)
     *  `vprintf` returns the number of characters output.
     */
    Int vprintf(CString fmt, VaList va);

    /*!
     *  ======== avprintf ========
     *  `{@link #vprintf}` where all optional arguments are `IArg`s
     *
     *  This function will treat each argument as though it was widened to be 
     *  of type `IArg` prior to being passed to the `{@link #vprintf}`
     *  function.
     *
     *  @see #vprintf
     */
    Int avprintf(CString fmt, VaList va);

    /*!
     *  ======== vsprintf ========
     *  A `VaList` sprintf
     *
     *  This function is identical to `{@link #sprintf}` except that 
     *  its arguments are passed via a `VaList` (a "varargs list").
     *
     *  @param(buf) a character output buffer
     *  @param(fmt) a standard '`printf`-style' format string.
     *  @param(va)  an arguments list that points to the arguments referenced
     *              by the `fmt` string
     *
     *  @a(returns)
     *  `vsprintf` returns the number of characters output.
     */
    Int vsprintf(Char buf[], CString fmt, VaList va);

    /*!
     *  ======== avsprintf ========
     *  `{@link #vsprintf}` where all optional arguments are `IArg`s
     *
     *  This function is identical to `{@link #sprintf}` except that 
     *  its arguments are passed via a `VaList` (a "varargs list").
     *
     *  This function will treat each argument as though it was widened to be 
     *  of type `IArg` prior to being passed to the `vsprintf` function
     *
     *  @see #vsprintf
     */
    Int avsprintf(Char buf[], CString fmt, VaList va);
    
    /*!
     *  ======== snprintf ========
     *  Write formated output to a character buffer
     *
     *  This function is identical to `{@link #sprintf}` except that at most
     *  `n` characters are copied to the specified character buffer `buf`.
     *  If n is zero, nothing is written to character buffer. Otherwise,
     *  output characters beyond the `n` - 1 are discarded rather than
     *  being written to the character buf, and a null character is written 
     *  at the end of the characters written into the buffer.
     *
     *  @param(buf) a character output buffer
     *  @param(n)   the maximum number of characters, including '\0', written to
     *              the output buffer `buf`
     *  @param(fmt) a 'printf-style' format string
     *
     *  @a(returns)
     *  `snprintf` returns the number of characters that would have been
     *  written had `n` been sufficiently large, not counting the terminating
     *  '\0' character.
     */
    Int snprintf(Char buf[], SizeT n, CString fmt, ...);
    
    /*!
     *  ======== vsnprintf ========
     *  A `VaList` snprintf
     *
     *  This function is identical to `{@link #snprintf}` except that 
     *  its arguments are passed via a `VaList` (a "varargs list").
     *
     *  @param(buf) a character output buffer
     *  @param(n)   at most number of characters including '\0' written to
     *              output buffer
     *  @param(fmt) a standard '`printf`-style' format string.
     *  @param(va)  an arguments list that points to the arguments referenced
     *              by the `fmt` string
     *
     *  @a(returns)
     *  `vsnprintf` returns the number of characters that would have been
     *  written had `n` been sufficiently large, not counting the terminating
     *  '\0' character.
     */
    Int vsnprintf(Char buf[], SizeT n, CString fmt, VaList va);
	
internal:

    /*! struct used to keep track of state during doPrint */
    struct ParseData {
        Int     width;      /* width in format specifier */
        Bool    lFlag;      /* length modifier flag */
        Bool    lJust;      /* left justify flag */
        Int     precis;     /* precision in format specifier */
        Int     len;        /* length of formatted number */
        Int     zpad;       /* leading zero pad flag */
        Char    *end;       /* pointer to end of local buf to hold num */
        Bool    aFlag;      /* deal with vars on stack as IArgs */
        Char    *ptr;       /* ptr to local buf after filling in num */
    };

    /*! typedef for generated functions to process extended formats */
    typedef Int (*ExtendFxn)(Char **, CString *, VaList *, ParseData *);

    /*! config parameter used to call generated function  */
    readonly config ExtendFxn extendFxn = '&xdc_runtime_System_printfExtend__I';
    
    /*
     * ======== printfExtend ======== 
     *  System_printfExtend is generated based on extendedFormats string
     *
     *  This generated function is accessed through an internal config so
     *  that it is an indirect call in the ROM case, but optimized to a direct
     *  call in the RAM case.
     *
     * @_nodoc
     */
    Int printfExtend (Char **bufp, CString *fmt, VaList *va, ParseData *parse);

    /*!
     *  ======== exitFxns ========
     *  @_nodoc
     *  List of functions statically plugged to be called at exit
     *
     */
    metaonly config AtexitHandler exitFxns[];
    
    /*!
     *  ======== mprintf ========     
     *  @_nodoc
     */
    function mprintf(fmt, args);
    
    /*!
     *  ======== doPrint ========
     *  @_nodoc
     */
    Int doPrint(Char buf[], SizeT n, CString fmt, VaList *pva, Bool aFlag);
    
    /*!
     *  ======== lastFxn ========
     *  @_nodoc
     *
     *  Calls atexit() after all other modules have been initialized
     *  This used to be done in System_Module_startup() but this caused
     *  problems since atexit() uses a heap which isn't necessarily
     *  initialized.
     */
    Void lastFxn();
    
    /*!
     *  ======== putchar ========
     *  @_nodoc
     *
     *  Write character ch to the buffer and, if the buffer pointer is
     *  non-`NULL`, update the buffer pointer.
     *
     *  Keeps track of the number of characters written into the buffer by
     *  modifying bufsize `n`. Atmost, `n` - 1 characters are written.  
     */
    Void putchar(Char **bufp, Char ch, SizeT *n);
    
    /*!
     *  ======== rtsExit ========
     *  @_nodoc
     */
    Void rtsExit();

    /*!
     *  ======== atexitDone ========
     *  @_nodoc
     */
    Bool atexitDone();

    /*!
     *  ======== Module_State ========
     *  @_nodoc
     */
    struct Module_State {
        AtexitHandler  atexitHandlers[];   /* array of atexit handlers       */
        Int            numAtexitHandlers;  /* Current num of atexit handlers */
    };
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

