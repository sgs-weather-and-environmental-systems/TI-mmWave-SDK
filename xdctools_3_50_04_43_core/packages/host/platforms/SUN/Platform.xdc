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
/*
 *  ======== Platform.xdc ========
 */

package host.platforms.SUN;

/*!
 *  ======== Platform ========
 *  Native SUN Solaris platform support
 *
 *  This module implements xdc.platform.IPlatform and defines configuration
 *  parameters that correspond to this platform's Cpu's, Board's, etc.
 *
 *  The configuration parameters are initialized in this package's
 *  configuration script (package.cfg) and "bound" to the TCOM object
 *  model.  Once they are part of the model, these parameters are
 *  queried by a program's configuration script.
 *
 *  This particular platform has a single Cpu, and therefore, only
 *  declares a single CPU configuration object.  Multi-CPU platforms
 *  would declare multiple Cpu configuration parameters (one per
 *  platform CPU).
 */
metaonly module Platform inherits xdc.platform.IPlatform
{
    /*!
     *  ======== BOARD ========
     *  @_nodoc this structure (and CPU below) exists to satisfy the
     *  IPlatform interface requirements; these fields are largely
     *  unnecessary for host platforms.
     */
    readonly config xdc.platform.IPlatform.Board BOARD = {
	id:		"0",
	boardName:	"sun-sparc",
	boardFamily:	"sun-sparc",
	boardRevision:	null
    };

    /*!
     *  ======== CPU ========
     *  @_nodoc 
     */
    readonly config xdc.platform.IExeContext.Cpu CPU = {
	id:		"0",
	clockRate:	750.0,
	catalogName:	"host.platforms.SUN",
	deviceName:	"SunSparc7",
	revision:	"",
    };

instance:
    config String remoteHost;
}
/*
 *  @(#) host.platforms.SUN; 1, 0, 0, 1,0; 11-8-2017 17:09:41; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

