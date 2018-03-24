/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

/*
 *  ======== run ========
 */
function run(cmdr, args)
{
    /* Check for command line parameters */
    if ((args.length == 0) ||
        (this.repositoryPath == null) ||
        (this.schemaFile == null)) {
        cmdr.usage();
    }

    var opts = {};
    for (var p in this) {
        opts[p] = this[p];
    }

    var pkgName = args[0];

    var outDir = this.repositoryPath + "/" + pkgName.replace(/\./g ,'\/');

    /* Parse XML schema */
    var platformSchema  = _getPlatformSchema(this.schemaFile);
    opts.platformSchema =  platformSchema;

    /* Generate package files */
    var Main = xdc.module("xdc.tools.mkpkg.Main");
    Main.update = true;

    Main.mkpkg(
        "xdc/tools/platformWizard/template",
        outDir,
        pkgName,
        opts
    );

    /* Build package */
    var XDCROOT = environment['xdc.root'];
    var cmdarr = [XDCROOT + '/xdc','release',
                  '--directory',outDir];
    if (environment["XDCPATH"] != null) {
        var cmdarr = [XDCROOT + '/xdc',"XDCPATH=" + environment["XDCPATH"],
                      'release',
                      '--directory',outDir];
    }
    var ret = _localExec(cmdarr);

    /* In case of an error return error stream */
    return ((ret.status == 0) ? null : ret.errStream.log);
}

/*
 *  ======== _copy_stream ========
 */
function _copy_stream(ins, outs) {
    var thread = new java.lang.Thread(function() {
        var isr = new java.io.InputStreamReader(ins);
        var br = new java.io.BufferedReader(isr);
        var line;
        while (line = br.readLine()) {
            outs.log += (line + " ");
        }
    });
    thread.start();
    return (thread);
}

/*
 *  ======== _localExec ========
 *  Execute a program. Works around some difficulties in executing the XDC
 *  command using xdc.exec(); we need to output lines as soon as they are
 *  available for long running commands.
 */
function _localExec(cmdarr)
{
    /* generate the name of the XDC command on this OS */
    var os = java.lang.System.getProperty("os.name") + "";
    if (os.match(/^Windows/i)) {
        cmdarr[0] += ".exe";
    }

    /* create the command array */
    var cmdarr_j = java.lang.reflect.Array.newInstance(
        java.lang.String, cmdarr.length);
    for (var i = 0; i < cmdarr.length; i++) {
        cmdarr_j[i] = cmdarr[i];
    }

    /* copy the environment array from the current environment */
    var env = java.lang.System.getenv();

    /* We need to set XDCTOOLS_JAVA_HOME, if it's not being set already */
    var javahome = java.lang.System.getProperty("java.home");

    var keys = env.keySet().toArray();
    var envSize = keys.length;
    if (java.lang.System.getenv("XDCTOOLS_JAVA_HOME") == null
        && javahome != null) {
        envSize = envSize + 1;
    }
    var env_j = java.lang.reflect.Array.newInstance(
        java.lang.String, envSize);
    for (var i = 0; i < keys.length; i++) {
        var key = keys[i];
        env_j[i] = key + '=' + env.get(key);
    }
    if (envSize > keys.length) {
        env_j[envSize - 1] = "XDCTOOLS_JAVA_HOME=" + javahome;
    }

    /* create the process */
    var runtime = java.lang.Runtime.getRuntime();
    var proc = runtime.exec(cmdarr_j, env_j);

    /* create threads to copy the stdout and stderr streams */

    var result = new Object();
    result.errStream = new Object();
    result.outStream = new Object();

    result.errStream.log = "";
    result.outStream.log = "";

    var cpyerr = _copy_stream(proc.getErrorStream(), result.errStream);
    var cpyout = _copy_stream(proc.getInputStream(), result.outStream);

    /* wait for the process to complete */
    var status = proc.waitFor();
    result.status = status;

    /* wait for the streams to complete */
    cpyerr.join();
    cpyout.join();

    /* return the exit status of the process */
    return (result);
}

/*
 *  ======== _setMemoryMapArray ========
 */
function _setMemoryMapArray(schema, memoryMap) {
    var k = 0;
    for each(var elem in memoryMap) {
        var memMap = new Object();
        memMap.name = elem.name[0];
        memMap.base = elem.base[0];
        memMap.len =  elem.len[0];
        memMap.space = elem.space[0];
        memMap.access = elem.access[0];
        schema.memMapArray[k++] = memMap;
    }
}

/*
 *  ======== _getPlatformSchema ========
 */
function _getPlatformSchema(fileName)
{
    var schema = {};

    var e4x = xdc.loadXML(fileName);

    schema.memMapArray = new Array();

    if ("externalMemoryMap" in e4x) {
        schema.customMemoryMap = false;
        _setMemoryMapArray(schema, e4x.externalMemoryMap);
    }
    else if ("customMemoryMap" in e4x) {
        schema.customMemoryMap = true;
        _setMemoryMapArray(schema, e4x.customMemoryMap);
    }

    /* cpuCore */
    schema.cpuCore = new Object();

    schema.cpuCore.name = e4x.cpuCore[0].name[0];
    schema.cpuCore.clockRate = e4x.cpuCore[0].clockRate[0];
    schema.cpuCore.catalogName = e4x.cpuCore[0].catalogName[0];
    schema.cpuCore.deviceName = e4x.cpuCore[0].deviceName[0];
    schema.cpuCore.dataMemory = e4x.cpuCore[0].dataMemory[0];
    schema.cpuCore.stackMemory = e4x.cpuCore[0].stackMemory[0];
    schema.cpuCore.codeMemory = e4x.cpuCore[0].codeMemory[0];

    schema.cpuCore.register = new Array();
    j = 0;
    for each(var c in e4x.cpuCore[0].register) {
        var register = new Object();
        register.name = c.name[0];
        register.value = c.value[0];
        schema.cpuCore.register[j++] = register;
    }

    return schema;
}
/*
 *  @(#) xdc.tools.platformWizard; 1,0,0,0; 1-9-2017 12:51:43; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

