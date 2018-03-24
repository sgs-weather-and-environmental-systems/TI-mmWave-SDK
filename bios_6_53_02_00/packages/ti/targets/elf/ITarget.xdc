/* 
 *  Copyright (c) 2008-2015 Texas Instruments Incorporated
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
 *  ======== ITarget.xdc ========
 *
 */

/*!
 *  ======== ITarget ========
 *  An ELF extension to the `ti.targets.ITarget` interface.
 */
metaonly interface ITarget inherits ti.targets.ITarget {

    override readonly config string rts = "ti.targets.rts6000";

    override readonly config xdc.bld.ITarget2.Command ar = {
        cmd: "ar6x",
        opts: "rq"
    };

    override readonly config xdc.bld.ITarget2.Command lnk = {
        cmd: "cl6x",
        opts: "--abi=eabi -z"
    };

    override readonly config xdc.bld.ITarget2.Command vers = {
        cmd: "cl6x",
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
     *
     *  -mo places all functions into subsections
     *  --no_compress helps with compile time with no real difference in
     *  code size since the generated config.c is mostly data and small
     *  function stubs.
     */
    override config xdc.bld.ITarget2.Options ccConfigOpts = {
        prefix: "$(ccOpts.prefix) -mo",
        suffix: "$(ccOpts.suffix)"
    };

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
    ];

    final override readonly config string sectMap[string] = [
        [".text", "code"],
        [".ti.decompress", "code"],
        [".stack", "stack"],
        [".bss", "data"],
        [".cinit", "data"],
        [".pinit", "data"],
        [".init_array", "data"],
        [".const", "data"],
        [".data", "data"],
        [".rodata", "data"],
        [".neardata", "data"],
        [".fardata", "data"],
        [".switch", "data"],
        [".sysmem", "data"],
        [".far", "data"],
        [".args", "data"],
        [".cio", "data"],
        [".ti.handler_table", "data"],
        [".c6xabi.exidx", "data"],
        [".c6xabi.extab", "data"],
    ];

    override readonly config Bool splitMap[string] = [
        [".text", true],
        [".pinit", true],
        [".const", true],
        [".data", true],
        [".fardata", true],
        [".switch", true],
        [".far", true],
        [".args", true],
        [".cio", true],
        [".c6xabi.extab", true]
    ];

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

    override config String includeOpts = "-I$(rootDir)/include";

    override config String stdInclude = "ti/targets/elf/std.h";

    override config String binaryParser = "ti.targets.omf.elf.Elf32";
}
/*
 *  @(#) ti.targets.elf; 1, 0, 0,0; 11-8-2017 17:21:11; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

