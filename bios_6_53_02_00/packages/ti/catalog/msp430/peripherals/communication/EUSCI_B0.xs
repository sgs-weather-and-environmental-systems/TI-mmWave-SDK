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
 *  ======== EUSCI_B0.xs ========
 */

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(clock)
{
    this.clock = clock;

    this.interruptSource[0].registerName = "UCTXIE0";
    this.interruptSource[0].registerDescription = "eUSCI_B0 SPI/I2C Transmit Interrupt Enable";
    this.interruptSource[0].interruptEnable = false;
    this.interruptSource[0].interruptHandler = false;

    this.interruptSource[1].registerName = "UCRXIE0";
    this.interruptSource[1].registerDescription = "eUSCI_B0 SPI/I2C Receive Interrupt Enable";
    this.interruptSource[1].interruptEnable = false;
    this.interruptSource[1].interruptHandler = false;

    this.interruptSource[2].registerName = "UCTXIE1";
    this.interruptSource[2].registerDescription = "eUSCI_B0 I2C Transmit Interrupt Enable 1";
    this.interruptSource[2].interruptEnable = false;
    this.interruptSource[2].interruptHandler = false;

    this.interruptSource[3].registerName = "UCRXIE1";
    this.interruptSource[3].registerDescription = "eUSCI_B0 I2C Receive Interrupt Enable 1";
    this.interruptSource[3].interruptEnable = false;
    this.interruptSource[3].interruptHandler = false;

    this.interruptSource[4].registerName = "UCTXIE2";
    this.interruptSource[4].registerDescription = "eUSCI_B0 I2C Transmit Interrupt Enable 2";
    this.interruptSource[4].interruptEnable = false;
    this.interruptSource[4].interruptHandler = false;

    this.interruptSource[5].registerName = "UCRXIE2";
    this.interruptSource[5].registerDescription = "eUSCI_B0 I2C Receive Interrupt Enable 2";
    this.interruptSource[5].interruptEnable = false;
    this.interruptSource[5].interruptHandler = false;

    this.interruptSource[6].registerName = "UCTXIE3";
    this.interruptSource[6].registerDescription = "eUSCI_B0 I2C Transmit Interrupt Enable 3";
    this.interruptSource[6].interruptEnable = false;
    this.interruptSource[6].interruptHandler = false;

    this.interruptSource[7].registerName = "UCRXIE3";
    this.interruptSource[7].registerDescription = "eUSCI_B0 I2C Receive Interrupt Enable 3";
    this.interruptSource[7].interruptEnable = false;
    this.interruptSource[7].interruptHandler = false;

    this.interruptSource[8].registerName = "UCSTTIE";
    this.interruptSource[8].registerDescription = "eUSCI_B0 I2C START Condition Interrupt Enable";
    this.interruptSource[8].interruptEnable = false;
    this.interruptSource[8].interruptHandler = false;

    this.interruptSource[9].registerName = "UCSTPIE";
    this.interruptSource[9].registerDescription = "eUSCI_B0 I2C STOP Condition Interrupt Enable";
    this.interruptSource[9].interruptEnable = false;
    this.interruptSource[9].interruptHandler = false;

    this.interruptSource[10].registerName = "UCNACKIE";
    this.interruptSource[10].registerDescription = "eUSCI_B0 I2C Not-acknowledge Interrupt Enable";
    this.interruptSource[10].interruptEnable = false;
    this.interruptSource[10].interruptHandler = false;

    this.interruptSource[11].registerName = "UCALIE";
    this.interruptSource[11].registerDescription = "eUSCI_B0 I2C Arbitration Lost Interrupt Enable";
    this.interruptSource[11].interruptEnable = false;
    this.interruptSource[11].interruptHandler = false;

    this.interruptSource[12].registerName = "UCCLTOIE";
    this.interruptSource[12].registerDescription = "eUSCI_B0 I2C Clock Low Timeout Interrupt Enable";
    this.interruptSource[12].interruptEnable = false;
    this.interruptSource[12].interruptHandler = false;

}

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
}
