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
/*
 *  ======== C71.xdc ========
 */

/*!
 *  @_nodoc
 *  ======== C71 ========
 *  TI C71 default runtime model (little endian)
 */
metaonly module C71 inherits ti.targets.elf.ITarget {
    override readonly config string name                 = "C71";
    override readonly config string suffix               = "e71";
    override readonly config string isa                  = "71";
    override readonly config xdc.bld.ITarget.Model model = {
        endian: "little"
    };

    override readonly config string rts = "ti.targets.nda.rts7000";
/*    override config string platform   = "ti.platforms.sim6xxx:TMS320CDM420"; */

    /*
     *  ======== compatibleSuffixes ========
     */
/*    override config String compatibleSuffixes[] = ["64", "62"]; */

    override readonly config xdc.bld.ITarget2.Command ar = {
        cmd: "ar7x",
        opts: "rq"
    };

    override readonly config xdc.bld.ITarget2.Command cc = {
        cmd: "cl7x -c",
        opts: "-mv7100 --abi=eabi"
    };

    override readonly config xdc.bld.ITarget2.Command vers = {
        cmd: "cl7x",
        opts: "--compiler_revision"
    };

    override readonly config xdc.bld.ITarget2.Command asm = {
        cmd: "cl7x -c",
        opts: "-mv7100 --abi=eabi"
    };

    override readonly config xdc.bld.ITarget2.Command lnk = {
        cmd: "cl7x",
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
     */
    override config xdc.bld.ITarget2.Options ccConfigOpts = {
        prefix: "$(ccOpts.prefix) -mo",
        suffix: "$(ccOpts.suffix)"
    };

    override config string includeOpts = "-I$(rootDir)/include";

/*
    final override readonly config string sectMap[string] = [
        [".text", "code"],
        [".stack", "stack"],
        [".bss", "data"],
        [".cinit", "data"],
        [".pinit", "data"],
        [".const", "data"],
        [".data", "data"],
        [".switch", "data"],
        [".sysmem", "data"],
        [".far", "data"],
        [".args", "data"],
        [".cio", "data"],
    ];

    final override readonly config Bool splitMap[string] = [
        [".text", true],
        [".const", true],
        [".data", true],
        [".switch", true],
        [".far", true],
        [".args", true],
        [".cio", true]
    ];
*/

    override readonly config xdc.bld.ITarget.StdTypes stdTypes = {
        t_IArg          : { size: 4, align: 4 },
        t_Char          : { size: 1, align: 1 },
        t_Double        : { size: 8, align: 8 },
        t_Float         : { size: 4, align: 4 },
        t_Fxn           : { size: 8, align: 8 },
        t_Int           : { size: 4, align: 4 },
        t_Int8          : { size: 1, align: 1 },
        t_Int16         : { size: 2, align: 2 },
        t_Int32         : { size: 4, align: 4 },
        t_Int40         : { size: 8, align: 8 },
        t_Int64         : { size: 8, align: 8 },
        t_Long          : { size: 8, align: 8 },
        t_LDouble       : { size: 8, align: 8 },
        t_LLong         : { size: 8, align: 8 },
        t_Ptr           : { size: 8, align: 8 },
        t_Short         : { size: 2, align: 2 },
        t_Size          : { size: 8, align: 8 },
    };

    override config String stdInclude = "ti/targets/elf/nda/std.h";

    override readonly config Int bitsPerChar = 8;
}
/*
 *  @(#) ti.targets.elf.nda; 1, 0, 0,0; 11-8-2017 17:21:16; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

