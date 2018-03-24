/* 
 *  Copyright (c) 2013 Texas Instruments and others.
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
 *  IAR ARM extension to the base `xdc.bld.ITarget3` interface.
 */
@TargetHeader("xdc/bld/stddefs.xdt")
metaonly interface ITarget inherits xdc.bld.ITarget3 {

    override readonly config String rts = "iar.targets.arm.rts";

    override config string stdInclude = "iar/targets/arm/std.h";

    /*
     *  ======== binDir ========
     *  Code gen tools bin directory path
     */
    config string binDir = "$(rootDir)/bin/";

    /*!
     *  ======== model ========
     *  Little endian, thumb2 model
     */
    override readonly config xdc.bld.ITarget.Model model = {
        endian: "little",
        codeModel: "thumb2",
        shortEnums: true
    };

    /*!
     *  ======== ccOpts ========
     *  User configurable compiler options.
     */
    override config Options ccOpts = {
        prefix: "--silent",
        suffix: ""
    };

    /*!
     *  ======== asmOpts ========
     *  User configurable assembler options.
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
        cmd: "iarchive",
        opts: ""
    };

    /*!
     *  ======== arOpts ========
     *  User configurable archiver options.
     */
    override config Options arOpts = {
        prefix: "--silent",
        suffix: ""
    };

    /*!
     *  ======== lnkOpts ========
     *  User configurable linker options.
     */
    override config xdc.bld.ITarget2.Options lnkOpts = {
        prefix: "--silent",
        suffix: "--map $(XDCCFGDIR)/$@.map  --redirect _Printf=_PrintfSmall --redirect _Scanf=_ScanfSmall ",
    };

    /*!
     *  ======== vers ========
     *  The command used to get the tool-chain to return a version number.
     */
    readonly config Command vers = {
        cmd: "iccarm",
        opts: "-v"
    };

    /*!
     *  ======== extension ========
     *  The IAR assembly file extension recognised by this target.
     */
    override config Extension extensions[string] = [
        [".asm",  {suf: ".asm", typ: "asm"}],
        [".c",    {suf: ".c",   typ: "c"  }],
        [".cpp",  {suf: ".cpp", typ: "cpp"}],
        [".cxx",  {suf: ".cxx", typ: "cpp"}],
        [".C",    {suf: ".C",   typ: "cpp"}],
        [".cc",   {suf: ".cc",  typ: "cpp"}],
        [".s",    {suf: ".s",   typ: "asm"}],
        [".sv7M", {suf: ".sv7M",typ: "asm"}],
    ];

    /*!
     *  ======== includeOpts ========
     *  Additional user configurable target-specific include path options
     */
    override config String includeOpts = "";

    /*!
     *  ======== cmdPrefix ========
     *  Prefix to put in front of each command
     *
     *  This string is put in front of every Command before being passed to
     *  the shell for execution.  This string can be used to run the compiler
     *  in emulation environments. 
     *
     *  LC_ALL=C must be set for code gen to run on SUSE
     */
    config String cmdPrefix = "LC_ALL=C ";

    /*!
     *  ======== alignDirectiveSupported ========
     *  The compiler supports an align directive.
     */
    override readonly config Bool alignDirectiveSupported = true;

    /*!
     *  ======== stdTypes  ========
     *  Size and alignment for standard base types
     */
    override readonly config xdc.bld.ITarget.StdTypes stdTypes = {
        t_IArg          : { size: 4, align: 4 },
        t_Char          : { size: 1, align: 1 },
        t_Double        : { size: 8, align: 8 },
        t_Float         : { size: 4, align: 4 },
        t_Fxn           : { size: 4, align: 4 },
        t_Int           : { size: 4, align: 4 },
        t_Int8          : { size: 1, align: 1 },
        t_Int16         : { size: 2, align: 2 },
        t_Int32         : { size: 4, align: 4 },
        t_Long          : { size: 4, align: 4 },
        t_LDouble       : { size: 8, align: 8 },
        t_LLong         : { size: 8, align: 8 },
        t_Ptr           : { size: 4, align: 4 },
        t_Short         : { size: 2, align: 2 },
        t_Size          : { size: 4, align: 4 },
        t_Int64         : { size: 8, align: 8 },
    };

    /*!
     *  ======== profiles ========
     *  Standard options profiles.
     */
    override config xdc.bld.ITarget.OptionSet profiles[string] = [
        ["debug", {
            compileOpts: {
                copts: "--debug --dlib_config $(rootDir)/inc/c/DLib_Config_Normal.h",
            },
            linkOpts: "--semihosting=iar_breakpoint",
        }],
        ["release", {
            compileOpts: {
                copts: "-Ohs --dlib_config $(rootDir)/inc/c/DLib_Config_Normal.h",
            },
            linkOpts: "--semihosting=iar_breakpoint",
        }],
        ["debug_full", {
            compileOpts: {
                copts: "--debug --dlib_config $(rootDir)/inc/c/DLib_Config_Full.h",
            },
            linkOpts: "--semihosting=iar_breakpoint",
        }],
        ["release_full", {
            compileOpts: {
                copts: "-Ohs --dlib_config $(rootDir)/inc/c/DLib_Config_Full.h",
            },
            linkOpts: "--semihosting=iar_breakpoint",
        }],
    ];

    override config String binaryParser = "ti.targets.omf.elf.Elf32";
}
/*
 *  @(#) iar.targets.arm; 1, 0, 0,0; 11-8-2017 17:20:29; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

