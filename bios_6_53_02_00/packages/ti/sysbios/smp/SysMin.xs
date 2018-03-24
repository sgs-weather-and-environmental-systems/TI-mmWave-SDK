/* --COPYRIGHT--,ESD
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
 *  This program and the accompanying materials are made available under the 
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at 
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 */
/*
 *  ======== SysMin.xs ========
 *  SMP aware SysMin replacement
 *
 */

var Core = null;

/*
 *  ======== module$use ========
 */
function module$use(obj, params)
{
    Core = xdc.module("ti.sysbios.hal.Core");
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.lineBuffers.length = Core.numCores;

    for (var i = 0; i < Core.numCores; i++) {
        mod.lineBuffers[i].outidx = 0;
        for (var j = 0; j < 256; j++) {
            mod.lineBuffers[i].outbuf[j] = 0;
        }
    }

    mod.outbuf.length = params.bufSize;

    if (params.bufSize != 0) {
        var Memory = xdc.module('xdc.runtime.Memory');
        Memory.staticPlace(mod.outbuf, 0, params.sectionName);
    }

    mod.outidx = 0;
    mod.wrapped = false;  
}

/*
 *  ======== viewInitModule ========
 *
 */
function viewInitModule(view, mod)
{
    view.outBuf = mod.outbuf;
    view.outBufIndex = mod.outidx;
    view.wrapped = mod.wrapped;
}

/*
 *  ======== viewInitOutputBuffer ========
 *  Displays the contents of SysMin's output buffer in ROV.
 */
function viewInitOutputBuffer(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* 
     * Retrieve the module's state. 
     * If this throws an exception, just allow it to propogate up.
     */
    var rawView = Program.scanRawView('ti.sysbios.smp.SysMin');
    
    /* 
     * If the buffer has not wrapped and the index of the next character to
     * write is 0, then the buffer is empty, and we can just return.
     */
    if (!rawView.modState.wrapped && (rawView.modState.outidx == 0)) {
        view.elements = new Array();
        return;
    }
    
    /* Get the buffer size from the configuration. */
    var bufSize = Program.getModuleConfig('ti.sysbios.smp.SysMin').bufSize;
    
    /* Read in the outbuf */    
    var outbuf = null;
    try {
        outbuf = Program.fetchArray(rawView.modState.outbuf$fetchDesc, 
                                    rawView.modState.outbuf, bufSize);
    }
    /* If there's a problem, just re-throw the exception. */
    catch (e) {
        throw ("Problem reading output buffer: " + e.toString());
    }
        
    /* 
     * We will create a new view element for each string terminated in a
     * newline. 
     */
    var elements = new Array();
    
    /* Leftover characters from each read which did not end in a newline. */
    var leftover = "";    
    
    /* If the output buffer has wrapped... */
    if (rawView.modState.wrapped) {
        /* Read from outidx to the end of the buffer. */
        var leftover = readChars("", outbuf, rawView.modState.outidx, 
                                 outbuf.length - 1, elements);        
    }

    /* Read from the beginning of the buffer to outidx */
    leftover = readChars(leftover, outbuf, 0, rawView.modState.outidx - 1,
                         elements);

    /* 
     * If there are any leftover characters not terminated in a newline,  
     * create an element for these and display them. 
     */
    if (leftover != "") {
        var elem = Program.newViewStruct('ti.sysbios.smp.SysMin', 
                                         'OutputBuffer');
        elem.entry = leftover;
        elements[elements.length] = elem;
    }

    view.elements = elements;
}

/*
 *  ======== readChars ========
 *  Reads characters from 'buffer' from index 'begin' to 'end' and adds
 *  any newline-terminated strings as elements to the 'elements' array.
 *  If the last character is not a newline, this function returns what it's
 *  read from the "incomplete" string.
 *  The string 'leftover', the leftover incomplete string from the previous
 *  call, is prepended to the first string read.
 */
function readChars(leftover, buffer, begin, end, elements)
{
    /* Start with the previous incomplete string. */
    var str = leftover;
    
    /* For each of the specified characters... */
    for (var i = begin; i <= end; i++) {
            
        /* Convert the target values to characters. */
        var ch = String.fromCharCode(buffer[i]);
        
        /* Add the character to the current string. */
        str += ch;
                
        /* 
         * If a string ends in a newline, create a separate table entry for it.
         */
        if (ch == '\n') {
            /* 
             * Create a view structure to display the string, and add
             * it to the table. 
             */
            var elem = Program.newViewStruct('ti.sysbios.smp.SysMin', 
                                             'OutputBuffer');
            elem.entry = str;           
            elements[elements.length] = elem;
            
            /* Reset the string */
            str = "";
        }
    }
    
    /* Return any unfinished string characters. */
    return (str);
}

