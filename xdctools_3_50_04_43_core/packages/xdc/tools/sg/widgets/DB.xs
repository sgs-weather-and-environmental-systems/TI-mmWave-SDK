/* 
 *Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */
function module$meta$init() {
    addJars(environment['xdc.root']+'/packages/xdc/tools/bldgen/sg/java');
}

function instance$meta$init() {
    setPath.call(this, environment['xdc.path'].split(';'));
}

function getPath() {
    return this.$private.path;
}

function setPath(path) {
    /* delete empty strings from the path */
    var p = [];
    for (var i=0; i<path.length; i++) {
        if (path[i] != '') {
            p.push(path[i]);
        }
    }

    this.$private.path = p;
    this.$private.il = undefined;
}

function getUnits(childOf) {
    if (!this.$private.il) {
        /* create a Java array */
        var path = java.lang.reflect.Array.newInstance(
            java.lang.String,
            this.$private.path.length
        );

        /* and copy the strings to it */
        for (var i=0; i<this.$private.path.length; i++) {
            path[i] = this.$private.path[i];
        }

        /* create the InterfaceList object */
        this.$private.il =
            new Packages.xdc.tools.sg.widgets.InterfaceList(path);
    }
    return this.$private.il.findImplementors(childOf);
}
/*
 *  @(#) xdc.tools.sg.widgets; 1,0,0,0; 1-9-2017 12:51:58; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

