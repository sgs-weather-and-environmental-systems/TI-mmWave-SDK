/* 
 *  Copyright (c) 2009 Texas Instruments and others.
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
 *  ======== ITarget3.xdc ========
 */
package xdc.bld;

/*!
 *  ======== ITarget3 ========
 *  Extension of the interface {@link xdc.bld.ITarget3}.
 *
 *  This interface contains some common structures and config parameters
 *  shared by several packages that contain targets.
 */
metaonly interface ITarget3 inherits ITarget2 {
    /*!
     *  ======== rawVersion ========
     *  The raw version string from the compiler
     *
     *  @a(Readonly) This value is automatically computed by the XDC Build
     *  Engine by executing the `{@link #getRawVersion()}` function after 
     *  `package.bld` completes but prior to generating `package.mak`.
     */
    config String rawVersion;
	
    /*!
     *  ======== getRawVersion ========
     *  Get a target-specific raw compiler version string
     *
     *  This function is called during makefile generation to obtain a 
     *  target-specific raw compiler version string.  
     *
     *  @a(returns)
     *  This function returns a string, typically provided by the compiler
     *  itself, that identifies the version of the compiler referenced by
     *  `{@link #rootDir}`.
     *
     *  @a(throws)  `Error` exceptions are thrown for fatal errors.
     */
    String getRawVersion();
}

/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

