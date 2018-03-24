/*
 * Copyright (c) 2012-2013, Texas Instruments Incorporated
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
 *  ======== EventCombiner.xs ========
 *
 */

var Ecm = null;
var Hwi = null;

/*
 *  ======== module$use ========
 */
function module$use()
{
    Hwi = xdc.useModule('ti.sysbios.family.c64p.Hwi');
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
    
    Ecm = this;

    for (var i = 0; i < Ecm.NUM_EVENTS; i++) {
        Ecm.events[i].unmask = false;
        Ecm.events[i].fxn = '&ti_sysbios_family_c64p_EventCombiner_unused';
        Ecm.events[i].arg = i;
    }

    for (var i = 0; i < 4; i++) {
        Ecm.eventGroupHwiNum[i] = -1;
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    Ecm.EVTMASK[0] = 0;
    Ecm.EVTMASK[1] = 0;
    Ecm.EVTMASK[2] = 0;
    Ecm.EVTMASK[3] = 0;

    for (var i = 0; i < Ecm.NUM_EVENTS; i++) {
        var regIndex = Math.floor(i / 32);
        mod.dispatchTab[i].fxn = Ecm.events[i].fxn;
        mod.dispatchTab[i].arg = Ecm.events[i].arg;

        if (Ecm.events[i].unmask == false) {
            Ecm.EVTMASK[regIndex] |= 1 << (i % 32);
        }
    }

    for (var i = 0; i < 4; i++) {
        var hwiNum = Ecm.eventGroupHwiNum[i];
        if (hwiNum != -1) {
            mapEventGroup(i, hwiNum);
        }
    }
}

/*
 *  ======== dispatchEventGroup ========
 */
function dispatchEventGroup(id, hwiNum)
{
    if (hwiNum < 4 || hwiNum > 15) {
        Ecm.$logError("EventCombiner.dispatchEventGroup: hwi vector number must be between 4 -> 15 inclusive (attempting to set vector number " + hwiNum + ").", Ecm);
    }

    if (id < 0 || id >= Ecm.NUM_EVENTS) {
        Ecm.$logError("EventCombiner.dispatchEventGroup: event id must be between 0 -> " + Ecm.NUM_EVENTS + " (attempting to map event id " + id + ").", Ecm);
    }

    Ecm.eventGroupHwiNum[id] = hwiNum;
}

/*
 *  ======== mapEventGroup ========
 */
function mapEventGroup(id, hwiNum)
{
    if (hwiNum < 4 || hwiNum > 15) {
        Ecm.$logError("EventCombiner: hwi vector number must be between 4 -> 15 inclusive (attempting to set vector number " + hwiNum + ").", Ecm);
    }

    var hwiParams = new Hwi.Params();
    hwiParams.eventId = id;
    hwiParams.arg = id;
    hwiParams.enableInt = true;
    Hwi.create(hwiNum, '&ti_sysbios_family_c64p_EventCombiner_dispatch',
        hwiParams);
}

/*
 *  ======== module$validate ========
 *  Combined events should be plugged with the EventCombiner dispatch function.
 *  If they aren't, then print a warning.
 */
function module$validate()
{
    /*
     *  Loop through HWI interrupts to see if any combiner event is plugged.
     *  If a combiner event is plugged, make sure the dispatcher is being
     *  used and that the EventCombiner dispatch is used.  If either case
     *  is not true, Log a warning.
     */
    for (var intNum = 4; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
        if (Hwi.interrupt[intNum].used == true) {
            var evtNum = Hwi.$object.intEvents[intNum];

            if (evtNum >= 0 && evtNum <= 3) {
                if (Hwi.interrupt[intNum].useDispatcher == false) {
                    Ecm.$logWarning("EventCombiner.validate: Hwi dispatcher is not being used for event " + evtNum + " on vector " + intNum + ".", Ecm);
                }
                if (Hwi.interrupt[intNum].fxn !=
                    '&ti_sysbios_family_c64p_EventCombiner_dispatch') {
                    Ecm.$logWarning("EventCombiner.validate: Function for event " + evtNum + " on vector " + intNum + " is not EventCombiner_dispatch.", Ecm);
                }
            }
        }
    }
}

/*
 *  ======== viewInitEvents ========
 */
function viewInitEvents(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var EventCombiner = xdc.useModule('ti.sysbios.family.c64p.EventCombiner');

    /* Scan the raw view in order to obtain the module state. */
    var rawView;
    try {
        rawView = Program.scanRawView('ti.sysbios.family.c64p.EventCombiner');
    }
    catch (e) {
        // TODO - report problem.
        print("Caught exception while retrieving raw view: " + e);
    }

    var mod = rawView.modState;

    /* Retrieve the module configuration. */
    var modCfg = Program.getModuleConfig('ti.sysbios.family.c64p.EventCombiner');

    /* Display function and arg for each configured event. */
    for (var i = 0; i < EventCombiner.NUM_EVENTS; i++) {
        var fxnName = Program.lookupFuncName(Number(mod.dispatchTab[i].fxn))[0];
        var arg     = mod.dispatchTab[i].arg;

        /* ignore system interrupts that are not plugged */
        if (fxnName == "ti_sysbios_family_c64p_EventCombiner_unused__E") {
            continue;
        }

        var entryView =
            Program.newViewStruct('ti.sysbios.family.c64p.EventCombiner',
                                  'Events');

        entryView.eventId = i;
        entryView.fxn     = fxnName;
        entryView.arg     = arg;

        view.elements.$add(entryView);
    }
}
