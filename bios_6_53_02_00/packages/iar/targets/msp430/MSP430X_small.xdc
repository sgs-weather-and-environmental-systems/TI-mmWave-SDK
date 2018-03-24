/* 
 *  Copyright (c) 2014-2016 Texas Instruments Incorporated
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
 *  ======== MSP430X_small ========
 *  IAR MSP430X little endian, large code model, small data model target.
 */

metaonly module MSP430X_small inherits ITarget
{
    override readonly config String name             = "MSP430X_small";
    override readonly config String suffix           = "r430XS";
    override readonly config String isa              = "430X";    
    override readonly config xdc.bld.ITarget.Model model = {
        endian: "little",
        codeModel: "large",
        dataModel: "small",
        shortEnums: true
    };

    /*!
     *  ======== cc ========
     *  The command used to compile C/C++ source files into object files
     *
     *  Defaults:
     *  @p(dlist)
     *      -`-e`
     *          enable compiler extensions so it's possible to get segment
     *          start addresses in C, via:
     *          @p(code)
     *              #pragma segment = "CSTACK"
     *              isrStack = __segment_begin("CSTACK");
     *          @p
     *      -`--core=430X`
     *          MSP430X architecture     
     *      -`--data_model`
     *          Small data model for MSP430X architecture     
     *      -`--save_reg20`
     *          All 20 bits of registers are preserved in all interrupt functions    
     *  @p
     */
    override readonly config Command cc = {
        cmd: "icc430",
        opts: "-e --core=430X --data_model=small --save_reg20"
    };
   
    /*!
     *  ======== asm ========
     *  The command used to assembles assembly source files into object files
     *
     *  Defaults:
     *  @p(dlist)
     *      -`-v1`
     *          MSP430X architecture
     *      -`-D__SMALL_DATA_MODEL__`
     *          indicate that this is small model to assembly code; IAR does
     *          currently have any pre-defined macros for this purpose; we use
     *          this symbol because it is the same as that used by the TI
     *          compiler (so some degree of portability is possible).
     *  @p
     */
    override readonly config Command asm = {
        cmd: "a430",
        opts: "-v1 --data_model small --code_model large -D__SMALL_DATA_MODEL__ -DUSE_LARGE_CODE_MODEL=1"
    };

    /*!
     *  ======== profiles ========
     *  Standard options profiles for the IAR MSP430 tool-chain.
     */
    override config xdc.bld.ITarget.OptionSet profiles[string] = [
        ["debug", {
            compileOpts: {
                copts: "--debug --dlib_config $(rootDir)/lib/dlib/dl430xlsfn.h",
            },
            linkOpts: "$(rootDir)/lib/dlib/dl430xlsfn.r43",
        }],
        ["release", {
            compileOpts: {
                copts: "-Ohs --dlib_config $(rootDir)/lib/dlib/dl430xlsfn.h",
            },
            linkOpts: "$(rootDir)/lib/dlib/dl430xlsfn.r43",
        }],
        ["debug_full", {
            compileOpts: {
                copts: "--debug --dlib_config $(rootDir)/lib/dlib/dl430xlsff.h",
            },
            linkOpts: "$(rootDir)/lib/dlib/dl430xlsff.r43",
        }],
        ["release_full", {
            compileOpts: {
                copts: "-Ohs --dlib_config $(rootDir)/lib/dlib/dl430xlsff.h",
            },
            linkOpts: "$(rootDir)/lib/dlib/dl430xlsff.r43",
        }],
    ];

    override readonly config xdc.bld.ITarget.StdTypes stdTypes = {
        t_IArg          : { size: 4, align: 2 },
        t_Char          : { size: 1, align: 1 },
        t_Double        : { size: 4, align: 2 },
        t_Float         : { size: 4, align: 2 },
        t_Fxn           : { size: 4, align: 2 },
        t_Int           : { size: 2, align: 2 },
        t_Int8          : { size: 1, align: 1 },
        t_Int16         : { size: 2, align: 2 },
        t_Int32         : { size: 4, align: 2 },
        t_Long          : { size: 4, align: 2 },
        t_LDouble       : { size: 4, align: 2 },
        t_LLong         : { size: 8, align: 2 },
        t_Ptr           : { size: 2, align: 2 },
        t_Short         : { size: 2, align: 2 },
        t_Size          : { size: 2, align: 2 },
    };
}
/*
 *  @(#) iar.targets.msp430; 1, 0, 0,0; 11-8-2017 17:20:38; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

