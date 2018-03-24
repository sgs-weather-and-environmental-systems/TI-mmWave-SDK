/* 
 *  Copyright (c) 2016 Texas Instruments. All rights reserved.
 *  This program and the accompanying materials are made available under the
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
/*
 *  ======== Rta.xdc ========
 */

package xdc.runtime;

/*!
 *  ======== Rta ========
 *  The Rta module contains target and configuration code for providing RTA
 *  support.
 *
 *  The 'Command' enum defines the available control commands, and the
 *  'CommandPacket' structure defines the format of commands received from
 *  the host.
 *
 *  All commands should send back a response, even if only to acknowledge
 *  receipt and completion of the command. The format of the response
 *  is defined by the 'ResponsePacket' structure.
 *
 *  The Rta_processCommand can be used to process commands received from a
 *  host to call the appropriate API. Alternatively, the individual APIs can
 *  be called if not all of the defined commands are used.
 */
@DirectCall
module Rta {

    /*! Logged when the Agent receives a command */
    config Log.Event LD_cmdRcvd = {
        mask: Diags.USER2,
        msg: "LD_cmdRcvd: Received command: %d, arg0: 0x%x, arg1: 0x%x"
    };

    /*! Logged when a diags mask is changed */
    config Log.Event LD_writeMask = {
        mask: Diags.USER2,
        msg: "LD_writeMask: Mask addres: 0x%x, New mask value: 0x%x"
    };

    /*! Assert if logger id in control command is invalid. */
    config Assert.Id A_invalidLogger = {
        msg: "A_invalidLogger: The logger id %d is invalid."
    };

    /*! Error raised if Agent receives an invalid command. */
    config Error.Id E_badCommand  = {
        msg: "E_badCommand: Received invalid command, id: %d."
    };

    /*! Command ids */
    enum Command : Int {
        Command_READ_MASK = 0,
        Command_WRITE_MASK = 1,
        Command_LOGGER_OFF = 2,
        Command_LOGGER_ON = 3,
        Command_GET_CPU_SPEED = 4,
        Command_RESET_LOGGER = 5,
        Command_CHANGE_PERIOD = 6,
        Command_START_TX = 7,
        Command_STOP_TX = 8
    };

    /*!
     * Structure of command received from host
     * TODO - Either the types should be changed to 32-bits, or the packet
     * size information should be added to the RTA XML file.
     */
    struct CommandPacket {
        Command  cmdId;
        UArg     arg0;
        UArg     arg1;
    }

    /*! Structure of response packet sent back to host */
    struct ResponsePacket {
        Command  cmdId;
        UArg     resp0;
        UArg     resp1;
    }

    /*!
     *  ======== dataTransportClassName =========
     *  The name of the xdc.rta.IDataTransport class to use.
     *
     *  The class specified here can be used on the host for reading RTA data
     *  from this target application.
     */
    config String dataTransportClassName = "";

    /*!
     *  ======== controlTransportClassName ========
     *  The name of the xdc.rta.IControlTransport class to use.
     *
     *  The class specified here can be used on the host for communicating with
     *  this target application to send control commands and receive responses.
     */
    config String controlTransportClassName = "";

    /*!
     *  ======== processCommand ========
     *  Executes a command packet and prepares the response packet.
     *
     *  This API will execute the command specified by the command packet
     *  argument, and will store the response information in the response
     *  packet argument.
     *
     *  @param(cmd)    The CommandPacket to execute.
     *  @param(resp)   The ResponsePacket to populate with the response.
     */
    Void processCommand(CommandPacket *cmd, ResponsePacket *resp);

    /*!
     *  ======== acknowledgeCmd ========
     */
    Void acknowledgeCmd(ResponsePacket *resp);

    /*!
     *  ======== readMask ========
     */
    Void readMask(ResponsePacket *resp, UArg addr);
    
    /*!
     *  ======== writeMask ========
     */   
    Void writeMask(ResponsePacket *resp, UArg addr, UArg val);
    
    /*!
     *  ======== enableLog ========
     */
    Void enableLog(ResponsePacket *resp, UArg log);
    
    /*!
     *  ======== disableLog ========
     */
    Void disableLog(ResponsePacket *resp, UArg log);
    
    /*!
     *  ======== getCpuSpeed ========
     */
    Void getCpuSpeed(ResponsePacket *resp);
    
    /*!
     *  ======== resetLog ========
     */
    Void resetLog(ResponsePacket *resp, UArg log);
    
    /*!
     *  ======== changePeriod ========
     */
    Void changePeriod(ResponsePacket *resp, UArg period);

    /*!
     *  @_nodoc
     *  ======== genRta ========
     *  Generates the Rta XML file.
     */
    function genRta(outputFileName);

}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

