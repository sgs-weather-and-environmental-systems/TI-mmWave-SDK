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
 *  ======== xdc.platform ========
 *  Interfaces and modules necessary for the XDC Platform Model
 *
 *  @a(Custom Memory Check)
 *  If a custom memory map is specified for a platform, through the
 *  configuration parameter `{@link xdc.platform.IPlatform#customMemoryMap}`,
 *  the custom map is checked
 *  against the default memory map to verify if the custom map fits within
 *  the default map. The environment variable `xdc.platform.custom.check`
 *  controls this check.
 *
 *  By default, the check is enabled. It can be disabled by passing 
 *  `-Dxdc.platform.custom.check="false"` to the XDCscript shell (`xs`),
 *  which is used to run the `{@link xdc.tools.configuro configuro}` command
 *  line configuration tool.
 *  If, on the other hand, you are using `xdc` to run the configuration step
 *  you can set this variable by setting the
 *  `{@link xdc.bld.Executable#Attrs xsopts}` attribute of an
 *  `{@link xdc.bld.Executable}` within a build script.
 */
package xdc.platform [1, 0, 1] {
    /* platform model interfaces */
    interface IPlatform, ICpuDataSheet, IExeContext, IPeripheral;

    /* utility modules that implement core behavior */
    module ExeContext, Utils;
}
/*
 *  @(#) xdc.platform; 1, 0, 1,0; 11-8-2017 17:10:44; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

