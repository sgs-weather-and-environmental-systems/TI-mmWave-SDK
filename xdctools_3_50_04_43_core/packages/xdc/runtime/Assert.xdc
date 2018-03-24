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
 *  ======== Assert.xdc ========
 */

/*!
 *  ======== Assert ========
 *  Runtime assertion manager
 *
 *  The `Assert` module provides configurable diagnostics to the program.
 *  Similar to the standard C `assert()` macro, `Assert` methods are
 *  interspersed with other code to add diagnostics to a program. Unlike
 *  the standard C assert support, the `Assert` module provides greater
 *  flexibility in managing the messages displayed, the message string
 *  space overhead, and the runtime handling of failures. In addition,
 *  because the `Assert` methods build atop the Diags module, you can
 *  precisely control which asserts remain in the final application, if any.
 *
 *  The `Assert` module works in conjunction with the `{@link Diags}` module.
 *  `Assert` statements are added to the code using the
 *  `{@link #isTrue Assert_isTrue()}` function. Execution of assert
 *  statements is controlled by the `{@link Diags#ASSERT}` and
 *  `{@link Diags#INTERNAL}` bits in a module's diagnostics mask. By default,
 *  all module's `Diags_ASSERT` bit is enabled and the `Diags_INTERNAL` bit
 *  is disabled.  See `{@link Types#Common$ Types.Common$}` for the
 *  declaration of the bits in the diagnostics mask and
 *  `{@link Defaults#common$ Default.common$}` for the default module settings.
 *
 *  Two types of asserts are supported: public asserts and internal asserts.
 *
 *  @p(blist)
 *  - Public asserts have an assert ID and are, by default, controlled
 *  by the `{@link Diags#ASSERT}` bit.
 *  - Internal asserts don't have an assert ID (other than NULL) and
 *  are active only when both the `{@link Diags#ASSERT}` and
 *  `{@link Diags#INTERNAL}` bits of the module's diagnostics mask are set.
 *  @p
 *
 *  `Assert` IDs are small integer values that index into a table of
 *  assertion descriptors. These descriptors hold an error message
 *  and a diagnostics mask that is used to enable and disable the
 *  assertion at runtime.
 *
 *  You can remap individual public asserts to different bits in the
 *  diagnostics mask, or can disable the assert altogether. This is
 *  done by setting the mask property of the assert ID. Setting the
 *  mask to 0 disables the assert. In all other cases, the `Diags.ASSERT`
 *  bit is OR'd together with the mask to define the controlling bits.
 *  For example, the module's diagnostics mask must have the `Diags.ASSERT`
 *  bit set and any other bit specified in the mask property of the
 *  assert ID in order to activate the assert.
 *
 *  @a(Examples)
 *  @p(html)
 *  <hr />
 *  @p
 *  Example 1: The following C code adds an assert to application code
 *  which is not in a module. This assert does not have an assert
 *  identifier (the second argument is NULL); this makes it an internal
 *  assert.
 *
 *  @p(code)
 *  // file.c
 *  #include <xdc/runtime/Assert.h>
 *
 *  Assert_isTrue(count > 0, NULL);
 *  @p
 *
 *  The following XDC configuration statements set both the ASSERT and
 *  INTERNAL bits in the diagnostics mask to enable the internal assert
 *  created in the previous C code. Since the C code is not in a module,
 *  you must set the bits in the diagnostics mask of the
 *  `{@link xdc.runtime.Main xdc.runtime.Main}` module. The Main module
 *  is used to control all `{@link Log}` and `Assert` statements that are
 *  not part of the implementation of a module; for example, top-level
 *  application code or any existing sources that simply call the `Log` or
 *  `Assert` methods.
 *
 *  @p(code)
 *  // program.cfg
 *  var Assert = xdc.useModule('xdc.runtime.Assert');
 *  var Diags = xdc.useModule('xdc.runtime.Diags');
 *  var Main = xdc.useModule('xdc.runtime.Main');
 *
 *  Main.common$.diags_ASSERT = Diags.ALWAYS_ON;
 *  Main.common$.diags_INTERNAL = Diags.ALWAYS_ON;
 *  @p
 *
 *  @p(html)
 *  <hr />
 *  @p
 *  Example 2: The following example shows how to use and configure an
 *  assert ID that is declared by a module. It adds that assert to the
 *  application's C source code, and configures the application to
 *  execute the assert.
 *
 *  This is part of the XDC file for the module that declares an `Assert` Id:
 *
 *  @p(code)
 *  // Mod.xdc
 *  import xdc.runtime.Assert;
 *  import xdc.runtime.Diags;
 *
 *  config Assert.Id A_nonZero = {
 *      msg: "A_nonZero: value must be non-zero"
 *  };
 *  @p
 *
 *  This is part of the C code for the application:
 *
 *  @p(code)
 *  // Mod.c
 *  #include <xdc/runtime/Assert.h>
 *
 *  Assert_isTrue(x != 0, Mod_A_nonZero);
 *  @p
 *
 *  This is part of the XDC configuration file for the application:
 *
 *  @p(code)
 *  // program.cfg
 *  var Diags = xdc.useModule('xdc.runtime.Diags');
 *  var Mod = xdc.useModule('my.pkg.Mod');
 *  Mod.common$.diags_ASSERT = Diags.ALWAYS_ON;
 *  @p
 *
 *  The Assert calls can also be completely removed by defining the symbol
 *  xdc_runtime_Assert_DISABLE_ALL. This can be done on the compile line, e.g.
 *  -Dxdc_runtime_Assert_DISABLE_ALL. This will completely remove the Assert
 *  statements from any code compiled with this flag, regardless of the
 *  application's configuration or your compiler's optimization settings.
 *
 *  It is also possible to remove all conditions from Assert calls. As explained
 *  above, Assert calls are executed only if certain bits in the module's
 *  Diags mask are set. However, if the symbol
 *  xdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT is defined, the module's Diags 
 *  mask is not queried at all, and all Assert calls are unconditionally
 *  executed.
 *  The symbol xdc_runtime_Assert_DISABLE_ALL has a precedence, and if it's
 *  set, no Assert calls are executed regardless of any definition of
 *  xdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT.
 */
@DirectCall
@CustomHeader

module Assert {

    /*!
     *  ======== Assert_Desc ========
     *  Assert descriptor
     *
     *  Each public assert is defined with an assert descriptor. This
     *  structure defines which bits in the module's diagnostics mask
     *  control this assert, and the message raised when the assert fails.
     *  The mask property is optional, it defaults to the
     *  `{@link Diags#ASSERT}` bit.
     *
     *  @field(mask)    Specifies which bits enable the assert.
     *  @field(msg)     The message printed when the assert fails.
     */
    metaonly struct Desc {
        Diags.Mask mask;
        String msg;
    };

    /*!
     *  ======== Assert_Id ========
     *  Assert identifier
     *
     *  Each metaonly assert descriptor is encoded into a target accessable
     *  assert Id type which can be passed to the `{@link #isTrue}` function.
     */
    @Encoded typedef Desc Id;

    /*!
     *  ======== E_assertFailed ========
     *  The `{@link Error#Id}` raised when an assertion violation is detected
     *
     *  When an assertion violation is triggered, an error is raised via
     *  `Error_raise()`.  `E_assert_Failed` is the `{@link Error#Id}` passed
     *  to `Error_raise()`.
     *  
     *  The first string argument (%s) will be either "", if the assertion Id
     *  is `NULL` (for internal asserts), or ": " (for public asserts).
     *  The second string argument (%s) is the
     *  `Assert.Desc.msg` string associated with the assertion Id; if the
     *  Id is `NULL`  (an internal assert) or if text is not loaded 
     *  (`!{@link Text#isLoaded}()`), this string is "".
     *
     *  @see #isTrue
     *  @see Error#Id
     */
    readonly config Error.Id E_assertFailed = {msg: "assertion failure%s%s"};

    /*!
     *  ======== Assert_isTrue ========
     *  Test an assertion
     *
     *  `Assert_isTrue()` statements may be conditionally enabled (disabled)
     *  on a per module basis by setting the calling module's
     *  `{@link IModule#$common $common.diags_ASSERT}` configuration
     *  parameter.  If
     *  the `Assert_isTrue()` statement is not in a module, the calling
     *  module is the `{@link Main}` module.  You must enable the
     *  `{@link Diags#ASSERT}` bit in the module's diagnostics mask for this
     *  call to be enabled.  If a `NULL` assert id is specified, then you
     *  must enable the `{@link Diags#INTERNAL}` in addition to the
     *  `ASSERT` bit.  
     *
     *  If the `Assert_isTrue()` statement is enabled and `expr` evaluates to
     *  false, the assert specified by `id` is raised; i.e., the
     *  `{@link #E_assertFailed}` error is raised with a `NULL`
     *  error block.  In other words, the standard `{@link Error#raise}`
     *  handling hooks will be run, `{@link System#abort()}` will be called,
     *  and control does not return to the caller.  The `id` may be `null`, in
     *  which case you will get a generic assert message.
     *
     *  @param(expr)    the expression which should evaluate to true
     *  @param(id)      identifies the assert being raised
     *
     *  @a(Examples)
     *  C Code
     *  @p(code)
     *  #include <xdc/runtime/Assert.h>
     *
     *  Assert_isTrue(count > 0, NULL);
     *  @p
     */
    @Macro Void isTrue(Bool expr, Id id);

internal:

    Void raise(Types.ModuleId mod, CString file, Int line, Id id);

}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

