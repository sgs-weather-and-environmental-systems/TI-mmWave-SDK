/* 
 *  Copyright (c) 2012 Texas Instruments and others.
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
 *  ======== ITarget ========
 *  A IAR extension to the base `xdc.bld.ITarget3` interface.
 */
@TargetHeader("xdc/bld/stddefs.xdt")
metaonly interface ITarget inherits xdc.bld.ITarget3 {

    override readonly config String rts = "iar.targets.msp430.rts";

    override config string stdInclude = "iar/targets/msp430/std.h";
    
    override config String platform = "ti.platforms.msp430:MSP430F5438:1";

    config string binDir = "$(rootDir)/bin/";

    /*!
     *  ======== ccOpts ========
     *  User configurable compiler options.
     *
     *  Defaults:
     *  @p(dlist)
     *      -`--silent`
     *          Silent operation
     *      -`--diag_suppress`
     *          Pa050 complains about Unix EOL characters
     *          Go005 complains about function inlining
     *  @p
     */
    override config Options ccOpts = {
        prefix: "--silent",
        suffix: "--diag_suppress=Pa050,Go005"
    };

    /*!
     *  ======== asmOpts ========
     *  User configurable assembler options.
     *
     *  Defaults:
     *  @p(dlist)
     *      -`-S`
     *          Silent operation
     *  @p
     */
    override config Options asmOpts = {
        prefix: "-S",
        suffix: ""
    };

    /*!
     *  ======== ar ========
     *  The command used to create an archive
     */
    override readonly config Command ar = {
        cmd: "xar",
        opts: ""
    };

    /*!
     *  ======== arOpts ========
     *  User configurable archiver options.
     */
    override config Options arOpts = {
        prefix: "",
        suffix: ""
    };

    /*!
     *  ======== xlib ========
     *  The command used to modify a library
     *
     *  Defaults:
     *  @p(dlist)
     *      -`-c`
     *        run command line
     *  @p
     */
    readonly config Command xlib = {
        cmd: "xlib",
        opts: "-c"
    };

    /*!
     *  ======== xlibOpts ========
     *  User configurable xlib options.
     *  
     *  Defaults:
     *  @p(dlist)
     *      -`MAKE-LIBRARY`
     *        changes a module to library type
     *  @p
     */
    config Options xlibOpts = {
        prefix: "",
        suffix: "\"MAKE-LIBRARY $@\""
    };

    /*!
     *  ======== lnk ========
     *  The command used to link executables.
     */
    override readonly config Command lnk = {
        cmd: "xlink",
        opts: ""
    };

    /*!
     *  ======== lnkOpts ========
     *  User configurable linker options.
     *
     *  Defaults:
     *  @p(dlist)
     *      -`-S`
     *          Silent operation
     *      -`-xens`
     *          Cross reference list generated in map file
     *      -`-l`
     *          Generates a map file
     *      -`-rt`
     *          Plugins in IAR debugger low level functions
     *      -`-e`
     *          Redirects function call to another function at link time
     *      -`-s`
     *          Program entry point
     *  @p
     */
    override config xdc.bld.ITarget2.Options lnkOpts = {
        prefix: "-S",
        suffix: "-xens -l $(XDCCFGDIR)/$@.map -rt -e_PrintfSmall=_Printf -e_ScanfSmall=_Scanf -s __program_start",
    };

    /*!
     *  ======== vers ========
     *  The command used to get the tool-chain to return a version number.
     */
    readonly config Command vers = {
        cmd: "icc430",
        opts: "-v"
    };

    /*!
     *  ======== extension ========
     *  The IAR assembly file extension recognised by this target.
     */
    override config Extension extensions[string] = [
        [".asm", {suf: ".asm", typ: "asm"}],
        [".c",   {suf: ".c",   typ: "c"  }],
        [".cpp", {suf: ".cpp", typ: "cpp"}],
        [".cxx", {suf: ".cxx", typ: "cpp"}],
        [".C",   {suf: ".C",   typ: "cpp"}],
        [".cc",  {suf: ".cc",  typ: "cpp"}],
        [".s43", {suf: ".s43", typ: "asm"}],
    ];

    override config String includeOpts = "";

    /*!
     *  ======== cmdPrefix ========
     *  Prefix to put in front of each command
     *
     *  This string is put in front of every Command before being passed to
     *  the shell for execution.  This string can be used to run the compiler
     *  in emulation environments.  
     */
    config String cmdPrefix = "";

    /*!
     *  ======== alignDirectiveSupported ========
     *  The compiler supports an align directive.
     */
    override readonly config Bool alignDirectiveSupported = true;

}
/*
 *  @(#) iar.targets.msp430; 1, 0, 0,0; 11-8-2017 17:20:36; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

