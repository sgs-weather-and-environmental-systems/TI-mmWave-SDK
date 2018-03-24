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

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(controllerIndex)
{    
    /* 
     * Retrieve the handle to the controller from the static controller map
     * using the index that was passed in.
     */
    var controller = xdc.jre.com.ti.dvt.server4.ControllerMap.getController(controllerIndex);
    
    /* Get the SymbolTable implementation. */
    this.$private.symTab = controller.getSymbolTable();
}

/*
 *  ======== getSymbolValue ========
 *  This function returns the address of the requested symbol
 */
function getSymbolValue(symbolName)
{
    var val = this.$private.symTab.getSymbolValue(symbolName);
    
    if (val == -1) {
        Program.debugPrint("Failed to find symbol: '" + symbolName + "'!");
    }
    
    return (val);
}

/*
 *  ======== lookupDataSymbol ========
 *  This function returns an array of symbols that have the specified value.
 */
function lookupDataSymbol(addr)
{   
    return (this.$private.symTab.lookupDataSymbol(addr));
}

/*
 *  ======== lookupFuncName ========
 *  Lookup the function name(s) at a given address.
 */
function lookupFuncName(addr)
{
    return (this.$private.symTab.lookupFuncName(addr));
}

/*
 *  ======== getISA ========
 * getCPUSubFamily returns a decimal number, convert it to hex to
 * retrieve the isa. e.g. 100 -> '64', 40 -> '28', 85 -> '55'.
 */
function getISA()
{
    return (this.$private.symTab.getISA());
}

/*
 *  ======== getJavaImp ========
 */
function getJavaImp()
{
    return (this.$private.symTab);
}
