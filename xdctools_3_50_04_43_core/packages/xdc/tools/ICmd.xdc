/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * */

/*!
 *  ======== ICmd ========
 *  Generic xdc-script (xs) command
 *
 *  Modules that implement this interface can serve as "commands" that
 *  can be executed from the command line (via `xs`) or from within
 *  XDCscript scripts (without having to fork a separate process to run
 *  `xs`).
 *
 *  @a(Command Line Example)
 *  The following example runs the `xdc.tools.path` tool from the command 
 *  line to get an array of names of all packages below the current
 *  working directory (".").
 *  @p(code)
 *      xs xdc.tools.path -n -a -PR .
 *  @p
 *  
 *  @a(XDCscript Example)
 *  The following example runs the `xdc.tools.path` tool from within
 *  a script to get an array of names of all packages below the current
 *  working directory (".").
 *  @p(code)
 *      var Main = xdc.module('xdc.tools.path.Main');
 *      var result = Main.exec(["-n", "-a", "-PR", "."]);
 *  @p
 */
metaonly interface ICmd {

    //! Usage for this command
    config String usage[] = [];

    /*!
     *  ======== main ========
     *  `xs` shell entry point
     *
     *  This function
     *  @p(blist)
     *   - creates a no-arg instance, `inst`, of the module inheriting
     *     this interface;
     *   - parses command line arguments placing all options in the config
     *     params of the inheriting module;
     *   - creates a `{@link xdc.tools.Cmdr}` instance, `cmdr`;
     *   - calls `{@link #run inst.run()}` with the `cmdr` and any command
     *     line command line arguments not parsed as options; and
     *   - outputs the return result from `inst.run()`
     *   @p
     */
    final function main(args);

    /*!
     *  ======== exec ========
     *  `xs` script entry point
     *
     *  This function is called from within other XDCscript scripts and
     *  performs the same operations as `{@link #main()}` except that,
     *  rather than output the return value of `inst.run()`, this value
     *  is simply returned to the caller of `exec()`.
     */
    final function exec(args);

instance:

    /*!
     *  ======== run ========
     *  Underlying implementation of the command
     *
     *  Since this method is used to support both command line tools and
     *  other XDCscript scripts, it is important to avoid explicit
     *  termination of the JVM via `java.lang.System.exit()`; doing so
     *  precludes callers from handling failures.
     *
     *  Implementations should instead call
     *  @p(blist)
     *  - `{@link xdc.tools.Cmdr#error cmdr.error()}` when encountering a
     *     fatal error.
     *  - `{@link xdc.tools.Cmdr#warning cmdr.warning()}` when encountering a
     *     non-fatal error.
     *  - `{@link xdc.tools.Cmdr#info cmdr.info()}` when simply generating
     *     an informative message.
     *  @p
     */
    Any run(Cmdr.Instance cmdr, String args[]);
}
/*
 *  @(#) xdc.tools; 1, 0, 0,0; 11-8-2017 17:13:28; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

