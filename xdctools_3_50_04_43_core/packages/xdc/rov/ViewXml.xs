/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * */

/*
 * ======== processCommand ========
 * Accepts a string command line and services the request.
 */
function processCommand(input) {
    var Model = xdc.useModule('xdc.rov.Model');
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* Verify Model has been initialized. */
    if (!Model.$private.initialized) {
        return("<Exception>ROV Model not initialized</Exception>");
    }
    
    try {
        var result = pCmd(input);
    }
    catch (e) {
        var exception = Program.exToString(e);
        Program.debugPrint("rov/server/main.xs caught exception while " +
                           "processing command: " + exception);
        var result = "<Exception>" + xmlQuote(exception) + "</Exception>";
    }
    
    return (result);
}

/*
 *  ======== pCmd ========
 */
function pCmd(input) 
{
    var Program = xdc.useModule('xdc.rov.Program');
    Program.debugPrint("Model - Processing command " + input);
    
    /* Clear Cache */
    if (input == "cc") {
        Program.debugPrint("Clearing server cache...");
        Program.resetMods();
        /* 
         * Server writes out an empty string to acknowledge that the
         * cache has been cleared.
         */
        return ("");
    }
    /* List modules */
    else if (input == "lm") {
        return(listModules());
    }
    /* 
     * Retrieve Module (m is 109 in Java) 
     * 
     * Module requests have the form:
     *   m <module name> <tab name>
     *   m ti.sysbios.knl.Task Detailed
     *
     * The tab name comes last so that it may contain spaces.
     */
    else if (input.charAt(0) == 'm') {
        Program.debugPrint("RovServer received request: " + input);
        var modName = input.substring(2);
        
        /* Find the index of the space after the module name */
        var index = input.indexOf(' ', 3);
    
        modName = input.substring(2, index);
        var tabName = input.substring(index + 1, input.length);
        
        return (retrieveView(modName, tabName));
    }
    /* Unrecognized command */
    else {
        return ("<Exception>Unrecognized command</Exception>");
    }
}

/*
 *  ======== listModules ========
 *
 */
function listModules()
{
    var Model = xdc.useModule('xdc.rov.Model');
    
    Program.debugPrint("Listing modules...");
                
    /* Get the package hierarchy as a js object */
    var moduleList = Model.getModuleList();
    
    /* Convert the package hierarchy to an XML object */
    var sb = new java.lang.StringBuilder();
    sb.append("<ModuleList>\n");
    moduleListToXML(sb, moduleList, "  ");
    sb.append("</ModuleList>\n");
    
    Program.debugPrint("Module list = \n" + sb.toString());
    
    return (sb.toString());
}

/*
 *  ======== retrieveView ========
 *
 */
function retrieveView(modName, tabName)
{
    Program.debugPrint("Retrieving:    tab " + tabName + 
                       "     for module " + modName);

    var viewType = Program.getViewType(modName, tabName);

    var ViewInfo = xdc.useModule('xdc.rov.ViewInfo');
    
    var view;
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
        default:
            throw (new Error("Undefined view type: " + viewType));
            break;
    }
    
    /* Check abort flag before returning. */
    var Model = xdc.useModule('xdc.rov.Model');
    if (Model.getICallBackInst().getAbortFlag()) {
        return("abort");
    }
        
    return (view.toString());   
}

/* 
 *  ======== moduleListToXML ========
 *  This function turns the module list into an XML structure. It does not use
 *  the JavaScript XML type to build the structure--it turns out it's much 
 *  quicker / more efficient to simply build the structure as a String using a 
 *  StringBuilder.
 */
function moduleListToXML(sb, elem, pad) {
    
    /* 
     * For each package, display subpackages first, followed by any modules 
     * in the package. 
     */
    var modules = new Array();
    
    for (var i = 0; i < elem.children.length; i++) {
        /* Handle the modules after adding all the packages. */
        if (elem.children[i].isModule) {
            modules[modules.length] = elem.children[i];
        }
        else {
            var pkg = elem.children[i];
            var folder = pkg.name.substring(pkg.name.lastIndexOf('.') + 1);
            sb.append(pad + "<" + folder + " type=\"package\">\n");
            moduleListToXML(sb, pkg, pad + "  ");
            sb.append(pad + "</" + folder + ">\n");
        }
    }
    
    /* Handle the modules */
    for (var i = 0; i < modules.length; i++) {
        var mod = modules[i];
        
        sb.append(pad + "<" + mod.name + " type=\"module\">\n");
        for (var j = 0; j < mod.tabs.length; j++) {
            sb.append(pad + "  <view type=\"" + mod.tabs[j].type + "\">" + encode(mod.tabs[j].name) + "</view>\n");
        }            
        sb.append(pad + "</" + mod.name + ">\n");
    }
}

/*
 *  ======== retrieveModuleView ========
 *  Retrieve the specified module-type view. Call Program.getViewType to 
 *  determine which Model.retrieve* API to call.
 *  Returns an XML formatted string representing the view.
 */
function retrieveModuleView(modName, tabName)
{
    var msgOk = "ROV detected errors in scan of";
    
    try {
        Program.scanModuleView(modName, tabName);
    } 
    catch (e) {
        if (e.message == "abort") {
            return ("abort");
        }    
        /*
         * Program.scanModuleView will intentionally throw exceptions to
         * force user to handle them. 
         * If this is that type of excpetion, continue on.
         * Otherwise, report the exception directly instead of continuing.
         */  
        else if (!e.message.substring(0, msgOk.length).equals(msgOk)) {
            throw e;
        }
    }
    
    /* Get the view manually in case it threw an exception. */
    var modDesc = Program.getModuleDesc(modName);
    var modView = modDesc.viewMap[tabName];
    
    /*
     * The final result has the form:
     * <Tab name="Module"> <-- tab name
     *   <ti.sysbios.knl.Task> <-- mod name
     *     <ti.sysbios.knl.Task.Module_View> <-- mod view
     *       <schedulerLocked>
     */
    var viewXML = viewToXML(modView, modDesc.errorMap[tabName]);
    
    var modRoot = new XML('<' + modName + '/>');
    modRoot[viewXML.name()] = viewXML;
    
    var tabRoot = new XML('<Tab name="' + encode(tabName) + '"/>');
    tabRoot[modName] = modRoot;
    
    return (tabRoot);
}

/*
 *  ======== retrieveInstanceView ========
 *  Retrieve the specified instance-type view. Call Program.getViewType to 
 *  determine which Model.retrieve* API to call.
 *  Returns an XML formatted string representing the view.
 */
function retrieveInstanceView(modName, tabName)
{    
    var msgOk = "ROV detected errors in scan of";
    
    try {
        Program.scanInstanceView(modName, tabName);
    } 
    catch (e) {
        if (e.message == "abort") {
            return ("abort");
        }    
        /*
         * Program.scanInstanceView will intentionally throw exceptions to
         * force user to handle them. 
         * If this is that type of excpetion, continue on.
         * Otherwise, report the exception directly instead of continuing.
         */  
        else if (!e.message.substring(0, msgOk.length).equals(msgOk)) {
            throw e;
        }
    }
        
    var mod = Program.getModuleDesc(modName);
            
    var root = new XML('<' + modName + '/>');
    
    var count = 0;
    
    /* Get the instance views, add them to the XML output */
    Program.debugPrint("mod.instances.length = " + mod.instances.length);
    
    /* Convert each instance to XML. */
    for (var i in mod.instances) {
        var view = mod.instances[i].viewMap[tabName];
        
        Program.debugPrint ("view = " + view);
        
        var viewXml = viewToXML(view, mod.instances[i].errorMap[tabName]);
        
        /* The first time around... */
        if (i == 0) {
            root[viewXml.name()] = viewXml;
        }
        
        root[viewXml.name()][i] = viewXml;        
    }
        
    /* Add the module root underneath the tab name root */
    var tabRoot = new XML('<Tab name="' + tabName + '"/>');
    tabRoot[modName] = root;
    
    return (tabRoot);
}

/*
 *  ======== retrieveInstanceDataView ========
 *  Retrieve the specified instance-data-type view. Call Program.getViewType to
 *  determine which Model.retrieve* API to call.
 *  Returns an XML formatted string representing the view.
 */
function retrieveInstanceDataView(modName, tabName)
{
    var e;
    try {
        var dataArr = Program.scanInstanceDataView(modName, tabName);
    } 
    catch (e) {
        if (e.message == "abort") {
            return ("abort");
        }
        else {
            var exception = Program.exToString(e);
            Program.debugPrint("Caught exception in ROV Server: " + exception);
        }
    }
    
    var rawView = new java.lang.StringBuilder();
    
    rawView.append('<Tab name="' + tabName + '" type="data">\n');
    rawView.append('  <' + modName + '>\n');
    
    for each (var instView in dataArr) {
        rawView.append('    <' + instView.$type + '>\n'); // xdc.rov.Program.DataView
        rawView.append('      <label>' + instView.label + '</label>\n');
        rawView.append('      <elements>\n');
        
        /* Add each data element */
        for each (var elem in instView.elements) {
            rawView.append(viewToXML(elem, null).toString());
        }
        
        rawView.append('      </elements>\n');
        rawView.append('    </' + instView.$type + '>\n'); // xdc.rov.Program.DataView
    }
    
    rawView.append('  </' + modName + '>\n');
    rawView.append('</Tab>\n');
    
    return (String(rawView));
}

/*
 *  ======== retrieveModuleDataView ========
 *  Retrieve the specified module-data-type view. Call Program.getViewType
 *  to determine which Model.retrieve* API to call.
 *  Returns an XML formatted string representing the view.
 */
function retrieveModuleDataView(modName, tabName)
{
    var e;
    try {
        var dataView = Program.scanModuleDataView(modName, tabName);
    } 
    catch (e) {
        if (e.message == "abort") {
            return ("abort");
        }
        else {
            var exception = Program.exToString(e);
            Program.debugPrint("Caught exception in ROV Server: " + exception);
            /* Re-throw the exception so that the user sees it. */
            throw (e);
        }
    }
    
    var xmlView = new java.lang.StringBuilder();
    
    xmlView.append('<Tab name="' + tabName + '" type="module_data">\n');
    xmlView.append('<' + modName + '>\n');
        
    /* Add each data element */
    for each (var elem in dataView.elements) {
        xmlView.append(viewToXML(elem, null).toString() + "\n");
    }
        
    xmlView.append('</' + modName + '>\n');
    xmlView.append('</Tab>\n');
    
    return (String(xmlView));
}

/*
 *  ======== viewToXML ========
 *  Converts a single view structure to XML. This function is leveraged for
 *  all of the view types except for the Raw tab.
 */
function viewToXML(view, error) {
    var viewXml = new XML('<' + view.$type + '/>');    
    
    /* 
     * Address field is added explicitly because it doesn't show up in 
     * the for/in loop.
     */
    if ('address' in view) {
        viewXml["address"] = view.address;
    }
    
    if (error) {
        viewXml["address"].@error = encode(error);
    }
    
    for (var p in view) {
    
        /* If the status is undefined, don't include this field. */
        if (view.$status[p] === undefined) {
            continue;
        }
        
        /* If the field is an array... */
        if ((view[p]) && (view[p].$category == 'Vector')) {
            
            var array = new XML('<' + p + '/>');
            /* 
             * Create child elements for each array element,
             * formatted like array-0, array-1, etc.
             */
            for (var i = 0; i < view[p].length; i++) {
                var index = p + "-" + i;
                array[index] = encode(view[p][i]);
            }
 
            viewXml[p] = array;
        }
        /* If the field didn't get filled in, display an empty box */
        else if (view[p] == undefined) {
            viewXml[p] = "";
        }
        /* If this is just a normal field. */
        else {
            viewXml[p] = encode(view[p]);
        }
        
        /* If the status is non-null, there's an error to report. */
        if (view.$status[p] != null) {
            viewXml[p].@error = encode(view.$status[p]);
        }

    }
    
    return (viewXml);
}

/* 
 *  ======== encode ========
 *  Encodes the given string to make it safe for XML.
 */
function encode(str) {
    return(java.net.URLEncoder.encode(str, 'UTF-8'));
}

/*
 *  ======== retrieveRawView ========
 *  The raw tab is handled specially because of it's more generic nature and
 *  the complexity of displaying the configuration object.
 *  All of the functions that follow are to support the raw tab.
 */
function retrieveRawView(modName)
{
    var rawObj = Program.scanRawView(modName);
    
    var rawView = new java.lang.StringBuilder();
    
    rawView.append('<Tab name="Raw">\n');
    rawView.append('  <' + modName + '>\n');
    
    Program.debugPrint("Creating raw view XML");
    
    /* Add the module state */
    if (rawObj.modState != null) {
        var modView = rawToXML(rawObj.modState, "Module State", "    ");
        rawView.append(modView);
    }
    
    Program.debugPrint("Creating raw view XML for instances");
    /* Add the instance states */
    rawView.append('    <property name="Instance States">\n');
    for each (var obj in rawObj.instStates) {
        
        var elemName = Program.getShortName(obj.$label);
        if (elemName == "") {
            elemName = String(obj.$addr);
        }
        
        var instView = rawToXML(obj, elemName, "      ");
        rawView.append(instView);        
    }
    rawView.append('    </property>\n');
    
    /* Add the module config info */
    /* This will take some work. Can't have '$' in XML name. */
    var cfgView = rawToXML(rawObj.modCfg, "Configuration", "    ");
    rawView.append(cfgView);
    
    rawView.append('  </' + modName + '>\n');
    rawView.append('</Tab>\n');
    
    return (String(rawView));
}

/*
 *  ======== rawToXML ========
 */
function rawToXML(obj, elemName, pad)
{
    var sb = new java.lang.StringBuilder();

    sb.append(pad + '<property name="' + elemName + '">\n');
    
    xmlStruct(sb, obj, pad + "  ", 0);
    
    sb.append(pad + '</property>\n');

    return String(sb);
}

/* 
 *  ======== xmlStruct ========
 *  Convert a structure to XML using a string builder.
 */
function xmlStruct(sb, obj, pad, level)
{    
    if ((level != undefined) && (level != -1)) {
        level++;
    }
        
    for (var field in obj) {       
        xmlField(sb, field, obj[field], pad, level);
    }
}

/*
 *  ======== xmlField ========
 *  Convert the field of a structure into XML using a string builder. 
 */
function xmlField(sb, field, value, pad, level)
{   
    /* If the field is an object... */
    if (value && typeof value == 'object') {
        /* If this is an address or an enum (an Addr or EnumVal object)... */
        if (('$category' in value) && 
            ((value.$category == 'Addr') || (value.$category == 'EnumVal'))) {
            appendProperty(sb, pad, field, String(value));
        }
        /* Otherwise it's just another structure... */
        else {
            if (level == 5) {
                appendProperty(sb, pad, field, "ROV reached max depth (5)");
            }
            else {
                sb.append(pad + '<property name="' + encode(field) + '">\n');
                xmlStruct(sb, value, pad + "  ", level);
                sb.append(pad + '</property>\n');
            }
        }
    }
    /* If the field is just a scalar value... */
    else {
        appendProperty(sb, pad, field, String(value));
    }
}

/*
 *  ======== xmlQuote ========
 *  Quote special characters in a string for use in an XML document.
 */
function xmlQuote(str) {
    str = str.replace(/&/g, "&amp;");
    str = str.replace(/</g, "&lt;");
    str = str.replace(/>/g, "&gt;");
    str = str.replace(/'/g, "&apos;");
    str = str.replace(/"/g, "&quot;");
    return str;
}

function appendProperty(sb, pad, field, value)
{
    //sb.append(pad + '<' + field + '>' + String(value) + '</' + field + '>\n');
    sb.append(pad + '<property name="' + encode(field) + '">' + encode(value) + '</property>\n');
}
/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

