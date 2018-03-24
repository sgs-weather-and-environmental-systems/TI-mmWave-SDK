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
/*!
 *  ======== ResourceBundle ========
 *  @_nodoc
 * Provide access to localized properties files within packages.
 *
 * This module encapsulates a resource bundle to manage
 * resources for a locale using a set of static strings from 
 * a property file. This allows you to write programs that can: 
 * @p(dlist)
 *    - be easily localized, or translated, into different languages
 *    - handle multiple locales at once
 *    - be easily modified later to support even more locales
 * @p
 *
 * @see java.util.PropertyResourceBundle
 * @see java.util.Properties
 * @see java.text.MessageFormat
 * 
 * @a(SETUP)
 * @p(blist)
 *    - Factor resource/message strings from a command-line/gui 
 *      application into a properties file.
 *    - Create a properties directory in the application package.
 *    - Name the file resources.properties
 *    - Place the properties file within the properties directory.
 *    - Optionally translate the strings within the properties file
 *      into additional languages and add the translated files into
 *      the properties directory according to the ResourceBundle
 *      family file nameing conventions:
 *          .e.g. resources_es.properties would name a Spanish translation.
 *    - Add the 'properties' directory to the package.bld file.
 *      @p(code)
 *      Pkg.otherFiles = ['properties'];
 *      @p
 * @p
 *
 * @a(USAGE)
 * In the resources.properties file:
 * @p(code)
 * # Display Strings
 * column.name = Name
 * column.value = Value
 * # Messages
 * msg.error.pkg.notfound = Error: package could not be found: {0}
 * msg.arg.test = Message Test {0}, {1}, {2} and that is all
 * @p
 
 * In the application code:
 * @p(code)
 *    var rbMod = xdc.useModule('xdc.tools.ResourceBundle');
 *    var rbInst = rbMod.getResourceBundle('xdc.tools.objviewer.sg', 'en');  
 *    var colName = rbInst.getString('column.name');
 *    var pnfMsg = rbInst.formatMessage('msg.error.pkg.notfound', ['ti.sysbios.knl']);
 *    var tstMsg = rbInst.formatMessage('msg.arg.test', ['string1', 'string2', 'string3']);
 * @p
 *  
 */
metaonly module ResourceBundle {

    /*!
     *  ======== getResourceBundle ========
     * getResourceBundle() - Convenience function to create an instance.
     *
     * Create ResourceBundle Instance using the properties file found
     * in the specified package localized to the stated language.
     *
     * @param(pkgName)          Qualified package name
     *
     * @param(lang)             Locale indicator
     *
     * @a(returns)              ResourceBundle.Instance
     */
    ResourceBundle.Instance getResourceBundle(String pkgName, String lang);


instance:

    /*!
     * getString()
     *
     * Get the string specified by the key from the underlying
     * properties file. 
     *
     * @param(key) resource string key
     * 
     * @a(returns) specified string
     * 
     * @see java.util.PropertyResourceBundle#getString
     */
    String getString(String key);
    
    /*!
     * formatMessage()
     *
     * Format a string specified by the key and using the
     * declared arguments from the underlying properties file. 
     * @param(key) resource string key
     * @param(args) array of positional string arguments
     * @a(returns) specified string
     * @see java.util.PropertyResourceBundle#getString
     * @see java.text.MessageFormat#formatMessage
     * 
     */    
    String formatMessage(String key, any args);
    
    
    /*!
     * create()
     *
     * Create ResourceBundle Instance using the properties file found
     * in the specified package localized to the stated language.
     * @param(pkgName) Qualified package name
     * @param(lang)    Locale indicator
     * @a(returns) ResourceBundle.Instance
     */
    create(String pkgName, String lang);
     

}
/*
 *  @(#) xdc.tools; 1, 0, 0,0; 11-8-2017 17:13:28; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

