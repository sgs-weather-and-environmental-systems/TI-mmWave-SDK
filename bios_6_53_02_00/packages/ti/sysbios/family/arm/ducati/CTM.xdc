/*
 * Copyright (c) 2012, Texas Instruments Incorporated
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
 *  ======== CTM.xdc ========
 *
 */

package ti.sysbios.family.arm.ducati;

/*!
 *  ======== CTM ========
 *  Counter Timer Module Device Definitions.
 *
 *  For Ducati SYS/BIOS applications, 
 *  Counter/timer 0 is assigned to core 0's Timer 0 interrupt 18
 *  Counter/timer 1 is assigned to core 1's Timer 0 interrupt 22
 *  Counters 2/3 are assigned to core 0's TimestampProvider
 *  Counters 4/5 are assigned to core 1's TimestampProvider
 *  Counters 6,7 are for application use.
 *
 *  Counters 2/3 and 4/5 are in chained mode and started simultaneously
 *  by core 0 so that both cores timestamps are in sync with each other 
 *  AND both chained timers have independent SHADOW registers to guarantee
 *  64bit counter reading coherency.
 */

module CTM
{
    /*! 
     *  Counter Timer Module
     *  Physical Base address is 0x55080400
     *  Auto-configured virtual Base address is 0x40000400
     */
    struct CTM {
        UInt32 CTCNTL;          /*! 0x0000 */
        UInt32 RES_04 [7];      /*! 0x0004 - 0x0020 */
        UInt32 CTSTMCNTL;       /*! 0x0020 */
        UInt32 CTSTMMSTID;      /*! 0x0024 */
        UInt32 CTSTMINTVL;      /*! 0x0028 */
        UInt32 CTSTMSEL0;       /*! 0x002C */
        UInt32 CTSTMSEL1;       /*! 0x0030 */
        UInt32 RES_34 [3];      /*! 0x0034 - 0x0040 */
        UInt32 TINTVLR[8];      /*! 0x0040 - 0x0060 */
        UInt32 RES_60 [7];      /*! 0x0060 - 0x007C */
        UInt32 CTNUMDBG;        /*! 0x007C */
        UInt32 CTDBGSGL [8];    /*! 0x0080 - 0x00A0 */
        UInt32 RES_A0 [20];     /*! 0x00A0 - 0x00F0 */
        UInt32 CTGNBL [2];      /*! 0x00F0 - 0x00F8 */
        UInt32 CTGRST [2];      /*! 0x00F8 - 0x0100 */
        UInt32 CTCR [32];       /*! 0x0100 - 0x0180 */
        UInt32 CTCNTR [32];     /*! 0x0180 - 0x0200 */
    }

    /*!
     * Physical CTM Device. 
     * Short name is "CTM_ctm" 
     * Long name is "ti_sysbios_family_arm.ducati_CTM_ctm" 
     */
    extern volatile CTM ctm;
}

