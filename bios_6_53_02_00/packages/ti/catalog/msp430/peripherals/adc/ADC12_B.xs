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
 *  ======== ADC12_B.xs ========
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

    for (var i=0; i<32; i++) {
        this.interruptSource[i].registerName = "ADC12IE"+i;
        this.interruptSource[i].registerDescription = "ADC12_B Interrupt Enable " + i;
        this.interruptSource[i].interruptEnable = false;
        this.interruptSource[i].interruptHandler = false;
    }

    this.interruptSource[32].registerName = "ADC12HIIFG";
    this.interruptSource[32].registerDescription = "ADC12_B Window Comparator High Threshold";
    this.interruptSource[32].interruptEnable = false;
    this.interruptSource[32].interruptHandler = false;

    this.interruptSource[33].registerName = "ADC12LOIFG";
    this.interruptSource[33].registerDescription = "ADC12_B Window Comparator Low Threshold";
    this.interruptSource[33].interruptEnable = false;
    this.interruptSource[33].interruptHandler = false;

    this.interruptSource[34].registerName = "ADC12INIFG";
    this.interruptSource[34].registerDescription = "ADC12_B Window Comparator In-between Threshold";
    this.interruptSource[34].interruptEnable = false;
    this.interruptSource[34].interruptHandler = false;

}
