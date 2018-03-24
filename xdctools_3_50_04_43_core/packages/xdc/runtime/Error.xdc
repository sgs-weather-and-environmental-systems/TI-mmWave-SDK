/* 
 *  Copyright (c) 2008-2017 Texas Instruments Incorporated
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
 *  ======== Error.xdc ========
 */

/*!
 *  ======== Error ========
 *  Runtime error manager
 *
 *  The `Error` module provides mechanisms for raising, checking, and
 *  handling errors in a program. At the configuration time, you can use the
 *  parameters `{@link Error#policy Error.policy}`,
 *  `{@link Error#policyFxn Error.policyFxn}` and
 *  `{@link Error#raiseHook Error.raiseHook}` to specify what happens when an
 *  error takes place. You can control how much debugging information is
 *  available in that case, while also controlling the memory footprint that the
 *  `Error' module adds to the program.
 *
 *  Module producers use this module to define specific error types and
 *  reference these when raising an error. Each error type has a custom error
 *  message and can be parameterized with up to `{@link #NUMARGS}` arguments. A
 *  generic error type is provided for raising errors when not in a module.
 *
 *  Use the `{@link #check Error_check()}` function in your application or
 *  module to determine if an error has been raised in a function that takes an
 *  `{@link #Block Error_Block}` as an argument. It is important to understand
 *  that it is the caller's responsibility to check the error block after
 *  calling such a function. Otherwise, a raised error may go undetected, which
 *  could compromise the integrity of the system. For example:
 *
 *  @p(code)
 *  Task_create(..., &eb);
 *
 *  if (Error_check(&eb)) {
 *      ...an error has been raised...
 *  }
 *  @p
 *
 *  The function assigned to the parameter
 *  `{@link Error#policyFxn Error.policyFxn}` is the central part of the
 *  error handling mechanism in this module. Most of the users will either leave
 *  this parameter at its default value, or select one of the alternative
 *  implementations that are included with the `Error` module. However, this
 *  configuration parameter also allows users to completely take over the error
 *  handling by setting this parameter to their own implementation. In that
 *  case, we recommend that users first review the included implementations,
 *  and base their implementation on one of these function. The included
 *  implementations are `{@link #policyDefault}`, `{@link #policyMin}`, and
 *  `{@link #policySpin}`.
 *
 *  The `{@link #raiseHook Error.raiseHook}` configuration parameter allows
 *  a configured function to be invoked when an error is raised.
 *  This function is invoked from the default implementation of
 *  `{@link Error#policyFxn Error.policyFxn}`. Therefore, if a different
 *  implementation of `Error.policyFxn` is used, the function specified by
 *  `Error.raiseHook` may or may not be called.
 *  This function is passed a pointer to the error's error block and makes it
 *  easy to manage all errors from a common point. For example, you can
 *  trap any error (fatal or not) by simply setting a breakpoint in this
 *  function. You can use the following functions to extract information
 *  from an error block.
 *
 *  @p(blist)
 *  - `{@link #getData Error_getData()}`
 *  - `{@link #getCode Error_getCode()}`
 *  - `{@link #getId Error_getId()}`
 *  - `{@link #getMsg Error_getMsg()}`
 *  - `{@link #getSite Error_getSite()}`
 *  @p
 *
 *  The Error module provides facilities for handling errors, but the Log
 *  module also provides features for logging error events. These are separate
 *  concepts; however, to ensure that users do not have to both raise and log
 *  an error, the Error module will automatically log an error event when one
 *  is raised. The Error module logs the standard {@link Log#L_error} event,
 *  passing it the error message and arguments.
 *
 *  The error event is logged to the Error module's logger using the Error
 *  module's diags mask. Logging of errors is enabled by default in the diags
 *  mask, but the event will not be logged unless a logger is configured for
 *  the Error module as well.
 *
 *  To make the error event appear as though it is coming from the module which
 *  called Error_raise, the event is logged with the caller's module id and
 *  with the caller's call site information.
 *
 *  @a(Examples)
 *  Example 1: The following example shows how a module, named ModA,
 *  defines a custom error type and shows how this error is raised by
 *  the module. The module defines an `Id` of `E_notEven` in its module
 *  specification file (in this case, `ModA.xdc`). The error's message
 *  string takes only one argument. The module also defines a `mayFail()`
 *  function that takes an error block. In the module's C source file,
 *  the function checks for the error condition and raises the error if
 *  needed.
 *
 *  This is part of ModA's XDC specification file for the module:
 *
 *  @p(code)
 *  config xdc.runtime.Error.Id E_notEven = {
 *      msg: "expected an even number (%d)"
 *  };
 *
 *  Void mayFail(Int x, xdc.runtime.Error.Block *eb);
 *  @p
 *
 *  This is part of the C code for the module:
 *
 *  @p(code)
 *  Void ModA_mayFail(Int x, Error_Block *eb)
 *  {
 *      if ((x % 2) != 0) {
 *          Error_raise(eb, ModA_E_notEven, x, 0);
 *          ...add error handling code here...
 *          return;
 *      }
 *      ...
 *  }
 *  @p
 *
 *  @p(html)
 *  <hr />
 *  @p
 *
 *  Example 2: The following C code supplies an error block to a function
 *  that requires one and tests the error block to see if the function
 *  raised an error. Note that an error block must be initialized before
 *  it can be used and same error block may be passed to several functions.
 *
 *  @p(code)
 *  #include <xdc/runtime/Error.h>
 *  #include <ti/sysbios/knl/Task.h>
 *  Error_Block eb;
 *  Task_Handle tsk;
 *
 *  Error_init(&eb);
 *  tsk = Task_create(..., &eb);
 *
 *  if (Error_check(&eb)) {
 *      ...an error has been raised...
 *  }
 *  @p
 *
 *  @p(html)
 *  <hr />
 *  @p
 *
 *  Example 3: The following C code shows that you may pass a special constant
 *  `Error_ABORT` in place of an error block to a function requiring an error
 *  block. In this case, if the function raises an error, the program is aborted
 *  (via `{@link System#abort xdc_runtime_System_abort()}`), thus execution
 *  control will never return to the caller.
 *
 *  @p(code)
 *  #include <xdc/runtime/Error.h>
 *  #include <ti/sysbios/knl/Task.h>
 *
 *  tsk = Task_create(..., Error_ABORT);
 *  ...will never get here if an error was raised in Task_create...
 *  @p
 *
 *  @p(html)
 *  <hr />
 *  @p
 *
 *  Example 4: The following C code shows that you may pass a special constant
 *  `Error_IGNORE` in place of an error block to a function requiring an error
 *  block. The purpose of this constant is to avoid allocating an error block on
 *  stack in the use case where the caller is not checking the error block after
 *  the call returns.
 *  In this example, the caller only checks the returned value but not the error
 *  block. If the function raises an error, the program will return to the
 *  caller, assuming `Error_policy` is set to `{@link #Policy UNWIND}`.
 *
 *  @p(code)
 *  #include <xdc/runtime/Error.h>
 *  #include <ti/sysbios/knl/Task.h>
 *
 *  tsk = Task_create(..., Error_IGNORE);
 *  if (tsk != NULL) {
 *      ...
 *  }
 *  @p
 *
 *  @p(html)
 *  <hr />
 *  @p
 *
 *  Example 5: The following C code shows how to write a function that
 *  is not part of a module and that takes an error block and raises
 *  the generic error type provided by the Error module. Note, if the
 *  caller passes `Error_ABORT` for the error block or if the error policy is
 *  `{@link #Policy TERMINATE}`, then the call to
 *  `{@link #raise Error_raise()}` will call
 *  `{@link System#abort xdc_runtime_System_abort()}` and never return.
 *
 *  @p(code)
 *  #include <xdc/runtime/Error.h>
 *
 *  Void myFunc(..., Error_Block *eb)
 *  {
 *      ...
 *
 *      if (...error condition detected...) {
 *          String  myErrorMsg = "my custom error message";
 *          Error_raise(eb, Error_E_generic, myErrorMsg, 0);
 *          ...add error handling code here...
 *          return;
 *      }
 *  }
 *  @p
 */
@DirectCall
@Template("./Error.xdt")

module Error {

    /*!
     *  ======== Policy ========
     *  Error handling policies
     *
     *  These constants are assigned to `{@link Error#policy Error.policy}` to
     *  control the flow of the program when an error is raised.
     *
     *  @field(TERMINATE) All raised errors are fatal. A call to
     *  `{@link #raise Error_raise}` will never return to the caller. The
     *  program calls `System_abort` instead.
     *
     *  @field(UNWIND) Errors are returned to the caller. A call to
     *  `{@link #raise Error_raise}` will return back to the caller.
     */
    enum Policy {
        TERMINATE,
        UNWIND
    };

    /*!
     *  ======== Desc ========
     *  Error descriptor
     *
     *  Each type of error is defined with an error descriptor. This
     *  structure groups common information about the errors of this type.
     *
     *  @field(msg) The error message using a `printf` style format string, 
     *              but limited to `{@link #NUMARGS}` arguments.
     *              This format string together with the two arguments passed
     *              to `Error_raise`` are used to create a human readable
     *              error message.
     *
     *  @field(code) A user assignable code, 0 by default. The user may
     *              optionally set this field during config to give the
     *              error a well-known numeric code. 
     */
    metaonly struct Desc {
        String msg;
        UInt16 code;
    };

    /*!
     *  ======== Id ========
     *  Error identifier
     *
     *  Each type of error raised is defined with a metaonly
     *  `{@link Error#Desc}`.  An `Error_Id` is a 32-bit target value that
     *  encodes the information in the `Desc`.  Target programs use
     *  `Error_Id` values to "raise" and check for specific errors.
     *
     *  @a(Warning) `{@link #Id}` values may vary among different
     *  configurations of an application.  For example, the addition of a
     *  new module to a program may result in a different absolute value for
     *  `{@link #E_generic}`.  If you need error numbers that remain
     *  invariant, use the user definable `{@link #Desc Desc.code}` field.
     */
    @Encoded typedef Desc Id;

    /*!
     *  ======== HookFxn ========
     *  Function called whenever an error is raised
     *
     *  The first parameter and only parameter passed to this function is a
     *  pointer to an `Error_Block`.  Even if the client passes a `NULL` error
     *  block pointer to `{@link #raise Error_raise}`, this parameter passed 
     *  to this "hook" function is always `non-NULL`.
     */
    typedef Void (*HookFxn)(Block *);

    /*!
     *  ======== NUMARGS ========
     *  Maximum number of arguments supported by an error
     */
    const Int NUMARGS = 2;

    /*!
     *  ======== Data ========
     *  Error args
     *
     *  The two arguments (arg1, arg2) passed to `{@link #raise}` are 
     *  stored in one of these arrays within the associated Error_Block.
     *  To access these arguments use `{@link #getData}` to obtain a 
     *  pointer to the Error_Block's Data array.
     *
     *  @see #getData
     */
    struct Data {
        IArg arg[NUMARGS];
    }

    /*!
     *  ======== Block ========
     *  Error block
     *
     *  An opaque structure used to store information about errors once raised.
     *  This structure must be initialized via `{@link #init Error_init()}`
     *  before being used for the first time.
     */
    @Opaque struct Block {
        UInt16      unused;     /* for backward compatibility (was code) */
        Data        data;       /* arguments passed to raise() */
        Id          id;         /* id passed to raise() */
        CString     msg;        /* msg associated with id */
        Types.Site  site;       /* info about Error_raise call site */
    };

    /*!
     *  ======== IGNORE ========
     *  Special Error_Block used when the caller does not want to check
     *  Error_Block
     *
     *  This constant should be used when the caller does not plan to check
     *  `Error_Block` after the call returns, but wants the call to return even
     *  in the case when an error is raised. `{@link #policy Error_policy}` is
     *  still in effect and the application will still terminate when an error
     *  is raised if `Error_policy` is not set to
     *  `{@link #Policy Error_UNWIND}`.
     */
    const Block IGNORE;

    /*!
     *  ======== ABORT ========
     *  Special Error_Block that terminates the application in case of an error
     *
     *  This constant has the same effect as passing `NULL` in place of an
     *  `Error_Block`. If an error is raised when `Error_ABORT` is passed, the
     *  application terminates regardless of `{@link #policy Error_policy}`.
     */
    const Block ABORT;

    /*!
     *  ======== PolicyFxn ========
     *  Error policy function signature
     *
     *  @a(Parameters)
     *  A policy function is passed the following parameters:
     *  @p(dlist)
     *      - `eb`
     *        A pointer to an `{@link #Block Error_Block}` structure to be
     *        initialized using the subsequent arguments.  This pointer may 
     *        be `NULL`.
     *      - `modId`
     *        The module ID of the module calling
     *        `{@link #raise Error_raise()}`
     *      - `fileName`
     *        A string naming the source file which made the call to
     *        `{@link #raise Error_raise()}`
     *      - `lineNumber`
     *        An integer line number within the file named above where
     *        the call `{@link #raise Error_raise()}` occured
     *      - `errId`
     *        The `{@link #Id Error_Id}` of the error being raised
     *      - `arg1` and `arg2`
     *        Two `IArg` arguments associated with the error being raised
     *  @p
     */
    typedef Void (*PolicyFxn)(Block *, Types.ModuleId, CString, Int, Id,
                              IArg, IArg);

    /*!
     *  ======== policyFxn ========
     *  Error handler function
     *
     *  This function is called to handle all raised errors but, unlike
     *  `{@link raiseHook}`, this function is responsible for completely
     *  handling the error (including calling `{@link #raiseHook raiseHook}`
     *  with an appropriately initialized `{@link #Block Error_Block}`, if
     *  `raiseHook` functionality is required).
     *
     *  The default value is a function which, in addition to calling
     *  `raiseHook` with an initialized `Error_Block` structure, logs the
     *  error using this module's logger.
     *
     *  Alternately, `{@link #policySpin}`, which simply loops
     *  indefinitely, can be used to minimize target footprint.  Note, this
     *  function does NOT call `raiseHook`, and also ignores
     *  `{@link Error#policy Error.policy}`.
     *
     *  The third implementation, `{@link #policyMin}` finds a middle ground
     *  between the two implementations above in terms of memory footprint and
     *  the available error information. Only the `{@link #Id Error_Id}` of the
     *  error being raised is available in the resulting `Error_Block`,
     *  `raiseHook` is not invoked, but `{@link Error#policy Error.policy}` is
     *  observed.
     */
    config PolicyFxn policyFxn = Error.policyDefault;

    /*!
     *  ======== E_generic ========
     *  Generic error
     *
     *  This error takes advantage of the $S specifier to allow for recursive
     *  formatting of the error message passed to error raise.
     *
     *  For example, the following is possible:
     *  @p(code)
     *  Error_raise(eb, Error_E_generic, "Error occurred, code: %d", code);
     *  @p
     *
     *  @see System#extendedFormats
     *  @see System#printf
     */
    config Id E_generic = {msg: "%$S"};

    /*!
     *  ======== E_memory ========
     *  Out of memory error
     *
     *  The first parameter must be the heap instance handle. The second
     *  parameter is the size of the object for which the allocation failed.
     */
    config Id E_memory = {msg: "out of memory: heap=0x%x, size=%u"}; 

    /*!
     *  ======== E_msgCode ========
     *  Generic error that displays a string and a numeric value
     */
    config Id E_msgCode = {msg: "%s 0x%x"}; 

    /*!
     *  ======== policy ========
     *  System-wide error handling policy
     *
     *  You can use this parameter to decide at the configuration time what
     *  happens when an error is raised. The program can either call
     *  `System_abort()` or return back to the caller. The implementations of
     *  `{@link Error#policyFxn Error.policyFxn}` should consider this
     *  parameter, but some implementations may not do so to save the memory
     *  footprint (`Error_policySpin`, for example).
     * 
     */
    config Policy policy = UNWIND;

    /*!
     *  ======== raiseHook ========
     *  The function to call whenever an error is raised
     *
     *  If set to a non-`null` value, the referenced function is always
     *  called when an error is raised, even if the `Error` policy is
     *  `{@link #Policy TERMINATE}`.  In rare cases, it is possible that a
     *  raised error does not trigger a call to `raiseHook`; see
     *  `{@link #maxDepth}`.
     *
     *  Regardless of the current policy in use, raising an error by
     *  calling `{@link #raise Error_raise}` will always invoke the
     *  error raise hook function assigned to the
     *  `{@link #raiseHook Error.raiseHook}` configuration parameter, if the
     *  default `{@link Error#policyFxn Error.policyFxn}` implementation is
     *  used.
     *
     *
     *  By default, this function is set to `{@link #print Error_print}`
     *  which causes the error to be formatted and output via
     *  `{@link xdc.runtime.System#aprintf System_printf}`.  Setting this
     *  configuration parameter to `null` indicates that no function hook
     *  should be called.
     *
     *  @see #maxDepth
     *  @see #HookFxn
     *  @see #print
     */
    config HookFxn raiseHook = Error.print;

    /*!
     *  ======== maxDepth ========
     *  Maximum number of concurrent calls to `{@link #raiseHook}`
     *
     *  To prevent errors that occur in the raiseHook function from
     *  causing an infinite recursion, the maximum number of concurrent
     *  calls to `{@link #raiseHook}` is limited by `Error_maxDepth`.  If
     *  the number of concurrent calls exceeds `Error_maxDepth`, the
     *  `raiseHook` function is not called.
     *
     *  In multi-threaded systems, errors raised by separate threads may
     *  be detected as recursive calls to `raiseHook`.  So, setting
     *  `Error.maxDepth` to a small value may - in rare instances - result in
     *  `errorHook` not being called for some raised errors.
     *
     *  If it is important that all raised errors trigger a call to the
     *  `raiseHook` function, set `Error.maxDepth` to an impossibly large
     *  number (0xffff) and either ensure that the raise hook never calls a
     *  function that can raise an error or add checks in `raiseHook` to
     *  protect against "double faults".
     */
    config UInt16 maxDepth = 16;

    /*!
     *  ======== check ========
     *  Return TRUE if an error was raised
     *
     *  @param(eb) pointer to an `Error_Block`, `Error_ABORT` or `Error_IGNORE`
     *
     *  @a(returns)
     *  If `eb` is non-`NULL` and `{@link #policy Error.policy} == UNWIND` and
     *  an error was raised on `eb`, this function returns `TRUE`.  Otherwise,
     *  it returns `FALSE`.
     */
    Bool check(Block *eb);

    /*!
     *  ======== getData ========
     *  Get an error's argument list
     *
     *  @param(eb)      non-`NULL` pointer to an `Error_Block`
     *
     *  @a(returns)
     *  `getData` returns an array of type `{@link #Data}` with
     *  `{@link #NUMARGS}` elements containing the arguments provided
     *  at the time the error was raised.
     *
     *  @see #raise
     */
    Data *getData(Block *eb);

    /*!
     *  ======== getCode ========
     *  Get an error's code
     *
     *  @param(eb) non-`NULL` pointer to an `Error_Block`
     *
     *  @a(returns)
     *  `getCode` returns the error code associated with this error block.
     *
     *  @see #raise
     *  @see #Desc
     */
    UInt16 getCode(Block *eb);

    /*!
     *  ======== getId ========
     *  Get an error's id
     *
     *  @param(eb) non-`NULL` pointer to an `Error_Block`
     *
     *  @a(Warning)
     *  `Error_Id` values may vary among different configurations
     *  of an application.  For example, the addition of a new module to a
     *  program may result in a different absolute value for
     *  `{@link #E_generic}`.  If you need error numbers that remain
     *  invariant, use the user definable `{@link #Desc Desc.code}` field.
     *
     *  @see #raise
     *  @see #Desc
     */
    Id getId(Block *eb);

    /*!
     *  ======== getMsg ========
     *  Get an error's "printf" format string
     *
     *  @param(eb) non-`NULL` pointer to an `Error_Block`
     *
     *  @see #raise
     *  @see #Desc
     */
    CString getMsg(Block *eb);

    /*!
     *  ======== getSite ========
     *  Get an error's call site info
     *
     *  @param(eb) non-`NULL` pointer to an `Error_Block`
     *
     *  @a(returns)
     *  `getSite` returns a pointer to an initialized
     *  `{@link Types#Site Types.Site}` structure.  However, in the
     *  event that the call site was compiled with `xdc_FILE` defined to
     *  be `NULL` (to minimize string space overhead) the `file`
     *  field may be set to `NULL`.
     *
     *  @see #raise
     *  @see #Desc
     */
    Types.Site *getSite(Block *eb);

    /*!
     *  ======== idToCode ========
     *  Extract the user's error code associated with an `Error_Id`
     *
     *  @param(id) `Error_Id` from which to extract the user defined
     *             code 
     *  @_nodoc
     */
    @Macro UInt16 idToCode(Id id);

    /*!
     *  ======== idToUid ========
     *  Extract the unique error id associated with an `Error_Id`
     *
     *  @param(id) `Error_Id` from which to extract the system unique
     *             id associated with the specified `Error_Id`
     *  @_nodoc
     */
    @Macro UInt16 idToUid(Id id);

    /*!
     *  ======== init ========
     *  Put an error block into its initial state
     *
     *  To ensure reliable error detection, clients must call `init` for
     *  an `Error_Block` prior to any use.
     *
     *  If the same Error Block is used multiple times, only the last error
     *  raised is retained.
     *
     *  @param(eb) pointer to an `Error_Block`, `Error_ABORT` or `Error_IGNORE`
     *
     *      If `eb` is `NULL` this function simply returns.
     */
    Void init(Block *eb);

    /*!
     *  ======== print ========
     *  Print error using System.printf()
     *
     *  This function prints the error using `System_printf()`.  The output
     *  is on a single line terminated with a new line character and has the
     *  following form:
     *  @p(code)
     *      <site>: <file>, line <line_num>: <err_msg>
     *  @p
     *  where `<site>` is the module that raised the error, `<file>` and
     *  `<line_num>` are the file and line number of the containing the call
     *  site of the `Error_raise()`, and `<err_msg>` is the error message
     *  rendered with the arguments associated with the error.
     *
     *  @param(eb) pointer to an `Error_Block`, `Error_ABORT` or `Error_IGNORE`
     *
     *      If `eb` is `Error_ABORT` or `Error_IGNORE`, this function simply
     *      returns with no output.
     *
     *  @a(Warning)
     *  This function is not protected by a gate and, as a result,
     *  if two threads call this method concurrently, the output of the two
     *  calls will be intermingled.  To prevent intermingled error output,
     *  you can either wrap all calls to this method with an appropriate
     *  `Gate_enter`/`Gate_leave` pair or simply ensure that only one
     *  thread in the system ever calls this method.
     */
    Void print(Block *eb);

    /*!
     *  ======== policyDefault ========
     *  Default implementation of the policyFxn
     *
     *  This function is the implementation which is plugged in by default to
     *  the `{@link #policyFxn}`. It processes the error and logs it before
     *  returning to the caller or aborting - depending on the error policy
     *  `{@link #policy}`.
     */
    Void policyDefault(Block *eb, Types.ModuleId mod, CString file, Int line,
        Id id, IArg arg1, IArg arg2);

    /*!
     *  ======== policyMin ========
     *  Implementation of the policyFxn with a smaller footprint
     *
     *  This function is a compromise between a debug-friendly
     *  `{@link #policyDefault}`, which offers more details about any raised
     *  errors, but requires a larger footprint, and `{@link #policySpin}`,
     *  which is small but does not display any debug information.
     *
     *  This function returns to the caller, unless `{@link #policy}` is set to
     *  `TERMINATE`, or the `Error_Block` passed to it is `NULL`. If it returns,
     *  the only information available in the returned `Error_Block` is the
     *  error ID.
     */
    Void policyMin(Block *eb, Types.ModuleId mod, CString file, Int line,
        Id id, IArg arg1, IArg arg2);

    /*!
     *  ======== policySpin ========
     *  Lightweight implementation of the policyFxn
     *
     *  This function is a lightweight alternative  which can be plugged in to
     *  the `{@link #policyFxn}`. It just loops infinitely.
     *
     *  @a(Warning)
     *  This function does not call `{@link #raiseHook}` and never returns to
     *  the caller.  As a result, ANY error raised by the application will cause
     *  it to indefinitly hang.
     */
    Void policySpin(Block *eb, Types.ModuleId mod, CString file, Int line,
        Id id, IArg arg1, IArg arg2);

    /*!
     *  ======== raise ========
     *  Raise an error
     *
     *  This function is used to raise an `Error` by writing call site,
     *  error ID, and error argument information into the `Error_Block`
     *  pointed to by `eb`.
     *
     *  If `Error_raise` is called more than once on an `Error_Block` object,
     *  the previous error information is overwritten; only the last error
     *  is retained in the `Error_Block` object.
     *
     *  In all cases, any configured `{@link #raiseHook Error.raiseHook}`
     *  function is called with a non-`NULL` pointer to a fully
     *  initialized `Error_Block` object.
     *
     *  @param(eb) pointer to an `Error_Block`, `Error_ABORT` or `Error_IGNORE`
     *
     *      If `eb` is `Error_ABORT` or
     *      `{@link #policy Error.policy} == TERMINATE`,
     *      this function does not return to the caller; after calling any
     *      configured `{@link #raiseHook}`, `System_abort` is called with the
     *      string `"xdc.runtime.Error.raise: terminating execution\n"`.
     *
     *  @param(id) the error to raise
     *
     *      This pointer identifies the class of error being raised; the error
     *      class indicates how to interpret any subsequent arguments passed to
     *      `{@link #raise}`.
     *
     *  @param(arg1) error's first argument
     *
     *      The argument interpreted by the first control character
     *      in the error message format string. It is ignored if not needed.
     *
     *  @param(arg2) error's second argument
     *
     *      The argument interpreted by the second control character
     *      in the error message format string. It is ignored if not needed.
     */
    @Macro Void raise(Block *eb, Id id, IArg arg1, IArg arg2);

    /*! @_nodoc */
    Void raiseX(Block *eb, Types.ModuleId mod, CString file, Int line,
        Id id, IArg arg1, IArg arg2);

    /*! @_nodoc EXPERIMENTAL */
    Void setX(Block *eb, Types.ModuleId mod, CString file, Int line,
        Id id, IArg arg1, IArg arg2);

internal:

    struct Module_State {
        UInt16      count;
    };

}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

