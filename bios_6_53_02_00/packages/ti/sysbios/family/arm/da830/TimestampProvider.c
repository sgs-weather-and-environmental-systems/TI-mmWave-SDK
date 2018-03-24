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
 *  ======== TimestampProvider.c ========
 */
#include <xdc/std.h>

#include <xdc/runtime/System.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/Assert.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Clock.h>

#include <ti/sysbios/family/arm/da830/Hwi.h>

#include "package/internal/TimestampProvider.xdc.h"

#define MOD     TimestampProvider_module

#define iceRegs ti_sysbios_family_arm_da830_TimestampProvider_iceRegs
asm("_ti_sysbios_family_arm_da830_TimestampProvider_iceRegs .set 0x01bc1800");
asm("ti_sysbios_family_arm_da830_TimestampProvider_iceRegs .set 0x01bc1800");

/*
 *  ======== TimestampProvider_Module_startup ========
 */
Int TimestampProvider_Module_startup( Int phase )
{
    volatile UInt32 *bmcntrl, *bmcount, clrIntMask;

    if (TimestampProvider_benchmarkCounterId == 0) {
        bmcntrl = &iceRegs.BCNT0CTRL;
        bmcount = &iceRegs.BCNT0;
        clrIntMask = 0xc0000010;
    }
    else {
        bmcntrl = &iceRegs.BCNT1CTRL;
        bmcount = &iceRegs.BCNT1;
        clrIntMask = 0xc0000020;
    }

    *bmcntrl = 0x40000000; /* claim ownership */
    *bmcntrl = 0x80000000; /* enable it */

    /* assert that counter is now owned by application */
    Assert_isTrue(((*bmcntrl >> 28) & 1 == 1),
                  TimestampProvider_A_counterInUse);

    /* run BCNTR release function at exit */
    System_atexit((System_AtexitHandler)TimestampProvider_releaseCounters);

    if (TimestampProvider_countType == TimestampProvider_CountType_CYCLES) {
        *bmcntrl = 0xC0091004;  /* load enabled, count cycles */
                                /* start event = 1, stop event = 0 */
                                /* range enable = 0 (enabled) */
                                /* overflowAction = 2 (interrupt) */
                                /* Async mode = 0 */
    }
    else {
        *bmcntrl = 0xC02A1004;  /* load enabled, count inst */
                                /* start event = 1, stop event = 0 */
                                /* range enable = 0 (enabled) */
                                /* overflowAction = 2 (interrupt) */
                                /* Async mode = 1 */
    }

    iceRegs.INTCNTL = 0x40000000; /* claim ownership */
    iceRegs.INTCNTL = 0x40003000; /* set polarity to active high */
    iceRegs.INTCNTL = 0x80000000; /* enable iceCrusher Interrupts */
    iceRegs.INTCNTL = clrIntMask; /* clear any pending overflow int */

    /* assert that interrupt control register is now owned by application */
    Assert_isTrue(((iceRegs.INTCNTL >> 28) & 1 == 1),
                  TimestampProvider_A_intControlInUse);

    /* clear counter */
    *bmcount = 0;

    return Startup_DONE;
}

/*
 *  ======== TimestampProvider_get64 ========
 */
Void TimestampProvider_get64(Types_Timestamp64 *result) 
{
    UInt key;

    key = Hwi_disable();
    if (TimestampProvider_benchmarkCounterId == 0) {
        result->lo = iceRegs.BCNT0;
        result->hi = MOD->upper32Bits;
        /* check for overflow, read again if yes */
        if (iceRegs.BCNT0CTRL & 0x00000001) {
            result->lo = iceRegs.BCNT0;
            result->hi += 1;
        }
    }
    else {
        result->lo = iceRegs.BCNT1;
        result->hi = MOD->upper32Bits;
        /* check for overflow, read again if yes */
        if (iceRegs.BCNT1CTRL & 0x00000001) {
            result->lo = iceRegs.BCNT1;
            result->hi += 1;
        }
    }
    Hwi_restore(key);
}

/*
 *  ======== TimestampProvider_get32 ========
 */
Bits32 TimestampProvider_get32() 
{
    if (TimestampProvider_benchmarkCounterId == 0) {
        return (iceRegs.BCNT0);
    }
    else {
        return (iceRegs.BCNT1);
    }
}

/*
 *  ======== TimestampProvider_getFreq ========
 */
Void TimestampProvider_getFreq(Types_FreqHz *freq) 
{
    BIOS_getCpuFreq(freq);
}

/*
 *  ======== TimestampProvider_getFreq ========
 */
Void TimestampProvider_overflowHandler(UArg arg)
{
    MOD->upper32Bits++;

    if (TimestampProvider_benchmarkCounterId == 0) {
        iceRegs.INTCNTL = 0xc0000010;   /* ack counter 0 */
    }
    else {
        iceRegs.INTCNTL = 0xc0000020;   /* ack counter 1 */
    }
}

/*
 *  ======== TimestampProvider_releaseCounters ========
 */
Void TimestampProvider_releaseCounters()
{
    volatile UInt32 *bmcntrl;

    if (TimestampProvider_benchmarkCounterId == 0) {
        bmcntrl = &iceRegs.BCNT0CTRL;
    }
    else {
        bmcntrl = &iceRegs.BCNT1CTRL;
    }

    *bmcntrl = 0x00000000; /* release ownership */
}



