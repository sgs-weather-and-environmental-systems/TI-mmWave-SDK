/*
 * Copyright (c) 2013, Texas Instruments Incorporated
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
 *  ======== Wugen.c ========
 *  Contains functions specific to 2430/3430 WUGEN module.
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Startup.h>

#include "package/internal/Wugen.xdc.h"

#define INTRMUXREG1     0x01800104      /* interrupt mux register on GEM */
#define EVTCLR0         0x01800040      /* event clear register on GEM */
#define EVTMASK         0x01800080      /* event mask register on GEM */

#define WUGENMEVT0      0x01c21060      /* WUGEN_MEVT0 register on IVA2 */
#define WUGENMEVTCLR0   0x01c21070      /* WUGEN_MEVTCLR0 register on IVA2 */
#define WUGENMEVTSET0   0x01c21080      /* WUGEN_MEVTSET0 register on IVA2 */

/*
 *  ======== Wugen_Module_startup ========
 */
Int Wugen_Module_startup(Int status)
{
    UInt32 mask[3];
    volatile UInt32 *evtclr0 = (volatile UInt32 *)EVTCLR0;

    /* initialize the WUGEN to its default state from reset */
    mask[0] = 0xffffffff;
    mask[1] = 0x0000ffff;
    mask[2] = 0x000fffff;
    Wugen_applyMasks(mask);

    /* clear event flag registers 0-3 with mask[0] value */
    evtclr0[0] = mask[0];
    evtclr0[1] = mask[0];
    evtclr0[2] = mask[0];
    evtclr0[3] = mask[0];

    return (Startup_DONE);
}


/*
 *  ======== Wugen_applyMasks ========
 *  This function takes an array of 3 integers and applies the specified
 *  mask to the WUGEN interrupt mask registers. If the bit in the mask is
 *  enabled, the corresponding interrupt in the WUGEN will be blocked.
 *
 *  params:
 *      mask - array of three integers used for applying to the WUGEN
 *             interrupt mask registers.
 *             First mask consists of IRQ 0-31
 *             Second mask consists of IRQ 32-47
 *             Third mask consists of DMA requests
 */
Void Wugen_applyMasks(UInt32 mask[])
{
    volatile UInt32 *mevtclr = (volatile UInt32 *)WUGENMEVTCLR0;
    volatile UInt32 *mevtset = (volatile UInt32 *)WUGENMEVTSET0;

    mevtclr[0] = ~(mask[0]);
    mevtclr[1] = (0x0000ffff & ~(mask[1]));
    mevtclr[2] = (0x000fffff & ~(mask[2]));
    mevtset[0] = (mask[0]);
    mevtset[1] = (0x0000ffff & mask[1]);
    mevtset[2] = (0x000fffff & mask[2]);
}

/*
 *  ======== Wugen_disableDma ========
 *  This function disables the specified DMA source in the WUGEN
 *
 *  params:
 *      dmaid - the DMA id for a particular EDMA source.
 */
Void Wugen_disableDma(UInt dmaid)
{
    volatile UInt32 *mevtset = (volatile UInt32 *)WUGENMEVTSET0;
    
    mevtset[2] = (1 << dmaid);
}

/*
 *  ======== Wugen_disableEvent ========
 *  This function disables the specified interrupt source in the WUGEN
 *
 *  params:
 *      eventid - the event number associated with the interrupt.
 */
Void Wugen_disableEvent(UInt eventid)
{
    UInt32 regnum;      /* WUGEN_MEVTSET register number */
    UInt32 bitpos;      /* The bit position of event in MEVTSET register */
    volatile UInt32 *mevtset = (volatile UInt32 *)WUGENMEVTSET0;
    
    regnum = 0;
    bitpos = eventid - 45;

    if ((eventid < 45) || (eventid > 92)) {
        return;
    }
    else if (eventid > 76) {
        regnum = 1;
        bitpos -= 32;
    }

    mevtset[regnum] = (1 << bitpos);
}

/*
 *  ======== Wugen_enableDma ========
 *  This function enables the specified DMA source in the WUGEN
 *
 *  params:
 *      dmaid - the DMA id for a particular EDMA source.
 */
Void Wugen_enableDma(UInt dmaid)
{
    volatile UInt32 *mevtclr = (volatile UInt32 *)WUGENMEVTCLR0;
    
    mevtclr[2] = (1 << dmaid);
}

/*
 *  ======== Wugen_enableEvent ========
 *  This function enables the specified interrupt source in the WUGEN
 *
 *  params:
 *      eventid - the event number associated with the interrupt.
 */
Void Wugen_enableEvent(UInt eventid)
{
    UInt32 regnum;      /* WUGEN_MEVTSET register number */
    UInt32 bitpos;      /* The bit position of event in MEVTSET register */
    volatile UInt32 *mevtclr = (volatile UInt32 *)WUGENMEVTCLR0;
    
    regnum = 0;
    bitpos = eventid - 45;

    if ((eventid < 45) || (eventid > 92)) {
        return;
    }
    else if (eventid > 76) {
        regnum = 1;
        bitpos -= 32;
    }

    mevtclr[regnum] = (1 << bitpos);
}

/*
 *  ======== Wugen_getMasks ========
 *  This function returns the WUGEN interrupt mask registers
 *
 *  params:
 *      mask - array of three integers used to return the WUGEN interrupt
 *             mask registers.
 *             First mask consists of IRQ 0-31
 *             Second mask consists of IRQ 32-47
 *             Third mask consists of DMA requests
 */
Void Wugen_getMasks(UInt32 mask[])
{
    volatile UInt32 *mevt = (volatile UInt32 *)WUGENMEVT0;

    mask[0] = mevt[0];
    mask[1] = (0x0000ffff & mevt[1]);
    mask[2] = (0x000fffff & mevt[2]);
}

/*
 *  ======== Wugen_ierToMasks ========
 *  Compute the WUGEN masks needed to allow the interrupts set in the IER
 *  register to propagate through the WUGEN.  This function does not enable
 *  external DMA requests.  You must set these explicitly to configure a
 *  DMA request as a wakeup event.
 *
 *  params:
 *      mask - array of three integers for returning WUGEN masks.
 *             First mask consists of IRQ 0-31
 *             Second mask consists of IRQ 32-47
 *             Third mask consists of DMA requests
 */
Void Wugen_ierToMasks(UInt32 mask[])
{
    Int i;
    Int muxnum;         /* Interrupt mux register number */
    Int bitpos;         /* The bit position of the interrupt select */
    Int eventNum;       /* The event number */
    Int irqVal;         /* The IVA 2 IRQ values */
    UInt32 evtmask;     /* The value of Event Mask Register */
    volatile UInt32 *muxReg = (volatile UInt32 *)INTRMUXREG1;
    volatile UInt32 *evtMaskReg = (volatile UInt32 *)EVTMASK;
    extern cregister volatile unsigned int IER;
    
    /* mask all interrupts */
    mask[0] = ~0;
    mask[1] = ~0;
    mask[2] = ~0;

    /* unmask interrupts 4-15 which are in use */
    for (i = 4; i < 16; i++) {
        if (IER & (1 << i)) {
            muxnum = (i - 4) >> 2;
            bitpos = (i % 4) << 3;

            /* only combined events 1, 2 and events 45-92 go through WUGEN */
            eventNum = (muxReg[muxnum] & (0x7f << bitpos)) >> bitpos;

            if (eventNum > 44 && eventNum < 93) { 
                irqVal = eventNum - 45;

                /* first mask contains IRQ 0-31, second contains 32-47 */
                if (irqVal < 32) {
                    mask[0] &= ~(1 << irqVal);
                }
                else {
                    mask[1] &= ~(1 << (irqVal - 32));
                }
            }
            else if (eventNum == 1) {
                /* check the combined events for event 1 */
                evtmask = (~(evtMaskReg[1]) >> 13);
                irqVal = 0;

                /* check event mask 1 for events 45-63 that are enabled */
                while (irqVal < 19) {
                    if (evtmask & 1) {
                        mask[0] &= ~(1 << irqVal);
                    }
                    evtmask = evtmask >> 1;
                    irqVal++;
                }
            }
            else if (eventNum == 2) {
                /* check the combined events for event 2 */
                evtmask = ~(evtMaskReg[2]);
                irqVal = 19;

                /* check event mask 2 for events 64-76 that are enabled */
                while (irqVal < 32) {
                    if (evtmask & 1) {
                        mask[0] &= ~(1 << irqVal);
                    }
                    evtmask = evtmask >> 1;
                    irqVal++;
                }

                /* check event mask 2 for events 77-92 that are enabled */
                while (irqVal < 48) {
                    if (evtmask & 1) {
                        mask[1] &= ~(1 << (irqVal - 32));
                    }
                    evtmask = evtmask >> 1;
                    irqVal++;
                }
            }
        }
    }
}


