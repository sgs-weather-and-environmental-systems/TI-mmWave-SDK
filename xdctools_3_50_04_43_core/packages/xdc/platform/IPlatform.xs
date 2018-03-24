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
 *  ======== IPlatform.xs ========
 */

/*
 *  ======== IPlatform.getCpuDataSheet ========
 *  Define the default platform package getCpuDataSheet() method.
 */
function getCpuDataSheet (cpuId) {
    throw new Error("The platform " + this.$orig
	+ " did not define the required getCpuDataSheet method.");
}

/*
 *  ======== IPlatform.getCreateArgs ========
 *  Define the default platform package getCreateArgs() method.
 */
function getCreateArgs () {
    return (null);
}

/*
 *  ======== IPlatform.getExeContext ========
 *  Define the default platform package getExeContext() method.
 */
function getExeContext (prog) {
    throw new Error("The platform " + prog.platform
	+ " did not define the required getExeContext method.");
}

/*
 *  ======== ICpuDataSheet.getMemoryMap ========
 *  Define the default IExeContext getMemoryMap() method.
 */
function getMemoryMap (registers) {
    return ([]);
}

/*
 *  ======== ICpuDataSheet.getRegisterSet ========
 *  Define the default IExeContext getRegisterSet() method.
 */
function getRegisterSet () {
    return ([]);
}

/*
 *  ======== IPlatform.getLinkTemplate ========
 *  Define the default platform package getLinkTemplate() method.
 */
function getLinkTemplate (prog) {
    return (null);    /*  no linker command template for this platform */
}

/*
 *  ======== IPlatform.getExecCmd ========
 *  Define the default program execution command
 */
function getExecCmd (prog, platPath) {
   return ("$(ECHO) don't know how to execute '" + prog.name + "'\nexit 1");
}
/*
 *  @(#) xdc.platform; 1, 0, 1,0; 11-8-2017 17:10:44; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

