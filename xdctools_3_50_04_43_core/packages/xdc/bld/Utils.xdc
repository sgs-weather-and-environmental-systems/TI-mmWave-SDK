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
 *  ======== Utils.xdc ========
 */
package xdc.bld

/*!
 *  ======== Utils ========
 *  Utility functions to simplify creation of targets and platforms
 */
metaonly module Utils
{
    /*!
     *  ======== expandString ========
     *  Expand references within a string to specified values
     *
     *  All references of the form "`$(<name>)`" within the command string,
     *  `cmd` are replaced with the string value having key `<name>` in the
     *  hashtable `values`.
     *
     *  If `<name>` appears in values and its value is `null` or `undefined`,
     *  then `$(<name>)` is replaced with the empty string.  If `<name>` does
     *  not appear in `values`, then `$(<name>)` is not replaced.
     *
     *  @param(cmd)     a string with embeded references to values defined in
     *                  the values hashtable parameter
     *  @param(values)  an arbitrary hash of name-value pairs; these values
     *                  are used to substitute for references of the form
     *                  `$(name)` that appear within `cmd`.
     *
     *  @a(returns)     string with references replaced as specified by the
     *                  `values` hash.
     *
     *  @a(throws)      `Error` exceptions are thrown for fatal errors
     */
    String expandString(String cmd, Any values);

    /*!
     *  ======== expandDbgName ========
     *  Generate name of a debug support output file
     *
     *  @param(cfgName) the name of the generated configuration script
     *                  without the ".cfg" extension
     *  @param(exeName) the name of the output executable
     *  @param(pattern) file name pattern
     *
     *  Both cfgName and exeName are relative to the directory containing
     *  package.bld.
     *
     *  @_nodoc this function is an internal method shared between xdc.bld
     *  and xdc.cfg and has little value outside this context.
     */
    function expandDbgName(cfgName, exeName, pattern);
    
    /*!
     *  ======== parsePlatName ========
     *  Parse platform instance name into platform package name and short
     *  instance name
     *
     *  @param(platInstName)     the name of a platform instance
     *
     *  @a(returns)
     *  returns object with the following fields:
     *  @p(dlist)
     *      - `platPkgName`
     *              name of the platform package name
     *      - `instName`
     *              name of the platform instance
     *      - `instMod`
     *              module object specifying platform instances (if it exists)
     * @p
     *
     *  @a(throws)      `Error` exceptions are thrown for fatal errors

     *  @_nodoc this function is an internal method shared between xdc.bld
     *  and xdc.cfg and has little value outside this context.
     */
    function parsePlatName(platInstName);

    /*!
     *  ======== display ========
     *  Recursively print arbitrary object
     *
     *  @param(msg)  a string to print before printing the object
     *  @param(obj)  an arbitrary object to display
     */
    Void display(String msg, Any obj);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

