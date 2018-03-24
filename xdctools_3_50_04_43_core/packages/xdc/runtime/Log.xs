/* 
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
 * */
/*
 *  ======== Log.xs ========
 */

var Defaults = xdc.module('xdc.runtime.Defaults');
var Diags = xdc.module('xdc.runtime.Diags');

/*
 *  ======== lookupEventMessage ========
 *  Returns the format string for the event with the given id.
 */
function lookupEventMessage(eventId)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* Get the Log module's configuration object. */
    var cfg = Program.getModuleConfig('xdc.runtime.Log');

    if (cfg.idToInfo["#" + eventId] == undefined) {
        return ("<ERROR: No message found for eventId #" + eventId + ">");
    }
    else {
        return (cfg.idToInfo["#" + eventId].split('::')[1]);
    }
}

/*
 *  ======== getTargetArgSize ========
 *  Returns the target size of a record argument in bytes (not MAUs).
 */
function getTargetArgSize()
{
    /* Guaranteed to be 4 bytes on all targets. */
    return (4);
}

/*
 *  ======== lookupEventName ========
 */
function lookupEventName(eventId)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* Get the Log module's configuration object. */
    var cfg = Program.getModuleConfig('xdc.runtime.Log');

    if (cfg.idToInfo["#" + eventId] != undefined) {
        return (cfg.idToInfo["#" + eventId].split('::')[0]);
    }
    else if (info.eventId == 0) {
        return ("Log_print");
    }
    else {
        return ("Unrecognized event id: " + eventId);
    }
}

/*
 *  ======== lookupModuleName ========
 */
function lookupModuleName(modId)
{
    var Program = xdc.useModule('xdc.rov.Program');
    return (Program.moduleIdToName(modId));
}

/*
 *  ======== getTargetEventRecSize ========
 *  Returns the record size in bytes (not MAUs).
 */
function getTargetEventRecSize()
{
    var bytesPerMau = Program.build.target.bitsPerChar / 8;
    return (this.EventRec.$sizeof() * bytesPerMau);
}

/*
 *  ======== Event$alignof ========
 *  Return alignment required for an encoded value of an EventDesc
 */
function Event$alignof()
{
    return (Program.build.target.stdTypes.t_Int32.align);
}

/*
 *  ======== Event$encode ========
 *  Return a C expression that evaluates to the encoded value of an EventDesc
 */
function Event$encode(desc)
{
    var encodedDesc = "0";

    if (desc) {
        /*
         * Determine the event's priority. If none is specified, give it the
         * max priority so that it isn't inadvertently filtered out.
         */
        var priMask;
        if (desc.level != undefined) {
            priMask = desc.level;
        }
        else {
            priMask = Diags.LEVEL1;
        }

        /* Determine the mask value by combining the event mask and priority */
        var maskVal = (desc.mask | priMask) & 0xFFFF;

        /* If no IDs were assigned, Log is not used, but we still need to
         * generate events for modules that define Log_Events.
         */
        var id = desc.$private.id == undefined ? 0 : desc.$private.id;

        encodedDesc = "(((xdc_runtime_Log_Event)" + id + ") << 16 | "
            + maskVal + ")";
    }

    return (encodedDesc);
}

/*
 *  ======== Event$sizeof ========
 *  Return sizeof the encoded value of an EventDesc
 */
function Event$sizeof()
{
    return (Program.build.target.stdTypes.t_Int32.size);
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(obj, params)
{
    var Text = xdc.module('xdc.runtime.Text');
    var Diags = xdc.module('xdc.runtime.Diags');
    var internalCounter = 1;

    var pkgVers = {};
    for each (var mod in Program.targetModules()) {

        if (mod.PROXY$) {
            continue;
        }

        /* create an Id for all Log_Event's declared in the module */
        if ('$$logEvtCfgs' in mod && mod.$$logEvtCfgs.length > 0) {
            for each (var cn in mod.$$logEvtCfgs) {
                var desc = mod[cn];
                /* If Text is disabled, there are no strings in Text to manage
                 * and we don't want anything in 'idToInfo' and no warning about 
                 * the same ids.
                 */
                if (Text.isLoaded) {
                    desc.$private.id = Text.defineRopeCord(desc.msg);
                }
                else {
                    /* We still need to supply an ID because the API promises
                     * that all Log Events from a module are within a range and
                     * no other modules get an ID from that range.
                     */
                    desc.$private.id = internalCounter++;
                }

                var key = "#" + desc.$private.id;
                if (this.idToInfo[key] != null) {
                    var Warnings = xdc.module('xdc.Warnings');
                    var oldEvent = this.idToInfo[key].split('::');
                    this.$logWarning({warning: Warnings.LOGID, args:
                        [mod.$name + '.' + cn, oldEvent[0], oldEvent[1]]},
                        this, "idToInfo");
                }
                this.idToInfo[key] = mod.$name + '.' + cn + '::' + desc.msg;
            }
        }

        /* "inherit" the default logger */
        mod.Module__loggerObj = mod.common$.logger;

        /* If the module's header file was built with a version of XDCtools
         * prior to 3.20, we don't want to generate objects for new ILogger
         * functions because the original header files do not define the
         * required types. We have to do it for all modules even if they do
         * not have loggers.
         */
        
	var origVers = pkgVers[mod.$package.$name];
        if (origVers === undefined) {
	    /* get xdc version used to build mod.$package */
	    origVers = Packages.xdc.services.global.Vers.getXdcString(
		mod.$package.packageBase + "/package/package.defs.h");
	    pkgVers[mod.$package.$name] = origVers;
	}
        if (!origVers || (origVers < "xdc-v14" && origVers >= "xdc-a00")) {
            if (mod.$sealed("Module__loggerFxn0")) {
                mod.$unseal("Module__loggerFxn0");
                mod.$unseal("Module__loggerFxn1");
                mod.$unseal("Module__loggerFxn2");
            }
            mod.Module__loggerFxn0 = $$NOGEN;
            mod.Module__loggerFxn1 = $$NOGEN;
            mod.Module__loggerFxn2 = $$NOGEN;
        }

        if (mod.common$.logger) {
            var cn = mod.common$.logger.$orig.$module.$name;

            if (mod.Module__loggerFxn0 != "$$NOGEN") {
                mod.Module__loggerFxn0 = $externModFxn(cn + '.write0');
                mod.Module__loggerFxn1 = $externModFxn(cn + '.write1');
                mod.Module__loggerFxn2 = $externModFxn(cn + '.write2');
            }
            mod.Module__loggerFxn4 = $externModFxn(cn + '.write4');
            mod.Module__loggerFxn8 = $externModFxn(cn + '.write8');
            mod.Module__loggerDefined = true;
        }

        /* generate log event ids for loggable fxns in the module */
        var res = null;
        if ('$$loggables' in mod && mod.$$loggables.length > 0) {
            res = "";
            var sep = "";
            var id;
            var msg;
            var desc;
            for each (var fxn in mod.$$loggables) {
                res += sep;
                sep = ",";
                res += fxn.name;

                if (query(mod, 'ENTRY')) {
                    msg = "--> " + fxn.name + ": (" + fxn.entry + ")";
                    desc = new this.EventDesc({msg: msg});
                    if (Text.isLoaded) {
                        id = Text.defineRopeCord(msg);
                    }
                    else {
                        id = internalCounter++;
                    }
                    this.idToInfo['#' + id] = mod.$name + '.' + fxn.name +
                        '$ENTRY' + '::' + desc.msg;
                    desc.$private.id = id;
                    id = (id << 16) | Diags.ENTRY;
                }
                else {
                    id = 0;
                }
                res += ":" + id;

                if (query(mod, 'EXIT')) {
                    msg = "<-- " + fxn.name + ": " +
                        (fxn.exit ? fxn.exit : "void");
                    desc = new this.EventDesc({msg: msg});
                    if (Text.isLoaded) {
                        id = Text.defineRopeCord(msg);
                    }
                    else {
                        id = internalCounter++;
                    }
                    this.idToInfo['#' + id] = mod.$name + '.' + fxn.name +
                        '$EXIT' + '::' + desc.msg;
                    desc.$private.id = id;
                    id = (id << 16) | Diags.EXIT;
                }
                else {
                    id = 0;
                }
                res += ":" + id;
            }
        }

        /* record any generated event id's in module
         *    $$fxnEvtIds = "fxn_name:enter_id:exit_id,..."
         */
        mod.$$bind('$$fxnEvtIds', res);
    }
}

/*
 *  ======== query ========
 */
function query(mod, dl)
{
    var sel = 'diags_' + dl;
    return (mod.common$[sel] === undefined
        ? (Defaults.common$[sel] != Diags.ALWAYS_OFF)
            : (mod.common$[sel] != Diags.ALWAYS_OFF));
}

/*
 *  ======== validate ========
 */
function validate()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    var Diags = xdc.module('xdc.runtime.Diags');

    /*
     * Validate all of the event definitions in all of the modules in the
     * configuration.
     */
    for (var i = 0; i < xdc.om.$modules.length; i++) {
        var mod = xdc.om.$modules[i];

        /* TODO: check that there's no logger for "impossible" masks */

        /* check all Log_Event's declared in any module */
        if ('$$logEvtCfgs' in mod && mod.$$logEvtCfgs.length > 0) {
            for each (var cn in mod.$$logEvtCfgs) {
                var desc = mod[cn];

                if (mod.$used && desc.$private.id == null) {
                    this.$logWarning("The event '" + mod.$name + "." + cn
                        + "' has not been assigned an id.  Try adding "
                        + "xdc.useModule('xdc.runtime.Log') to your "
                        + "configuration", mod, cn);
                }
                /* check that mask is within UInt16 range */
                if (desc.mask < 0) {
                    this.$logError("value of 'mask' must be non-negative",
                        mod, cn);
                }
                else if (desc.mask > 0xFFFF) {
                    this.$logError("value of 'mask' must be at most 16 bits",
                        mod, cn);
                }

                /* Verify that ASSERT and INTERNAL aren't used in the mask */
                if ((desc.mask & Diags.ASSERT) ||
                    (desc.mask & Diags.INTERNAL)) {
                    this.$logError("The categories ASSERT and INTERNAL are " +
                                   "for asserts only and can not be used for" +
                                   " event definitions.", mod, cn);
                }

                /* Check that 'level' is within valid range. */
                if ((desc.level > Diags.LEVEL4) | (desc.level < Diags.LEVEL1)) {
                    this.$logError("value of 'level' must be between " +
                                   "Diags.LEVEL1 and Diags.LEVEL4", mod, cn);
                }
            }
        }
    }
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

