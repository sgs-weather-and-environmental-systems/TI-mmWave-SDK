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
 *  ======== Timer_B7.xs ========
 */

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(clock)
{
    this.clock = clock;

    this.interruptSource[0].registerName = "TBIE";
    this.interruptSource[0].registerDescription = "Timer_B overflow interrupt enable";
    this.interruptSource[0].interruptEnable = false;
    this.interruptSource[0].interruptHandler = false;

    this.interruptSource[1].registerName = "CCIE.0";
    this.interruptSource[1].registerDescription = "Capture/compare interrupt enable 0";
    this.interruptSource[1].interruptEnable = false;
    this.interruptSource[1].interruptHandler = false;

    this.interruptSource[2].registerName = "CCIE.1";
    this.interruptSource[2].registerDescription = "Capture/compare interrupt enable 1";
    this.interruptSource[2].interruptEnable = false;
    this.interruptSource[2].interruptHandler = false;

    this.interruptSource[3].registerName = "CCIE.2";
    this.interruptSource[3].registerDescription = "Capture/compare interrupt enable 2";
    this.interruptSource[3].interruptEnable = false;
    this.interruptSource[3].interruptHandler = false;

    this.interruptSource[4].registerName = "CCIE.3";
    this.interruptSource[4].registerDescription = "Capture/compare interrupt enable 3";
    this.interruptSource[4].interruptEnable = false;
    this.interruptSource[4].interruptHandler = false;

    this.interruptSource[5].registerName = "CCIE.4";
    this.interruptSource[5].registerDescription = "Capture/compare interrupt enable 4";
    this.interruptSource[5].interruptEnable = false;
    this.interruptSource[5].interruptHandler = false;

    this.interruptSource[6].registerName = "CCIE.5";
    this.interruptSource[6].registerDescription = "Capture/compare interrupt enable 5";
    this.interruptSource[6].interruptEnable = false;
    this.interruptSource[6].interruptHandler = false;

    this.interruptSource[7].registerName = "CCIE.6";
    this.interruptSource[7].registerDescription = "Capture/compare interrupt enable 6";
    this.interruptSource[7].interruptEnable = false;
    this.interruptSource[7].interruptHandler = false;
}

/*
 *  ======== setTxxCCRx ========
 */
function setTxxCCRx(ccrNumber , value)
{
    switch (ccrNumber) {
        case 0:
            this.TBCCR0 = value;
            break;
        case 1:
            this.TBCCR1 = value;
            break;
        case 2:
            this.TBCCR2 = value;
            break;
        case 3:
            this.TBCCR3 = value;
            break;
        case 4:
            this.TBCCR4 = value;
            break;
        case 5:
            this.TBCCR5 = value;
            break;
        case 6:
            this.TBCCR6 = value;
            break;
        default:
    }
}

/*
 *  ======== getTxxCCRx ========
 */
function getTxxCCRx(ccrNumber)
{
    switch (ccrNumber) {
        case 0:
            return this.TBCCR0;
            break;
        case 1:
            return this.TBCCR1;
            break;
        case 2:
            return this.TBCCR2;
            break;
        case 3:
            return this.TBCCR3;
            break;
        case 4:
            return this.TBCCR4;
            break;
        case 5:
            return this.TBCCR5;
            break;
        case 6:
            return this.TBCCR6;
            break;
        default:
            return null;
            break;
    }
}
