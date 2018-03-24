/* --COPYRIGHT--,EPL
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * --/COPYRIGHT--*/

var gs;
var configModel;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init() 
{
    /* jars aren't normally loaded until after the schema loads completely */
    xdc.$$addJars(xdc.getPackageBase(this.$package) + "java");
    gs = Packages.xdc.services.getset;

    /* configure debug information */
    gs.GetSet.onSet(this, "debug",
                    function(name, value){gs.GetSet.debug = value;});
    gs.GetSet.onSet(this, "maxIterations", 
                    function(name, value){gs.Group.maxIterations = value;});
    gs.GetSet.onSet(this, "maxStackDepth", 
                    function(name, value){gs.Setters.maxStackDepth = value;});

    /* if XGCONF is running, notify it of any changes */
    configureXGCONF();
}

/*
 *  ======== init ========
 */
function init(obj) 
{
    gs.GetSet.init(obj);
}

/*
 *  ======== createGroup ========
 */
function createGroup() 
{
    return gs.Scheduler.createGroup();
}

/*
 *  ======== onGet ========
 */
function onGet(obj, sel, getter) 
{
    gs.GetSet.onGet(obj, sel, getter);
}

/*
 *  ======== onSet ========
 */
function onSet(obj, sel, setter) 
{
    gs.GetSet.onSet(obj, sel, setter);
}

/*
 *  ======== configureXGCONF ========
 * (should't xgconf register with us rather than us registering with xgconf?)
 */
function configureXGCONF() 
{
    /* if the XGCONF ConfigProvider module isn't loaded, we're done */
    var ConfigProviderName = "xdc.tools.xgconf.configprovider.ConfigProvider";
    if (!(ConfigProviderName in xdc.om)) {
        return;
    }

    /* if ConfigProvider isn't currently being used, we're done */
    var ConfigProvider = xdc.om[ConfigProviderName];
    if (ConfigProvider.$instances.length == 0) {
        return;
    }

    /* if it's an old version without the propertyChange method, we're done */
    configModel = ConfigProvider.$instances[0].$private.configModel;
    if (!("propertyChange" in configModel)) {
        return;
    }

    /* setup a global listener to notify XGCONF */
    gs.Setters.addGlobal(notifyXGCONF);
}

/*
 *  ======== notifyXGCONF ========
 *  Notify XGCONF of any setter firing.
 */
function notifyXGCONF(name, value) 
{
    if (gs.GetSet.debug) {
        print("notifying xgconf about " + this + "." + name
            + " set to " + value);
    }
    /* construct event and signal that the property has changed */
    var event = new Packages.xdc.tools.xgconf.modeldata.ModelEvent;
    event.propertyName = this.$name + "." + name;
    configModel.propertyChange(event);
}
