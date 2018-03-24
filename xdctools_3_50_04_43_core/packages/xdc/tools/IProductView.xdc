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
package xdc.tools;

/*!
 *  ======== IProductView ========
 *  @_nodoc
 *  Provide product organization details
 *
 *  The IProductView interface allows RTSC products to provide
 *  a logical view for consumption within IDE frameworks like eclipse.
 *  The interface defines a structure 'ProductElemDesc' that can be
 *  used to define the product as a logical grouping of modules.
 *   
 *  The 'ProductElemDesc' structure can be built recursively to
 *  form a tree. The implementor can also control the display of the
 *  tree elements by associating icons with individual nodes of the tree.
 *  
 *  The interface also defines a method called 'getProductDescriptor'
 *  that maybe queried by the IDE to get the defined 'ProductElemDesc'
 *  structure. The IDE can then build a graphical tree view of the product.
 */ 
metaonly interface IProductView {
    
    /*!
     *  Structure that should be filled up recursively by the implementor to
     *  define the logical tree view of the product. The product view is 
     *  essentially composed of elements that are either modules or groups.
     *  Groups can contain other groups or modules. The implementor will 
     *  typically start with a root node and then logically build a tree
     *  comprising of groups and modules.
     *
     *  @field(elemName)        Name of element. Elements can be groups or
     *                          modules
     *  @field(moduleName)      In case of a leaf node this field will
     *                          contain the module name. For intermediate
     *                          tree nodes the module name will be set to null
     *  @field(iconFileName)    The name of the icon file that is associated
     *                          with this element
     *  @field(elemArray)       Array of 'ProductElemDesc' that allows to
     *                          recursively build up a tree of ProductElemDesc
     */ 
    metaonly struct ProductElemDesc {
        String elemName;
        String moduleName;
        String iconFileName;
        ProductElemDesc elemArray[];
    };
    
    /*!
     *  ======== getProductDescriptor ========
     *  Return product descriptor
     *
     *  This function returns the root node of the tree of 'ProductElemDesc'
     *  structures built by the implementation.
     */ 
    ProductElemDesc getProductDescriptor();

}
/*
 *  @(#) xdc.tools; 1, 0, 0,0; 11-8-2017 17:13:28; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

