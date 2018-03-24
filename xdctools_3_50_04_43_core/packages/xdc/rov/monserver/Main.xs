/* --COPYRIGHT--,EPL
 *  Copyright (c) 2016-2017 Texas Instruments Incorporated
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * --/COPYRIGHT--*/

var eol = "\r\n";

var server;
var pw;
var Support = xdc.module("xdc.rov.monserver.Support");

var logFile = java.lang.System.getenv("XDC_ROV_MONSERVER_LOG");

var debug = {
    init: function() {
        if (logFile != null && this.debugfile == null) {
            if (logFile == "-") {
                this.debugfile = java.lang.System.out;
            }
            else {
                var fos = new java.io.FileOutputStream(logFile, true);
                this.debugfile = new java.io.PrintStream(fos);
            }
        }
    },
    println: function(msg) {
        if (this.debugfile != null) {
            this.debugfile.println(msg);
        }
    },
    flush: function() {
        if (this.debugfile != null) {
            this.debugfile.flush();
        }
    },
    close: function() {
        if (this.debugfile != null) {
            this.debugfile.flush();
            if (logFile != "-") {
                this.debugfile.close();
                this.debugfile = null;
            }
        }
    },
    stop: function() {
        if (this.debugfile != null) {
            this.debugfile.flush();
            this.debugfile = null;
        }
    }
};

/*
 *  ======== progress ========
 */
function progress(msg) 
{
    pw.println("<BOM>Working: " + msg + "<EOM>");
    pw.flush();
}

/*
 *  ======== run ========
 */
function run(cmdr, args)
{
    debug.init();
    debug.println("\nstarting the " + this.$package + " ...");
    debug.println("    package path: " + xdc.curPath());

    pw = new java.io.PrintWriter(java.lang.System.out);
    var isr  = new java.io.InputStreamReader(java.lang.System.in);
    var br = new java.io.BufferedReader(isr);
    var line;

    /* HACK to work around HW bug (LPRFTOOLS-292) */
//    xdc.global["DISABLE_READ_RTC"] = true; /* remove or set to false to remove the workaround */

    while (true) {
        var execCmd;

        debug.println("waiting for a request ...");

        /* close debug to allow log file deletion while
         * we wait for commands
         */
        debug.close();

        /* get next command */
        line = br.readLine();

        /* re-open log file (if necessary) */
        debug.init();
        debug.println("***" + line + "***");
        if (line == null) {
            break; /* input stream was closed, so we exit */
        }
        line = String(line);

        var start = java.lang.System.currentTimeMillis();

        /* execute new command */
        if (line.indexOf("exec:") == 0) {
            var msg = "<BOM>OK<EOM>";
            var suffix = line.substr(5);
            if (suffix != execCmd) {
                execCmd = suffix;
                var tokens = suffix.split(/[?&]/);
                var execPath = tokens[0];
                if (java.io.File(execPath).exists()) {
                    progress("starting ROV model ...");
                    tokens.shift(1);
                    try {
                        Support.startModel(execPath, tokens, debug, progress);
                    }
                    catch (e) {
                        var emsg = String(e).replace(
                                /JavaException:.*java.lang.Exception/g, "");
                        msg = "<BOM>Error: Failed to start ROV using '" + tokens
                            + "':" + emsg + "<EOM>";
                        execCmd = null;
                    }
                }
                else {
                    msg = "<BOM>Error: The executable file '" + execPath
                        + "' doesn't exist<EOM>";
                    execCmd = null;
                }
            }
            pw.println(msg);
            pw.flush();
        }
        else if (line == "clear") {
            /* 'clear' means that a new executable needs to be supplied next */
            execCmd = null;
            pw.println("<BOM>OK<EOM>");
            pw.flush();
        }
        else if (line == "exit") {
            pw.println("<BOM>OK<EOM>");
            debug.println("Exiting " + this.$module.$name);
            break;
        }

        /* Any of the commands processed below can be accepted only if the
         * executable is already supplied.
         */
        else if (execCmd == undefined) {
            var errormsg = "<BOM>Error: The executable hasn't been supplied yet!<EOM>";
            pw.println(errormsg);
            pw.flush();
        }
        else if (line == "list") {
            var views = getViews();
            var ret = JSON.stringify(views);
            pw.println("<BOM>" + ret + "<EOM>");
            pw.flush();
        }
        else if (line.indexOf("view:") == 0) {
            /* Requests for views are supplied as "view:Module,View"
             * strings.
             */
            var mod = line.substring(5, line.indexOf(','));
            var view = line.substr(line.indexOf(',') + 1);
            if (view == "undefined" || view == "null") {
                debug.println("Error: undefined or null view requested");
                view = "Raw";
            }
            var ret = getView(mod, view);
            if (typeof ret == "object") { /* this includes null */
                ret = Support.stringify(ret, "");
            }
            if (ret == undefined) {
                ret = "Error: " + mod 
                      + " returned undefined for the view " + view;
            }

            pw.println("<BOM>" + ret + "<EOM>");
            pw.flush();
            debug.println("view sent to Polymer: " + ret);
            debug.println(getStatusLines("Target errors detected:\n", "    "));
        }
        else if (line == "addons") {
            var addons = discoverAddons();
            var ret = JSON.stringify(addons);
            pw.println("<BOM>" + ret + "<EOM>");
            pw.flush();
        }

        /* log time to execute command */
        debug.println("    ***" + line + "*** completed in "
            + (java.lang.System.currentTimeMillis() - start) + " ms");
    }

    /* exit this server */
    debug.println("exiting ROV server (" + this.$module.$name + ") ...");
    debug.close();

    br.close();
    pw.close();
    Support.close();

    /* explicitly exit: needed to work around a bug (probably in the
     * web socket library) that prevents the JVM from exiting due to 
     * non-daemon thread created as part of the socket connection which 
     * is not closed.
     */
    java.lang.System.exit(0); 
}

/*
 *  ======== discoverAddons ========
 *  Return an array of server-side addon paths
 *
 *  discovery algorithm:
 *      var result = [];
 *      var roots = [<paths in XDC_ROV_HTTPROOTS>, <http initial root>];
 *      for (all http roots) {
 *          if (<root>/"addons.json" exists) {
 *              list = load(<root>/addons.json);
 *              for (all objs in list) {
 *                  if (obj.id and obj.path are globally unique) {
 *                      var addon = {path: obj.path, name: obj.name, root:root}
 *                      result.push(addon);
 *                  }
 *              }
 *          }
 *      }
 *      return (result);
 *
 *  Assumes: the initial root of the HTTP server is the base of 
 *           xdc.rov.polymerUI
 */
function discoverAddons()
{
    var result = [];
    
    /* create search path from env and initial root */
    var roots = [];
    var rootsEnv = java.lang.System.getenv("XDC_ROV_HTTPROOTS");
    if (rootsEnv != null) {
        roots = String(rootsEnv).split(/;+/);
    }
    var init = xdc.findFile("xdc/rov/polymerUI");
    if (init) {
        roots.push(init); /* add initial http "/" */
    }
    
    /* find "addons.json" in a root */
    var ids = {};
    var paths = {};
    for (var i = 0; i < roots.length; i++) {
        var root = roots[i];
        if (root != "") {
            var list = loadJSON(root + "/addons.json");
            for (var j = 0; j < list.length; j++) {
                var addon = list[j];
                if (ids[addon.id] == null && paths[addon.path] == null) {
                    ids[addon.id] = 1;
                    paths[addon.path] = 1;
                    result.push({path: addon.path, name: addon.name, root: root});
                    //result.push(addon.path);
                }
            }
        }
    }

    return (result);    
}

/*
 *  ======== getViews ========
 *  The list of modules and views is returned as a map of arrays, where 
 *  keys are module names and values are arrays of the structures:
 *  [{name:"view1", type:"view1_type"}, ... ,{name:"viewN", type:"viewN_type}]
 */
function getViews()
{
    var Program = xdc.module("xdc.rov.Program");
    var ret = {};

    debug.println("Generating the list of available views ...");
    for (var i = 0; i < Program.moduleNames.length; i++) {
        var modName = Program.moduleNames[i];
        var mod = Program.getModuleDesc(modName);
        var viewArgs = getViewArgs(mod);

        if (mod.loadFailed) {
            debug.println("module " + modName
                          + " failed to load: " + mod.loadFailedMsg);
            continue; /* skip modules that can't be found */
        }
        var tabs = Program.getSupportedTabs(modName);
        var tabArray = [];
        for (var j = 0; j < tabs.length; j++) {
            var viewtype = String(tabs[j].type);
            var tabName = tabs[j].name;
            tabArray[j] = {
                name:    tabName,
                type:    viewtype.substr(viewtype.lastIndexOf('.') + 1),
                columns: getViewColumns(modName, tabName, viewtype),
                argsId:  getViewArgsId(mod, tabName)
            };
        }

        var mviews = {viewArgs: viewArgs, viewTabs: tabArray};

        //debug.println(mod.name + " views: " + JSON.stringify(mviews,null,2));
        ret[modName] = mviews;
    }

    return (ret);
}

/*
 *  ======== getViewArgs ========
 *  Get a module-specific hashtable of argument descriptions
 *
 *  This hashtable is indexed by the value of the argsId property in
 *  a specific ROV tab for the module mod.
 */
function getViewArgs(mod)
{
    var result = {};

    if (mod.viewInfo && "argsMap" in mod.viewInfo) {
        var argsMap = mod.viewInfo.argsMap;
        for (var i = 0; i < argsMap.length; i++) {
            var argsRec = argsMap[i];
            var key = argsMap.$keys[i];
            var val = {
                description: argsRec.description,
                args: []
            };
            for (var j = 0; j < argsRec.args.length; j++) {
                var arg = argsRec.args[j];
                val.args.push({
                    name: arg.name,
                    type: arg.type,
                    value: arg.defaultValue
                });
            }
            result[key] = val;
        }
        if (false && argsMap.length > 0) {
            debug.println(mod.name + ".viewArgs: "
                          + JSON.stringify(result, null, 2));
        }
    }

    return (result);
}

/*
 *  ======== getViewArgsId ========
 *  Get the id/key into the module-specific viewArgs hashtable
 */
function getViewArgsId(mod, tabName)
{
    if (mod.viewInfo) {
        var view = mod.viewInfo.viewMap[tabName];
        if (view != null) {
            //debug.println("module " + mod.name + ":"
            //    + tabName + ".argsId = " + view.argsName);
            return (view.argsName);
        }
        else {
            /* if tabName is "Raw", view == null */
        }
    }

    return undefined;
}

/*
 *  ======== getViewColumns ========
 */
function getViewColumns(modName, tabName, tabType)
{
    var cols = [];

    if (tabType == "xdc.rov.ViewInfo.INSTANCE" 
        || tabType == "xdc.rov.ViewInfo.MODULE") {
        /* address is not declared as part of module and instance views */
        cols = ["address"]; 
    }

    var mod = Program.getModuleDesc(modName);
    if (mod.cfg == null) {
        /* pure C module */
        var structName = mod.viewInfo.viewMap[tabName].structName;
        var dummy = new mod.useMod.$capsule[structName];
        for (var prop in dummy) {
            cols.push(prop);
        }
        return (cols);
    }

    if (tabName != "Raw") {
        var dummy = Program.newViewStruct(modName, tabName);
        for (var n in dummy) {
            cols.push(n);
        }
    }

    return (cols);
}

/*
 *  ======== getView ========
 */
function getView(mod, view)
{
    Program.resetMods();
    try {
        var viewType = Program.getViewType(mod, view);
        debug.println("Fetching " + mod + "." + view + " of type " + viewType);
        var ViewInfo = xdc.useModule("xdc.rov.ViewInfo");

        switch (String(viewType)) {
            case String(ViewInfo.MODULE):
                return (Program.scanModuleView(mod, view));
                break;
            case String(ViewInfo.INSTANCE):
                return (Program.scanInstanceView(mod, view));
                break;
            case String(ViewInfo.INSTANCE_DATA):
                return (Program.scanInstanceDataView(mod, view));
                break;
            case String(ViewInfo.MODULE_DATA):
                return (Program.scanModuleDataView(mod, view));
                break;
            case String(ViewInfo.RAW):
                return (Program.scanRawView(mod));
                break;
            case String(ViewInfo.TREE_TABLE):
                return (Program.scanTreeTableView(mod, view));
                break;
            case String(ViewInfo.TREE):
                return (Program.scanTreeView(mod, view));
                break;
            default:
                throw (new Error("Undefined view type: " + viewType));
                break;
        }
    }
    catch (e) {
        var msg = e.message;
        if (msg == null) {
            msg = String(e);
        }
        msg += getStatusLines("\n");
        debug.println("Fetch " + mod + "." + view + " of type " + viewType
              + " failed: " + msg);
        return ("Error: " + msg);
    }
}

/*
 *  ======== getStatusLines ========
 */
function getStatusLines(prefix, indent)
{
    prefix = prefix != null ? prefix : "";
    indent = indent != null ? indent : "";

    var result = "";
    var errs = Program.getStatusTable();
    for (var i = 0; i < errs.length; i++) {
        var e = errs[i];
        if (i == 0) result = prefix;
        result += indent + e.mod + ':' + e.tab + ':' + e.field
              + " (" + e.inst + "): " + e.message + '\n';
    }
    return (result);
}

/*
 *  ======== loadJSON ========
 */
function loadJSON(path)
{
    var lines = [];

    try {
        var file = new java.io.BufferedReader(new java.io.FileReader(path));
        var line;
        while ((line = file.readLine()) != null) {
            lines.push(String(line));
        }
    }
    catch(e) { /* ignore non-existent files */
        debug.println("loadJSON(" + path + ") failed: " + e.message);
    }

    if (file != null) {
        file.close();
    }

    return (lines.length == 0 ? [] : JSON.parse(lines.join("")));
}
