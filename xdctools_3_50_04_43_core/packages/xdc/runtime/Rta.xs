/*
 *  ======== genRta ========
 */
function genRta(outputFileName)
{
    var file = new java.io.File(outputFileName);
    file["delete"]();
    var out = new java.io.FileWriter(outputFileName);
    out = new java.io.BufferedWriter(out);

    var rts = xdc.om['xdc.runtime'];

    var data = new rts.Types.RtaDecoderData;
    data.targetName = Program.build.target.$name;
    data.binaryParser = Program.build.target.binaryParser;

    /* 
     * Add all instances of modules which implement ILogger to the meta data.
     * This list is primarily used for supporting control commands.
     */
    var ILogger = xdc.module('xdc.runtime.ILogger');
    for (var i = 0; i < xdc.om.$modules.length; i++) {
        var mod = xdc.om.$modules[i];
        
        /* If this module implements the ILogger interface. */
        if (mod instanceof ILogger.Module) {
            /* Add each of the module's instances. */
            for (var j = 0; j < mod.$instances.length; j++) {
                addLoggerInst(data, mod, mod.$instances[j].$orig, j);
            }
            
            /* get emebdded loggers too */
            for (var j = 0; j < mod.$objects.length; j++) {
                addLoggerInst(data, mod, mod.$objects[j].$orig, j);
            }
        }
    }
    
    /*
     * For each module, store the logger associated with it and its initial
     * diags configuration.
     */
    var targetModules = Program.targetModules();
    for (var i = 0; i < targetModules.length; i++) {
        var mod = targetModules[i];
        if (!mod.PROXY$) {

            var loggerInst = "";
            if (mod.common$.logger == null) {
                loggerInst = "null";
            }
            else if (mod.common$.logger.$orig.instance.name) {
                loggerInst = mod.common$.logger.$orig.instance.name;
            }
            else {
                loggerInst = String(mod.common$.logger.$orig);
            }

            data.modMap[mod.$name] = {
                id: mod.Module__id,
                logger: loggerInst,
                /*
                 * Mask has the form EXLIAS00123456FZ
                 * Deprecation of USER7 and USER8: In the generation of the
                 * mask constants in Diags.xs/module$static$init, USER7 and
                 * USER8 are deprecated and the code ensures that 7 and INFO
                 * and 8 and ANALYSIS have the same values. So we can just use
                 * INFO and ANALYSIS here.
                 */
                diagsMask: String(Number(mod.common$.diags_ENTRY)) +
                       String(Number(mod.common$.diags_EXIT)) +
                       String(Number(mod.common$.diags_LIFECYCLE)) +
                       String(Number(mod.common$.diags_INTERNAL)) +
                       String(Number(mod.common$.diags_ASSERT)) +
                       String(Number(mod.common$.diags_STATUS)) +
                       "00" +
                       String(Number(mod.common$.diags_USER1)) +
                       String(Number(mod.common$.diags_USER2)) +
                       String(Number(mod.common$.diags_USER3)) +
                       String(Number(mod.common$.diags_USER4)) +
                       String(Number(mod.common$.diags_USER5)) +
                       String(Number(mod.common$.diags_USER6)) +
                       String(Number(mod.common$.diags_INFO)) +
                       String(Number(mod.common$.diags_ANALYSIS))
            };
        }
    }

    /* Create the event map */
    for (var id in rts.Log.idToInfo) {
        var info = rts.Log.idToInfo[id].split('::');
        data.evtMap[info[0]] = {
            id: Number(id.substring(1)),
            msg: java.net.URLEncoder.encode(info[1], 'UTF-8')
        };
    }

    /* Target specific constants. */
    data.eventSize = rts.Log.EventRec.$sizeof();
    data.argSize = Program.build.target.stdTypes.t_IArg.size;

    data.bitsPerChar = Program.build.target.bitsPerChar;
    data.endian = Program.build.target.model.endian;

    /* 
     * The data and control transport classes to use for communicating with the
     * target.
     */
    if (this.dataTransportClassName != "") {
        data.dataTransportClassName = this.dataTransportClassName;
    }
    if (this.controlTransportClassName != "") {
        data.controlTransportClassName = this.controlTransportClassName;
    }
    
    out.write(String(data.$xml()));
    out.write('\n');

    out.close();
}

/*
 *  ======== addLoggerInst ========
 */
function addLoggerInst(data, mod, inst, index)
{    
    data.loggers.length++;
    
    var logger = {};
    
    /* Store the instance name if one was given. */
    if (inst.instance.name) {
        logger.name = inst.instance.name;
    }
    else {
        logger.name = String(inst);
    }
    
    /* Store the type of the logger instance. */
    logger.type = String(mod);
    
    /* Store the meta data provided for this logger instance. */
    var metaArgs = mod.getMetaArgs(inst, index);
    logger.metaArgs = metaArgs;
    
    /* Add the logger to the list */
    data.loggers[data.loggers.length - 1] = logger;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

