/* --COPYRIGHT--,EPL
 *  Copyright (c) 2016 Texas Instruments Incorporated
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
 *  ======== Main.xdc ========
 *  The xdc.rov.monserver delivers ROV views to clients through the standard
 *  IO. The clients access monserver through an ROV module embedded in the
 *  TI Cloud Agent, or through a WebSocket server.
 *
 *  Commands:
 *
 *  Start the server -
 *      xs xdc.rov.monserver -p <port_number>
 *
 *  Load an executable
 *      exec:<full path>
 *
 *  Get a list of Modules and Tabs
 *      list
 *
 *  Get a Module's View
 *      view:Task,Basic
 *
 *  Unload the executable
 *      clear
 *
 */
metaonly module Main inherits xdc.tools.ICmd {

    override config String usage[] = [
        ' ',
        'Usage',
        '[-p]',
        '[--help]',
        ' ',
    ];

instance:

    /*!
     *  ======== port ========
     *
     *  TCP port for the server
     *
     *  Only values from 1025 to 65535 are accepted.
     */
    @CommandOption('p')
    config UInt port = 8888;

}
