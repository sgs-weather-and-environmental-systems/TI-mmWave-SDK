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
 *  ======== ENABLE ========
 *  Name of env variable (and Java property) that can be used to enable
 *  Clock from the command line
 */
var ENABLE = "xdc.services.global.Clock.enable";

/*
 *  ======== Global Clock State ========
 */
var _t0   = 0;      /* time of last reset */
var _prev = 0;      /* time of last print */


/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* enable the clock if ENABLE is set to "true" */
    var flag = java.lang.System.getProperty(ENABLE);
    if (flag == null) {
	flag = java.lang.System.getenv(ENABLE);
    }
    if (flag != null && flag == "true") {
	this.enable = true;
    }
}

/*
 *  ======== getElapsedTime ========
 */
function getElapsedTime()
{
    return (java.lang.System.currentTimeMillis() - _t0);
}

/*
 *  ======== print ========
 */
function print(msg)
{
    if (this.enable) {
        var cur = java.lang.System.currentTimeMillis();
	var mem = "";
	if (this.showMemory) {
	    var rt = java.lang.Runtime.getRuntime();
	    mem = "used: " + (rt.totalMemory() - rt.freeMemory()) + ", ";
	}

	xdc.global.print(mem + "dt =", cur - _prev, msg);
        _prev = cur;
    }
}

/*
 *  ======== reset ========
 */
function reset()
{
    _prev = _t0 = java.lang.System.currentTimeMillis();
}
/*
 *  @(#) xdc.services.global; 1, 0, 0,0; 11-8-2017 17:11:49; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

