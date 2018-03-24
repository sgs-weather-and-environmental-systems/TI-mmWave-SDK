/*
 *  ======== Registry.xs ========
 */

var Text;

/*
 *  ======== module$use ========
 */
function module$use() 
{
    xdc.useModule('xdc.runtime.Assert');
    xdc.useModule('xdc.runtime.Types');
    
    Text = xdc.useModule('xdc.runtime.Text');
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod) 
{
    mod.listHead = null;
    
    /* Registry module ids start at the max and count down. */
    // TODO - Does it make more sense for them to count up?
    mod.curId = Text.registryModsLastId;
}

/*
 *  ======== viewInitRegisteredModules ========
 */
function viewInitRegisteredModules(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Registry = xdc.useModule('xdc.runtime.Registry');
    var Types = xdc.useModule('xdc.runtime.Types');
    
    /* 
     * Retrieve the module's state. 
     * If this throws an exception, just allow it to propogate up.
     */
    var rawView = Program.scanRawView('xdc.runtime.Registry');
    
    var elements = new Array();
    
    /* Retrieve the begining of the module list. */
    var curDescAddr = rawView.modState == null ? 0 : rawView.modState.listHead;
    
    /* Walk the list of modules. */
    while (curDescAddr != 0) {
        /* Create a view element to display the descriptor. */
        var viewElem = Program.newViewStruct('xdc.runtime.Registry',
                                             'Registered Modules');

        /* Retrieve the target Registry Descriptor object. */
        try {
            var desc = Program.fetchStruct(Types.RegDesc$fetchDesc, 
                                           curDescAddr);
        }
        catch (e) {
            /* 
             * If there was a problem reading the structure, use the element
             * to display the error and return.
             */
            Program.displayError(viewElem, 'modName',
                                 "Problem retrieving the next module in " +
                                 "the Registry: " + e);
            elements[elements.length] = viewElem;
            view.elements = elements;
            return;
        }
    
        /* Retrieve the registered module's name. */
        try {
            viewElem.modName = Program.fetchStaticString(desc.modName);
        }
        catch (e) {
            /* 
             * If there was a problem retrieving the name string, use the
             * element to display the error and continue.
             */
            Program.displayError(viewElem, 'modName',
                                 "Problem retrieving the registered " +
                                 "module's name: " + e);
        }
        
        /* Retrieve the registered module's id. */
        viewElem.id = desc.id;

        /* Display the diags mask. */
        viewElem.mask = "0x" + Number(desc.mask).toString(16);
        
        /* Store the address of the descriptor. */
        viewElem.descAddr = curDescAddr;        
        
        /* Move to the next module. The list ends in 'null'. */
        curDescAddr = desc.next;
        
        /* Add the view structure to the display. */
        elements[elements.length] = viewElem;
    }
    
    view.elements = elements;
}

/*
 *  ======== lookupModIdRov ========
 *  At ROV-time, lookup the module name for the given registered module id.
 */
function lookupModIdRov(modId)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    var view = Program.scanModuleDataView('xdc.runtime.Registry', 
                                          'Registered Modules');
    
    /* Look through each of the registered modules. */
    for each (var elem in view.elements) {
        if (elem.id == modId) {
            return (elem.modName);
        }
    }
    
    /* Return an error message if it wasn't found. */
    return("Module " + modId + " not found in Registry!");
}

/*
 *  ======== isMemberRov ========
 *  At ROV-time, determine whether the given module id is a member of the 
 *  Registry.
 */
function isMemberRov(modId)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* 
     * The range of acceptable Registry module ids is based on the values of
     * configs in the Text module.
     */
    var TextCfg = Program.getModuleConfig('xdc.runtime.Text');
    
    var MAXMID = TextCfg.registryModsLastId;
    var MINMID = TextCfg.unnamedModsLastId + 1;
    
    return (modId <= MAXMID && modId >= MINMID);
}

/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

