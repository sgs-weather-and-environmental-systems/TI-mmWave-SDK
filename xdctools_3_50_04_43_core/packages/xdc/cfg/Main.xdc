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
 *  ======== Main.xdc ========
 */

/*!
 *  ======== Main ========
 *  API for the configuration model.
 *
 *  This module contains functions that allow a client to run separate
 *  steps of the configuration phase.
 *
 *  @_nodoc
 */

metaonly module Main {

    /*!
     *  ======== init ========
     *  Initialize the configuration model
     *
     *  This function adds references `Program` and `prog` to the current
     *  scope.  Both references refer to `xdc.cfg.Program` module.
     *
     *  This function also replaces the default implementation of
     *  `xdc.useModule` with a config-specific implementation.
     */
    Void init();

    /*!
     *  ======== setExecutable ========
     *  Select the executable to be configured
     *
     *  This function populates the Program object based on the executable.
     *  The executable is either a `java.io.File` object or a string specifying
     *  a file name. If `pathPrefix` is supplied, the executable is located in
     *  the directory specified by that parameter. Otherwise, the executable
     *  is searched for in the current directory and if it is not found there,
     *  an error is reported.
     *
     *  Supplying `pathPrefix` is not necessary for standard build flow but is
     *  required if this module is used directly, e.g. via graphical
     *  configuration.
     *
     *  @param `cfgScript`	executable configuration script
     *
     *  @param `pathPrefix`	absolute path to the directory where
     *                          `cfgScript` is located
     *
     *  @a(return)		the array of error messages joined in a string 
     *				separated by "@@"
     */
    String setExecutable(String cfgScript, String pathPrefix);

    /*!
     *  ======== runStringCfg ========
     *  UNDER CONSTRUCTION
     *  @_nodoc
     *
     *  Run the configuration script for the selected executable and configure
     *  all modules and instances.
     *
     *  The executable selected with setExecutable() is configured by running
     *  its user defined script. Then, this function closes all packages.
     *
     *  @param `userScript`  Parameter that specifies a string to
     *                     be executed instead of the user specified
     *                     configuration script  
     *
     *  @a(return)	the array of error messages joined in a string 
     *			separated by "@@"
     */
    String runStringCfg(String userScript);

    /*!
     *  ======== runCfg ========
     *  Run the configuration script for the selected executable and configure
     *  all modules and instances.
     *
     *  The executable selected with `setExecutable()` is configured by running
     *  its user defined script. Then, this function closes all packages.
     *
     *  @a(return)	the array of error messages joined in a string 
     *			separated by "@@"
     */
    String runCfg();

    /*!
     *  ======== validate ========
     *   Validate the configuration
     *
     *  This function calls validate functions for all modules and packages.
     *
     *  @a(return)	the array of error messages joined in a string 
     *			separated by "@@"
     */
    String validate();

    /*!
     *  ======== genFiles ========
     *  Generate the files required to build the selected executable
     *
     *  This function generates files that are compiled and linked with
     *  the application's object files to generate an application.
     *  Those functions are not exposed for now, but can be if needed.
     *
     *  @param executable	string or a java.io.File object
     *
     *  @param prefix		a relative path in the package base directory
     *				where the generated files are located
     *				(usually package/cfg')
     *
     */
    String genFiles(any executable, String prefix);
    
    /*!
     *  ======== main ========
     *  Run the configuration model for a given executable
     *
     *  This function is the shell of the configuration model. A configuration
     *  for a given executable gets created and the files needed by the 
     *  executable are generated.
     *
     *  @param args             array of arguments
     *  @p(dlist)
     *      - `args[0]`
     *          string or a java.io.File object identifying the executable
     *
     *      - `args[1]`
     *          name of the executable's configuration script
     *
     *      - `args[2]`
     *          a relative path in the package base directory
     *		where the generated files are located
     *		(usually package/cfg')
     *
     *      - `args[3]`
     *          an absolute path to the package where the executable's
     *          configuration script is located (this argument is optional,
     *          and if not specified, the current working directory is assumed)
     *  @p
     */
    function main(args); 
}
/*
 *  @(#) xdc.cfg; 1, 0, 2,0; 11-8-2017 17:10:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

