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
 *  ======== Clobber.xdc ========
 *
 *
 */

package ti.sysbios.family.c28;

/*!
 *  @_nodoc
 *  ======== Clobber ========
 *  Clobber module.
 *  
 *  trashRegs takes a starting value, then goes through all of the registers
 *  and assigns them values starting with 'value' and incrementing by 1.
 *  For example, if 'value' is 5, then XAR0 gets 5, XAR1 gets 6, XAR2 gets 7,
 *  etc.
 *
 *  checkRegs takes the same starting value and checks to make sure that all
 *  of the register values haven't changed.
 * 
 */
module Clobber 
{
    /*!
     *  ======== trashScratchRegs ========
     *  Trash scratch registers
     *
     *  @param(value)   Base of incremented value placed in registers
     */
    Void trashScratchRegs(UInt32 value);
   
    /*!
     *  ======== trashPreservedRegs ========
     *  Trash preserved registers
     *
     *  @param(value)   Base of incremented value placed in registers
     */
    Void trashPreservedRegs(UInt32 value);
    
    /*!
     *  ======== checkScratchRegs ========
     *  Check scratch registers
     *
     *  Check all of the scratch regs:
     *  ACC, XAR0, XAR4-7, P, ST0, ST1, XT
     *  28FP: R0-R3
     *
     *  @param(value)   Value used in {@link #trashScratchRegs}
     *
     *  @b(returns)     Number of registers that had an incorrect value
     */
    UInt checkScratchRegs(UInt32 value);
    
    /*!
     *  ======== checkScratchRegs ========
     *  Check preserved registers
     *
     *  Check all of the preserved regs:
     *  XAR1-3, RPC
     *  28FP: R4-R7
     *
     *  @param(value)   Value used in {@link #trashPreservedRegs}
     *
     *  @b(returns)     Number of registers that had an incorrect value
     */
    UInt checkPreservedRegs(UInt32 value);
}
