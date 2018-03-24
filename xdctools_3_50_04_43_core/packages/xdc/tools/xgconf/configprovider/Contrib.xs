/*
 *  ======== Contrib.xs ========
 */
var cfgMain;

/* replace the standard error reporter to collect JS errors */
var jsErrors = new java.io.ByteArrayOutputStream();
var ps = new java.io.PrintStream(jsErrors);
var rhino = Packages.org.mozilla.javascript;
var er = rhino.tools.ToolErrorReporter(true, ps);
var older = rhino.Context.currentContext.setErrorReporter(er);

/*
 *  ======== runUserScript ========
 *  This function has no business being in this file, and should be moved
 *  into xdc.cfg package. It's included here to avoid a compatibility break.
 *  Since the issue of controlling how much of the config model is executed
 *  has come up before, should make the xdc.cfg API robust enough to avoid
 *  changing it again for a long while.
 */
function runUserScript(script)
{
    cfgMain.$private.$$cfgCapsule._userscript(script);
    if (xdc.om.$$errors.length > 0) {
        return (cfgMain.$capsule.getErrors());
    }
    return ("");
}

/*
 *  ======== execConfig ========
 */
function execConfig(exeName, pkgName, cfgScript)
{
    var exception = null;
    var setRetVal, runRetVal, validateRetVal;
    var e = null;
    var e2 = null;

    try {
        var cfgtestDir = xdc.getPackageBase(pkgName);
        xdc.$$make_om('cfg');
        /* the following line should be removed before xdc-t34 */
        xdc.om.$$bind('$$genflg', 1);
        var saved_cwd = java.io.File('.').getCanonicalPath();
        utils.cwd =  cfgtestDir;
        
        /* identify the name of the package/cfg/*.cfg file */
        /* first try the XDCtools 3.21 (and later) name */
        var cfName = 'package/cfg/' +  exeName.replace(".x", ".p").replace(/\.([^\.]*)$/,"_$1") + ".cfg";
        if (!java.io.File(cfName).exists()) {
            /* then try the older XDCtools name */
            var oldCfName = 'package/cfg/' +  exeName.replace(/\.([^\.]*)$/,"_$1") + ".cfg";
            if (java.io.File(oldCfName).exists()) {
                cfName = oldCfName;
            }
        }

        /* initialize the configuration step */
        var time = $profile.start();
        cfgMain = xdc.module('xdc.cfg.Main');
        cfgMain.init();
        setRetVal = cfgMain.setExecutable(cfName, cfgtestDir);
        $profile.stop(time, "setExecutable");

        /* run the config model */
        if (!_hasError(setRetVal)) {
            time = $profile.start();
            var script = cfgScript? cfgScript : null;
            if (this.breakAfterUserScript) {
                /* run only the user script */
                runRetVal = runUserScript(script);
            }
            else {
                /* run the whole config model */
                runRetVal = cfgMain.runStringCfg(script);
            }
            $profile.stop(time, "runUserScript");

            /* validate the resulting configuration */
            if (!_hasError(runRetVal)) {
                time = $profile.start();
                validateRetVal = cfgMain.validate();
                $profile.stop(time, "validate");
            }
        }
    }
    catch (e2) {
        /* catch and save exceptions from the script execution */
        e = e2;
    }

    /* this try/catch supports debug info about errors in XDCtools itself */
    var e2 = null;
    try {    	
    	/* For some syntax and reference errors, Rhino prints out a part of
    	 * the stack trace, so the file name and the line number have to be
    	 * extracted from that output.
    	 */
        if ((jsErrors + "") != "") {
            var lines = (jsErrors + "").split(/\n/);
            for each (var line in lines) {
                var m = line.match(/^js: "([^\"]*)", line ([0-9]+): (.*)/);
                if (m) {
                    var fileName = m[1];
                    var lineNumber = m[2];
                    if (fileName.match(".*/" + pkgName + "$")
                        && lineNumber > 1) {
                        fileName = Program.build.cfgScript;

                        /* xdc.cfg gets the line number wrong by one */
                        lineNumber--;
                    }

                    var loc = "\"" + fileName + "\", line " + lineNumber;
                    if (!exception) {
                        exception = "";
                    }
                    exception += "@@fatal::: :::" + loc + "::: :::" + m[3];
                }
            }
        }

        if (e != null && exception == null) {
            var stackTrace = Packages.config.Shell.getStackTrace("");
            var loc = " ";
            
            /* If a string is an argument to 'throw', then that string is in 
             * e, and e doesn't have any other properties. For most other 
             * errors, the message is in e.message.
             */
            if (typeof(e) == "string") {
            	var msg = e;
            }
            else {
                var msg = e.message + "";
            }
            msg = msg.replace(/^.*XDCException: /, "");

            var configScriptName = Program.build.cfgScript;
            if (!java.io.File(configScriptName).isAbsolute()) {
                configScriptName =
                    java.io.File(configScriptName).getAbsolutePath() + "";
            }
            var configFileName = configScriptName.replace(/.*[\\\/]/,"").
                replace(/\.([^\.]*)$/,".cfg");

            if (loc == " ") {
                /* Search for configuration file in stack trace */
                var re = new RegExp('.*/' + configFileName + '\", ([0-9]+).*');
                var m = re.exec(stackTrace);
                if (m) {
                    loc = "\"" + configScriptName + "\", line " + m[1];
                }
            }

            if (loc == " ") {
                /* Search for package name in stack trace */
                var re = new RegExp('.*/' + pkgName + '\", line ([0-9]+).*');
                var m = re.exec(stackTrace);
                if (m) {
                    /* xdc.cfg gets the line number wrong by one */
                    loc = "\"" + configScriptName + "\", line " + (m[1] - 1);
                }
            }

            /* Format message with file name and line number*/
            exception = "@@fatal::: :::" + loc + "::: :::" + msg;
        }
    }
    catch (e2) {
        /* really bad -- an error in the error handler */
        exception = "@@fatal::: ::: ::: :::" + e2.message;
    }
    finally {
        /* restore the error reporter */
        rhino.Context.currentContext.setErrorReporter(older);

        xdc.om.$$bind('_$$setRetVal', _formatRetVal(setRetVal));
        xdc.om.$$bind('_$$runRetVal', _formatRetVal(runRetVal));
        xdc.om.$$bind('_$$validateRetVal', _formatRetVal(validateRetVal));
        xdc.om.$$bind('_$$contribException', _formatRetVal(exception));

        utils.cwd = saved_cwd;

        function unseal(obj) {
            var name = obj.$name;
            for (var prop in obj) {
                // print("unseal " + obj.$name + "." + prop);

                /* prevent cycles */
                if (!obj.$sealed(prop)) {
                    // print("skipping " + prop + " of " + name + " because not sealed");
                    continue;
                }

                obj.$unseal(prop);
                var val = null;
                
                /* Add try..catch loop to handle null delegates */
                try {
                    val = obj[prop];                    
                } catch (e) {
                }

                if (val == null) {
                    // print("skipping " + prop + " of " + name + " because is null");
                    continue;
                }
                
                if (typeof(val) != "object") {
                    // print("skipping " + prop + " of " + name + " because not an object");
                    continue;
                }
                

                /* only recurse into rtsc objects */
                if (!("$name" in val) || !("$unseal" in val)) {
                    // print("skipping " + prop + " of " + name + " because missing props");
                    continue;
                }

                /* only recurse into aggregates, not refs */
                if (val.$name.indexOf(name) != 0) {
                    // print("skipping " + val.$name + " of " + name + " because not a child");
                    continue;
                }

                /* unseal the contained object */
                unseal(val);
            }
        }

        /* unseal the entire model */
        var time = $profile.start();
        for each (var mod in xdc.om.$modules) {
            unseal(mod);
            for each (var inst in mod.$instances) {
                unseal(inst);
            }
        }
        $profile.stop(time, "unseal");

        return xdc;
    }
}

/*
 *  ======== _hasError ========
 */
function _hasError(result) 
{
    var str = result + "";
    return (str.match("@@error:::") || str.match("@@fatal:::"));
}

/*
 *  ======== _formatRetVal ========
 *  Make sure the return string is properly formatted with
 *  severity codes and location bracketing the errors.
 */
function _formatRetVal(retVal) 
{
    /* first make sure it's not undefined */
    if (retVal == undefined) {
        retVal = null;
    }

    /* if no messages, don't bother */
    if (!retVal || retVal.match(/^\s*$/)) {
        return retVal;
    }

    /* if starts with a legal separator code, done */
    if (retVal.match(/^@@\w+:::/)) {
        return retVal;
    }

    /* add a legal separator code */
    retVal = "@@fatal::: ::: ::: :::" + retVal;

    return retVal;
}
