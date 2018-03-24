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

/*!
 *  ======== MSP430.xdc ========
 *  ELF MSP430 small code, small data model, little endian
 *
 *  This target corresponds to the TI default runtime model for MSP430 devices.
 */
metaonly module MSP430 inherits ti.targets.ITarget {
    override readonly config string name    = "MSP430";
    override readonly config string suffix  = "e430";
    override readonly config string isa     = "430";
    override readonly config string rts     = "ti.targets.msp430.rts430";
    override readonly config xdc.bld.ITarget.Model model = {
        endian: "little",
        codeModel: "small",
        dataModel: "small"
    };

    override readonly config string stdInclude = "ti/targets/msp430/elf/std.h";

    override readonly config ti.targets.ITarget.Command ar = {
        cmd:  "ar430",
        opts: "rq"
    };

    override readonly config ti.targets.ITarget.Command cc = {
        cmd:  "cl430 --abi=eabi -c",
        opts: " -vmsp"
    };

    override readonly config ti.targets.ITarget.Command vers = {
        cmd:  "cl430",
        opts: "--compiler_revision"
    };

    override readonly config ti.targets.ITarget.Command asm = {
        cmd:  "cl430 --abi=eabi -c",
        opts: " -vmsp"
    };

    override readonly config ti.targets.ITarget.Command lnk = {
        cmd:  "cl430",
        opts: "-z"
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
    override config ti.targets.ITarget.Options asmOpts = {
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
    override config ti.targets.ITarget.Options ccOpts = {
        prefix: "-qq -pdsw225",
        suffix: ""
    };

    /*!
     *  ======== ccConfigOpts ========
     *  User configurable compiler options for the generated config C file.
     */
    override config ti.targets.ITarget.Options ccConfigOpts = {
        prefix: "$(ccOpts.prefix)",
        suffix: "$(ccOpts.suffix)"
    };

    /*!
     *  ======== profiles ========
     *  Standard options profiles for the TI tool-chain.
     */
    override config xdc.bld.ITarget.OptionSet profiles[string] = [
        ["debug", {
            compileOpts: {
                copts: "-g",
                defs:  "-D_DEBUG_=1",
            }
        }],
        ["release", {
            compileOpts: {
                copts: "-O2 -g --optimize_with_debug",
            },
        }],
        ["profile", {
            compileOpts: {
                copts: "-g",
            },
        }],
        ["coverage", {
            compileOpts: {
                copts: "-g",
            },
        }],
    ];

    override config string includeOpts = "-I$(rootDir)/include ";

    final override readonly config string sectMap[string] = [
        [".text", "code"],
        [".cinit", "code"],
        [".const", "code"],

        [".init_array", "data"],
        [".bss", "data"],
        [".data", "data"],
        [".sysmem", "data"],
        [".stack", "stack"],
        [".args", "data"],
        [".cio", "data"],
        [".reset", "data"],
        [".mspabi.extab", "code"],
        [".mspabi.exidx", "code"]
    ];

    final override readonly config Bool splitMap[string] = [
        [".text", true],
        [".const", true],
        [".data", true],
        [".mspabi.extab", true],
        [".args", true],
        [".cio", true]
    ];

    override readonly config xdc.bld.ITarget.StdTypes stdTypes = {
        t_IArg          : { size: 2, align: 2 },
        t_Char          : { size: 1, align: 1 },
        t_Double        : { size: 8, align: 2 },
        t_Float         : { size: 4, align: 2 },
        t_Fxn           : { size: 2, align: 2 },
        t_Int           : { size: 2, align: 2 },
        t_Int8          : { size: 1, align: 1 },
        t_Int16         : { size: 2, align: 2 },
        t_Int32         : { size: 4, align: 2 },
        t_Long          : { size: 4, align: 2 },
        t_LDouble       : { size: 8, align: 2 },
        t_LLong         : { size: 8, align: 2 },
        t_Ptr           : { size: 2, align: 2 },
        t_Short         : { size: 2, align: 2 },
        t_Size          : { size: 2, align: 2 },
    };

    override config String binaryParser = "ti.targets.omf.elf.Elf32";
};
/*
 *  @(#) ti.targets.msp430.elf; 1, 0, 0,0; 11-8-2017 17:21:27; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

