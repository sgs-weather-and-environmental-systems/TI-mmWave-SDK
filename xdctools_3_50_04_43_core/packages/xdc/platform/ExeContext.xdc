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
 *  ======== ExeContext.xdc ========
 */
package xdc.platform;

/*!
 *  ======== ExeContext ========
 *  Stock implementation of xdc.platform.IExeContext.
 *
 *  This module is used by platforms to create execution contexts that
 *  must be returned by `{@link xdc.platform.IPlatform#getExeContext()}`.
 */
metaonly module ExeContext inherits xdc.platform.IExeContext
{

instance:
    /*!
     *  ======== create ========
     *  Create an execution context.
     *
     *  An execution context is the "view" that an executable has of the
     *  CPU it is running on; e.g., the accessible memory map including
     *  platform specific memory or memory mapped registers.
     *
     *  @param(cpu)	an `{@link xdc.platform.IExeContext#Cpu}` structure
     *                  that uniquely identifies a specific CPU
     *	@param(board)	an `{@link xdc.platform.IPlatform#Board}` structure
     *                  that uniquely identifies a specific board
     */
    create(xdc.platform.IExeContext.Cpu cpu,
	xdc.platform.IPlatform.Board board);
}

/*
 *  @(#) xdc.platform; 1, 0, 1,0; 11-8-2017 17:10:44; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

