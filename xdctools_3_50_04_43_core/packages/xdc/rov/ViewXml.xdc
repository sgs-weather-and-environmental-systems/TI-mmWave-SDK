
/*!
 *  ======== ViewXml ========
 *  This module sits on top of the ROV core to convert ROV views into
 *  XML. This is useful for test scripts and command-line based ROV tools.
 */
metaonly module ViewXml {
    
    /*!
     *  ======== processCommand ========
     *  This API allows the client to interact with the ROV core and retrieve
     *  ROV views.
     *
     *  It takes String commands of the following forms.
     *  1. "lm" - List Modules. 
     *     This returns an XML list of all of the modules in the executable's
     *     configuration and the views they support.
     *  2. "m <module name> <tab name>" - Retrieve tab view for module.
     *  3. "cc" - Clear cache.
     *     This command clears the ROV core's cache of views. This command
     *     should be sent whenever the target state changes.     
     */
    String processCommand(String cmd);
    
    /*!
     *  ======== listModules ========
     *  Returns the list of modules in XML form.
     */
    String listModules();
    
    /*!
     *  ======== retrieveView ========
     *  Retrieves the view in XML form for the given module and tab.
     */
    String retrieveView(String modName, String tabName);
}
/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

