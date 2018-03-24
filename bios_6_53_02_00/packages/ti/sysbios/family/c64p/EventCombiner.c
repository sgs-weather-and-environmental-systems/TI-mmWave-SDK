/*
 * Copyright (c) 2015, Texas Instruments Incorporated
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
 * ======== EventCombiner.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/family/c64p/Hwi.h>

#ifdef ti_sysbios_BIOS_useSK__D
#include <ti/sk/sk.h>
#endif

#include "package/internal/EventCombiner.xdc.h"

#include <c6x.h>        /* intrinsics like _lmbd() */

#define EVTFLAGREG      0x01800000
#define EVTSETREG       0x01800020
#define EVTCLRREG       0x01800040
#define EVTMASKREG      0x01800080
#define MEVTFLAGREG     0x018000a0

/*
 *  ======== EventCombiner_Module_startup ========
 */
Int EventCombiner_Module_startup(Int phase)
{
    Int i;
#ifdef ti_sysbios_BIOS_useSK__D
    UInt regIndex;
#else
    UInt *evtMaskReg = (UInt *)EVTMASKREG;
    UInt *evtClrReg = (UInt *)EVTCLRREG;
#endif

    /* okay to proceed with initialization */
    for (i = 0; i < 4; i++) {
#ifdef ti_sysbios_BIOS_useSK__D
        regIndex = ((EVTCLRREG - EVTFLAGREG) / 4) + i;
	SK_setEventReg(regIndex, 0xffffffff);

        regIndex = ((EVTMASKREG - EVTFLAGREG) / 4) + i;
        SK_setEventReg(regIndex, EventCombiner_EVTMASK[i]);

#else
        evtClrReg[i] = 0xffffffff;
        evtMaskReg[i] = EventCombiner_EVTMASK[i];

#endif
    }

    return Startup_DONE;
}

/*
 *  ======== EventCombiner_disableEvent ========
 *  function will mask out the eventId from being part of the combined event.
 */
Void EventCombiner_disableEvent(UInt eventId)
{
#ifdef ti_sysbios_BIOS_useSK__D
    UInt regIndex;
#endif
    UInt hwiKey;
    UInt index;
    UInt bitpos;
    volatile UInt *evtMask = (volatile UInt *)EVTMASKREG;

    index = eventId >> 5;
    bitpos = eventId % 32;

    hwiKey = Hwi_disable();

#ifdef ti_sysbios_BIOS_useSK__D
    index &= 0x3;
    regIndex = ((EVTMASKREG - EVTFLAGREG) / 4) + index;
    SK_setEventReg(regIndex, evtMask[index] | (1 << bitpos));

#else
    evtMask[index] |= 1 << bitpos;

#endif

    Hwi_restore(hwiKey);
}

/*
 *  ======== EventCombiner_enableEvent ========
 *  Function will unmask (enable) the eventId to be part of the combiner event.
 *  Needs to be documented to not accept eventId above 127.
 */
Void EventCombiner_enableEvent(UInt eventId)
{
#ifdef ti_sysbios_BIOS_useSK__D
    UInt regIndex;
#endif
    UInt hwiKey;
    UInt index;
    UInt bitpos;
    volatile UInt *evtMask = (volatile UInt *)EVTMASKREG;

    index = eventId >> 5;
    bitpos = eventId % 32;

    hwiKey = Hwi_disable();

#ifdef ti_sysbios_BIOS_useSK__D
    /* cap index at 3 (EVTMASK0->EVTMASK3) so we don't write non-EVTMASK reg */
    index &= 0x3;
    regIndex = ((EVTMASKREG - EVTFLAGREG) / 4) + index;
    SK_setEventReg(regIndex, evtMask[index] & ~(1 << bitpos));

#else
    evtMask[index] &= ~(1 << bitpos);

#endif

    Hwi_restore(hwiKey);
}

/*
 *  ======== EventCombiner_dispatch ========
 *  This function needs to be plugged into the Hwi dispatcher table for
 *  supporting the event combiner.  First, the masked event flag register is
 *  read.  Next, the left most bit is determined and used to index into
 *  the Event Combiner dispatch table.  This will determine the function to
 *  call and its argument. This process is repeated until the mask flag is 0.
 *
 *  Calling constraints:
 *      can not be nested calls without disabling interrupts around the
 *      reading and clearing of the MEVTFLAG and EVTCLR registers respectively.
 *      eventId must be one of the combined events (0-3).
 */
Void EventCombiner_dispatch(UInt eventId)
{
#ifdef ti_sysbios_BIOS_useSK__D
    UInt regIndex;
#endif
    UInt index;
    UInt offset;
    volatile UInt eventRcv;
    volatile UInt *mevtFlag = (volatile UInt *)MEVTFLAGREG;
#ifndef ti_sysbios_BIOS_useSK__D
    volatile UInt *evtClr = (volatile UInt *)EVTCLRREG;
#endif

    Assert_isTrue(eventId < EventCombiner_NUM_EVENTS,
        EventCombiner_A_invalidEventId);

    offset = eventId * 32;
    eventRcv = mevtFlag[eventId];
    while (eventRcv) {
#ifdef ti_sysbios_BIOS_useSK__D
        regIndex = ((EVTCLRREG - EVTFLAGREG) / 4) + eventId;
	SK_setEventReg(regIndex, eventRcv);

#else
        evtClr[eventId] = eventRcv;

#endif
        do {
            index = 31 - _lmbd(1, eventRcv);
            eventRcv &= ~(1 << index);
            EventCombiner_module->dispatchTab[index + offset].fxn(
                EventCombiner_module->dispatchTab[index + offset].arg);
        } while (eventRcv);
        eventRcv = mevtFlag[eventId];
    }
}

/*
 *  ======== EventCombiner_dispatchPlug ========
 *  This function will plug the ECM dispatch table with the specified fxn
 *  and attrs.
 */
Void EventCombiner_dispatchPlug(UInt eventId, EventCombiner_FuncPtr fxn,
                                UArg arg, Bool unmask)
{
    Assert_isTrue(eventId < EventCombiner_NUM_EVENTS,
        EventCombiner_A_invalidEventId);

    if (eventId < EventCombiner_NUM_EVENTS) {
        EventCombiner_module->dispatchTab[eventId].fxn = fxn;
        EventCombiner_module->dispatchTab[eventId].arg = arg;

        if (unmask) {
            EventCombiner_enableEvent(eventId);
        }
    }
}

Void EventCombiner_unused(UArg arg)
{
    Error_raise(NULL, EventCombiner_E_unpluggedEvent, arg, 0);
}

