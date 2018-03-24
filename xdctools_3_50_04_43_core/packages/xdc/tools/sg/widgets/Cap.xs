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
/**
 *  ======== setCapsule ========
 * Initialize a Widget instance from a capsule.
 *
 * This function supports creating Widgets whose behavior is defined
 * in a capsule. Allows a widget to be customized without requiring
 * the use of inheritance.
 */
function setCapsule(capsuleName)
{
    /* load the capsule that defines the widget */
    this.capsule = xdc.loadCapsule(capsuleName);

    /* copy the contents of the capsule into $private */
    for (var p in this.capsule) {
        this.$private[p] = this.capsule[p];
    }

    this.$private.$public = this;
}

/*
 *  ======== isValid ========
 */
function isValid()
{
    if (this.capsule.isValid) {
        return this.capsule.isValid.call(this.$private);
    }
    else {
        return true;
    }
}
/*
 *  @(#) xdc.tools.sg.widgets; 1,0,0,0; 1-9-2017 12:51:57; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

