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
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    this.$private.supergroups = {
        xdccore: ["packageLoad", "useModule", "getLibs", "xdcerror"]
    };
}

/*
 *  ======== addSupergroup ========
 */
function addSupergroup(newName, subgroups)
{
    if (this.$private.supergroups[newName] == undefined) {
        this.$private.supergroups[newName] = subgroups;
    }
    else {
        print("Warning: trace group '" + newName + "' is already defined and "
            + "cannot be redefined.");
    }
}

/*
 *  ======== capsuleEnable ========
 */
function capsuleEnable(capsules)
{
    utils.setTraceLevel(this.level);

    this.capsules = [];
    for (var i = 0; i < capsules.length; i++) {
        this.capsules[this.capsules.length++] = capsules[i];
    }

    return (utils.traceCapsuleEnable(capsules));
}

/*
 *  ======== groupEnable ========
 */
function groupEnable(groups)
{
    utils.setTraceLevel(this.level);
    
    this.groups = [];
    for (var i = 0; i < groups.length; i++) {
        this.groups[this.groups.length++] = groups[i];
    }
    
    /* If there are supergroups in 'this.groups', they should be expanded. */
    _expandSupergroups();
    
    return (utils.traceGroupEnable(this.groups));
}

/*
 *  ======== packageEnable ========
 */
function packageEnable(packages)
{
    utils.setTraceLevel(this.level);
    
    this.packages = [];
    for (var i = 0; i < packages.length; i++) {
        this.packages[this.packages.length++] = packages[i];
    }

    return (utils.tracePackageEnable(packages));
}

/*
 *  ======== setLevel ========
 */
function setLevel(level)
{
    this.level = level;
    return (utils.setTraceLevel(this.level));
}

/*
 *  ======== start ========
 */
function start()
{
    utils.setTraceLevel(this.level);
    
    if (this.capsules.length > 0) {
        utils.traceCapsuleEnable(this.capsules);
    }

    if (this.packages.length > 0) {
        utils.tracePackageEnable(this.packages);
    }

    if (this.packageLoad) {
        this.groups[this.groups.length++] = "packageLoad";
    }

    if (this.useModule) {
        this.groups[this.groups.length++] = "useModule";
    }

    if (this.groups.length > 0) {
        _expandSupergroups();
        utils.traceGroupEnable(this.groups);
    }
}

function _expandSupergroups()
{
    var Trace = xdc.module('xdc.services.global.Trace');
    if (Trace.groups.length == 0) {
        return;
    }
    /* Check if any of the enabled groups is a supergroup, and if yes, add its
     * component groups. We'll keep going through checking for supergroups as
     * long as the number of enabled groups increases. For that to work
     * correctly, we need to not allow redundant groups in 'this.groups'.
     */
    do {
        var counter = Trace.groups.length;
        // add supergroups
        for (var m = 0; m < Trace.groups.length; m++) {
            if (Trace.$private.supergroups[Trace.groups[m]] != undefined) {
                var componentGroups = [];
                componentGroups = Trace.$private.supergroups[Trace.groups[m]];
                for (var j = 0; j < Trace.groups.length; j++) {
                    for (var k = 0; k < componentGroups.length; k++) {
                        if (componentGroups[k] == Trace.groups[j]) {
                            /* component group is already in 'this.groups' */
                            componentGroups[k] = null;
                        }
                    }
                }
            }
            else {
                continue;
            }
            for (var n = 0; n < componentGroups.length; n++) {
                if (componentGroups[n] != undefined) {
                    Trace.groups[Trace.groups.length++] = componentGroups[n];
                }
            }
        }
    } while (counter < Trace.groups.length);
}
/*
 *  @(#) xdc.services.global; 1, 0, 0,0; 11-8-2017 17:11:49; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

