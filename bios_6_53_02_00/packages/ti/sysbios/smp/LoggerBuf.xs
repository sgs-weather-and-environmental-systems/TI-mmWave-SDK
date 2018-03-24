/*
 * Copyright (c) 2014, Texas Instruments Incorporated
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
 *  ======== LoggerBuf.xs ========
 */

var Logger = null;

var Diags;

/*
 *  ======== module$use ========
 */
function module$use()
{
    var System = xdc.useModule('xdc.runtime.System');
    var Defaults = xdc.module('xdc.runtime.Defaults');
    var Types = xdc.module('xdc.runtime.Types');
    var Timestamp = xdc.module('xdc.runtime.Timestamp');

    Logger = this;
    if (Logger.enableFlush) {
        System.atexitMeta(Logger.flushAllInternal);
    }
    
    /* bind LoggerBuf.TimestampProxy to whatever Timestamp is using,
     * unless LoggerBuf.TimestampProxy was set already.
     */
    if (Logger.TimestampProxy == null) {
	/*
         * if our module$use() occurs before BIOS.module$use(), do 
         * what BIOS does in selecting the Timestamp delegate
         */ 
	if (!Timestamp.$written("SupportProxy")) {
	    var Settings = xdc.module("ti.sysbios.family.Settings");
            Logger.TimestampProxy = xdc.useModule(Settings.getDefaultTimestampDelegate());
	}
	else {
	    Logger.TimestampProxy = Timestamp.SupportProxy.delegate$;
	}
    }

    /* Memory module is needed only if memoryPolicy is not STATIC_POLICY. */
    if (Defaults.getCommon(Logger, "memoryPolicy") != Types.STATIC_POLICY) {
        xdc.useModule('xdc.runtime.Memory');
    }
    
    /* disable trace on timestamp proxy to prevent recursive callbacks */
    Diags = xdc.module("xdc.runtime.Diags");
    var modName = Logger.TimestampProxy.delegate$.$name;
    Diags.setMaskMeta(modName, Diags.ALL_LOGGING, Diags.ALWAYS_OFF);
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(obj, params)
{    
    /* Assign the default filtering levels based on the configuration. */
    obj.level1 = params.level1Mask;
    obj.level2 = params.level2Mask;
    obj.level3 = params.level3Mask;
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, prms)
{
    /*
     * Note: not really needed in static case since the app
     * should not free this object. Here for completeness.
     */
    obj.bufHeap = null;

    obj.enabled = false;
    obj.flush = prms.exitFlush;
    obj.entryArr.length = prms.numEntries;
    obj.curEntry = obj.entryArr.$addrof(0);
    obj.readEntry = obj.entryArr.$addrof(0);
    obj.endEntry = obj.entryArr.$addrof(prms.numEntries - 1);
    obj.advance = Number(prms.bufType);
    obj.numEntries = prms.numEntries;
    obj.serial = 1;

    /*
     *  The following will place a memory buffer into section name. This
     *  buffer is the memory that this instance will manage.
     */
    var Memory = xdc.module('xdc.runtime.Memory');
    Memory.staticPlace(obj.entryArr, 0, prms.bufSection);
}

/*
 *  ======== getMetaArgs ========
 *  Returns meta data to support stop-mode RTA.
 */
function getMetaArgs(inst, instNum)
{
    var LoggerBuf = xdc.module('ti.sysbios.smp.LoggerBuf');
    
    /* Create a new StopModeData structure to populate. */
    var data = new LoggerBuf.StopModeData();
    data.bufferSymbol = "ti_sysbios_smp_LoggerBuf_Instance_State_" + 
                       instNum + "_entryArr__A";;
    data.bufferSize = inst.numEntries * LoggerBuf.Entry.$sizeof();
    
    return (data);
}
 
/*
 *  ======== viewInitBasic ========
 *  Initializes the 'Basic' ROV instance view.
 */
function viewInitBasic(view, obj)
{
    var LoggerBuf = xdc.useModule('ti.sysbios.smp.LoggerBuf');
    
    /* Retrieve the LoggerBuf instance's name */
    view.label = Program.getShortName(obj.$label);
    
   /* 
     * Determine the serial number of the last record, convert it to a
     * sequential number.
     */
    view.lastSerial = ((obj.serial + 1) / 2) - 1;
    
    /* Display the configured number of entries. */
    view.numEntries = obj.numEntries;
    
    /* Determine the type of the LoggerBuf, FIXED or CIRCULAR. */
    if ((obj.advance == LoggerBuf.FULL) || 
        (obj.advance == Number(LoggerBuf.BufType_FIXED))) {
        view.type = "FIXED";
    }
    else {
        view.type = "CIRCULAR";
    }
    
    /* Show whether the LoggerBuf instance is currently enabled. */
    view.enabledFlag = obj.enabled;
}

/*
 *  ======== viewInitRecords ========
 *  This function is called once per LoggerBuf instance.
 *
 *  The LoggerBuf 'Records' view leverages the LoggerBufDecoder class so it
 *  uses the same code as Stop-Mode RTA.
 */
function viewInitRecords(view, obj)
{
    xdc.loadPackage('xdc.runtime');
    xdc.loadPackage('xdc.rov');
    var Model = xdc.useModule('xdc.rov.Model');
    var Log = xdc.useModule('xdc.runtime.Log');
    var LoggerBuf = xdc.useModule('ti.sysbios.smp.LoggerBuf');
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* 
     * Populate the label first so that at least the label shows up if something
     * goes wrong.
     */
    view.label = Program.getShortName(obj.$label);
    if (view.label.equals("")) {
        view.label = String(obj.$addr);
    }
    
    /* Create an array to hold of the event views. */
    var eventViews = new Array();
    
    /* Get the memory reader */
    var memReader = Model.getMemoryImageInst();
    
    /* Read the memory. */   
    
    /* Calculate the size of a record. */
    var bytesPerMau = Program.build.target.bitsPerChar / 8;
    var recSizeBytes = LoggerBuf.Entry.$sizeof() * bytesPerMau;
    
    /* Calculate the total size of the read. */
    var readSizeBytes = obj.numEntries * recSizeBytes;

    /* Read the buffer's memory. */
    var buffer;
    try {
        buffer = memReader.readBytes(Number(obj.entryArr.$addr), readSizeBytes,
                                     true);
    }
    catch (e) {
        /* Strip the Java class name from the exception. */
        var msg = e.message;
        if (e.message.indexOf("java.lang.Exception: ") == 0) {
            msg = msg.substring(21);
        }
        
        displayGeneralError(view, "Caught exception reading logger's " + 
                            "memory buffer: " + msg);
        return;
    }

    /* Initialize the LoggerBufDecoder */
    try {
        var LBJava = LoggerBuf.initDecoder();
    }
    catch (e) {
        displayGeneralError(view, "Caught exception initializing the " +
                            "LoggerBuf decoder: " + e);
        return;
    }

    /* Decode the buffer. This returns an array of xdc.rta.HostEvent objects */
    var events;
    try {
        events = LBJava.decodeBuffer(buffer, 0, buffer.length);
    }
    catch (e) {
        displayGeneralError(view, "Caught exception decoding the " +
                            "LoggerBuf's records: " + e);
        return;        
    }
    
    /* 
     * Copy each of the HostEvent objects into a view element 
     * to be displayed. 
     */
    for (var i = 0; i < events.length; i++) {
        var evt = events[i];
        
        /* Create a new view element. */
        var evtView = Program.newViewStruct('ti.sysbios.smp.LoggerBuf', 'Records');

        /* Fill in the element. */
        evtView.serial = evt.sequenceNum;

        /* Upper 4 bits of timestamp are encoded with coreId */
        /* shift floating point timestamp right 60 bits */
        var coreId = Math.round(evt.timestamp / Math.pow(2, 60)); 
        evtView.core = coreId;

        /* 
         * mask off upper 4 bits of timestamp 
         */
        /* shift floating point coreId left 60 bits */
        var coreBits = coreId * Math.pow(2, 60); 
        /* subtract the 4 core bits from timestamp */
        evtView.timestampRaw = evt.timestamp - coreBits;

        try {
            evtView.modName = evt.getModuleName();
        }
        catch (e) {
            Program.displayError(evtView, 'modName', 
                "Caught exception decoding event's module name: " + e);
        }

        try {
            evtView.text = evt.getEventMsg();
        }
        catch (e) {
            Program.displayError(evtView, 'text', 
                "Caught exception decoding event's message: " + e);
        }

        evtView.eventId = evt.eventId;        
        
        try {
            evtView.eventName = evt.getEventName();
        }
        catch (e) {
            Program.displayError(evtView, 'eventName', 
                "Caught exception decoding event's name: " + e);
        }        
        
        evtView.arg0 = evt.args[0];
        evtView.arg1 = evt.args[1];
        evtView.arg2 = evt.args[2];
        evtView.arg3 = evt.args[3];
        evtView.arg4 = evt.args[4];
        evtView.arg5 = evt.args[5];
        evtView.arg6 = evt.args[6];
        evtView.arg7 = evt.args[7];
        
        eventViews[eventViews.length] = evtView;
    }

    view.elements = eventViews;
}

/*
 *  ======== displayGeneralError ========
 *  Helper function to display an exception when processing a logger view.
 */
function displayGeneralError(view, msg)
{
    /* Create a new view element to display the error. */
    var evtView = Program.newViewStruct('ti.sysbios.smp.LoggerBuf', 'Records');

    /* Display the error on the 'serial' field. */
    Program.displayError(evtView, 'serial', msg);
        
    /* Add the element to the view and return. */
    view.elements = [evtView];
}

/*
 *  ======== initDecoder ========
 *  Creates an instance of the ti.sysbios.smp.LoggerBufDecoder class.
 *  The LoggerBuf 'Records' ROV view uses the LoggerBufDecoder class to decode
 *  the raw bytes into xdc.rta.HostEvent objects. This decoder is shared
 *  between this ROV view and stop mode RTA.
 */
function initDecoder()
{      
    var Program = xdc.useModule('xdc.rov.Program');
    var LoggerBuf = xdc.useModule('ti.sysbios.smp.LoggerBuf');
    var Model = xdc.useModule('xdc.rov.Model');
    var Log = xdc.useModule('xdc.runtime.Log');
    
    /* Check if the decoder has already been created. */
    if (LoggerBuf.$private.LBJava != undefined) {
        return (LoggerBuf.$private.LBJava);
    }
   
    /* Get the IOFReader instance */
    var ofReader = Model.getIOFReaderInst();

    /* 
     * In order to decode the events in a LoggerBuf, the LoggerBufDecoder class
     * requires an object which implements the IEventMetaData interface to
     * provide log event information such as the mapping of an event id to 
     * the event's message. 
     *
     * For ROV, we create a JavaScript object which implements all of the APIs
     * in the IEventMetaData class, then place a Java wrapper on this so that
     * it can be called by the LoggerBufDecoder class.
     */
    var eventData = {
        getOFReader: 
            function() { 
                return (ofReader); 
            },
        lookupEventMessage: 
            function (eventId) { 
                return (Log.lookupEventMessage(eventId)); 
            },    
        getTargetArgSize: 
            function() {
                return (Program.build.target.stdTypes.t_IArg.size * 
                        Program.build.target.bitsPerChar / 8); 
            },
        lookupEventName: 
            function(eventId) {
                return (Log.lookupEventName(eventId));
            },
        lookupModuleName: 
            function(modId) {
                return (Log.lookupModuleName(modId)); 
            },
        getTargetEventRecSize: 
            function() {
                return (Log.EventRec.$sizeof() *
                        Program.build.target.bitsPerChar / 8); 
            }
    };
        
    /* Create the Java wrapper for the IEventMetaData object. */    
    var jEventData = new Packages.xdc.rta.IEventMetaData(eventData);

    /* Required target information */
    var bitsPerChar = Program.build.target.bitsPerChar;    
    var endianStr = Program.build.target.model.endian;
    var endianess = xdc.jre.xdc.rov.TargetType.strToEndianess(endianStr);

    /* Create an instance of the LoggerBufDecoder */
    var LBJava = new Packages.xdc.runtime.LoggerBufDecoder(endianess,
                                                           bitsPerChar, 
                                                           jEventData);
    
    /* 
     * Store off the LoggerBufDecoder instance so we only have to create it
     * once.
     */
    LoggerBuf.$private.LBJava = LBJava;
    
    return (LBJava);
}

/*
 *  ======== validate ========
 *  This function is called by this package's validate() method (defined
 *  in package.xs).  
 */
function validate()
{
    /* this is the module's object */
    if (!this.$used) {
        return;
    }
    
    /* Verify the default filter levels. */
    if (this.filterByLevel) {       
        /* Verify that all bits appear in one of the four masks */
        
        /* Create a mask of all bits configured in the filter masks. */
        var filterMask = this.level1Mask | this.level2Mask | 
                         this.level3Mask | this.level4Mask;
                
        /* 
         * Ensure that all bits are accounted for. We don't care here whether
         * the assert bits have been set anywhere or not (the ALL_LOGGING mask
         * excludes the assert bits).
         */
        if ((filterMask & Diags.ALL_LOGGING) != Diags.ALL_LOGGING) {
            this.$logError("Not all bits are accounted for in the filter " + 
                           "masks, 'level1Mask' - 'level4Mask'. All four " +
                           "masks must combine to equal Diags.ALL_LOGGING.",
                           this, "[level1Mask - level4Mask]");
        }
        
        /* 
         * Verify that no bits appear in more than one mask. To verify this,
         * we have to check every possible combination of masks.
         */
        if (((this.level1Mask & this.level2Mask) != 0) ||
            ((this.level1Mask & this.level3Mask) != 0) ||
            ((this.level1Mask & this.level4Mask) != 0) ||
            ((this.level2Mask & this.level3Mask) != 0) ||
            ((this.level2Mask & this.level4Mask) != 0) ||
            ((this.level3Mask & this.level4Mask) != 0)) {
            this.$logError("No diags bit should appear in more than one of " +
                           "the filter masks, 'level1Mask' - 'level4Mask'", 
                           this, "[level1Mask - level4Mask]");
        }
    }
    
    /* 
     * If Memory is not used, and the memory policy is not static, it is an
     * error.
     */
    var Defaults = xdc.module('xdc.runtime.Defaults');
    var Types = xdc.module('xdc.runtime.Types');
    if ((Defaults.getCommon(this, "memoryPolicy") != Types.STATIC_POLICY)
        && xdc.module('xdc.runtime.Memory').$used != true) {
        this.$logError("'common$.memoryPolicy' must be 'STATIC_POLICY' "
            + "when 'xdc.runtime.Memory' is not used", this, 
            "common$.memoryPolicy");  
    }
}
