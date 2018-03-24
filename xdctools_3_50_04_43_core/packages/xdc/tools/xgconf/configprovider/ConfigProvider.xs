/**
 * ConfigProvider.
 *
 * This Module implements the ContentProvider
 * required by a TreeViewer instance.
 *
 * This specific provider generates CfgObj nodes
 * which blend the config model object returned
 * from the contrib package with the ConfigFile
 * object returned from the parser package.
 */

/* ---------------- GLOBAL STATE ---------------- */

var specBrowser = null;
var uidToNodeMap = null;
var nodeMap = null;
var xdcGlobal = null;
var self = null;
var useProxy = true;

/* some shortcuts to Java classes */
var ConfigNode;
var ConfigModel;
var Type;
var ModelData;
var ModelDataProxy;
var modelDB;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    if (xdc.om.$name == "cfgnull") {
	return;
    }

    ConfigNode  = Packages.org.eclipse.rtsc.xdctools.model.elements.ConfigNode;
    ConfigModel = Packages.org.eclipse.rtsc.xdctools.model.cfgdata.ConfigModel;
    Type        = Packages.org.eclipse.rtsc.xdctools.model.elements.types.Type;

    /* set up the modelDB for the session */
    if ("dispose" in Type) {
        /* use the modelDB instance directly */
        modelDB = Type.modelDB;
        /* and remove it from thread local */
        Type.dispose();
    }
    else {
        /*
         * Use the static facade methods on the type. This will leak some
         * memory when the thread exits, but works with older XDCtools.
         */
        modelDB = Type;
    }
}

/*
 *  ======== canUseProxy ========
 *  for compatibility, check whether the proxy is available
 */
function canUseProxy()
{
    var SyncExecCommand =
        Packages.org.eclipse.rtsc.xdctools.model.cfgdata.SyncExecCommand;
    return ("newInstance" in ModelDataProxy && "OK" in SyncExecCommand);
}

/*
 *  ======== createModelData ========
 */
function createModelData(v)
{
    var md = new ModelData(v);
    if (useProxy) {
        return ModelDataProxy.newInstance(self.$private.socket, md);
    }
    return md;
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(fileName, exeName, pkgName, cfgScript, params)
{
    self = this;
    this.$private.fileName = fileName;
    this.$private.exeName = exeName;
    this.$private.pkgName = pkgName;
    this.$private.cfgScript = cfgScript;
    this.$private.configModel = new ConfigModel();
    this.$private.cfgSessXdc = null;
}


// Public utility functions
//---------------------------------------------------------------------------------

/*
 *  ======== loadCfgModel ========
 *  Retrieve the configuration model data.
 *
 *  This function massages the data to provide a package,
 *  module, instance, config param hierarchy with the
 *  xdc.services.spec objects attached to the appropriate
 *  objects.
 */
function loadCfgModel() 
{
    var contrib    = xdc.useModule('xdc.tools.xgconf.configprovider.Contrib');
    ModelData      = Packages.xdc.tools.xgconf.configprovider.ModelData;
    ModelDataProxy = Packages.xdc.tools.xgconf.configprovider.ModelDataProxy;
    useProxy = canUseProxy();

    contrib.breakAfterUserScript = this.breakAfterUserScript;
    this.$private.cfgSessXdc = contrib.execConfig(this.$private.exeName,
						  this.$private.pkgName, this.$private.cfgScript);

    if (this.$private.cfgSessXdc == null) {
        return (null);
    }
    var cfgSessModel = this.$private.cfgSessXdc.om;
    xdcGlobal = this.$private.cfgSessXdc.global;
    
    this.$private.setRetVal = cfgSessModel._$$setRetVal;
    this.$private.runRetVal = cfgSessModel._$$runRetVal;
    this.$private.validateRetVal = cfgSessModel._$$validateRetVal;
    this.$private.validateRetVal = cfgSessModel._$$validateRetVal;
    this.$private.validateException = cfgSessModel._$$contribException;
    
    var res = this._getValidateResults();
    this.$private.configModel.setCfgErrors(res);

    var start = $profile.start();

    /* first pick up Program and Program.global */
    var Program = cfgSessModel["xdc.cfg.Program"];
    var ProgGlobal = Program.global;
    var nid = new java.lang.String("Program");;
    this.$private.configModel.addIdMapEntry(Program, nid);

    /* scan all the objects in the JavaScript global namespace */
    for (var x in xdcGlobal) {
        var gid = xdcGlobal[x];

        /* if not a RTSC object, skip it */
        if ((gid == undefined) || (typeof(gid) != 'object') 
	    || !('$category' in gid)) {
            continue;
        }

        var gcat = new java.lang.String(gid.$category + '');
        var gis = new java.lang.String(gid + '');

        /* if not a module or instance, skip it */
        if (!(gcat.contains("Module")) && !(gis.contains("Instance#"))) {
            continue;
        }

        /* add an id for it */
        nid = new java.lang.String(x);
        this.$private.configModel.addIdMapEntry(gis, nid);
    }

    /* revolting hack to find the user script capsule */
    /* TODO: modify xdc.bld/cfg.xdt to save script capsule */
    /* if script is passed explicitly, executed in utils.global context */
    var userScriptCapsule = utils.global;
    var e;
    try {
        var userScriptPath =
            java.io.File(Program.build.cfgScript).getCanonicalPath();
        for each (var __cap in utils.$$capmap) {
            if (__cap.$path == userScriptPath) {
                userScriptCapsule = __cap.$capsule;
                break;
            }
        }
    }
    catch(e) {}
    this.$private.userScriptCapsule = userScriptCapsule;

    /* scan all the objects in the user script capsule namespace */
    for (var x in userScriptCapsule) {
        var gid = userScriptCapsule[x];

        /* if not a RTSC object, skip it */
        if ((gid == undefined) || (typeof(gid) != 'object') 
	    || !('$category' in gid)) {
            continue;
        }
        var gcat = new java.lang.String(gid.$category + '');
        var gis = new java.lang.String(gid + '');

        /* if not a module or instance, skip it */
        if (!(gcat.contains("Module")) && !(gis.contains("Instance#"))) {
            continue;
        }

        /* add an id for it */
        nid = new java.lang.String(x);
        this.$private.configModel.addIdMapEntry(gis, nid);
    }

    /* scan all the objects in Program.global */
    for (var x in ProgGlobal) {
        var gid = ProgGlobal[x];
        if ((gid == undefined) || (typeof(gid) != 'object') 
	    || !('$category' in gid)) {
            continue;
        }
        var gcat = new java.lang.String(gid.$category + '');
        var gis = new java.lang.String(gid + '');

        /* if not a module or instance, skip it */
        if (!(gcat.contains("Module")) && !(gis.contains("Instance#"))) {
            continue;
        }

        nid = new java.lang.String(x);
        this.$private.configModel.addIdMapEntry(gis, nid);
        this.$private.configModel.addProgGlobalId(nid);
    }
    
    /* return a reference to the entire xdc.om in the root node */
    var md = createModelData(cfgSessModel);
    this.$private.rootNode = new ConfigNode(this.$private.exeName,
					    this.$private.exeName, null, md, null, false,
					    this.$private.configModel);
    this.$private.configModel.setRootNode(this.$private.rootNode);

    /* list all the modules loaded, $used or not */
    for (var i = 0; i < cfgSessModel.$packages.length; i++) {
        var pkg = cfgSessModel.$packages[i];
        
        if (pkg.$name == 'xdc.tools.xgconf.configprovider') {
            continue;
        }
        
        var type = new Type(_getSpec(pkg),pkg.$name, pkg.$category);
        md = createModelData(pkg);
	
        var pkgNode = new ConfigNode(pkg.$name, pkg.$name,
				     this.$private.rootNode, md, type, false,
				     this.$private.configModel);
        for (var j = 0; j < pkg.$modules.length; j++) {
            var mod = pkg.$modules[j];
            if (mod.$spec.isProxy()) {
                continue;
            }
            if (!mod.$spec.isMod()) {
                continue;
            } 
            var modName = new java.lang.String(mod.$name);
            if (modName.compareTo('xdc.cfg.Main') == 0) {
                continue;
            }

            var tc = _hasTopScope(mod);
            if (tc) {
                pkgNode.setTopScope(true);
            }
            var modType = new Type(_getSpec(mod), mod.$name, mod.$category);
            md = createModelData(mod);
            var modNode = new ConfigNode(mod.$name, mod.$name,
					 pkgNode, md, modType, tc,
					 this.$private.configModel);
            var sm = this.$private.configModel.getNodeId(mod.$name);
	    //               print ('name: ' + mod.$name + '; sm: ' + sm);
            if (sm != undefined) {
                modNode.setDisplayName(sm);
		//print ('name: ' + modNode.getName() + '; displayName: ' + modNode.getDisplayName());
            }

            addConfigs(mod, modNode);
            for (var k = 0; k < mod.$instances.length; k++) {
                var inst = mod.$instances[k];                
                //print ('configprovider inst name: ' + inst.$name );
                var itc = _hasInstTopScope(inst);
                md = createModelData(inst);
                
                var instType = new Type(null, inst.$name, inst.$category);
                var instNode = new ConfigNode(inst.$name, inst.$name,
					      modNode, md, instType, itc,
					      this.$private.configModel);
                var sm = this.$private.configModel.getNodeId(inst.$name);
                if (sm != undefined) {
                    instNode.setDisplayName(sm);
                }
                else {
                    /* Set display names of implicit instances */
                    instNode.setDisplayName(
                        instNode.getName() + 
                            ' (' +
                            mod.$name.replace(/.*\.([^\.]*)$/,"$1") +
                            ')');
                }                    
                //print ('name: ' + instNode.getName() + '; displayName: ' + instNode.getDisplayName());
                
                addConfigs(inst, instNode);
                addCreateArgs(inst, instNode);
            }
            this.$private.configModel.addModule(modNode);
	    //print ('addModule: name: ' + modNode.getName());
        }
	
    }
    $profile.stop(start, "scan xdc.om"); 

    return (this.$private.configModel);
}

/*
 *  ======== runCFFxn ========
 */
function runCFFxn(mobjId, modinst, fxn, op, cfgparam, value) 
{
    var raw = null;
    var mod = null;
    var modId = null;
    var jmobjId = new java.lang.String(mobjId);
    // print('runCFFxn mobjId: ' + mobjId + '; modinst: ' + modinst + '; op: ' + op + '; cfgparam: ' + cfgparam + '; value: ' + value); 
    if (modinst == 1) {
        if (jmobjId.contains(".Instance#")) {
            modId = jmobjId.substring(0, jmobjId.indexOf(".Instance#"));
        }
    } 
    else {
        modId = mobjId;
    }
    //print ('modId: ' + modId);
    for (var m in this.$private.cfgSessXdc.om.$modules) {
        var mo = this.$private.cfgSessXdc.om.$modules[m];
        if ((mo != undefined) && (mo != null)) {
            var mid = new java.lang.String(mo.$name);
            if (mid.compareTo(modId) == 0) {
                mod = mo;
                break;
            }
        }
    }
    if (mod != null) {
        if (modinst == 0) {
            if (fxn in mod.$capsule) {
                raw = mod.$capsule[fxn].call(mod, op, cfgparam, value);
                   // print ('mod raw results: ' + raw);
            }
        } 
	else {
            var finst = null;
            for (var k = 0; k < mod.$instances.length; k++) {
                var inst = mod.$instances[k];   
                var jn = new java.lang.String(inst.$name);
                //print ('jn: ' + jn + '; jmobjId: ' + jmobjId);
                if (jn.compareTo(jmobjId) == 0) {
                    finst = inst;
                    //print('found inst: ' + finst.$name);
                    break;
                }             
            }
            if (finst != null) {
                raw = finst[fxn](op, cfgparam, value);
                if (raw != undefined) {
                 //print('inst raw results: ' + raw);
                }
            }
        }
    }
    return (raw);
}

/*
 *  ======== eval ========
 */
function eval(expr)
{
    var Context = Packages.org.mozilla.javascript.Context;
    return Context.currentContext.evaluateString(
        this.$private.userScriptCapsule,
        expr, this.$private.fileName, -1, null);
}

/*
 *  ======== _getValidateResults ========
 */
function _getValidateResults ()
{
    var valRes = java.lang.reflect.Array.newInstance(java.lang.Object, 4);
    valRes[0] = this.$private.setRetVal;
    valRes[1] = this.$private.runRetVal;
    valRes[2] = this.$private.validateRetVal;
    valRes[3] = this.$private.validateException;
    
    return (valRes);
}


/*
 *  ======== addConfigs ========
 */
function addConfigs(obj, node)
{
    var nodeSpec = null;
    if (node.isInstance()) {
    
        /* An instance needs the config params in Params.instance. Although Params presents
         * the appearance of a RTSC Structure (var p = new mod.Params; is how one is created) 
         * there is no spec world Struct that defines it. The instance is implemented here as an 
         * xdc.services.intern.xsr.Value.Obj. Its config paramaters are declared in the 
         * xdc.runtime.IInstance interface. As it may change over time this code finds the 
         * IInstance config params and passes them up as ConfigNode objects attached to a
         * "instance" config node.
         */
        nodeSpec = node.getParent().getSpecObj();
        var tnm = 'instance';
        var tv = null;
        var tcat = null;
        if (tnm in obj) {
            tv = obj[tnm];
            var md = null;
            if (tv && typeof(tv) == 'object' && ('$category' in tv)) {
                tcat = tv['$category'];
                md = createModelData(tv);
            } else if (tv == undefined) {
                md = createModelData(tv);
            }
            if (md == null) {
                md = tv;
            }
 //           java.lang.System.out.println('node.instance.name: ' + obj.instance + ' = ' + tv.name);
            var iType = new Type(null, tnm, tcat);
            
            cfgNode = new ConfigNode(tnm, tnm, node, md, iType, false,
                    node.getConfigModel());

            var isn = modelDB.findModSpec('xdc.runtime.IInstance');
            var cfg = isn.getConfigs();
            if (cfg != null) {
                for (var i = 0; i < cfg.size(); i++) {
                    var c = cfg.get(i);
                    tnm = c.getName();
                    var md = createModelData(tv.name);

                    //java.lang.System.out.println("ii cfg names: " + c.getName());
                    var tsn = modelDB.findModPropSpec('xdc.runtime.IInstance', tnm);
                    iType = new Type(tsn, tnm, null);
                    var nNode = new ConfigNode(tnm, tnm, cfgNode, md,
                            iType, false, node.getConfigModel());
                }
            }
        }
    }
    else {
        nodeSpec = node.getSpecObj();
    }
    if (nodeSpec != null) {
        var tn = nodeSpec.getChildren();
        if (tn != null) {
            /* identify the children that are not overridden */
            var byName = {};
            for (var z = 0; z < tn.size(); z++) {
                var cfgSpec = tn.get(z);
                byName[cfgSpec.name] = cfgSpec; 
            }
            for (var z = 0; z < tn.size(); z++) {
                var cfgSpec = tn.get(z);
                if (byName[cfgSpec.name] != cfgSpec) {
                    /* decl has been overridden, so ignore it */
                    continue;
                }

                var clsname = cfgSpec.getClass().getName();
                if ((clsname.compareTo('xdc.services.spec.Decl$Config') == 0) ||
                        (clsname.compareTo('xdc.services.spec.Decl$Fxn') == 0) ||
                        (clsname.compareTo('xdc.services.spec.Decl$Proxy') == 0))
                {
                    var cn = cfgSpec.getName();
                    var v = null;
                    var cat = null;
                    var md = null;
                    if (cn in obj) {
                        v = obj[cn];
                        /* Handle configuration parameters of type 'Any' */
                        if ((clsname.compareTo('xdc.services.spec.Decl$Config') == 0) && 
                             (cfgSpec.getTypeCode() == "a")) {
                            md = new ModelData(v,Packages.xdc.tools.xgconf.modeldata.IModelData.NONE);
                        }
                        else if (v && typeof(v) == 'object' && ('$category' in v)) {
                            cat = v['$category'];
                            md = createModelData(v);
                        } 
                        else if (v == undefined) {
                            md = createModelData(v);
                        }
                    }
                    if (md == null) {
                        md = v;
                    }
                            
                    var cfgType = new Type(cfgSpec, cn, cat);
                    var cfgNode = new ConfigNode(cn, cn, node, md, cfgType,
                            false, node.getConfigModel());
                }
            }
        }
    }
}

/*
 *  ======== addCreateArgs ========
 */
function addCreateArgs(obj, node)
{
    var array = new Array();
    var argNode = null;
    var args = null;
    var argSpecs = null;
    var parent = node.getParent();
    if (parent.isModule()) {
        var ms = parent.getSpecObj();
        if (ms != null) {
            var f = ms.getCreator();
            if (f != null) {
                argSpecs = f.getArgs();
            }
        }

    }
    if (('$args' in obj) && (argSpecs != null)) {
        args = obj['$args'];
        for (var i = 0; i < argSpecs.size(); i++) {
            var sp = argSpecs.get(i);
            var p = sp.getName();
            var v = args[p];
            //print (p +'; ' + i + ': ' + argSpecs.get(i).getName());
            var n = p;
            var c = null;
            var md = null;
            if ((v != undefined) && (typeof(v) == 'object')) {
                c = ('$category' in v) ? v.$category : null;
            }
            if (c != null) {
                md = createModelData(v);
            } else if (v == undefined) {
                md = createModelData(v);
            }
            if (md == null) {
                md = v;
            }

            var argType = new Type(sp, n, c);
            argNode = new ConfigNode(n, n, null, md, argType, false,
                    node.getConfigModel());
            node.addCreateArgs(argNode);
        }
        
    }
    return (array);
}

// Private utility functions
//----------------------------------------------------------------------------

/*
 *  ======== _hasTopScope ========
 */
function _hasTopScope(obj)
{
    var flag = false;
/*    
    if (('$$scope' in obj) && ('$used' in obj)) {
        if (obj['$used']) {
        print('name: ' + obj.$name + '; $$scope: ' + obj['$$scope']);
            flag = obj['$$scope'] ? true : false;
        }
    }
*/    
    
    if ('$$usedPhase' in obj)  {
    //    if (obj['$used']) {
            flag = (obj['$$usedPhase'] == 0);
    //    print('name: ' + obj.$name + '; $$usedPhase: ' + obj['$$usedPhase'] + ' flag: ' + flag);
    //    print('name: ' + obj.$name + '; $used: ' + obj['$used']);
   //     }
    }
    
    return(flag);
}

/*
 *  ======== _hasInstTopScope ========
 */
function _hasInstTopScope(obj) 
{
    var flag = true;
    //@@@ this is necessary until $$usedPhase is 2 on modules used within the script 
    //@@@and instances have no way to tell when they were created.
/*    
    if ('$$phase' in obj) {
        print('name: ' + obj.$name + '; $$phase: ' + obj['$$phase']);
        flag = (obj['$$phase'] == 5);
    }
*/    
    return(flag);
}

/*
 *  ======== _getSpec ========
 */
function _getSpec(obj)
{
    var ses = modelDB.getSpecSession();
    switch (obj.$category) {
        case "Package":
            return ses.findPkg(obj.$name);
        case "Module":
        case "Interface":
            return ses.findUnit(obj.$name);
        default:
            return null;
    }
}
