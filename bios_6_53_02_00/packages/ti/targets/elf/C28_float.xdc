/* 
 *  Copyright (c) 2008-2017 Texas Instruments Incorporated
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
 *  ======== C28_float.xdc ========
 */

/*!
 *  @_nodoc
 *  ======== C28_float ========
 *  TI C28 large model little endian with floating point support (fpu32) (ELF)
 */
metaonly module C28_float inherits ti.targets.ITarget {
    override readonly config string name                = "C28_float";
    override readonly config string suffix              = "e28FP";
    override readonly config string isa                 = "28FP";
    override readonly config xdc.bld.ITarget.Model model = {
        dataModel: "large",
        endian: "little"
    };
    override readonly config xdc.bld.ITarget.Module base = ti.targets.C28_float;

    override readonly config string rts                 = "ti.targets.rts2800";

    /*
     *  ======== compatibleSuffixes ========
     */
    override config String compatibleSuffixes[] = ["e28L"];

    final override readonly config Bool alignDirectiveSupported = false;

    /*!
     *  ======== cc ========
     *  Define compiler executable
     *
     *  Options:
     *  @p(dlist)
     *      -`-c`
     *          no linking
     *      -`-v28`
     *          compile for c28x.
     *      -`-ml`
     *          use large memory model
     *      -`-DLARGE_MODEL=1`
     *          required to use va_arg in large model
     *      -`--float_support=fpu32`
     *          Enable FPU
     */
    override readonly config xdc.bld.ITarget2.Command cc = {
        cmd: "cl2000 -c",
/*
        opts: "--preproc_with_comment -v28 -DLARGE_MODEL=1 -ml --float_support=fpu32 --abi=eabi"
        opts: "-ppc -v28 -DLARGE_MODEL=1 -ml --float_support=fpu32 --abi=eabi"
        opts: "-v28 -DLARGE_MODEL=1 -ml --float_support=fpu32 --abi=eabi"
*/
        opts: "-v28 -DLARGE_MODEL=1 -ml --float_support=fpu32 --abi=eabi"
    };

    /*!
     *  ======== asm ========
     *  Define assembler executable
     *
     *  Options:
     *  @p(dlist)
     *      -`-c`
     *          no linking
     *      -`-v28`
     *          compile for c28x.
     *      -`-ml`
     *          use large memory model
     *      -`-DLARGE_MODEL=1`
     *          because compiler and BIOS are broken; asembler
     *          defines __LARGE_MODEL but BIOS uses LARGE_MODEL
     *      -`--float_support=fpu32`
     *          Enable FPU
     */
    override readonly config xdc.bld.ITarget2.Command asm = {
        cmd: "cl2000 -c",
/*
        opts: "--preproc_with_comment -v28 -ml -DLARGE_MODEL=1 --float_support=fpu32 --abi=eabi"
        opts: "-ppc -v28 -ml -DLARGE_MODEL=1 --float_support=fpu32 --abi=eabi"
        opts: "-v28 -ml -DLARGE_MODEL=1 --float_support=fpu32 --abi=eabi"
*/
        opts: "-v28 -ml -DLARGE_MODEL=1 --float_support=fpu32 --abi=eabi"
    };

    /*!
     *  ======== lnk ========
     *  Define linker executable
     */
    override readonly config xdc.bld.ITarget2.Command lnk = {
        cmd: "cl2000",
        opts: "--abi=eabi -z"
    };

    /*!
     *  ======== lnkOpts ========
     *  Linker options
     *
     *  Options:
     *  @p(dlist)
     *      -`-q`
     *          Quite run
     *      -`-u`
     *          Place unresolved external symbol into symbol table
     *      -`-c`
     *          ROM autoinitialization model
     *      -`-m`
     *          create a map file
     *      -`-l`
     *          archive library file as linker input
     */
    override config xdc.bld.ITarget2.Options lnkOpts = {
        prefix: "-q -u _c_int00",
        suffix: "-w -c -m $(XDCCFGDIR)/$@.map -l $(rootDir)/lib/libc.a"
    };

/*
    override readonly config xdc.bld.ITarget2.Command lnk =
        ti.targets.C28_float.lnk;
*/

    override readonly config xdc.bld.ITarget2.Command vers =
        ti.targets.C28_float.vers;

    override readonly config xdc.bld.ITarget2.Command ar =
        ti.targets.C28_float.ar;

    final override readonly config string sectMap[string] = [
        [".text", "code"],
        [".switch", "data"],
        [".data", "data"],
        [".rodata", "data"],
        [".neardata", "data"],
        [".fardata", "data"],
        [".far", "data"],
        [".cinit", "data"],
        [".bss", "data"],
        [".const", "data"],
        [".stack", "stack"],
        [".sysmem", "data"],
        [".init_array", "data"],
        [".args", "data"],
        [".bss:.cio", "data"],
        [".c28xabi.exidx", "data"],
        [".c28xabi.extab", "data"],
    ];

    final override readonly config Bool splitMap[string] =
        ti.targets.C28_float.splitMap;

    override readonly config xdc.bld.ITarget.StdTypes stdTypes = {
        t_IArg          : { size: 2, align: 2 },
        t_Char          : { size: 1, align: 1 },
        t_Double        : { size: 4, align: 4 },
        t_Float         : { size: 2, align: 2 },
        t_Fxn           : { size: 2, align: 2 }, /* far */
        t_Int           : { size: 1, align: 1 },
        t_Int8          : { size: 1, align: 1 },
        t_Int16         : { size: 1, align: 1 },
        t_Int32         : { size: 2, align: 2 },
        t_Int64         : { size: 4, align: 2 },
        t_Long          : { size: 2, align: 2 },
        t_LDouble       : { size: 2, align: 2 },
        t_LLong         : { size: 4, align: 2 },
        t_Ptr           : { size: 2, align: 2 },
        t_Short         : { size: 1, align: 1 },
        t_Size          : { size: 2, align: 2 },
    };

    override config String includeOpts = "-I$(rootDir)/include";

    override config String stdInclude = "ti/targets/elf/std.h";

    override config String binaryParser = "ti.targets.omf.elf.Elf32";

    override readonly config Int bitsPerChar =
        ti.targets.C28_float.bitsPerChar;
}
/*
 *  @(#) ti.targets.elf; 1, 0, 0,0; 11-8-2017 17:21:10; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

