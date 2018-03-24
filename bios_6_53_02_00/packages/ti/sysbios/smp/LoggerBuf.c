/* --COPYRIGHT--,ESD
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
 *  This program and the accompanying materials are made available under the 
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at 
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 */
/*
 *  ======== LoggerBuf.c ========
 */

#include <xdc/runtime/Error.h>
#include <xdc/runtime/Gate.h>
#include <xdc/runtime/Log.h>
#include <xdc/runtime/Memory.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/System.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/Diags.h>
#include <xdc/runtime/ILogger.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/hal/Core.h>

#include <stdlib.h>
#include <string.h>

#include "package/internal/LoggerBuf.xdc.h"

/*
 *  ======== LoggerBuf_instanceStartup ========
 */
Void LoggerBuf_instanceStartup(LoggerBuf_Object *obj)
{
    LoggerBuf_reset(obj);
}

/*
 *  ======== Log_Module_startup ========
 */
Int LoggerBuf_Module_startup(Int phase)
{
    Int i;

    /* loop over all "permanent" instances and initialize them */
    for (i = 0; i < LoggerBuf_Object_count(); i++) {
        LoggerBuf_instanceStartup(LoggerBuf_Object_get(NULL, i));
    }

    return (Startup_DONE);
}

/*
 *  ======== Instance_init =========
 */
Int LoggerBuf_Instance_init(LoggerBuf_Object *obj,
    const LoggerBuf_Params *prms, Error_Block *eb)
{
    obj->entryArr = Memory_alloc(prms->bufHeap,
            prms->numEntries * sizeof (LoggerBuf_Entry), 0, eb);

    if (obj->entryArr != NULL) {
        obj->flush = prms->exitFlush;
        obj->bufHeap = prms->bufHeap;
        obj->numEntries = prms->numEntries;
        obj->endEntry = obj->entryArr + (prms->numEntries - 1);
    
        /*
         * The following are set in instanceStartup():
         * obj->serial = 1;
         * obj->curEntry = obj->entryArr;
         * obj->readEntry = obj->entryArr;
         * obj->enabled = TRUE;
         */
        LoggerBuf_instanceStartup(obj);
    }

    return (0);        /* status passed to finalize on error */
}

/*
 *  ======== LoggerBuf_Instance_finalize ========
 */
Void LoggerBuf_Instance_finalize(LoggerBuf_Object *obj, Int status)
{
    if (obj->entryArr != NULL) {
        Memory_free(obj->bufHeap, obj->entryArr,
                    obj->numEntries * sizeof (LoggerBuf_Entry));
    }
}

/*
 *  ======== LoggerBuf_enable ========
 */
Bool LoggerBuf_enable(LoggerBuf_Object *obj)
{
    Bool prev = obj->enabled;
    obj->enabled = TRUE;
    return (prev);
}

/*
 *  ======== LoggerBuf_disable ========
 */
Bool LoggerBuf_disable(LoggerBuf_Object *obj)
{
    Bool prev = obj->enabled;
    obj->enabled = FALSE;
    return (prev);
}

/*
 *  ======== LoggerBuf_reset ========
 */
Void LoggerBuf_reset(LoggerBuf_Object *obj)
{
    memset(obj->entryArr, 0, obj->numEntries * sizeof (LoggerBuf_Entry));

    obj->serial = 1;
    obj->curEntry = obj->entryArr;
    obj->readEntry = obj->entryArr;
    obj->enabled = TRUE;
}

/*
 *  ======== LoggerBuf_setFilterLevel ========
 *  Sets the filter level for the given diags level.
 *
 *  LoggerBuf maintains a separate filter level for every diags category. This
 *  is accomplished by maintaining three masks, one for each of the levels 1 - 
 *  3, wich store the diags categories which are currently at that level. There
 *  is no mask for level4; if the diags category is not found in levels 1-3, it
 *  is  assumed that the filtering level is level4.
 *
 *  This API is an instance function per the IFilterLogger interface, but 
 *  LoggerBuf only maintains module-wide filter levels.
 *
 *  TODO - Should this be conditional on the 'filterByLevel' config?
 */
Void LoggerBuf_setFilterLevel(LoggerBuf_Object *obj, Diags_Mask mask, 
                              Diags_EventLevel filterLevel)
{   
    /* 
     * First, remove the bits in 'mask' from all of the current 'level' masks.
     * Use level = (~(mask & level) & level) to remove 'mask' bits from all 
     * 'level's.
     *    1. AND mask and level to get set of bits that appear in both
     *    2. Take the inverse of this set and AND it with 'level' to disable
     *       any bits which appear in 'mask'.
     */
    LoggerBuf_module->level1 = ~(LoggerBuf_module->level1 & mask) & 
                               LoggerBuf_module->level1;
    LoggerBuf_module->level2 = ~(LoggerBuf_module->level2 & mask) & 
                               LoggerBuf_module->level2;    
    LoggerBuf_module->level3 = ~(LoggerBuf_module->level3 & mask) & 
                               LoggerBuf_module->level3;    
    
    /* Enable the bits specified in 'mask' in the appropriate level. */
    switch (filterLevel) {
        case Diags_LEVEL1:
            LoggerBuf_module->level1 |= mask;
            break;
        case Diags_LEVEL2:
            LoggerBuf_module->level2 |= mask;
            break;
        case Diags_LEVEL3:
            LoggerBuf_module->level3 |= mask;
            break;
        case Diags_LEVEL4:
            break;
        default: {
            /* Raise an error that a bad filter level was received. */
            Error_Block eb;
            Error_init(&eb);
            Error_raise(&eb, LoggerBuf_E_badLevel, filterLevel, 0);
            break;
        }
    }
}

/*
 *  ======== LoggerBuf_getFilterLevel ========
 *  Returns the mask of diags categories which are set to the specified filter
 *  level.
 *
 *  This API is an instance function per the IFilterLogger interface, but 
 *  LoggerBuf only maintains module-wide filter levels.
 */
Diags_Mask LoggerBuf_getFilterLevel(LoggerBuf_Object *obj, 
                                    Diags_EventLevel level)      
{
    /* Return the mask of diags categories associated with 'level'. */
    switch (level) {
        case Diags_LEVEL1:
            return (LoggerBuf_module->level1);
        case Diags_LEVEL2:
            return (LoggerBuf_module->level2);
        case Diags_LEVEL3:
            return (LoggerBuf_module->level3);
        case Diags_LEVEL4:
            /* 
             * Return the inverse of all the bits set in levels 1 - 3,
             * and only return those bits which belong to the set of
             * logging categories (excludes asserts and the two level bits).
             */
            return (~(LoggerBuf_module->level1 |
                      LoggerBuf_module->level2 |
                      LoggerBuf_module->level3) & Diags_ALL_LOGGING);
        default: {
            /* Raise an error to report the bad filter level. */
            Error_Block eb;
            Error_init(&eb);
            Error_raise(&eb, LoggerBuf_E_badLevel, level, 0);
            return (0);
        }
    }
}

/*
 *  ======== LoggerBuf_filterOutEvent ========
 *  Returns TRUE if the event should be filtered out.
 *  TODO - Might be more clearly written as 'passesFilter'?
 */
Bool LoggerBuf_filterOutEvent(Diags_Mask mask)
{
    /* 
     * If filtering for the event's diags category is currently
     * set to level1... 
     */
    if (LoggerBuf_module->level1 & mask) {
        /* If the event is lower than level1, filter it out. */
        return(Diags_compareLevels(Diags_getLevel(mask), Diags_LEVEL1));
    }
    /* 
     * If filtering for the event's diags category is currently
     * set to level2... 
     */
    else if (LoggerBuf_module->level2 & mask) {
        /* If the event is lower than level2, filter it out. */
        return(Diags_compareLevels(Diags_getLevel(mask), Diags_LEVEL2));
    }
    /* 
     * If filtering for the event's diags category is currently
     * set to level3... 
     */
    else if (LoggerBuf_module->level3 & mask) {
        /* If the event is lower than level3, filter it out. */
        return(Diags_compareLevels(Diags_getLevel(mask), Diags_LEVEL3));
    }
    /* 
     * Otherwise, the filter level must be level4, which means that events of
     * all levels should be logged.
     */
    else {
        return (FALSE);
    }
}

/*
 *  ======== write0 =========
 */
Void LoggerBuf_write0(LoggerBuf_Object *obj, Log_Event evt,
                      Types_ModuleId mid)
{
    LoggerBuf_write4(obj, evt, mid, 0, 0, 0, 0);
}

/*
 *  ======== write1 =========
 */
Void LoggerBuf_write1(LoggerBuf_Object *obj, Log_Event evt,
                      Types_ModuleId mid, IArg a1)
{
    LoggerBuf_write4(obj, evt, mid, a1, 0, 0, 0);
}

/*
 *  ======== write2 =========
 */
Void LoggerBuf_write2(LoggerBuf_Object *obj, Log_Event evt,
                      Types_ModuleId mid, IArg a1, IArg a2)
{
    LoggerBuf_write4(obj, evt, mid, a1, a2, 0, 0);
}

/*
 *  ======== write4 =========
 */
Void LoggerBuf_write4(LoggerBuf_Object *obj, Log_Event evt,
                      Types_ModuleId mid, IArg a1, IArg a2, IArg a3, IArg a4)
{
    IArg key;
    Int adv;
    Int32 ser;
    LoggerBuf_Entry *e;

    /* Do nothing if the instance is disabled. */
    if (!obj->enabled) {
        return;
    }

    /* 
     * If event level filtering is enabled, and the event isn't a high enough
     * level, drop the record and return.
     */
    if (LoggerBuf_filterByLevel && 
        LoggerBuf_filterOutEvent(Log_getMask(evt))) {
        return;
    }
    
    /* 
     *  If all of the following are true:
     *   - A logger has been specified to route status events to
     *   - This is a status event
     *   - This logger is NOT the status logger
     * Pass the event to the status logger and return.
     *
     * Otherwise, continue to log the event.
     */
    if ((LoggerBuf_statusLogger != NULL) && 
        (Log_getMask(evt) & Diags_STATUS) &&
        (LoggerBuf_statusLogger != 
         ti_sysbios_smp_LoggerBuf_Handle_to_xdc_runtime_ILogger(obj))) {
        ILogger_write4(LoggerBuf_statusLogger, evt, mid, a1, a2, a3, a4);
        return;
    }
    
    key = Gate_enterModule();

    /*
     * Record new serial number even if the buffer is FULL.  We do this
     * because a reader (decoder) of the buffer needs to know if events
     * have been missed, and the buffer might become un-FULL at some
     * later time.
     */
    ser = obj->serial;

    obj->serial += 2;

    adv = obj->advance;
    if (adv == LoggerBuf_FULL) {
        goto leave;
    }

    e = obj->curEntry;

    if (e == obj->endEntry) {
        if (adv == LoggerBuf_WRAP) {
            obj->curEntry = obj->entryArr;
        }
        else {
            obj->advance = LoggerBuf_FULL;
        }
    }
    else {
        obj->curEntry = e + 1;
    }

    LoggerBuf_TimestampProxy_get64(&e->tstamp);

    /* encode coreId in upper 4 bits of 64 bit timestamp */
    e->tstamp.hi &= 0x0FFFFFFF;
    e->tstamp.hi |= (Core_getId() << 28);

    e->serial = ser;
    e->evt = Types_makeEvent(Log_getEventId(evt), mid);
    e->arg1 = a1;
    e->arg2 = a2;
    e->arg3 = a3;
    e->arg4 = a4;

leave:
    Gate_leaveModule(key);
}

/*
 *  ======== write8 =========
 *
 *  Odd serial numbers indicate a new record, even serial numbers indicate
 *  an "extension" to the previous record.  0 is a sentinal for no record,
 *  but only if it doesn't follow a -1 (0xffffffff).  If a serial number
 *  of 0 follows a serial number of 0xffffffff, it's an extension, otherwise
 *  it's a "no record".
 */
Void LoggerBuf_write8(LoggerBuf_Object *obj, Log_Event evt,
                      Types_ModuleId mid, IArg a1, IArg a2, IArg a3, IArg a4,
                      IArg a5, IArg a6, IArg a7, IArg a8)
{
    /* part1 */
    
    IArg key;
    Int adv;
    Int32 ser;
    LoggerBuf_Entry *e;

    /* Do nothing if the instance is disabled. */
    if (!obj->enabled) {
        return;
    }

    /* 
     * If event level filtering is enabled, and the event isn't a high enough
     * level, drop the record and return.
     */
    if (LoggerBuf_filterByLevel && 
        LoggerBuf_filterOutEvent(Log_getMask(evt))) {
        return;
    }
    
    /* 
     *  If all of the following are true:
     *   - A logger has been specified to route status events to
     *   - This is a status event
     *   - This logger is NOT the status logger
     * Pass the event to the status logger and return.
     *
     * Otherwise, continue to log the event.
     */
    if ((LoggerBuf_statusLogger != NULL) && 
        (Log_getMask(evt) & Diags_STATUS) &&
        (LoggerBuf_statusLogger != 
         ti_sysbios_smp_LoggerBuf_Handle_to_xdc_runtime_ILogger(obj))) {
        ILogger_write8(LoggerBuf_statusLogger, evt, mid, a1, a2, a3, a4, a5,
                       a6, a7, a8);
        return;
    }

    key = Gate_enterModule();

    /*
     * Record new serial number even if the buffer is FULL.  We do this
     * because the buffer might become un-FULL at some later time, and
     * a reader (decoder) of the buffer needs to know if events have
     * been missed.
     */
    ser = obj->serial;

    obj->serial += 2;

    adv = obj->advance;
    if (adv == LoggerBuf_FULL) {
        goto leave;
    }

    e = obj->curEntry;
    if (e == obj->endEntry) {
        if (adv == LoggerBuf_WRAP) {
            obj->curEntry = obj->entryArr;
        }
        else {
            obj->advance = LoggerBuf_FULL;
        }
    }
    else {
        obj->curEntry = e + 1;
    }

    LoggerBuf_TimestampProxy_get64(&e->tstamp);

    /* encode coreId in upper 4 bits of 64 bit timestamp */
    e->tstamp.hi &= 0x0FFFFFFF;
    e->tstamp.hi |= (Core_getId() << 28);

    e->serial = ser;
    e->evt = Types_makeEvent(Log_getEventId(evt), mid);
    e->arg1 = a1;
    e->arg2 = a2;
    e->arg3 = a3;
    e->arg4 = a4;

    /* part 2 */

    /*
     * We intentionally don't check for a "new" FULL condition here
     * since we want to write only the "extension" record, so a decoder
     * can know that this is an incomplete record and therefore throw
     * it away.  By not checking for FULL here, we end up just overwriting
     * the "starter" record (that was written above) of a two-entry record
     * with the "extension" record.
     */

    e = obj->curEntry;
    if (e == obj->endEntry) {
        if (adv == LoggerBuf_WRAP) {
            obj->curEntry = obj->entryArr;
        }
        else {
            obj->advance = LoggerBuf_FULL;
        }
    }
    else {
        obj->curEntry = e + 1;
    }

    e->serial = ser + 1;
    e->evt = ~0;
    e->arg1 = a5;
    e->arg2 = a6;
    e->arg3 = a7;
    e->arg4 = a8;

leave:
    Gate_leaveModule(key);
}

/*
 *  ======== LoggerBuf_flushAll ========
 */
Void LoggerBuf_flushAll()
{
    Int i;
    LoggerBuf_Object *obj;

    /* flush static instances */
    for (i = 0; i < LoggerBuf_Object_count(); i++) {
        obj = LoggerBuf_Object_get(NULL, i);
        if (obj->flush) {
            LoggerBuf_flush(obj);
        }
    }
    
    /* flush dynamic instances */
    
    /* loop over all dynamic instances */
    for (obj = LoggerBuf_Object_first(); obj != NULL;) {
        if (obj->flush) {
            LoggerBuf_flush(obj);               /* flush obj */
        }
        obj = LoggerBuf_Object_next(obj);   /* get next instance after 'obj' */
    }
}

/*
 *  ======== LoggerBuf_flushAllInternal ========
 */
Void LoggerBuf_flushAllInternal(Int stat)
{
     LoggerBuf_flushAll();
}

/*
 *  ======== LoggerBuf_flush ========
 */
Void LoggerBuf_flush(LoggerBuf_Object *obj)
{
    Int nEntries;
    Log_EventRec evtRec;
    UInt coreId;
    
    /* 'counter' is the maximum number of entries we want to print. Otherwise,
     * we could end up in an infinite loop if events are being generated
     * faster than they are being printed.
     */
    Int counter = obj->numEntries;
    
    for (;;) {
        nEntries = LoggerBuf_getNextEntry(obj, &evtRec);
        if (counter == 0 || nEntries == 0) {
            break;
        }
        else {
            if (nEntries != -1) {
                coreId = evtRec.tstamp.hi >> 28;
                System_printf("Core: %d ", coreId);
                evtRec.tstamp.hi &= 0x0FFFFFFF; /* mask off coreId */
                Log_doPrint(&evtRec);
                counter--;
            }
        }
    }
}

/*
 *  ======== LoggerBuf_getNextEntry ========
 *  "atomically" read and clear the next entry in the log
 *
 *  Returns:
 *      0   - no entry in the log
 *      1,2 - read one or two complete entries (write4, write8)
 *      -1  - read one but there may be another
 *
 *  Below are some notes on the implementation.
 *
 *  Pointers:
 *  - cureEntry points to the next entry to write
 *  - endEntry points to the last entry (not past it)
 *  - readEntry points to the entry that will be read on the next call to
 *    getNextEntry. 
 *
 *  Edge cases:
 *  - An extension record can be orphaned (the base can be missing)
 *  - A base record cannot be missing its extension (the records are written in
 *    order, so the base is always overwritten first)
 *  - The serial number can wrap from 0xFFFFFFFF to 0x0.
 *  - If a base record is at the end of the buffer, its extension may be at
 *    the beginning.
 */
Int LoggerBuf_getNextEntry(LoggerBuf_Object *obj, Log_EventRec *evtRec)
{
    LoggerBuf_Entry *ent;
    LoggerBuf_Entry *nextEnt;
    Int nEntries;
    Bits32 serA;
    IArg key;

    nEntries = 0;

    key = Gate_enterModule();

    ent = obj->readEntry;

    serA = ent->serial;
    if ((serA & 1) != 0) {
        /* serial numbers are odd and start at 1 */
        nEntries++;

        /* reduce two-spaced serial numbers to consecutive ints */
        evtRec->serial = (serA + 1) / 2;
        evtRec->evt = ent->evt;
        evtRec->tstamp = ent->tstamp;
        evtRec->arg[0] = ent->arg1;
        evtRec->arg[1] = ent->arg2;
        evtRec->arg[2] = ent->arg3;
        evtRec->arg[3] = ent->arg4;

        memset(ent, 0, sizeof (LoggerBuf_Entry));

        /* get pointer to next entry */
        if (ent == obj->endEntry) {
            nextEnt = obj->entryArr;
        }
        else {
            nextEnt = ent + 1;
        }

        if (nextEnt->serial == (serA + 1)) {

            /* continuation record */
            nEntries++;

            evtRec->arg[4] = nextEnt->arg1;
            evtRec->arg[5] = nextEnt->arg2;
            evtRec->arg[6] = nextEnt->arg3;
            evtRec->arg[7] = nextEnt->arg4;

            memset(nextEnt, 0, sizeof (LoggerBuf_Entry));

            /* get pointer to next entry */
            if (nextEnt == obj->endEntry) {
                nextEnt = obj->entryArr;
            }
            else {
                nextEnt += 1;
            }
        }
        else {
            evtRec->arg[4] = 0;
            evtRec->arg[5] = 0;
            evtRec->arg[6] = 0;
            evtRec->arg[7] = 0;
        }
    }
    else {
        /*
         * readEntry has an even sequence number, so it's either an
         * incomplete record, or it's empty.  If it's incomplete, we
         * need to toss it by advancing readEntry, but if it's empty
         * we want to do nothing.  We need to be able to distinguish
         * between an incomplete "extension" record that has a serial
         * number of 0 (since it's base record was 0xffffffff) and
         * an empty record, and we do this by checking the evt field,
         * which gets set to ~0 for extension records in write8.
         */
        if ((ent->evt == 0) && (ent->serial == 0)) {
            /* empty record, don't advance read pointer */
            nextEnt = obj->readEntry;
        }
        else if (ent->evt == ~0) {
            /* extension record */
            /* return -1 to indicate there may be more to go */
            nEntries = -1;

            if (ent == obj->endEntry) {
                nextEnt = obj->entryArr;
            }
            else {
                nextEnt = ent + 1;
            }
        }
        else {
            /* return -1 to indicate there may be more to go */
            nEntries = -1;

            /* bogus extension record, clear & advance read pointer */
            memset(ent, 0, sizeof (LoggerBuf_Entry));

            if (ent == obj->endEntry) {
                nextEnt = obj->entryArr;
            }
            else {
                nextEnt = ent + 1;
            }
        }
    }

    obj->readEntry = nextEnt;

    Gate_leaveModule(key);

    return (nEntries);
}
