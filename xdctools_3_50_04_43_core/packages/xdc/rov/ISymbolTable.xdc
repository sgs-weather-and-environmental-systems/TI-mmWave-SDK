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
 *  ======== ISymbolTable ========
 *  @_nodoc
 *  Symbol table reader interface
 *
 *  This interface is used by a variety of tools that need to preuse
 *  an application's symbols.
 */
metaonly interface ISymbolTable {

instance:
    
    /*!
     *  ======== getSymbolValue ========
     *  Returns the value of the symbol
     *
     *  Returns -1 if the symbol does not exist.
     */
    Int getSymbolValue(String name);

    /*!
     *  ======== lookupDataSymbol ========
     *  Returns an array of all the symbol names at the given data address
     */
    Any lookupDataSymbol(Int addr);
    
    /*!
     *  ======== lookupFuncName ========
     *  Returns an array of all the symbol names at the given function address
     */
    Any lookupFuncName(Int addr);
    
    /*!
     *  ======== getISA ========
     *  Returns the ISA of the current target as a decimal value
     *  
     *  The hexadecimal of the returned value matches the ISA string.
     *  For example, for 64x targets this API returns 100 (0x64).
     */
    Int getISA();
    
    /*!
     * @_nodoc 
     *  ======== getJavaImp ========
     *  Returns an object implementing the ISymbolTable.java interface
     *  
     *  This may either be a Java object which backs this XDC module or it may
     *  just be a JavaScript object which has been made into an implementing
     *  Java object.
     */
    function getJavaImp(); 
}
/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

