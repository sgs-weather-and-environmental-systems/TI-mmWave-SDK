/* 
 *  Copyright (c) 2012-2015 Texas Instruments Incorporated
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */
/*
 *  ======== IARP32.xdc ========
 *
 */

/*!
 *  ======== IARP32 ========
 *  TI IARP32 interface (little endian)
 */
metaonly interface IARP32 inherits ti.targets.ITarget {
    override readonly config string isa             = "arp32";

    override readonly config string rts = "ti.targets.arp32.rts";
    override config string platform     = "ti.platforms.simARP32";

    override readonly config xdc.bld.ITarget2.Command ar = {
        cmd: "ar-arp32",
        opts: "rq"
    };

    override readonly config xdc.bld.ITarget2.Command lnk = {
        cmd: "cl-arp32",
        opts: "-z"
    };

    override readonly config xdc.bld.ITarget2.Command vers = {
        cmd: "cl-arp32",
        opts: "--compiler_revision"
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
     */
    override config xdc.bld.ITarget2.Options ccConfigOpts = {
        prefix: "$(ccOpts.prefix)",
        suffix: "$(ccOpts.suffix)"
    };

    override config string includeOpts = "-I$(rootDir)/include";

    final override readonly config string sectMap[string] = [
        [".text", "code"],
        [".stack", "stack"],
        [".bss", "data"],
        [".cinit", "data"],
        [".init_array", "data"],
        [".const", "data"],
        [".data", "data"],
        [".switch", "data"],
        [".sysmem", "data"],
        [".far", "data"],
        [".args", "data"],
        [".cio", "data"],
        [".fardata", "data"],
        [".rodata", "data"],
    ];

    final override readonly config Bool splitMap[string] = [
        [".text", true],
        [".switch", true],
        [".cio", true],
    ];

    override readonly config Int bitsPerChar = 8;

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
        }]
    ];

    override readonly config xdc.bld.ITarget.StdTypes stdTypes = {
        t_IArg          : { size: 4, align: 4 },
        t_Char          : { size: 1, align: 1 },
        t_Double        : { size: 8, align: 4 },
        t_Float         : { size: 4, align: 4 },
        t_Fxn           : { size: 4, align: 4 },
        t_Int           : { size: 4, align: 4 },
        t_Int8          : { size: 1, align: 1 },
        t_Int16         : { size: 2, align: 2 },
        t_Int32         : { size: 4, align: 4 },
        t_Int64         : { size: 8, align: 4 },
        t_Long          : { size: 4, align: 4 },
        t_LDouble       : { size: 8, align: 4 },
        t_LLong         : { size: 8, align: 4 },
        t_Ptr           : { size: 4, align: 4 },
        t_Short         : { size: 2, align: 2 },
        t_Size          : { size: 4, align: 4 },
    };

    override config String stdInclude = "ti/targets/arp32/elf/std.h";

    override config String binaryParser = "ti.targets.omf.elf.Elf32";
}
/*
 *  @(#) ti.targets.arp32.elf; 1, 0, 0,0; 11-8-2017 17:21:04; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

