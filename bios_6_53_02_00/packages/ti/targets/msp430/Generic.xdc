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
 *  ======== Generic.xdc ========
 *  @_nodoc
 *  Generic MSP430 target
 *
 *  This target is used to support "generation only" configurations in which
 *  we don't want/need to supply a compiler toolchain.  During configuration,
 *  some products generate sources that would normally be compiled and linked
 *  into  the application.  In some use cases, however, we simply want to
 *  generate the sources and let the user compile the sources as they see fit.
 *
 *  This target allows existing makefile templates to be largely unaware that
 *  they are, in fact, participating in a "generation only" configuration.
 *  This, in turn, allows the generated makefile to serve as documentation
 *  or even a user modifiable makefile for building the generated sources.
 */
@TargetHeader("xdc/bld/stddefs.xdt")
metaonly module Generic inherits xdc.bld.ITarget2 {
    override readonly config string name    = "Generic"; 
    override readonly config string suffix  = "430";
    override readonly config string isa     = "430";    
    override readonly config string rts     = "ti.targets.msp430.rts430";
    override readonly config xdc.bld.ITarget.Model model = {
        endian: "little",
    };

    /*
     *  ======== stdInclude ========
     */
    override readonly config string stdInclude = "ti/targets/msp430/std.h";

    /*!
     *  ======== profiles ========
     *  Standard options profiles
     */
    override config xdc.bld.ITarget.OptionSet profiles[string] = [
        ["debug", {
            compileOpts: {
                copts: "",
                defs:  "-D_DEBUG_=1",
            }
        }],
        ["release", {
            compileOpts: {
                copts: "",
            },
        }],
    ];

    /*
     *  ======== stdTypes ========
     */
    override readonly config xdc.bld.ITarget.StdTypes stdTypes = {
        t_IArg          : { size: 2, align: 2 },
        t_Char          : { size: 1, align: 1 },
        t_Double        : { size: 4, align: 2 },
        t_Float         : { size: 4, align: 2 },
        t_Fxn           : { size: 2, align: 2 },
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

    /*!
     *  ======== asmName ========
     *  The function that converts a C name into an assembly name
     */
    String asmName(String CName);
}
/*
 *  @(#) ti.targets.msp430; 1, 0, 0,0; 11-8-2017 17:21:22; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

