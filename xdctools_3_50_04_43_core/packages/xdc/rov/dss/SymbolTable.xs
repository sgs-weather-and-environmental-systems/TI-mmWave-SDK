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

/* The underlying Java implementation. */
var jSymTab; 
 
function instance$meta$init(session)
{    
    xdc.loadPackage('xdc.rov.dss');
    
    jSymTab = new Packages.xdc.rov.dss.SymbolTable(session);
}    

/*
 *  ======== getSymbolValue ========
 */
function getSymbolValue(name)
{
    return (jSymTab.getSymbolValue(name));
}

/*
 *  ======== lookupDataSymbol ========
 */
function lookupDataSymbol(addr)
{
    return (jSymTab.lookupDataSymbol(addr));
}

/*
 *  ======== lookupFuncName ========
 */
function lookupFuncName(addr)
{
    return (jSymTab.lookupFuncName(addr));
}

/*
 *  ======== getISA ========
 */
function getISA()
{
    return (jSymTab.getISA()); 
}
