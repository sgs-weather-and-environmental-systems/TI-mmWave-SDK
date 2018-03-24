/* --COPYRIGHT--,EPL
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * --/COPYRIGHT--*/

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(controllerID)
{    
    var controller = xdc.jre.com.ti.dvt.server4.ControllerMap.getController(controllerID);
    /* call stack instances are not supported by pre-CCS 5.5; so we soft
     * fail here
     */
    try {
        this.$private.callStack = controller.getCallStack();
    }
    catch (e) {
        print("Warning: call stack parsing is not supported");
        this.$private.callStack = null;
    }
}

/*
 *  ======== clearRegisters ========
 */
function clearRegisters()
{
    if (this.$private.callStack != null) {
        this.$private.callStack.clearRegisters();
    }
}

/*
 *  ======== fetchRegisters ========
 */
function fetchRegisters(names)
{
    if (this.$private.callStack != null) {
	var jnames = java.lang.reflect.Array.newInstance(
            java.lang.String, names.length);
	for (var i = 0; i < names.length; i++) {
            jnames[i] = names[i];
	}
        this.$private.callStack.fetchRegisters(jnames);
    }
}

/*
 *  ======== getRegister ========
 */
function getRegister(name)
{
    if (this.$private.callStack != null) {
        return (this.$private.callStack.getRegister(name));
    }
    return (0);
}

/*
 *  ======== setRegister ========
 */
function setRegister(name, value)
{
    if (this.$private.callStack != null) {
        this.$private.callStack.setRegister(name, value);
    }
}

/*
 *  ======== toText ========
 */
function toText()
{
    if (this.$private.callStack != null) {
        return (this.$private.callStack.toText());
    }
    return ("<call stack parsing is not supported>");
}
