/* --COPYRIGHT--,EPL
 *  Copyright (c) 2008-2017 Texas Instruments Incorporated
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * --/COPYRIGHT--*/

/*
 *  ======== Main.xs ========
 *  The xdc.rov.server services ROV data requests from the ROV GUI in CCS.
 *
 *  This server is not generic to the ROV core, but is specific to the ROV
 *  GUI in CCS. Other ROV-based tools (such as the ROV test scripts)
 *  provide their own version of this server.
 */

var controller;
var NodeFactory;
var symInst;

/*
 *  ======== run ========
 *
 */
function run(cmdr, args)
{
    xdc.global.Program = xdc.useModule('xdc.rov.Program');

    Program.timestamp("Beginning of xdc.rov.server Main.xs run.");

    /* Read in the 'version' from the command line. */
    var pluginVers = this.version;
    Program.debugPrint("Version = " + pluginVers);

    /* Read in the path to the executable from the command line. */
    var executable = this.executable.replace(/\\/g, '/');
    Program.debugPrint("Executable = " + executable);

    /* Read in the controller index from the command line. */
    var controllerIndex = parseInt(this.controllerIndex);
    Program.debugPrint("Controller = " + controllerIndex);

    /* Verify the versions match. */
    if (!checkVersion(pluginVers, this.serverVers)) {
        cmdr.write("There is a version mismatch between the ROV server and " +
                   "the ROV plugin. Make sure the most recent XDC tools " +
                   "version is selected.");
        return;
    }

    /* Create the symbol table */
    Program.debugPrint('Creating ISymbolReader Instance');
    var DSSymbolReader = xdc.useModule('xdc.rov.server.DSSymbolReader');
    symInst = DSSymbolReader.create(controllerIndex);

    /* Create the call stack parser */
    Program.debugPrint('Creating ICallStack Instance');
    var DSCallStack = xdc.useModule('xdc.rov.server.DSCallStack');
    var callStack = DSCallStack.create(controllerIndex);

    /* Create the call back */
    Program.debugPrint('Creating ICallBack Instance');
    var DSCallBack = xdc.useModule('xdc.rov.server.DSCallBack');
    var callBack = DSCallBack.create(controllerIndex);

    /* Notify the callBack that we are loading the recap file. */
    callBack.updateStartupProgress(60, "Loading ROV recap file ...");

    /* Locate the Recap file */
    var recap;
    try {
        recap = getRecap(executable, symInst);
    }
    catch (e) {
        var msg = e.message;

        /*
         * Strip the java.lang.Exception from the message before returning
         * it.
         */
        var index = msg.indexOf("Exception: ");
        if (index != -1) {
            msg = msg.substring(index + String("Exception: ").length);
        }

        Program.debugPrint("Failed to find recap file: " + msg);
        cmdr.write(msg);
        return;
    }

    /* Get a handle to the ROV Controller */
    controller = xdc.jre.com.ti.dvt.server4.ControllerMap.getController(controllerIndex);

    /* Create the memory reader */
    Program.debugPrint('Creating MemoryReader Instance');

    /* Get the IMemoryImage instance from the Controller. */
    var iMemInst = controller.getMemoryReader();

    /* Get the target endianess and convert from string to enum. */
    var endianStr = recap.build.target.model.endian;
    var endian = Packages.xdc.rov.TargetType.strToEndianess(endianStr);

    /* Get the MAU size. */
    var bitsPerChar = recap.build.target.bitsPerChar;

    /* Create the MemoryImage instance */
    var memInst = new Packages.xdc.rov.MemoryImage(iMemInst, endian,
                                                   bitsPerChar);

    Program.debugPrint('Starting ROV Model');
    var Model = xdc.useModule('xdc.rov.Model');

    /* If startModel throws any exceptions, report them back and exit. */
    try {
        Model.start(this.modelVers, executable, recap, symInst, memInst, callBack);
    }
    catch (e) {
        var exception = Program.exToString(e);
        Program.debugPrint("Caught exception while starting ROV: " + exception);
        /*
         * Just write the message, we don't need an <Exception> tag here.
         * The plugin looks for "started", and if the message is anything else,
         * it displays that as an error.
         */
        cmdr.write("Caught exception while starting ROV: " + exception);
        return;
    }

    /* bind the call stack parser */
    Model.setICallStackInst(callStack);

    /*
     * TODO - This is a temporary workaround to resolve a class loader issue.
     * Ideally, this API should just be called from the LoggerBuf Records view.
     * However, the view is called through a java call back mechanism which
     * means that the view code actually has a different Java context. To work
     * around this, we create the LoggerBufDecoder while initializing the ROV
     * server, when we're still in the context of the xdc.tools.Server.
     */
    var LoggerBuf = xdc.useModule('xdc.runtime.LoggerBuf');
    LoggerBuf.initDecoder();

    /*
     * Set up the Java callback mechanism which allows for the ROV plugin to
     * call down to the ROV server.
     * We create a JavaScript object which implements the IServer interface
     * defined by the ROV plugin, then wrap this with a Java object.
     * We then pass this Java object back to the ROV plugin so that it may
     * use it to call into the ROV server.
     */
    var iserver = new xdc.jre.com.ti.dvt.server4.servers.IServer({
                            clearCache: clearCache,
                            listModules: listModules,
                            retrieveView: retrieveView
                        });

    controller.setServer(iserver);

    /* Notify the ROV plugin that the server initialization is complete. */
    controller.serverInitialized = true;

    /* The NodeFactory is used to create GUI nodes for the views. */
    NodeFactory = xdc.jre.com.ti.dvt.server4.NodeFactory;

    Program.debugPrint("Done with startModel");

    /* Write 'started' to indicate that the server has started successfully. */
    cmdr.write("started");

    /* Wait for commands and process them as they come in. */
    Program.debugPrint("xdc.rov.server.Main: rov.server ready to receive commands.");

    while (true) {
        var input = String(cmdr.read());
        Program.timestamp("Server received request: " + input);

        if (input == "q") {
            Program.debugPrint("rov.server received quit command.");
            break;
        }
        else {
            print("Received unexpected command: " + input);
        }
    }

    Program.debugPrint("rov.server returning from 'run'.");
    /* Write empty string to acknowledge server quit. */
    cmdr.write("");
}

/*
 *  ======== clearCache ========
 */
function clearCache()
{
    /* Clear Cache */
    Program.debugPrint("Clearing server cache...");
    Program.resetMods();
}

/*
 *  ======== listModules ========
 *  Called from the ROV plugin to retrieve the module list for the LHS.
 */
function listModules()
{
    var Model = xdc.useModule('xdc.rov.Model');
    
    /* Get the JavaScript representation of the module heirarchy. */
    var modList = Model.getModuleList();
    
    /* 
     * Underneath 'All Modules' will be a package heirarchy. 'rootPkgs' is the 
     * array of the root packages (e.g., 'xdc' and 'ti').
     */
    var rootPkgs = new Array();

    var viewableModNodes = new Array();
    
    /*
     * For each of the packages, create the package heirarchy node with
     * all of its subpackages and modules. Also, add each of the modules
     * to the 'viewableModNodes' list (to display under 'Viewable Modules').
     */
    for (var i = 0; i < modList.subPkgs.length; i++) {
        rootPkgs[i] = getPkgHeirarchyNode(modList.subPkgs[i], viewableModNodes);
    }

    /*
     * Look through the list of viewable modules for modules with the same 
     * name. Append the module's package prefix to the module's display name.
     */
    combineDuplicates(viewableModNodes);
    
    /* Sort the 'Viewable Modules' list alphabetically. */
    viewableModNodes.sort(compareNodes);
   
    /* 
     * Create an array of the top two nodes to return.
     * The root node, which displays the executable name, is created by
     * the ROV plugin.
     */
    var rootNodes = new Array();

    /*
     * Create the 'Viewable Modules' node and set its children to display the
     * flat list of viewable modules.
     */
    var viewMods = NodeFactory.createPackage("Viewable Modules", "", true);
    viewMods.setChildren(viewableModNodes);
    
    /* Expand this node by default. */
    viewMods.setExpandAll(true); 
    
    /*
     * If this is a BIOS 5 app, don't display the 'All Modules' list, and just
     * return now.
     */
    if (symInst.getSymbolValue("BIOS_start") != -1) {
        rootNodes[0] = viewMods;
        return (rootNodes);
    }
    
    /* 
     * Create the 'All Modules' node and set its children to display the
     * package heirarchy, which includes all modules in the configuration. 
     */
    var allMods = NodeFactory.createPackage("All Modules", "", true);
    allMods.setChildren(rootPkgs);
    
    /* Expand this node by default. */
    allMods.setExpandAll(true);

    /* 
     * Assing the 'Viewable Modules' and 'All Modules' root nodes to the array
     * and return it.
     */
    rootNodes[0] = viewMods;
    rootNodes[1] = allMods;
    
    return (rootNodes);
}

/*
 *  ======== getPkgHeirarchyNode ========
 *  Recursively traverse the module heirarchy from Module.getModuleList and 
 *  create the Java GUI elements to display it.
 *
 *  This function also builds up the list of 'viewableModNodes', which is the
 *  list of modules which have something other than the 'Raw' tab to display.
 */
function getPkgHeirarchyNode(pkg, viewableModNodes)
{
    var newPkg = NodeFactory.createPackage(pkg.name, pkg.fullName, (pkg.subPkgs.length != 0));
    
    /* Array of the package's children, both modules and subpackages. */
    var children = new Array();
    
    /* Copy over each of the sub packages. */
    for each (var subPkg in pkg.subPkgs) {        
        /* Fill in the package's modules and sub packages. */
        children[children.length] = getPkgHeirarchyNode(subPkg, viewableModNodes);
    }
    
    /* Create a tree node for each of the modules. */
    for each (var mod in pkg.modules) {

        var newMod = NodeFactory.createModule(mod.name, mod.fullName);        
        
        /* Copy over the module's tabs. */
        var tabs = new Array();

        /* If the module is missing from the package path... */
        if (mod.loadFailed) {
            Program.debugPrint("Missing module: " + mod.fullName);
            newMod.setForegroundColor(NodeFactory.red);
        }
        
        /* Set the module's tabs. */
        for each (var tab in mod.tabs) {
            tabs[tabs.length] = NodeFactory.createTab(tab.name, tab.type);
        }
        
        newMod.setTabs(tabs);
        
        /* Add the module to the package's list */
        children[children.length] = newMod;
        
        /* 
         * Add the module to the 'Viewable Modules' list if it has something to
         * display other than just 'Raw'.
         * If there is more than one tab, then there is something to show.
         * Or if there is only one tab, but it's name is not "Raw", then there
         * is something to show.
         */
        if ((mod.tabs.length > 1) || (!mod.tabs[0].name.equals("Raw"))) {
            viewableModNodes[viewableModNodes.length] = newMod;
        }
    }
    
    newPkg.setChildren(children);
    
    return (newPkg);
}

/*
 *  ======== compareNodes ========
 *  Comparison function for sorting module nodes alphabetically.
 */
function compareNodes(a, b)
{
    return (a.getDisplayName().compareTo(b.getDisplayName()));
}
 
/*
 *  ======== combineDuplicates ========
 *  Iterates over the list of nodes in 'nodes' looking for modules with 
 *  matching names. It appends the module's package prefix to the display
 *  name, e.g.,
 *    Hwi (ti.sysbios.family.c64p)
 *    Hwi (ti.sysbios.hal)
 */
function combineDuplicates(nodes) {
    /* Loop through all of the modules. */
    for (var i = 0; i < nodes.length; i++) {
        var name = nodes[i].getDisplayName();
        
        var foundMatch = false;
        
        /* Look over the rest to find duplicates. */
        for (var j = i + 1; j < nodes.length; j++) {
            
            /* If the names match... */
            if (name.equals(nodes[j].getDisplayName())) { 
                /* If we haven't adjusted node i's name yet... */
                if (!foundMatch) {
                    
                    /* Add the package prefix to the display name. */
                    addPackagePrefix(nodes[i]);
                    
                    foundMatch = true;
                }
                
                /* Adjust j's name. */
                addPackagePrefix(nodes[j]);
            }
            
            /* Continue looking for all matches. */
        }
    }
}

/*
 *  ======== addPackagePrefix ========
 *  When a duplicate module name is found, this function is called to add
 *  the package prefix to the node, e.g., 
 *    Hwi (ti.sysbios.family.c64p)
 *    Hwi (ti.sysbios.hal)
 */
function addPackagePrefix(node)
{
    /* Get the node's full package name. */
    var fullName = node.getFullName();
    
    /* Get just the package prefix. */
    var pkgPrefix = fullName.substring(0, fullName.lastIndexOf('.'));
            
    /* Add the package prefix after the module name. */
    node.setDisplayName(node.getDisplayName() + " (" + pkgPrefix + ")");
}

/*
 *  ======== retrieveView ========
 */
function retrieveView(modName, tabName)
{
    if (Program.getModuleDesc(modName).loadFailed) {
        throw ("ROV failed to load the module " + modName + ", most likely " +
               "because it, or a module it depends on, was not found along " +
               "the package path.\n\n" +
               
               Program.getModuleDesc(modName).loadFailedMsg + "\n\n" +
               
               "To correct path issues:\n" + 
               
               "For CCS projects, go to the project properties, look " +
               "under CCS Build->RTSC->Products and Repositories, and " +
               "ensure that all required products and repositories are " +
               "checked. " + 
               
               "Or, to set the default path settings for all applications " +
               "built outside of CCS, go to Window->Preferences...->CCS->" +
               "RTSC->Products and Respositories. " + 
               
               "Finally, close and re-open ROV (make sure ROV is closed in " + 
               "all perspectives). In older versions of CCS, you will have " +
               "to terminate and relaunch the debug session for the changes " +
               "to take effect.");
    }
    
    var viewType = Program.getViewType(modName, tabName);

    var ViewInfo = xdc.useModule('xdc.rov.ViewInfo');
    
    var begin = java.lang.System.currentTimeMillis();
    
    /*
     * The first step in any view is to call the appropriate Program.scan
     * function. We call those here in this try-catch block so the code for
     * handling the exceptions is all in one place.
     */
    var msgOk = "ROV detected errors in scan of";
    try {
        switch (String(viewType)) {
            case String(ViewInfo.MODULE):
                Program.scanModuleView(modName, tabName);
                break;
            case String(ViewInfo.INSTANCE):
                Program.scanInstanceView(modName, tabName);
                break;
            case String(ViewInfo.INSTANCE_DATA):
                Program.scanInstanceDataView(modName, tabName);
                break;
            case String(ViewInfo.MODULE_DATA):
                Program.scanModuleDataView(modName, tabName);
                break;
            case String(ViewInfo.RAW):
                Program.scanRawView(modName);
                break;
            case String(ViewInfo.TREE_TABLE):
                Program.scanTreeTableView(modName, tabName);
                break;
            case String(ViewInfo.TREE):
                Program.scanTreeView(modName, tabName);
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

        /*
         * Program.scan* will intentionally throw exceptions to
         * force user to handle them. 
         * If this is that type of exception, continue on.
         * Otherwise, report the exception directly instead of continuing.
         */  
        if (!msg.substring(0, msgOk.length).equals(msgOk)) {
            /* Strip the Java class name from the exception before re-throwing */
            var index = msg.indexOf("java.lang.Exception: ");
            if (index != -1) {
                msg = msg.substring(index + 21);
            }
            
            throw (msg);
        }
    }
    
    Program.debugPrint("Retrieving the whole view took " 
		       + (java.lang.System.currentTimeMillis() - begin));
    begin = java.lang.System.currentTimeMillis();

    /*
     * At this point, the appropriate 'scan' API has been called and the data
     * is ready to be formatted for the GUI.
     */
    switch (String(viewType)) {
        case String(ViewInfo.MODULE):
            view = retrieveModuleView(modName, tabName);
            break;
        case String(ViewInfo.INSTANCE):
            view = retrieveInstanceView(modName, tabName);
            break;
        case String(ViewInfo.INSTANCE_DATA):
            view = retrieveInstanceDataView(modName, tabName);
            break;
        case String(ViewInfo.MODULE_DATA):
            view = retrieveModuleDataView(modName, tabName);
            break;
        case String(ViewInfo.RAW):
            view = retrieveRawView(modName);
            break;
        case String(ViewInfo.TREE_TABLE):
            view = retrieveTreeTableView(modName, tabName);
            break;
        case String(ViewInfo.TREE):
            view = retrieveTreeView(modName, tabName);
            break;
        default:
            throw (new Error("Undefined view type: " + viewType));
            break;
    }
    
    Program.debugPrint("View to GUI took " 
		       + (java.lang.System.currentTimeMillis() - begin));

    /* TODO - Supposed to check for abort here? Possible that returning the
     *        value would confuse it?
     */
    return (view);
}

/*
 *  ======== retrieveModuleView ========
 *  Retrieve the specified module-type view. Call Program.getViewType to 
 *  determine which Model.retrieve* API to call.
 *  Returns an XML formatted string representing the view.
 */
function retrieveModuleView(modName, tabName)
{   
    /* Get the view manually in case it threw an exception. */
    var modDesc = Program.getModuleDesc(modName);
    var modView = modDesc.viewMap[tabName];
    
    var viewName = modName + "." + tabName;
    
    /* Get the error if there is one. */
    var error = "";
    if (modDesc.errorMap[tabName]) {
        error = modDesc.errorMap[tabName];
    }        
    
    /* Create the ContentNode to represent the view. */
    var nodes = new Array();
    nodes[0] = viewToNode(viewName, modView, error);
    
    return (nodes);
}

/*
 *  ======== retrieveInstanceView ========
 *  Retrieve the specified instance-type view. Call Program.getViewType to 
 *  determine which Model.retrieve* API to call.
 */
function retrieveInstanceView(modName, tabName)
{                  
    var mod = Program.getModuleDesc(modName);
                
    var count = 0;
    
    /* Get the instance views, add them to the XML output */
    Program.debugPrint("mod.instances.length = " + mod.instances.length);
    
    /* Convert each instance to XML. */
    var instances = new Array();
    
    var viewName = modName + "." + tabName;
    
    for (var i in mod.instances) {
        var view = mod.instances[i].viewMap[tabName];

        /* Get the error if there is one. */
        var error = "";
        if (mod.instances[i].errorMap[tabName]) {
            error = mod.instances[i].errorMap[tabName];
        }
        
        /* Add the instance to the array. */
        instances[instances.length] = viewToNode(viewName, view, error);
    }
    
    return (instances);
}

/*
 *  ======== retrieveInstanceDataView ========
 *  Retrieve the specified instance-data-type view. Call Program.getViewType to
 *  determine which Model.retrieve* API to call.
 */
function retrieveInstanceDataView(modName, tabName)
{
    var modDesc = Program.getModuleDesc(modName);
    
    var viewName = modName + "." + tabName;
    
    /* Create the root node, which is just the module name. */
    var root = NodeFactory.createNode(modName);
    
    /* Create the array of instances */
    var instances = new Array();

    /* 
     * If the module doesn't actually have instances, just call the view 
     * function once without passing in anything.
     *
     * This feature was added to support the BIOS 5 LOG view. It has been
     * replaced by 'scanTreeTableView' and should be deprecated.
     */
    if (!('Instance_State' in modDesc.useMod)) {
        var dataArr = modDesc.viewMap[tabName];
    
        for each (instView in dataArr) {
            /* Create a node to represent the instance. */
            var instNode = NodeFactory.createNode(instView.label);

            /* Add all of the instance's elements. */
            setNodesChildren(viewName, instNode, instView.elements);
            
            /* Add the instance to list */
            instances[instances.length] = instNode;
        }
    }
    else {
        /* Add each instance. */
        for each (var instDesc in modDesc.instances) {
            /* Retrieve the view from the instance. */
            var instView = instDesc.viewMap[tabName];
            
            /* Check for any generic error */
            var error = instDesc.errorMap[tabName];
            
            /* Create a node to represent the instance. */
            var instNode = NodeFactory.createNode(instView.label);

            /* 
             * If there was an error encountered while running the view for 
             * this instance, turn the label red, and display the exception to
             * the right.
             */
            if (error) {
                /* Set the label background to red. */
                instNode.setBackgroundColor(NodeFactory.red);
                
                /* If the instance label wasn't filled in, fill in "Error". */
                if (instNode.getDisplayName().equals("undefined")) {
                    instNode.setDisplayName("Error");
                }
                
                /* 
                 * Create a single element for the instance to display the 
                 * error. 
                 */
                var child = NodeFactory.createNode("");
                var errorProp = NodeFactory.createProperty(viewName, "Error",
                                                           error, error);
                child.setProperties([errorProp]);
                instNode.setChildren([child]);
            }
            else {
                /* Add all of the instance's elements. */
                setNodesChildren(viewName, instNode, instView.elements);
            }

            /* Add the instance to list */
            instances[instances.length] = instNode;
        }
    }
    
    root.setChildren(instances);
    
    /* Expand the root node to display all of the instances. */
    root.setExpandAll(true);
    
    var nodes = new Array();
    nodes[0] = root;
    
    return (nodes);    
}

/*
 *  ======== setNodesChildren ========
 *  Takes an array of homogenous objects and converts them into an array of
 *  GUI ContentNodes which are set as the children of the passed in GUI "node".
 *
 *  viewName - Every GUI node is given the name of the view it's in.
 *  node - A GUI ContentNode to add the children to.
 *  childObjs - Array of homogenous objects to convert into GUI nodes.
 */
function setNodesChildren(viewName, node, childObjs)
{
    /* Create an array of all of the data elements */
    var children = new Array();
    
    for each (var childObj in childObjs) {
        /* Create a GUI node from the child object. */
        var child = viewToNode(viewName, childObj, "");

        /* Use the value in the first column as the name of the node. */
        var childName = child.getProperties()[0].getValue();
        child.setDisplayName(childName);

        children[children.length] = child;
    }
    
    /* Add the data elements to the instance. */
    node.setChildren(children);
}

/*
 *  ======== retrieveModuleDataView ========
 *  Retrieve the specified module-data-type view. Call Program.getViewType
 *  to determine which Model.retrieve* API to call.
 *  Returns an XML formatted string representing the view.
 */
function retrieveModuleDataView(modName, tabName)
{
    var modDesc = Program.getModuleDesc(modName);
    var dataView = modDesc.viewMap[tabName];
    
    var viewName = modName + "." + tabName;
    
    var elements = new Array();
    
    /* Add each data element */
    for each (var elem in dataView.elements) {
        elements[elements.length] = viewToNode(viewName, elem, "");
    }
            
    return (elements);
}

/*
 *  ======== retrieveRawView ========
 *  The raw tab is handled specially because of it's more generic nature and
 *  the complexity of displaying the configuration object.
 *  All of the functions that follow are to support the raw tab.
 */
function retrieveRawView(modName)
{
    var viewName = modName +".Raw";
    
    /* Array of root nodes to return */
    var nodes = new Array();
    
    /* Get the module descriptor */
    var modDesc = Program.getModuleDesc(modName);

    /* Add the module state. */
    var modStateNode = strToNode(viewName, "Module State", modDesc.state, 0);
    nodes[0] = modStateNode;
    
    /* Add the instance states. */
    var instStateNode = NodeFactory.createNode("Instance States");
    var instStates = new Array();
    for each (var instDesc in modDesc.instances) {
        var elemName = Program.getShortName(instDesc.state.$label);
        if (elemName == "") {
            elemName = String(instDesc.state.$addr);
        }
        instStates[instStates.length] = strToNode(viewName, elemName, instDesc.state, 0);
    }
    
    instStateNode.setChildren(instStates);
    
    nodes[1] = instStateNode;
    
    /* Add the module config info */
    var modCfg = Program.getModuleConfig(modName);
    var modCfgNode = strToNode(viewName, "Configuration", modCfg, 0);

    nodes[2] = modCfgNode;
    
    return (nodes);
}

/*
 *  ======== retrieveTreeTableView ========
 *  Converts a TreeTable view into a GUI ContentNode heirarchy to be displayed
 *  in the GUI.
 */
function retrieveTreeTableView(modName, tabName)
{
    /* Retrieve the module descriptor to get to the processed view. */
    var modDesc = Program.getModuleDesc(modName);

    /* Retrieve the view, which is an array of root nodes. */
    var rootObjs = modDesc.viewMap[tabName];

    /* The view name is stored in every GUI node. */
    var viewName = modName + "." + tabName;

    /* Create the array of root nodes to return. */
    var rootNodes = new Array();

    /*
     * Convert each of the root Program.TreeNode objects into
     * GUI ContentNodes.
     */
    for each (var rootObj in rootObjs) {
        /* Tree table views are JavaScript objects that may have $status
         * property to hold error messages for specific view fields. They are
         * displayed separately and we don't want to show them in the view.
         */
        if (rootObj == "$status") {
            continue;
        }
        var rootNode = getTreeTableRecur(rootObj, viewName);
        rootNode.setExpandAll(true);
        rootNodes[rootNodes.length] = rootNode;
    }

    return (rootNodes);
}

/*
 *  ======== retrieveTreeView ========
 *  Similar to the Raw view, this view takes a raw javascript object and 
 *  converts it into a tree to be displayed.
 */
function retrieveTreeView(modName, tabName)
{
    /* Retrieve the module descriptor to get to the processed view. */
    var modDesc = Program.getModuleDesc(modName);
    
    /* Retrieve the view, which is an arbitrary object to be displayed. */
    var rawObj = modDesc.viewMap[tabName];
       
    /* The view name is stored in every GUI node. */
    var viewName = modName + "." + tabName;    
    
    /* Convert the raw object to a GUI tree */
    var rootNode = strToNode(viewName, "", rawObj, 0);
    
    /* We don't need the root level node, just its children. */
    var children = rootNode.getChildren();
        
    return (children);
} 

/*
 *  ======== getTreeTableRecur ========
 *  Recursively create a GUI content node object from a Program.TreeNode
 *  structure.
 */
function getTreeTableRecur(treeNode, viewName)
{
    /* Create the root node from the given TreeNode */
    var root = NodeFactory.createNode(treeNode.label);
    
    /* Get each of the node's children. */
    var children = new Array();
    for each (var childNode in treeNode.children) {
        children[children.length] = getTreeTableRecur(childNode, viewName);
    }
    
    /* 
     * The properties array is a homogeneous array of structures. Each 
     * structure in the array will be converted to a node, and each of the
     * fields in the structure will become a property of that node.
     *
     * This cannot leverage the 'setNodesChildren' API because it needs to 
     * add to the existing list of children.
     */
    for each (var childObj in treeNode.properties) {
        /* Create a GUI node from the child object. */
        var node = viewToNode(viewName, childObj, "");
            
        /* Use the value in the first column as the name of the node. */
        var nodeName = node.getProperties()[0].getValue();

        node.setDisplayName(nodeName);
            
        /* Add the property node. */
        children[children.length] = node;
    }

    root.setChildren(children);
    
    /* Return the completed GUI node. */
    return (root);
}

/*
 *  ======== strToNode ========
 *  Takes an arbitrary structure and turns it into a ContentNode.
 *  To avoid loops, it will only go down five levels of objects.
 */
function strToNode(viewName, objName, obj, level)
{
    if ((level != undefined) && (level != -1)) {
        level++;
    }

    /* Create a node to represent the structure. */
    var node = NodeFactory.createNode(objName);

    /*
     * Create arrays for the structure's fields (properties) and object
     * handles (children).
     */
    var properties = new Array();
    var children = new Array();

    /* Handle each of the structure's fields. */
    for (var field in obj) {
        /* Tree views are JavaScript objects that may have $status property to
         * hold error messages for specific view fields. They are displayed 
         * separately and we don't want to show them in the view.
         */
        if (field == "$status") {
            continue;
        }
        var value = obj[field];

        /* If this field is an object... */
        if (value && (typeof value) == 'object') {
            /* If value is an address or enum (an Addr or EnumVal object)... */
            if (('$category' in value) &&
                ((value.$category == 'Addr') ||
                 (value.$category == 'EnumVal'))) {
                properties[properties.length] =
                    NodeFactory.createProperty(viewName, field, String(value),
                                               "");
            }
            /* Otherwise it's just another structure... */
            else {
                if (level == 5) {
                    properties[properties.length] =
                        NodeFactory.createProperty(viewName, field,
                                                   "ROV reached max depth (5)",
                                                   "");
                }
                else {
                    children[children.length] = strToNode(viewName, field,
                                                          value, level);
                }
            }
        }
        /* If the field is just a scalar value... */
        else {
            properties[properties.length] =
                NodeFactory.createProperty(viewName, field, String(value), "");
        }
    }

// We don't sort here anymore: Bug 320769 - ROV tree view should show items ...
//    properties = NodeFactory.sortProperties(properties);
//    children = NodeFactory.sortNodes(children);

    node.setProperties(properties);
    node.setChildren(children);

    return (node);
}

/*
 *  ======== viewToNode ========
 * Creates a ContentNode to represent the given view structure. 
 */
function viewToNode(viewName, view, error)
{
    /* Create a node to represent the instance. */
    var inst = NodeFactory.createNode("");
    
    /* Create the properties array. */
    var properties = new Array();
    
    /* 
     * Address field is added explicitly because it doesn't show up in 
     * the for/in loop.
     */
    if ('address' in view) {
        properties[0] = NodeFactory.createProperty(viewName, "address", 
                                                   view.address, error);
    }

    /* Fill in all of the properties. */
    for (var p in view) {
    
        /* If the status is undefined, don't include this field. */
        if (view.$status[p] === undefined) {
            continue;
        }
        
        var pError = "";
        if (view.$status[p] != null) {
            pError = view.$status[p];
        }
        
        /* If the field is an array... */
        if ((view[p]) && (view[p].$category == 'Vector')) {                
            /* Create a drop down for the array values. */
            var arr = new Array();
            for (var j = 0; j < view[p].length; j++) {
                arr[j] = view[p][j];
            }                
            properties[properties.length] = 
		NodeFactory.createDropDown(viewName, p, arr, pError); 
        }
        /* If the field didn't get filled in, display an empty box */
        else if (view[p] == undefined) {
            properties[properties.length] = 
		NodeFactory.createProperty(viewName, p, "", pError);
        }
        /* If this is just a normal field. */
        else {
            properties[properties.length] = 
		NodeFactory.createProperty(viewName, p, view[p], pError);
        }            
    }
    
    /* Set the instance's properties. */
    inst.setProperties(properties);
    
    return(inst);
}

/* 
 * ======== checkVersion ========
 * The pluginVers parameter is a version string passed down from the ROV 
 * plugin that contains two keys:
 *    <xml version>.<server version>
 * 
 * The ROV Model will verify that the xml version matches later.
 *
 * This API verifies that the server version matches the version of the 
 * xdc.rov.server.
 */
function checkVersion(pluginVers, thisVers)
{
    /* Fail if the plugin did not pass in a version. */
    if (pluginVers == "") {
        return (false);
    }
    
    /* Otherwise, check if the versions are compatible. */
    var keys = pluginVers.split('.');

    /* Second key is the ROV Server version. */
    var serverVers = parseInt(keys[1]);
    Program.debugPrint("serverVers = " + serverVers);
    
    /* Verify the ROV Server version matches the current version. */
    if (serverVers != thisVers) {
        Program.debugPrint("Plugin version " + serverVers + " does not " +
                           "match server version " + thisVers);
        return (false);
    }
    
    return (true);
}

/*
 *  ======== getRecap ========
 *  This API does not catch any exceptions, so it should be called from a 
 *  try / catch block in 'run'.
 */
function getRecap(executable, symInst)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    Program.debugPrint('Retrieving Recap File');  
    
    /* First check if this is a BIOS 5 executable */
    if (symInst.getSymbolValue("BIOS_start") != -1) {
        Program.debugPrint("Detected BIOS 5 executable...");
        
        /* Use the BIOS 5 Recap module to find the appropriate file. */
        var Recap = xdc.useModule('ti.bios.rov.recaps.Recap');
        recapFile = Recap.locateRecap(symInst);
        
        Program.debugPrint("Found BIOS 5 recap file: " + recapFile);
        
        /* 
         * Load the ti.bios.rta package for decoding LOG records.
         * This must be done in the main server thread, it can't be done in
         * the LOG view.
         */
        xdc.loadPackage('ti.bios.rta');
        
        /* Load the recap */
        var recap = xdc.loadCapsule(recapFile);
        
        return (recap);
    }
    
    /* Otherwise, check if it is a RTSC app */
    xdc.loadPackage('xdc.rta');
    
    /* 
     * Use the 'FileLocator' class, which leverages the path mapping in CCS.
     * This 'locateRecap' API is a helper function which calls down to
     * xdc.rta.Recap and passes an instance of 'FileLocator'. This makes it
     * easier to work with from JavaScript.
     */
    var recapFile = 
        xdc.jre.com.ti.rta.support.file.FileLookup.locateRecap(executable,
                                                               ".rov.xs");
        
    Program.debugPrint("Found RTSC recap file: " + recapFile);
    
    /* Load the recap */
    var recap = xdc.loadCapsule(recapFile);
    
    return (recap);
}