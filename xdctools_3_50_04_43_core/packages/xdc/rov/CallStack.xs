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
 *  ======== CallStack ========
 */

var init = false;
var callStackInst;      /* call stack parser support proxy */

/*
 *  ======== clearRegisters ========
 */
function clearRegisters()
{
    if (!init) {
	_init();
    }
    if (callStackInst != null) {
        callStackInst.clearRegisters();
    }
}

/*
 *  ======== fetchRegisters ========
 */
function fetchRegisters(names)
{
    if (!init) {
	_init();
    }
    if (callStackInst != null) {
        callStackInst.fetchRegisters(names);
    }
}

/*
 *  ======== getRegister ========
 */
function getRegister(name)
{
    if (!init) {
	_init();
    }
    if (callStackInst != null) {
        return (callStackInst.getRegister(name));
    }
    return (0);
}

/*
 *  ======== setRegister ========
 */
function setRegister(name, value)
{
    if (!init) {
	_init();
    }
    if (callStackInst != null) {
        callStackInst.setRegister(name, value);
    }
}

/*
 *  ======== toText ========
 */
function toText()
{
    if (!init) {
	_init();
    }
    return (callStackInst == null ? "" : callStackInst.toText());
}

/*
 *  ======== _init ========
 *  Lazy initialization of this module
 *
 *  We defer init until it's _really_ needed.  This helps ensure 
 *  that the Model is fully initialized by the top-level client
 *  application (e.g., CCS, coredump, ...), which needs to create a
 *  call stack instance before we can effectively do anything.
 */
function _init(mod)
{
    var Model = xdc.module('xdc.rov.Model');
    callStackInst = Model.getICallStackInst();
    if (callStackInst == null) {
	print("Warning: no call stack parser has been provided by xdc.rov.Model");
    }
    init = true;
}
/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

