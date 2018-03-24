/* 
 *  Copyright (c) 2008-2016 Texas Instruments Incorporated
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
 *  ======== IArm.xdc ========
 *  Common settings for all Arm targets
 */
metaonly interface IArm inherits ti.targets.ITarget {

    override config String stdInclude = "ti/targets/arm/elf/std.h";

    override config string platform   = "ti.platforms.sim470xx";

    override config string includeOpts =
        "-I$(rootDir)/include ";

    override readonly config xdc.bld.ITarget.Model model = {
        shortEnums: true,
    };

    override readonly config xdc.bld.ITarget2.Command ar = {
        cmd:  "armar",
        opts: "rq"
    };

    override readonly config xdc.bld.ITarget2.Command vers = {
        cmd:  "armcl",
        opts: "--compiler_revision"
    };

    override readonly config xdc.bld.ITarget2.Command lnk = {
        cmd:  "armcl",
        opts: "-z"
    };

    /*!
     *  ======== ccOpts ========
     *  User configurable compiler options.
     *
     *  Defaults:
     *  @p(dlist)
     *      -`-qq`
     *          super quiet mode
     *      -`-pdsw225`
     *          generate a warning for implicitly declared functions; i.e.,
     *          functions without prototypes
     */
    override config xdc.bld.ITarget2.Options ccOpts = {
        prefix: "-qq -pdsw225",
        suffix: ""
    };

    /*!
     *  ======== ccConfigOpts ========
     *  User configurable compiler options for the generated config C file.
     *      -`--fp_mode=strict`
     *          disable conversion of double-precision computations to
     *          single-precision computations when the result is assigned to
     *          a single-precision variable.
     */
    override config xdc.bld.ITarget2.Options ccConfigOpts = {
        prefix: "$(ccOpts.prefix) -ms --fp_mode=strict",
        suffix: "$(ccOpts.suffix)"
    };

    /*!
     *  ======== asmOpts ========
     *  User configurable assembler options.
     *
     *  Defaults:
     *  @p(dlist)
     *      -`-qq`
     *          super quiet mode
     */
    override config xdc.bld.ITarget2.Options asmOpts = {
        prefix: "-qq",
        suffix: ""
    };

    /*!
     *  ======== profiles ========
     *  Standard options profiles for the TI tool-chain.
     */
    override config xdc.bld.ITarget.OptionSet profiles[string] = [
        ["debug", {
            compileOpts: {
                copts: "--symdebug:dwarf",
                defs:  "-D_DEBUG_=1",
            }
        }],
        ["release", {
            compileOpts: {
                copts: "-O2",
            },
        }],
        ["profile", {
            compileOpts: {
                copts: "--symdebug:dwarf",
            },
        }],
        ["coverage", {
            compileOpts: {
                copts: "--symdebug:dwarf",
            },
        }],
    ];

    final override readonly config string sectMap[string] = [
        [".text", "code"],
        [".stack", "stack"],
        [".bss", "data"],
        [".binit", "code"],
        [".cinit", "code"],
        [".init_array", "code"],
        [".const", "code"],
        [".data", "data"],
        [".rodata", "data"],
        [".neardata", "data"],
        [".fardata", "data"],
        [".switch", "data"],
        [".sysmem", "data"],
        [".far", "data"],
        [".args", "data"],
        [".cio", "data"],
        [".ARM.exidx", "data"],
        [".ARM.extab", "data"]
    ];

    override readonly config Bool splitMap[string] = [
        [".text", true],
        [".const", true],
        [".data", true],
        [".fardata", true],
        [".switch", true],
        [".far", true],
        [".args", true],
        [".cio", true],
        [".ARM.extab", true]
    ];

    override readonly config Int bitsPerChar = 8;

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
        t_Int64         : { size: 8, align: 8 },
        t_Long          : { size: 4, align: 4 },
        t_LDouble       : { size: 8, align: 8 },
        t_LLong         : { size: 8, align: 8 },
        t_Ptr           : { size: 4, align: 4 },
        t_Short         : { size: 2, align: 2 },
        t_Size          : { size: 4, align: 4 },
    };

    override config String binaryParser = "ti.targets.omf.elf.Elf32";
}
/*
 *  @(#) ti.targets.arm.elf; 1, 0, 0,0; 11-8-2017 17:20:58; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

