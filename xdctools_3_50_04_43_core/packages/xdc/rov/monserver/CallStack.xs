/* --COPYRIGHT--,EPL
 *  Copyright (c) 2016 Texas Instruments Incorporated
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * --/COPYRIGHT--*/

var mi;
/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(memoryReaderInstance)
{
    mi = memoryReaderInstance;
}

/*
 *  ======== clearRegisters ========
 */
function clearRegisters()
{
    mi.clearRegisters();
}

/*
 *  ======== fetchRegisters ========
 */
function fetchRegisters(names)
{
    var jnames = java.lang.reflect.Array.newInstance(java.lang.String,
        names.length);
    for (var i = 0; i < names.length; i++) {
        jnames[i] = names[i];
    }
    mi.fetchRegisters(jnames);
}

/*
 *  ======== getRegister ========
 */
function getRegister(name)
{
    return (mi.getRegister(name));
}

/*
 *  ======== setRegister ========
 */
function setRegister(name, value)
{
    mi.setRegister(name, value);
}

/*
 *  ======== toText ========
 */
function toText()
{
    var res = mi.toText();
    /* A string is added because, Hwi expects it, but that assumption should
     * be removed from Hwi.
     */
    res = res + "Unwind halted";
    return (res);
}
