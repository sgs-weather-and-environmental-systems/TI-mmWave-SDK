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
 *  ======== ViewInfo ========
 */
package xdc.rov

/*!
 *  ======== ViewInfo ========
 *  Describes the ROV views supported by a particular module.
 */
@Facet metaonly module ViewInfo
{
    /*
     *  ======== Arg ========
     *  Descriptor for a user-supplied argument passed to an ROV view
     */
    metaonly struct Arg {
        String name;         /*! the name displayed to the user */
        String type;         /*! the type of this argument:
                              *      "string", "number", "boolean"
                              */
        String defaultValue; /*! the default value of this argument */
    }

    /*
     *  ======== Args ========
     *  Descriptor for a set of user-supplied arguments to an ROV view
     *
     *  This structure describes a set of user-supplied arguments for a
     *  module view.
     *
     *  These arguments are module-specific but multiple view descriptors
     *  within a module can reference a common `Args` strucure.  These
     *  arguments allow the user to affect the output of a specific view
     *  and enable the view implementor to keep the set of distinct views
     *  to a minimum.
     */
    metaonly struct Args {
        String description; /*! the description shown to the user */
        Arg args[length];   /*! the argument in positional order */
    }
    
    /*!
     *  ======== ViewType ========
     *  ROV view type
     *
     *  @p(dlist)
     *      - INSTANCE
     *          basic instance information (one row per instance).  The view
     *          init function is passed three arguments: (1) an instance of 
     *          the view structure, (2) the instance state structure of the
     *          instance to view, and (3) a string containing user-supplied
     *          arguments.
     *
     *      - INSTANCE_DATA
     *          instance-specific data tables (many rows per instance).  The
     *          view init function is passed three arguments: (1) an instance
     *          of the
     *          {@link xdc.rov.Program#InstDataView Program.InstDataView}
     *          structure, (2) an instance state structure for the
     *          instance to view, and (3) a string containing user-supplied
     *          arguments.
     *
     *      - MODULE
     *          basic module information (one row per module).  The view
     *          init function is passed three arguments: (1) an instance of 
     *          the view structure, (2) the module state structure of the
     *          module to view, and (3) a string containing user-supplied
     *          arguments.
     *
     *      - MODULE_DATA
     *          module-specific data tables (many rows per module).  The
     *          view init function is passed two arguments: (1) a
     *          {@link xdc.rov.Program#ModDataView Program.ModDataView}
     *          structure, and (2) a string containing user-supplied
     *          arguments.
     *
     *      - RAW
     *         This is a reserved view type used by ROV to display raw data.
     *
     *      - TREE_TABLE
     *         The view init function is passed one argument: a string
     *         containing user-supplied arguments. It is expected
     *         to return a new initialized
     *         {@link xdc.rov.Program#TreeNode xdc.rov.Program.TreeNode}
     *         array or `null` in the event that there is nothing to
     *         display.
     *
     *         This view type is used to describe the `Diags` masks
     *         for all modules, for example; see
     *         {@link xdc.runtime.Diags#rovViewInfo Diags.rovViewInfo}'
     *
     *      - TREE
     *         The view init function is passed one argument: a string
     *         containing user-supplied arguments.  It is expected
     *         to return a new initialized JavaScript hash table of hash
     *         tables or `null` in the event that there is nothing to display.
     *
     *         This view type provides a simple two-level tree of name-value
     *         pairs.
     *  @p
     */
    metaonly enum ViewType {
        INSTANCE,
        MODULE,
        INSTANCE_DATA,
        MODULE_DATA,
        RAW,
        TREE_TABLE,
        TREE
    }
    
    /*!
     *  ======== View ========
     *  ROV View descriptor
     *
     *  @field(type)          the view type which control the type of arguments
     *                        passed to the `viewInitFxn`
     *  @field(viewInitFxn)   the name of a function that converts raw target
     *                        data into a human readable "view structure".
     *                        This name is the name of a metaonly function
     *                        defined in the module's `.xs` file.
     *  @field(structName)    the name of the view structure populated by
     *                        the `viewInitFxn`.  This name is a name defined
     *                        the module's `.xdc` file.
     *  @field(argsName)      the name of an `Args` descriptor that defines the
     *                        user-supplied arguments for this view.
     *                        `argsName` is used to index into `argsMap`.
     */
    metaonly struct View {
        ViewType type;
        String   viewInitFxn;
        String   structName;
        String   argsName;
    }

instance:
    
    /*!
     *  ======== viewMap ========
     *  Specifies all of the ROV views for the module
     *
     *  Maps module-specific view names to an appropriate View descriptor.
     */
    metaonly config View viewMap[string];

    /*!
     *  ======== showRawTab ========
     *  Control whether or not the "raw view" is available
     */
    metaonly config Bool showRawTab = true;

    /*!
     *  ======== argsMap ========
     *  Specifies argument structures for all of a module's views
     *
     *  Maps module-specific argument sets to an appropriate Args descriptor.
     */
    metaonly config Args argsMap[string];
}
/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

