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
package host.platforms.SUN;

/*!
 *  ======== SunSparc7 ========
 *  Sparc device data sheet module.
 *
 *  This module provides basic data suitable for SUN Solaris native
 *  builds.
 */
metaonly module SunSparc7 inherits xdc.platform.ICpuDataSheet
{
instance:
    override config string cpuCore	    = "sparc7";
    override config string cpuCoreRevision   = "1.0";
    override config int    minProgUnitSize   = 1;
    override config int    minDataUnitSize   = 1;
    override config int    dataWordSize	    = 4;

    /*!
     *  ======== memMap ========
     *  The memory map returned be getMemeoryMap().
     */
    config xdc.platform.IPlatform.Memory memMap[string] = [];
}
/*
 *  @(#) host.platforms.SUN; 1, 0, 0, 1,0; 11-8-2017 17:09:41; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

