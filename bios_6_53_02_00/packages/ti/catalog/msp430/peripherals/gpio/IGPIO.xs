/*
 * Copyright (c) 2016, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


/*
 *  ======== IGPIO.xs ========
 */

var iGPIO;

/*
 *  ======== module$validate ========
 */
function module$validate()
{
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init()
{
    this.interruptSource[0].registerName = "P1IE.0";
    this.interruptSource[0].registerDescription = "Port1 Interrupt Enable Bit 0";
    this.interruptSource[0].interruptEnable = false;
    this.interruptSource[0].interruptHandler = false;

    this.interruptSource[1].registerName = "P1IE.1";
    this.interruptSource[1].registerDescription = "Port1 Interrupt Enable Bit 1";
    this.interruptSource[1].interruptEnable = false;
    this.interruptSource[1].interruptHandler = false;

    this.interruptSource[2].registerName = "P1IE.2";
    this.interruptSource[2].registerDescription = "Port1 Interrupt Enable Bit 2";
    this.interruptSource[2].interruptEnable = false;
    this.interruptSource[2].interruptHandler = false;

    this.interruptSource[3].registerName = "P1IE.3";
    this.interruptSource[3].registerDescription = "Port1 Interrupt Enable Bit 3";
    this.interruptSource[3].interruptEnable = false;
    this.interruptSource[3].interruptHandler = false;

    this.interruptSource[4].registerName = "P1IE.4";
    this.interruptSource[4].registerDescription = "Port1 Interrupt Enable Bit 4";
    this.interruptSource[4].interruptEnable = false;
    this.interruptSource[4].interruptHandler = false;

    this.interruptSource[5].registerName = "P1IE.5";
    this.interruptSource[5].registerDescription = "Port1 Interrupt Enable Bit 5";
    this.interruptSource[5].interruptEnable = false;
    this.interruptSource[5].interruptHandler = false;

    this.interruptSource[6].registerName = "P1IE.6";
    this.interruptSource[6].registerDescription = "Port1 Interrupt Enable Bit 6";
    this.interruptSource[6].interruptEnable = false;
    this.interruptSource[6].interruptHandler = false;

    this.interruptSource[7].registerName = "P1IE.7";
    this.interruptSource[7].registerDescription = "Port1 Interrupt Enable Bit 7";
    this.interruptSource[7].interruptEnable = false;
    this.interruptSource[7].interruptHandler = false;

    this.interruptSource[8].registerName = "P2IE.0";
    this.interruptSource[8].registerDescription = "Port2 Interrupt Enable Bit 0";
    this.interruptSource[8].interruptEnable = false;
    this.interruptSource[8].interruptHandler = false;

    this.interruptSource[9].registerName = "P2IE.1";
    this.interruptSource[9].registerDescription = "Port2 Interrupt Enable Bit 1";
    this.interruptSource[9].interruptEnable = false;
    this.interruptSource[9].interruptHandler = false;

    this.interruptSource[10].registerName = "P2IE.2";
    this.interruptSource[10].registerDescription = "Port2 Interrupt Enable Bit 2";
    this.interruptSource[10].interruptEnable = false;
    this.interruptSource[10].interruptHandler = false;

    this.interruptSource[11].registerName = "P2IE.3";
    this.interruptSource[11].registerDescription = "Port2 Interrupt Enable Bit 3";
    this.interruptSource[11].interruptEnable = false;
    this.interruptSource[11].interruptHandler = false;

    this.interruptSource[12].registerName = "P2IE.4";
    this.interruptSource[12].registerDescription = "Port2 Interrupt Enable Bit 4";
    this.interruptSource[12].interruptEnable = false;
    this.interruptSource[12].interruptHandler = false;

    this.interruptSource[13].registerName = "P2IE.5";
    this.interruptSource[13].registerDescription = "Port2 Interrupt Enable Bit 5";
    this.interruptSource[13].interruptEnable = false;
    this.interruptSource[13].interruptHandler = false;

    this.interruptSource[14].registerName = "P2IE.6";
    this.interruptSource[14].registerDescription = "Port2 Interrupt Enable Bit 6";
    this.interruptSource[14].interruptEnable = false;
    this.interruptSource[14].interruptHandler = false;

    this.interruptSource[15].registerName = "P2IE.7";
    this.interruptSource[15].registerDescription = "Port2 Interrupt Enable Bit 7";
    this.interruptSource[15].interruptEnable = false;
    this.interruptSource[15].interruptHandler = false;

    this.interruptSource[16].registerName = "P3IE.0";
    this.interruptSource[16].registerDescription = "Port3 Interrupt Enable Bit 0";
    this.interruptSource[16].interruptEnable = false;
    this.interruptSource[16].interruptHandler = false;

    this.interruptSource[17].registerName = "P3IE.1";
    this.interruptSource[17].registerDescription = "Port3 Interrupt Enable Bit 1";
    this.interruptSource[17].interruptEnable = false;
    this.interruptSource[17].interruptHandler = false;

    this.interruptSource[18].registerName = "P3IE.2";
    this.interruptSource[18].registerDescription = "Port3 Interrupt Enable Bit 2";
    this.interruptSource[18].interruptEnable = false;
    this.interruptSource[18].interruptHandler = false;

    this.interruptSource[19].registerName = "P3IE.3";
    this.interruptSource[19].registerDescription = "Port3 Interrupt Enable Bit 3";
    this.interruptSource[19].interruptEnable = false;
    this.interruptSource[19].interruptHandler = false;

    this.interruptSource[20].registerName = "P3IE.4";
    this.interruptSource[20].registerDescription = "Port3 Interrupt Enable Bit 4";
    this.interruptSource[20].interruptEnable = false;
    this.interruptSource[20].interruptHandler = false;

    this.interruptSource[21].registerName = "P3IE.5";
    this.interruptSource[21].registerDescription = "Port3 Interrupt Enable Bit 5";
    this.interruptSource[21].interruptEnable = false;
    this.interruptSource[21].interruptHandler = false;

    this.interruptSource[22].registerName = "P3IE.6";
    this.interruptSource[22].registerDescription = "Port3 Interrupt Enable Bit 6";
    this.interruptSource[22].interruptEnable = false;
    this.interruptSource[22].interruptHandler = false;

    this.interruptSource[23].registerName = "P3IE.7";
    this.interruptSource[23].registerDescription = "Port3 Interrupt Enable Bit 7";
    this.interruptSource[23].interruptEnable = false;
    this.interruptSource[23].interruptHandler = false;

    this.interruptSource[24].registerName = "P4IE.0";
    this.interruptSource[24].registerDescription = "Port4 Interrupt Enable Bit 0";
    this.interruptSource[24].interruptEnable = false;
    this.interruptSource[24].interruptHandler = false;

    this.interruptSource[25].registerName = "P4IE.1";
    this.interruptSource[25].registerDescription = "Port4 Interrupt Enable Bit 1";
    this.interruptSource[25].interruptEnable = false;
    this.interruptSource[25].interruptHandler = false;

    this.interruptSource[26].registerName = "P4IE.2";
    this.interruptSource[26].registerDescription = "Port4 Interrupt Enable Bit 2";
    this.interruptSource[26].interruptEnable = false;
    this.interruptSource[26].interruptHandler = false;

    this.interruptSource[27].registerName = "P4IE.3";
    this.interruptSource[27].registerDescription = "Port4 Interrupt Enable Bit 3";
    this.interruptSource[27].interruptEnable = false;
    this.interruptSource[27].interruptHandler = false;

    this.interruptSource[28].registerName = "P4IE.4";
    this.interruptSource[28].registerDescription = "Port4 Interrupt Enable Bit 4";
    this.interruptSource[28].interruptEnable = false;
    this.interruptSource[28].interruptHandler = false;

    this.interruptSource[29].registerName = "P4IE.5";
    this.interruptSource[29].registerDescription = "Port4 Interrupt Enable Bit 5";
    this.interruptSource[29].interruptEnable = false;
    this.interruptSource[29].interruptHandler = false;

    this.interruptSource[30].registerName = "P4IE.6";
    this.interruptSource[30].registerDescription = "Port4 Interrupt Enable Bit 6";
    this.interruptSource[30].interruptEnable = false;
    this.interruptSource[30].interruptHandler = false;

    this.interruptSource[31].registerName = "P4IE.7";
    this.interruptSource[31].registerDescription = "Port4 Interrupt Enable Bit 7";
    this.interruptSource[31].interruptEnable = false;
    this.interruptSource[31].interruptHandler = false;

    // Store handle for current instance
    iGPIO = this;
}

/*
 *  ======== instance_validate ========
 */
function instance_validate(inst)
{
}

/*
 *  ======== findPinsForFunction ========
 */
function findPinsForFunction(regExp)
{
    // Create a new instance of our module-defined return type
    var returnValue = new this.$module.MatchedPortFunction_t;

    // Iterate through the device pin "database", indentify all matching pins,
    // and compile them into a data structure
    for (var port in iGPIO.devicePins) {
        for (var pin in iGPIO.devicePins[port]) {
            for (var func in iGPIO.devicePins[port][pin].pinFunction.functionName) {
                var functionName = iGPIO.devicePins[port][pin].pinFunction.functionName[func];

                // Check if regular expression returns a match
                if (functionName.search(regExp) > -1) {
                    returnValue.port.$add(Number(port));
                    returnValue.pin.$add(Number(pin));
                    returnValue.pinName.$add(iGPIO.devicePins[port][pin].pinName);
                    returnValue.functionIndex.$add(Number(func));
                    returnValue.functionName.$add(functionName);
                }
            }
        }
    }

    return returnValue;
}

/*
 *  ======== pinFunctionIsActive ========
 */
function pinFunctionIsActive(port, pin, regExp)
{
    // Sanitize input parameters
    port = Number(port);
    pin = Number(pin);

    var functionIndex = getPinFunctionIndex(port, pin);
    var functionName = iGPIO.devicePins[port][pin].pinFunction.functionName[functionIndex];

    // Check if regular expression returns a match
    if (functionName.search(regExp) > -1) {
        return true;
    }

    return false;
}

/*
 *  ======== getPinFunctionIndex ========
 */
function getPinFunctionIndex(port, pin)
{
    // Sanitize input parameters
    port = Number(port);
    pin = Number(pin);

    // Return functional index
    return iGPIO.devicePinSetting[port][pin].functionIndex;
}

/*
 *  ======== getPinOwner ========
 */
function getPinOwner(port, pin)
{
    // Sanitize input parameters
    port = Number(port);
    pin = Number(pin);

    // Return current owner
    return iGPIO.devicePinSetting[port][pin].owner;
}

/*
 *  ======== setPinFunctionUsingIndex ========
 */
function setPinFunctionUsingIndex(port, pin, index, owner)
{
    // Sanitize input parameters
    port = Number(port);
    pin = Number(pin);
    index = Number(index);
    var functionName = iGPIO.devicePins[port][pin].pinName;

    // Check if it is ok to assign a new pin function
    if ((iGPIO.devicePinSetting[port][pin].owner != undefined) &&
         (iGPIO.devicePinSetting[port][pin].owner != owner)) {
        $trace("setPinFunctionUsingIndex: Ownership conflict! port=" + port + " pin=" + pin +
            " current func=" + iGPIO.devicePinSetting[port][pin].functionIndex + " new func=" + index +
            " current owner=" + iGPIO.devicePinSetting[port][pin].owner + " new owner=" + owner, 0, ["GPIO"]);
        throw new Error("Can't assign new function to " + functionName +
            " because of " + String(this.devicePinSetting[port][pin].owner).match(/[\w\d]+$/));
    }

    // In order to change the functionIndex without triggering any setter reaction
    // avoiding possibly unwanted side effects, we make a temporary assignment to owner
    // that can be used in a setter function to decide whether to take action on the
    // programmatically induced change or not.
    iGPIO.devicePinSetting[port][pin].owner = "API";
    iGPIO.devicePinSetting[port][pin].functionIndex = index;
    iGPIO.devicePinSetting[port][pin].owner = owner;
}

/*
 *  ======== setDefaultPinFunction ========
 */
function setDefaultPinFunction(port, pin, owner)
{
    // Sanitize input parameters
    port = Number(port);
    pin = Number(pin);
    var functionName = iGPIO.devicePins[port][pin].pinName;

    // Check if it is ok to assign a new pin function
    if ((iGPIO.devicePinSetting[port][pin].owner != undefined) &&
         (iGPIO.devicePinSetting[port][pin].owner != owner)) {
        $trace("setDefaultPinFunction: Ownership conflict! port=" + port + " pin=" + pin +
            " current owner=" + iGPIO.devicePinSetting[port][pin].owner +
            " new owner=undefined", 0, ["GPIO"]);
        throw new Error("Can't assign default function to " + functionName +
            " because of " + String(this.devicePinSetting[port][pin].owner).match(/[\w\d]+$/));
    }

    // In order to change the functionIndex without triggering any setter reaction
    // avoiding possibly unwanted side effects, we make a temporary assignment to owner
    // that can be used in a setter function to decide whether to take action on the
    // programmatically induced change or not.
    iGPIO.devicePinSetting[port][pin].owner = "API";
    iGPIO.devicePinSetting[port][pin].functionIndex = 0;
    iGPIO.devicePinSetting[port][pin].owner = undefined;
}
