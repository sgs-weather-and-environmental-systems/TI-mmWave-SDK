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
 *  ======== module$meta$init ========
 */
var ResourceBundle;
function module$meta$init() {
    ResourceBundle = this;
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(pkgName, lang)
{
    this.$private.lang = lang;
    this.$private.pkgName = pkgName;
    this.$private.rb = _getResourceBundle(pkgName, lang);
}

/*
 *  ======== getResourceBundle ========
 */
function getResourceBundle(pkgName, langArg) 
{
    return (ResourceBundle.create(pkgName, langArg));
}

/*
 *  ======== _getResourceBundle ========
 */
function _getResourceBundle(pkgName, langArg) 
{
    var pn = pkgName;
    var pkgDir;
    var locale = langArg;  
    var rbun = null;
    
    if (pn == undefined) {
        pkgDir = utils.csd;
    } else {
        pkgDir = xdc.getPackageBase(pkgName);
    }
    
    var defPropFile = new java.io.File(pkgDir, "./properties/resources.properties");
    var defStream = new java.io.FileInputStream(defPropFile);
    var dbun = new java.util.PropertyResourceBundle(defStream);

    var propFile = new java.io.File(pkgDir, "./properties/resources_" + locale + ".properties");
    if (!propFile.exists()) {
        var mloc = locale.split('_');
        if (mloc != undefined) {
            locale = mloc[0];
            propFile = new java.io.File(pkgDir, "./properties/resources_" + locale + ".properties");
        }
    }
        
    if (propFile.exists()) {
        var propStream = new java.io.FileInputStream(propFile);
        rbun = new java.util.PropertyResourceBundle(propStream);
    }
    else {
        rbun = dbun;
    }
    
    return (rbun);
        
}

/**
 * Format message using static ResourceBundle.
 * 
 * @param sKey Message key.
 * @param args Object[] arguments.
 * @see java.text.MessageFormat#format
 */
function formatMessage(sKey, args) {
    var sMsgFormat = this.$private.rb.getString(sKey);
    var sMsg = java.text.MessageFormat.format(sMsgFormat, args);
    return sMsg;
} // end formattedMessage

/**
 * Get string from Resource Bundle mapped to the specified key.
 *
 * @param sKey Message key.
 * @see java.util.PropertyResourceBundle#getString
 * 
 */
function getString(sKey) {
    return (this.$private.rb.getString(sKey));
}
/*
 *  @(#) xdc.tools; 1, 0, 0,0; 11-8-2017 17:13:28; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

