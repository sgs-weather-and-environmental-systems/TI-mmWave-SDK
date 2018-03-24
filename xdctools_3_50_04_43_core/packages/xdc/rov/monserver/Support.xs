/* --COPYRIGHT--,EPL
 *  Copyright (c) 2016 Texas Instruments Incorporated
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * --/COPYRIGHT--*/

var debug = {
    println: function(msg) {}
};

var model = null;

var MAXDEPTH = 48;

/*
 *  ======== stopModel ========
 */
function stopModel()
{
    if (model != null) {
        if (model.reader != null) {
            model.reader.close();  /* close target memory reader */
            model.reader = null;
        }
        if (model.elf != null) {
            model.elf.close();  /* close elf symbol reader */
            model.elf = null;
        }

        if (model.started && Program != null) {
            Program.resetMods();
        }
    }
}

/*
 *  ======== startModel ========
 */
function startModel(execPath, urlArgs, logger, progress)
{
    if (urlArgs == null) {
        urlArgs = [];
    }

    if (logger != null) {
        debug = logger;
    }

    /* convert urlArgs "name[=value]" strings to a hash named args */
    var args = {};
    for (var i = 0; i < urlArgs.length; i++) {
        if (i == 0) debug.println("URL args:");

        var arg = urlArgs[i];
        debug.println("    " + arg);

        var k = arg.indexOf('=');
        var name = arg.substr(0, k);
        var value = arg.substr(k + 1);
        if (name == "") {
            name = value; /* if there's no '=', treat val as a boolean name */
            value = true;
        }
        args[name] = value;
    }

    var ip = ("comm" in args) ? args["comm"] : "UART:COM14";

    /* shutdown any previously open model state */
    stopModel();

    model = {};

    /* load recap file */
    var rInst = new Packages.xdc.rta.Recap();
    var recapFile = rInst.locateRecap(execPath, ".rov.xs");
    var recap = xdc.loadCapsule(recapFile);
    progress("Loaded the executable's configuration data: " + recapFile);

    /* check to make sure exe is a supported format */
    var parser = recap.build.target.binaryParser;
    if (parser && parser != "ti.targets.omf.elf.Elf32") {
        throw (new Error("ROV only supports Elf object files"));
    }

    /* parse exe for symbols */
    xdc.loadPackage("ti.targets.omf.elf");
    model.elf = new Packages.ti.targets.omf.elf.Elf32();
    try {
        var err = model.elf.parse(execPath);
        if (err != null && err != "") {
            throw (err);
        }
        model.elf.parseSymbols();
    }
    catch (e) {
        var msg = "Elf reader failed while reading '"
            + execPath + "' " + String(e).replace(/Error:/g, ':');
        debug.println(msg);
        throw (new Error(msg));
    }
    progress("Loaded the executable's symbols");

    var sym = xdc.module('xdc.rov.monserver.SymbolTable').create(model.elf);

    var dummyCB = xdc.module("xdc.rov.monserver.DummyCallBack").create();

    /* create connection to target memory reader */
    if (ip.indexOf("DSLite") == 0) {
        /* We have to know in advance DSLite's WebSocket port. This value may
         * be specified in the ip string, otherwise it must match the 
         * environment variable TI_DS_WEBSOCKET_PORT, which is 
         * defined either in System environment or in ticloudagent.bat in the
         * TI Cloud Agent installation.
         */
        var coreId = 0;
        var dslitePort = ip.split(":", 2)[2];
        if (dslitePort == undefined || dslitePort == "undefined") {
            dslitePort = args["wsPort"];
            if (dslitePort == null) {
                var env = java.lang.System.getenv("TI_DS_WEBSOCKET_PORT");
                if (env != null) {
                    dslitePort = String(env);
                }
                else {
                    throw new Error("can't detect DSLite port");
                }
            }
            dslitePort = Number(dslitePort);
        }

        /* get specified DS core id (TODO: use core name!) */
        var tmp = ip.split(":", 2)[1];
        if (tmp != null) {
            tmp = parseInt(tmp);
            if (!isNaN(tmp)) {
                coreId = tmp;
            }
        }

        try {
            debug.println("starting DSMemoryReader(" 
                          + dslitePort + ", " + coreId + ", ...) ...");
            model.reader = new Packages.xdc.rov.monserver.DSMemoryReader(
                dslitePort, coreId, model.elf);
        }
        catch (x) {
            debug.println("can't create DSMemoryReader: " + x);
            throw (x);
        }
    }
    else {
        try {
            model.reader = new Packages.xdc.rov.monserver.MemoryImage(
                ip, model.elf);
        }
        catch (x) {
            debug.println("can't create MemoryImage: " + x);
            throw (x);
        }
    }
    progress("Opened port: " + ip);

    try {
        /* Get the target-specific memory attrs */
        var endianStr = recap.build.target.model.endian;
        var endian = Packages.xdc.rov.TargetType.strToEndianess(endianStr);
        var bitsPerChar = recap.build.target.bitsPerChar;

        /* create top-level memory reader */
        var mem = new Packages.xdc.rov.MemoryImage(
                      model.reader, endian, bitsPerChar);

        progress("Memory reader instance created.");

        /* try to verify target's exe is the specified executable */
        if (ip.indexOf("DSLite") != 0) {
            //checkTarget(model, execPath, progress);
        }

        /* start ROV model */
        var Model = xdc.useModule("xdc.rov.Model");
        Model.start(4, execPath, recap, sym, mem, dummyCB);

        /* close elf file to avoid file conflicts with external apps */
        model.elf.close();

        if (ip.indexOf("DSLite") == 0) {
            /* model.reader is a DSMemoryReader instance */
            var callStack = xdc.module("xdc.rov.monserver.CallStack").create(
                model.reader);
            Model.setICallStackInst(callStack);
        }

        if ("setThrowViewErrors" in Program) {
            Program.setThrowViewErrors(false);
        }
    } 
    catch (x) {
        stopModel(); /* need to close the connection if there's a problem */
        throw x;
    }

    model.started = true;
    progress("ROV Model started");

    /* Retrieve the MemoryImage java object. */
    //debug.println("Warning: adding [0x20000000, 0x20040000) to the valid addresses");
    //var Model = xdc.module("xdc.rov.Model");
    //var memReader = Model.getMemoryImageInst();
    //var sections = memReader.getSections();
    //sections.addSection(0x20000000, 0x20040000);

    return;
}

/*
 *  ======== checkTarget ========
 */
function checkTarget(model, execPath, progress)
{
    var elfSum;
    var targetSum;

    /* if Elf supports checksums, compute them */
    if ("getSectionCRC" in model.elf) {

        /* verify that the elf .text section matches what's running */
        var s, text;
        for (var i = 0; (s = model.elf.getSectionHeader(i)) != null; i++) {
            if (String(s.name) == ".text") {
                text = s;
                break;
            }
            else if ((s.sh_flags & 6) == 6) {
                text = s;
            }
        }

        elfSum = model.elf.getSectionCRC(text, text.sh_addr, text.sh_size);

        progress("computing checksums: start = " + text.sh_addr 
                 + ", len = " + text.sh_size);

        /* can the target compute its own checkSum? */
        var hasSum = model.elf.getSymbolValue("xdc_rov_runtime_Mon__checksum");
        if (hasSum == 1) {
            targetSum = model.reader.checkSum(text.sh_addr, text.sh_size);
        }
        else {
            /* if not, compute the checksum locally (and slowly) */
            targetSum = model.reader.checkSumLocal(text.sh_addr, text.sh_size);
        }
    }

    if (elfSum != null && targetSum != null && targetSum != elfSum) {
        throw new Error("The executable '" + execPath
            + "' doesn't match the target's program: file checksum (0x"
            + Number(elfSum).toString(16) 
            + ") != target's checksum (0x"
            + Number(targetSum).toString(16) + ")");
    }

    progress("checksums: target = " + targetSum + ", elf = " + elfSum);
}

/*
 *  ======== close ========
 */
function close()
{
    stopModel();
}

/*
 *  ======== stringify ========
 *  This function and the ones invoked from it are running a simple replacement
 *  for JSON.stringify().
 */
function stringify(obj, indent, path)
{
    if (indent == null) {
        indent = "";
    }

    if (path == null) {
        path = "";
    }

    if (obj == null) {
        return (null);
    }

    var prefix = "\n";
    var suffix = "";
    var s;

    if (obj instanceof Array && obj.length == 0
        && Object.keys(obj).length != 0) {
        /* convert empty Array's with keys to hash tables (blech!) */
        s = "{";
    }
    else if (obj instanceof Array
        || ("$category" in obj && obj.$category == "Vector")) {
        /* otherwise Array's and RTSC Vector's are JSON arrays */
        s = processArray(obj, indent, path);
        return (s);
    }
    else if ("$category" in obj && obj.$category == "Addr") {
        /* map RTSC Addr's to simple string */
        return ('"' + String(obj) + '"');
    }
    else {
        /* everything else is a hash table */
        s = "{";
    }

    if ("address" in obj) {
        s = s.concat(prefix + indent + "    \"address\": \"0x"
            + Number(obj.address).toString(16) + '"');
        prefix = ",\n";
        suffix = "\n" + indent;
    }

    for (var prop in obj) {
        if (prop[0] != '#'
            && (prop.indexOf('$') == -1 
                || prop == "common$" || prop == "$addr" || prop == "$label")
                || prop == "$name" || prop == "$type" 
                || prop == "$category") {
            var field = obj[prop];
            var next;
            if (field == null) {
                next = field;
            }
            else if (prop == "common$" && path.indexOf("common$") != -1) {
                next = "\"<...>\""; /* never follow more then one common$ */
            }
            else if (typeof field == 'string'
                || field instanceof java.lang.String) {
                next = localEscape(field);
            }
            else if (typeof field == 'object' || typeof field == 'function') {
                if ("$category" in field && field.$category == "Addr") {
                    next = "\"0x" + Number(field).toString(16) + '"';
                }
                /* cutoff to prevent an infinite loop */
                else if (indent.length >= MAXDEPTH) {
                    next = "\"<Maximum depth reached>\"";
                }
                else {
                    var tmp = indent + "    ";
                    next = stringify(field, tmp, path + "." + prop);
                }
            }
            else if (typeof field == 'number') {
                next = '"' + field + '"';
            }
            else if (typeof field == 'boolean') {
                next = field;
            }
            else {
                continue; /* skip over unknown types *and* undefined */
            }
            if (next == undefined) {
                next = null;
            }

            /* Special case for Raw views. */
            if (indent.length == 0) {
                if (prop == "modCfg") {
                    prop = "Module Configuration Parameters";
                }
                else if (prop == "modState") {
                    prop = "Module State";
                }
                else if (prop == "instStates") {
                    prop = "Instance States";
                }
            }
            var pname = '"' + prop + "\": ";

            s = s.concat(prefix + indent + "    " + pname + next);
            prefix = ",\n";
            suffix = "\n" + indent;
        }
    }

    /* add any error/warning annotations */
    if ("$status" in obj) {
        for (var prop in obj.$status) {
            var msg = obj.$status[prop];
            if (msg != null) {
                s = s.concat(prefix + '"' 
                             + prop + "$status\": " + localEscape(msg));
            }
        }
    }

    s = s.concat(suffix + "}");
    return (s);
}

/*
 *  ======== processArray ========
 */
function processArray(array, indent, path)
{
    var prefix = "\n";
    var suffix = "";

    var s = "[";
    for (var i = 0; i < array.length; i++) {
        var field = array[i];
        var next = processArrayBody(field, indent, path + "[" + i + "]");
        s = s.concat(prefix + indent + "    " + next);
        prefix = ",\n";
        suffix = "\n" + indent;
    }
    s = s.concat(suffix + "]");
    return (s);
}

/*
 *  ======== processArrayBody ========
 */
function processArrayBody(field, indent, path)
{
    var next;
    if (field == undefined || field == null) {
        return (null);
    }
    else if (indent.length >= MAXDEPTH) {
        next = "\"<Maximum depth reached>\"";
    }
    else if (field instanceof Array
        || (typeof field == "object" && "$category" in field
            && field.$category == "Vector")) {
        next = processArray(field, indent + "    ", path);
    }
    else if (typeof field == 'string' || field instanceof java.lang.String) {
        next = localEscape(field);
    }
    else if (typeof field == 'object' || typeof field == 'function') {
        //displayStatus(field, "ArrayBody");
        var tmp = indent + "    ";
        next = stringify(field, tmp, path);
    }
    else if (typeof field == 'number') {
        next = '"' + field + '"';
    }
    else if (typeof field == 'boolean') {
        next = field;
    }
    else {
        next = null;
    }

    return (next);
}

/*
 *  ======== localEscape ========
 *
 *  escaping eols in multiline strings
 */
function localEscape(inp)
{
    return (JSON.stringify(inp));
    //return (JSON.stringify(inp.replace(/[\r\n]/g, "%0A")));
}

/*
 *  ======== displayStatus ========
 */
function displayStatus(obj, where)
{
    if ("$status" in obj) {
        debug.println("======== $status in " + where + ": " + obj);
        var msgs = obj["$status"];
        for (var f in msgs) {
            if (msgs[f] != null) {
                debug.println("    " + f + ": " + msgs[f]);
            }
        }
    }
}
