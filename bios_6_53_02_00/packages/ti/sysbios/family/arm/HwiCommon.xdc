/*
 * Copyright (c) 2014, Texas Instruments Incorporated
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
 *  ======== HwiCommon.xdc ========
 *
 */
package ti.sysbios.family.arm;

/*!
 *  @_nodoc
 *  ======== HwiCommon ========
 *  Hwi functions common to all ARM targets.
 *  
 *  This Hwi module provides common ARM family-specific implementations
 *  of several Hwi APIs
 */

@DirectCall
@ModuleStartup          /* generates call to HwiCommon_Module_startup at startup */
module HwiCommon
{
    /*!
     *  ======== enable ========
     *  Enable interrupts.
     *
     *  @b(returns)     previous interrupt enable/disable state
     */
    UInt enable();

    /*!
     *  ======== disable ========
     *  Disable interrupts.
     *
     *  @b(returns)     previous interrupt enable/disable state
     */
    UInt disable();

    /*!
     *  ======== restore ========
     *  Restore interrupts.
     *
     *  @param(key)     enable/disable state to restore
     */
    Void restore(UInt key);

    /*!
     *  ======== enableFIQ ========
     *  Enable FIQ interrupts.
     *
     *  @b(returns)     previous FIQ interrupt enable/disable state
     */
    UInt enableFIQ();

    /*!
     *  ======== disableFIQ ========
     *  Disable FIQ interrupts.
     *
     *  @b(returns)     previous FIQ interrupt enable/disable state
     */
    UInt disableFIQ();

    /*!
     *  ======== restoreFIQ ========
     *  Restore FIQ interrupts.
     *
     *  @param(key)     enable/disable state to restore
     */
    Void restoreFIQ(UInt key);

    /*!
     *  ======== enableIRQ ========
     *  Enable IRQ interrupts.
     *
     *  @b(returns)     previous IRQ interrupt enable/disable state
     */
    UInt enableIRQ();

    /*!
     *  ======== disableIRQ ========
     *  Disable IRQ interrupts.
     *
     *  @b(returns)     previous IRQ interrupt enable/disable state
     */
    UInt disableIRQ();

    /*!
     *  ======== restoreIRQ ========
     *  Restore IRQ interrupts.
     *
     *  @param(key)     enable/disable state to restore
     */
    Void restoreIRQ(UInt key);


    /*!
     *  @_nodoc
     *  ======== getTaskSP ========
     *  retrieve interrupted task's SP
     *
     *  Used for benchmarking the SYS/BIOS Hwi dispatcher's task 
     *  stack utilization.
     *
     *  @b(returns)     interrupted task's SP
     */
    Char *getTaskSP();

    /*!
     *  @_nodoc
     *  ======== switchFromBootStack ========
     *  Indicate that we are leaving the boot stack and
     *  are about to switch to a task stack.
     *  Used by Task_startup()
     */
    Void switchFromBootStack();

internal:   /* not for client use */

    /*!
     *  ======== switchToSystemMode ========
     *  switch from user mode (which boot code puts us in) to system mode
     *  which SYS/BIOS runs in.
     */
    Void switchToSystemMode();

    /*!
     *  ======== enableA ========
     *  Enable interrupts.
     *
     *  @b(returns)     previous FIQ interrupt enable/disable state
     */
    UInt enableA();

    /*!
     *  ======== disableA ========
     *  Disable interrupts.
     *
     *  @b(returns)     previous FIQ interrupt enable/disable state
     */
    UInt disableA();

    /*!
     *  ======== restoreA ========
     *  Restore interrupts.
     *
     *  @param(key)     enable/disable state to restore
     */
    Void restoreA(UInt key);

    /*!
     *  ======== enableFIQ ========
     *  Enable FIQ interrupts.
     *
     *  @b(returns)     previous FIQ interrupt enable/disable state
     */
    UInt enableFIQA();

    /*!
     *  ======== disableFIQ ========
     *  Disable FIQ interrupts.
     *
     *  @b(returns)     previous FIQ interrupt enable/disable state
     */
    UInt disableFIQA();

    /*!
     *  ======== restoreFIQ ========
     *  Restore FIQ interrupts.
     *
     *  @param(key)     enable/disable state to restore
     */
    Void restoreFIQA(UInt key);

    /*!
     *  ======== enableIRQ ========
     *  Enable IRQ interrupts.
     *
     *  @param(key)     enable/disable state to restore
     */
    UInt enableIRQA();

    /*!
     *  ======== disableIRQ ========
     *  Disable IRQ interrupts.
     *
     *  @b(returns)     previous IRQ interrupt enable/disable state
     */
    UInt disableIRQA();

    /*!
     *  ======== restoreIRQ ========
     *  Restore IRQ interrupts.
     *
     *  @param(key)     enable/disable state to restore
     */
    Void restoreIRQA(UInt key);

    /*!
     *  ======== swiHandler ========
     *  ARM SWI Exception Handler
     */
    Void swiHandler();

    struct Module_State {
        Char        *taskSP;        // temporary storage of interrupted
                                    // Task's SP during ISR execution
        Char        *isrStack;      // Points to isrStack address
        Ptr         isrStackBase;   // _stack
        Ptr         isrStackSize;   // _STACK_SIZE
    };
}

