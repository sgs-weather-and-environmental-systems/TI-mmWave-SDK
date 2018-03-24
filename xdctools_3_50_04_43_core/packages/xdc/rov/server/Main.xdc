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
/*!
 *  ======== Main ========
 *  @_nodoc
 *  This module is the ROV Server which communicates with the ROV GUI plugin
 *  in CCS 4.
 */
metaonly module Main inherits xdc.tools.ICmd {

    override config String usage[] = [
        ' ',
        'Usage',
        '[-v version] [-e executable] [-i ROV Controller Index]', 
        '[--help]',
        ' ',
    ];

instance:
    
    /*!
     *  ======== serverVers ========
     *  The current version of the ROV Server.
     *
     *  This version number is bumped for the following changes:
     *  1. Changes to the create arguments to the ROV Server.
     *  2. Changes to any of the ROV Controller APIs which are
     *     called by the ROV Server.
     *
     *  This version number should also be bumped whenever the xdc.rov.Model
     *  version number changes. The version check error reported by the ROV
     *  server is designed for the GUI and is more user friendly than the one
     *  returned by the Model. So if there is any incompatibility between
     *  the plugin and server, we want the server version to catch it.
     */
    config Int serverVers = 4;
    
    /*!
     *  ======== modelVers ========
     *  The version of the ROV Model that this server is compatible with.
     */
    config Int modelVers = 4;
    
    /*!
     *  ======== version ========
     *  Version number with two positions, for example "1.2".
     *
     *  The first position is the Model xmlVers, which indicates compatibility
     *  with the XML format returned by the ROV Model.
     *
     *  The second position is the ROV server version, which indicates 
     *  compatibility between the server and plugin. This includes the server
     *  create arguments and any changes to ROV Controller APIs which are 
     *  called from the server.
     */
    @CommandOption('v')
    config String version = "";
    
    /*!
     *  ======== executable ========
     *  Path to the executable.
     */
    @CommandOption('e')
    config String executable = "";

    /*!
     *  ======== controllerIndex ========
     *  ROV Controller index.
     *
     *  Index into ControllerMap which allows the ROV server to obtain a
     *  handle to the ROV Controller.
     */
    @CommandOption('i')
    config Int controllerIndex = -1;
}
