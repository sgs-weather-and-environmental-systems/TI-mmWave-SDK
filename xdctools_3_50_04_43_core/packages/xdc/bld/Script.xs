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
 *  ======== Script.addTest ========
 */
function addTest(testAttrs)
{
    function close(script)
    {
	/* create a name for the test, if necessary */
	if (this.test.attrs.groupName == null) {
	    this.test.attrs.groupName = script.$private.name;
	}
    
	/* set arg attrs to "", to simplify generation */
	if (this.test.attrs.args == null) {
	    this.test.attrs.args = "";
	}
	if (this.test.attrs.execArgs == null) {
	    this.test.attrs.execArgs = "";
	}
        if (this.test.attrs.refExitCode == null) {
            this.test.attrs.refExitCode = 0;
        }
    }
    
    var test = this.$package.Test.create();

    test.attrs = testAttrs;

    /* initialize private state */
    var priv = test.$private;
    priv.test = test;
    priv.close = close;

    /* add test to executable's list of tests */
    this.$private.tests[this.$private.tests.length++] = test;

    return (test);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

