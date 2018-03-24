/*
 * Copyright (c) 2015, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 * ======== GIO.xs ========
 */

var Queue = null;
var Memory = null;
var SyncNull = null;
var DEV = null;
var GIO = null;
var Sync = null;
var SyncSemThread = null;

/*
 * ======== getCFiles ========
 * return the array of C language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getCFiles(targetName)
{
    return (["GIO.c", "IOM_stub.c"]);
}

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    /* provide getCFiles() for Build.getCFiles() */
    this.$private.getCFiles = getCFiles;
}

/*
 * ======== module$use ========
 */
function module$use()
{
    GIO = this;

    DEV = xdc.useModule('ti.sysbios.io.DEV');
    Memory = xdc.useModule('xdc.runtime.Memory');
    Queue = xdc.useModule('ti.sysbios.knl.Queue');
    SyncSemThread = xdc.useModule("xdc.runtime.knl.SyncSemThread");
    Sync = xdc.useModule("xdc.runtime.knl.Sync");
}

/*
 * ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    if (GIO.$written("deviceTableSize")) {
        GIO.$logWarning("The GIO.deviceTableSize configuration parameter " +
            "has been deprecated.  Use DEV.tableSize.", GIO, "deviceTableSize");

        if (DEV.$written("tableSize") == false) { 
            DEV.tableSize = GIO.deviceTableSize;
        }
    }
}

/*
 *  ======== addDeviceMeta ========
 */
function addDeviceMeta(name, fxns, initFxn, devid, params)
{
    var DEV = xdc.useModule('ti.sysbios.io.DEV');

    var devParams = new DEV.Params();
    devParams.initFxn = $externFxn(initFxn);
    devParams.devid = devid;
    devParams.deviceParams = $externPtr(params);

    DEV.create(name, $externPtr(fxns), devParams);
}

/*
 *  ======== viewInitBasic ========
 *  Initialize the 'Basic' GIO instance view.
 */
function viewInitBasic(view, obj)
{    
    var GIO = xdc.useModule('ti.sysbios.io.GIO');
    var Program = xdc.useModule('xdc.rov.Program');
       
    view.label = Program.getShortName(obj.$label);
    view.doneCount = obj.doneCount;
    view.freeCount = obj.freeCount;
    view.submitCount = obj.submitCount;

    if (obj.mode == 1) {
        view.mode = "INPUT";
    }
    else {
        view.mode = "OUTPUT";
    }

    if (obj.model == GIO.Model_STANDARD) {
        view.model = "STANARD";
    }
    else {
        view.model = "ISSUERECLAIM";
    }

    view.userSuppliedSync = obj.userSync;
}
