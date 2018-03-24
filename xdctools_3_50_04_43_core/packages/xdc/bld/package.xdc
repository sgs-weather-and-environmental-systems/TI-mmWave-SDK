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
requires xdc.services.global;
requires xdc.services.intern.cmd;

/*!
 *  ======== xdc.bld ========
 *  The XDC Build Model
 *
 *  This package contains the XDC Build Model and the interfaces necessary
 *  to extend the Build Model to handle new compiler tool chains.  The
 *  modules in this package (and the instances managed by these modules)
 *  form the Build Object Model (BOM).
 *
 *  This model enables build scripts to declare the contents of each release
 *  of a package.  Based on these manifests, the Build Engine generates
 *  makefiles that build the specified object files, libraries, and
 *  executables, and archive these files into specified release files.  In
 *  addition, the generated makefiles are also capable of running collections
 *  of executables with command line arguments (provided that the platforms
 *  support this); e.g., regression tests.
 *
 *  @a(NOTE) User supplied file names of source files, generated libraries and
 *           executables must be limited to portable POSIX file names. That
 *           means that only alphanumeric charaters, and '_', '.', and '-'
 *           are allowed.
 *
 *  @a(throws)
 *  `XDCException` exceptions are thrown for fatal errors. The following error
 *  codes are reported in the exception message:
 *
 *   @p(dlist)                            
 *      -  `xdc.bld.TARGET_CONFIG_ERROR`
 *           This error is reported whenever there is an  error in
 *           the target configuration file. Check the configuration script
 *           for errors. 
 *      -  `xdc.bld.ROOTDIR_NOT_SET`
 *           This error is reported when the `rootDir` property for a target
 *           has not been set in the target configuration script. Ensure
 *           that this property is set correctly in the configuration
 *           script.   
 *      -  `xdc.bld.PLATFORM_NOT_SET`
 *           This error is reported when either 1) the `platform` property for
 *           a target has not been set in the target specification or the 
 *           target configuration script (config.bld) or 2) the build script
 *           (package.bld) is setting the platform for a program to an
 *           invalid value.
 *      -  `xdc.bld.DUPLICATE_TARGET_ERROR`
 *           This error is reported when a same target is listed twice in 
 *           `Bld.targets`. Check `{@link xdc.bld.BuildEnvironment#targets}`
 *	     to find out how `Bld.targets` is constructed. 
 */
package xdc.bld [1, 0, 2] {

    /* interfaces to code gen tool chains (used by build engine) */
    interface ITarget, ITarget2, ITarget3;

    /* interface to user-supplied extensions that filter target commands */
    interface ITargetFilter;

    /* global build environment read by a build script */
    module    BuildEnvironment;

    /* package contents container populated by a build script */
    module    PackageContents;

    /* objects that can be added to the PackageContents container */
    module    Release;
    module    Library;
    module    Test;
    module    Object;
    module    Executable;
    module    Repository;
    module    Assembly, Configuration;
    module    Script;
    
    /* each release has an optional script to post-process files
     * listed in a Manifest */
    module    Manifest;

    /* misc utils to simplify target development (ITarget implementations) */
    module    Utils;
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

