/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
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

#include <xdc/std.h>

#include <xdc/runtime/Error.h>
#include <xdc/runtime/Log.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/Timestamp.h>

#include "package/internal/Rta.xdc.h"

/* Value to respond to host that command was received and processed. */
#define ACKNOWLEDGED    1

/*
 *  ======== Rta_processCommand ========
 */
Void Rta_processCommand(Rta_CommandPacket *cmd, Rta_ResponsePacket *resp)
{       
    /* Log receipt of a command. */
    Log_write3(Rta_LD_cmdRcvd, cmd->cmdId, cmd->arg0, cmd->arg1);
    
    /* Include the cmd id in the response */
    resp->cmdId = cmd->cmdId;
    
    /* Handle the command. */
    switch (cmd->cmdId) {
        case Rta_Command_READ_MASK:
            Rta_readMask(resp, cmd->arg0);
            break;
        case Rta_Command_WRITE_MASK:
            Rta_writeMask(resp, cmd->arg0, cmd->arg1);
            break;
        case Rta_Command_LOGGER_OFF:
            Rta_disableLog(resp, cmd->arg0);
            break;
        case Rta_Command_LOGGER_ON:
            Rta_enableLog(resp, cmd->arg0);
            break;
        case Rta_Command_GET_CPU_SPEED:
            Rta_getCpuSpeed(resp);
            break;
        case Rta_Command_RESET_LOGGER:
            Rta_resetLog(resp, cmd->arg0);
            break;
        case Rta_Command_CHANGE_PERIOD:
            Rta_changePeriod(resp, cmd->arg0);
            break;
        default:
            Error_raise(NULL, Rta_E_badCommand, cmd->cmdId, 0);
            break;
    }
}

/*
 *  ======== Rta_acknowledgeCmd ========
 *  For commands that have no response, send an acknowledgement that the
 *  command was received and processed.
 */
Void Rta_acknowledgeCmd(Rta_ResponsePacket *resp)
{
    resp->resp0 = ACKNOWLEDGED;    
}
 
/*
 *  ======== Rta_readMask ========
 */
Void Rta_readMask(Rta_ResponsePacket *resp, UArg addr)
{
    /* 
     * The address passed in is the address of diagsMask__C, which holds the
     * address of the actual diagsMask in the module state structure. So
     * the address passed in must be dereferenced twice. 
     * The diagsMask is a Bits16.
     */
    Bits16 *maskAddr = *((Bits16 **) xdc_uargToPtr(addr));
    
    resp->resp0 = *maskAddr;    
}

/*
 *  ======== Rta_writeMask ========
 */
Void Rta_writeMask(Rta_ResponsePacket *resp, UArg addr, UArg val)
{
    /* 
     * The address passed in is the address of diagsMask__C, which holds the
     * address of the actual diagsMask in the module state structure. So
     * the address passed in must be dereferenced twice. 
     */
    Bits16 *maskAddr = *((Bits16 **) xdc_uargToPtr(addr));
    
    /* The diagsMask is a Bits16. */
    *maskAddr = (Bits16) val;
    
    Log_write2(Rta_LD_writeMask, (UArg) maskAddr, (Bits16) val);
    
    /* Acknowledge the command. */
    Rta_acknowledgeCmd(resp);
}

/*
 *  ======== Rta_enableLog ========
 *  TODO - Currently not supported for all ILoggers.
 */
Void Rta_enableLog(Rta_ResponsePacket *resp, UArg log)
{
    //UInt32 logNum = (UInt32) log;

    // TODO - Enable the log
    
    /* Acknowledge the command. */
    Rta_acknowledgeCmd(resp);
}

/*
 *  ======== Rta_disableLog ========
 *  TODO - Currently not supported for all ILoggers.
 */
Void Rta_disableLog(Rta_ResponsePacket *resp, UArg log)
{
    //UInt32 logNum = (UInt32) log;

    // TODO - Disable the log
    
    /* Acknowledge the command. */
    Rta_acknowledgeCmd(resp);
}

/*
 *  ======== Rta_resetLog ========
 *  TODO - Currently not supported for all ILoggers.
 */
Void Rta_resetLog(Rta_ResponsePacket *resp, UArg log)
{
    //UInt32 logNum = (UInt32) log;
    
    // TODO - Reset the log
    
    /* Acknowledge the command. */
    Rta_acknowledgeCmd(resp);
}

/*
 *  ======== Rta_changePeriod ========
 *  TODO - Currently unsupported. User needs to provide a function handle to
 *  perform this task.
 */
Void Rta_changePeriod(Rta_ResponsePacket *resp, UArg period)
{
    //UInt32 newPeriod = (UInt32) period;

    // TODO - Change the period
    
    /* Acknowledge the command. */
    Rta_acknowledgeCmd(resp);
}
 
/*
 *  ======== Rta_getCpuSpeed ========
 */
Void Rta_getCpuSpeed(Rta_ResponsePacket *resp)
{
    Types_FreqHz freq;
    
    /* Get the Timestamp frequency. */
    Timestamp_getFreq(&freq);
    
    resp->resp0 = freq.hi;
    resp->resp1 = freq.lo;    
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

