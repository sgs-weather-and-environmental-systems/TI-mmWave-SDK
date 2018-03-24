/*
 * Copyright (c) 2012-2017, Texas Instruments Incorporated
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
 * EXEMPLARY, OR CONSEQueueNTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 *  ======== Power.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Memory.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/Error.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/hal/Hwi.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/knl/Queue.h>

#include <ti/sysbios/family/c674/pscl.h>
#include <ti/sysbios/family/c674/pmi.h>
#include <ti/sysbios/family/c674/Power_trackDefs.h>

#include "package/internal/Power.xdc.h"

/* defines for doing CPU idling */
#define REG(x)          (*((volatile unsigned *)(x)))
#define PDCCMD_REGADDR  0x01810000
#define PDCCMD_VALUE    0x00005555

typedef struct Power_ConstraintObj {
    Queue_Elem link;
    Power_Constraint type;
    UArg value;
} Power_ConstraintObj;

typedef struct Power_NotifyObj {
    Queue_Elem link;
    Power_Event eventType;
    Fxn notifyFxn;
    UArg clientArg;
    UInt32 eventMask;
} Power_NotifyObj;

extern Void _PMI_doIdle(Void);

extern Power_ResourceRecord 
    ti_sysbios_family_c674_Power_database[Power_RSRC_END];

extern Fxn ti_sysbios_family_c674_Power_delayCompletionFxns[Power_INVALIDEVENT];
extern volatile UInt ti_sysbios_family_c674_Power_notifyWaitCount[Power_INVALIDEVENT];

/*
 *  ======== Power_configure ========
 *  Specify new configuration parameters for Power.
 *
 */
Power_Status Power_configure(Power_Attrs attrs) 
{
    UInt key;

    key = Hwi_disable();

    Power_module->currentConfig.scaleVoltage = attrs.scaleVoltage;
    Power_module->currentConfig.waitForVoltageScale = attrs.waitForVoltageScale;

    Hwi_restore(key);

    return(Power_SOK);
}


/*
 *  ======== Power_changeSetpoint ========
 *  Initiate a change to the F/V setpoint of the CPU, or the peripheral domain.
 *
 */
Power_Status Power_changeSetpoint(Power_Domain domain, UInt newSetpoint,
    UInt notifyTimeout)
{
    PSCL_Status statusPSCL = PSCL_CANNOT_CHANGE_SETPOINT;
    Power_Status status = Power_SOK;
    Power_Status statusNotifyCPU = Power_SOK;
    Power_Status statusNotifyPER = Power_SOK;
    Bool notifyCPU = FALSE;
    Bool notifyPER = FALSE;
    UInt willChange = FALSE;
    Bool proceed = FALSE;
    Types_FreqHz cpuFreq;
    UInt previousSPPER;
    UInt previousSP;
    UInt disallowed;
    PSCL_ClkID clk;
    UInt frequency;
    UInt voltage;
    UInt maskSP;
    UInt taskKey;
    UInt swiKey;
    UInt key;

    /* make sure V/F scaling is supported */
    if (!ti_sysbios_family_c674_Power_enableScaling) {
        status = Power_ENOTIMPLEMENTED;
    }

    /* check to make sure V/F scaling initialized OK */
    else if (Power_module->PSCLinitOK == FALSE) {
        status = Power_EINITFAILURE;
    }

    /* check that domain ID is valid */
    else if ((domain != Power_CPU) && (domain != Power_PER)) {
        status = Power_EINVALIDVALUE;
    }

    /* check if setpoint ID is out of range for the specified domain ID */
    else if (((domain == Power_CPU) && (newSetpoint > 
                 (Power_module->numSPCPU - 1))) ||
             ((domain == Power_PER) && (newSetpoint > 
                 (Power_module->numSPPER - 1)))) {
        status = Power_EOUTOFRANGE;
    }

    else {

        /* convert requested setpoint into a mask bit */
        maskSP = 1 << newSetpoint;

        /* go atomic */
        key = Hwi_disable();

        /* now check the requested SP against disallowed SP constraints */
        if (domain == Power_CPU) {
            disallowed = maskSP & Power_module->disallowedSetpointsCPU;
        }
        else {
            disallowed = maskSP & Power_module->disallowedSetpointsPER;
        }

        /* if the SP is *not* disallowed, check and set the 'busy' flag */
        if (disallowed == 0) {

            if (Power_module->busy == FALSE) {
                Power_module->busy = TRUE;
                proceed = TRUE;
            }
            else {
                status = Power_EBUSY;
            }
        }
        else {
            status = Power_ENOTSUPPORTED;
        }

        /* end ATOMIC */
        Hwi_restore(key);

        if (proceed == TRUE) {

            /* determine PSCL clock ID */
            clk = (PSCL_ClkID) domain == Power_CPU ? PSCL_CPU_CLK : 
                PSCL_PER_CLK;

            /* disable Task scheduling; allow Swi & Hwi for completion */
            taskKey = Task_disable();

            /* set flag for domain to be notified for SP change */
            if (domain == Power_CPU) {
                notifyCPU = TRUE;
            }
            else {
                notifyPER = TRUE;
            }

            /* if voltage scaling enabled, call to PSCL to see if this setpoint
               change will result in a voltage change; if yes, then must notify
               for other clk domain too, as there will be a voltage scale even
               though that clk frequency isn't changing */
            if (Power_module->currentConfig.scaleVoltage == TRUE) {

                PSCL_queryWillChangeVoltage(clk, newSetpoint, &willChange);

                if (willChange == TRUE) {
                    if (domain == Power_CPU) {
                        notifyPER = TRUE;
                    }
                    else {
                        notifyCPU = TRUE;
                    }
                }
            }

            /* now send any pre-notifications for CPU domain */
            if (notifyCPU == TRUE) {

                /* set nextSP to indicate the pending setpoint */
                if (domain == Power_CPU) {
                    Power_module->nextSP = newSetpoint; /* yes, new setpoint */
                    previousSP = Power_module->currentSetpointCPU;
                }
                else {                               /* not new CPU setpoint */
                    Power_module->nextSP = Power_module->currentSetpointCPU; 
                    previousSP = Power_module->currentSetpointCPU;
                }

                /* notify clients registered for pre CPU SP notification */
                statusNotifyCPU = 
                    Power_notify(Power_PENDING_CPU_SETPOINTCHANGE, 
                    notifyTimeout, Power_SigType_INTERNAL, NULL, NULL);
             }

            /* now send any pre-notifications for PER domain */
            if ((statusNotifyCPU == Power_SOK) && (notifyPER == TRUE)) {

                /* set nextSPPER to indicate the pending setpoint */
                if (domain == Power_CPU) {           /* not new PER SP */
                    Power_module->nextSPPER = Power_module->currentSetpointPER;
                    previousSPPER = Power_module->currentSetpointPER;
                }
                else {
                    Power_module->nextSPPER = newSetpoint; /* yes, new PER SP */
                    previousSPPER = Power_module->currentSetpointPER;
                }

                /* notify clients registered for pre PER SP notification */
                statusNotifyPER = 
                    Power_notify(Power_PENDING_PER_SETPOINTCHANGE,
                    notifyTimeout, Power_SigType_INTERNAL, NULL, NULL);
            }


            /* if all 'pre' notifications succeeded... do the scaling op */
            if ((statusNotifyCPU == Power_SOK) &&
                (statusNotifyPER == Power_SOK)) {

                swiKey = Swi_disable();

                /* call to PSCL to change the setpoint */
                statusPSCL = PSCL_changeSetpoint(clk, newSetpoint,
                    Power_module->currentConfig.scaleVoltage,
                    Power_module->currentConfig.waitForVoltageScale,NULL,NULL);

                Swi_restore(swiKey);
            }

            /* if scaling operation successful... */
            if (statusPSCL == PSCL_OK) {

                /* update previous and current SP globals */
                if (notifyCPU == TRUE) {
                    Power_module->currentSetpointCPU = Power_module->nextSP;
                    Power_module->previousSP = previousSP;
                }
                if (notifyPER == TRUE) {
                    Power_module->currentSetpointPER = Power_module->nextSPPER;
                    Power_module->previousSPPER = previousSPPER;
                }

                /* if scaled the CPU frequency... tell BIOS about it */
                if (domain == Power_CPU) {
                    Power_getSetpointInfo(Power_CPU, newSetpoint, &frequency,
                        &voltage);
                    cpuFreq.lo = frequency * 1000; /* convert kHz to Hz */
                    cpuFreq.hi = 0;             
                    BIOS_setCpuFreq(&cpuFreq);
                }

                /* now notify post-notification clients */
                if (notifyCPU == TRUE) {

                    /* notify clients registered of post CPU SP change */
                    statusNotifyCPU = 
                        Power_notify(Power_DONE_CPU_SETPOINTCHANGE, 
                            notifyTimeout, Power_SigType_INTERNAL, NULL, NULL);
                }

                if ((statusNotifyCPU == Power_SOK) && (notifyPER == TRUE)) {

                    /* notify clients registered of post PER SP change */
                    statusNotifyPER = 
                        Power_notify(Power_DONE_PER_SETPOINTCHANGE,
                            notifyTimeout, Power_SigType_INTERNAL, NULL, NULL);
                }
            }

            /* done, so clear Power busy flag */
            Power_module->busy = FALSE;

            /* resume Tasking */
            Task_restore(taskKey);

            /* figure out return code */
            if (statusPSCL == PSCL_INVALID_SETPOINT) {
                status = Power_EOUTOFRANGE;  /* invalid SP according to PSCL */
            }
            else if ((statusNotifyCPU == Power_ETIMEOUT) ||
                     (statusNotifyPER == Power_ETIMEOUT) ) {
                status = Power_ETIMEOUT;     /* notification timeout */
            }
            else if ((status != Power_SOK) || (statusPSCL != PSCL_OK)) {
                status = Power_EFAIL;        /* convert to 'general failure' */
            }
        }
    }

    return (status);
}


/*
 *  ======== Power_getCapabilities ========
 *  Get info on Power's enabled capabilities.
 *
 */
Power_Status Power_getCapabilities(UInt * capsMask)
{
    if (capsMask == NULL) {
        return (Power_EINVALIDPOINTER);
    }

    /* mask off the internal capabilities flags */
    *capsMask = Power_CAPSMASK & (Power_CVFSCALING | Power_CRESOURCETRACKING);

    return(Power_SOK);
}


/*
 *  ======== Power_getConstraintInfo ========
 *  Get info on aggregate of constraints that have been registered with Power.
 *
 */
Power_Status Power_getConstraintInfo(Power_Constraint type, UArg *value)
{
    Power_Status status = Power_SOK;

    /* check for NULL value pointer */
    if (value == NULL) {
        status = Power_EINVALIDPOINTER;
    }

    /* else, return specified constraints value */
    else if (type == Power_DISALLOWED_CPU_SETPOINT_MASK) {
        *value = Power_module->disallowedSetpointsCPU;
    }
    else if (type == Power_DISALLOWED_PER_SETPOINT_MASK) {
        *value = Power_module->disallowedSetpointsPER;
    }
    else if (type == Power_DISALLOWEDSLEEPSTATE_MASK) {
        *value = Power_module->disallowedSleepModes;
    }

    /* else, indicate invalid constraint type */
    else {
        status = Power_EINVALIDVALUE;
    }

    return (status);
}


/*
 *  ======== Power_getCurrentSetpoint ========
 *  Get the current setpoint in effect.
 *
 */
Power_Status Power_getCurrentSetpoint(Power_Domain domain, UInt * setpoint)
{
    Power_Status status = Power_SOK;
    PSCL_Status psclStatus;
    PSCL_ClkID clk;

    /* first make sure V/F scaling is supported */
    if (!ti_sysbios_family_c674_Power_enableScaling) {
        status = Power_ENOTIMPLEMENTED;
    }

    /* check to make sure V/F scaling initialized OK */
    else if (Power_module->PSCLinitOK == FALSE) {
        status = Power_EINITFAILURE;
    }

    /* check that domain ID is valid */
    else if ((domain != Power_CPU) && (domain != Power_PER)) {
        status = Power_EINVALIDVALUE;
    }

    /* check that setpoint pointer is not NULL */
    else if (setpoint == NULL) {
        status = Power_EINVALIDPOINTER;
    }

    else {

        /* determine PSCL clock ID */
        clk = (PSCL_ClkID) domain == Power_CPU ? PSCL_CPU_CLK : PSCL_PER_CLK;

        /* next query PSCL for current setpoint */
        psclStatus = PSCL_getSetpoint(clk, setpoint);

        if (psclStatus != PSCL_OK) {
            status = Power_EFAIL;
        }
    }

    return (status);
}


/*
 *  ======== Power_getDependencyCount ========
 *  Get the count of dependencies that are currently declared on a resource.
 *
 */
Power_Status Power_getDependencyCount(Power_Resource resourceID, UInt * count)
{
    /* make sure RT has been configured ON */
    if (!ti_sysbios_family_c674_Power_trackResources) {
        return (Power_ENOTSUPPORTED);
    }

    /* validate resource ID is within range of pre-defined resources */
    else if (resourceID >= Power_RSRC_END) {
        return (Power_EOUTOFRANGE);
    }

    /* make sure count pointer is not NULL */
    else if (count == NULL) {
        return (Power_EINVALIDPOINTER);
    }

    /* make sure this resource is 'valid' for DSP control */
    else if ((ti_sysbios_family_c674_Power_database[resourceID].flags & VALID)
         == 0) {
        return (Power_EINVALIDVALUE);
    }

    /* read reference count */
    *count = ti_sysbios_family_c674_Power_database[resourceID].count;

    return (Power_SOK);
}


/*
 *  ======== Power_getNumSetpoints ========
 *  Get the number of setpoints supported on the platform.
 *
 */
Power_Status Power_getNumSetpoints(Power_Domain domain, UInt * numberSetpoints)
{
    Power_Status status = Power_SOK;
    PSCL_Status psclStatus;
    PSCL_ClkID clk;

    /* first make sure V/F scaling is supported */
    if (!ti_sysbios_family_c674_Power_enableScaling) {
        status = Power_ENOTIMPLEMENTED;
    }

    /* check to make sure V/F scaling initialized OK */
    else if (Power_module->PSCLinitOK == FALSE) {
        status = Power_EINITFAILURE;
    }

    /* check that domain ID is valid */
    else if ((domain != Power_CPU) && (domain != Power_PER)) {
        status = Power_EINVALIDVALUE;
    }

    /* check that number of setpoints pointer is not NULL */
    else if (numberSetpoints == NULL) {
        status = Power_EINVALIDPOINTER;
    }

    else {

        /* determine PSCL clock ID */
        clk = (PSCL_ClkID) domain == Power_CPU ? PSCL_CPU_CLK : PSCL_PER_CLK;

        /* now call to PSCL to get number of setpoints for the domain */
        psclStatus = PSCL_getNumSetpoints(clk, numberSetpoints);

        if (psclStatus != PSCL_OK) {
            status = Power_EFAIL;
        }
    }

    return (status);
}


/*
 *  ======== Power_setDependency ========
 *  Declare a dependency upon a power-manageable resource.
 *
 */
Power_Status Power_setDependency(Power_Resource resourceID)
{
    Power_Status status = Power_SOK;
    PMI_Status pmi = PMI_BUSY;
    Bool callStatus;
    UInt checks = 0;
    UInt state = 0;
    UInt refCount;
    UInt key;

    /* make sure RT has been configured ON */
    if (!ti_sysbios_family_c674_Power_trackResources) {
        status = Power_ENOTSUPPORTED;
    }

    /* validate resource ID is within range of pre-defined resources */
    else if (resourceID >= Power_RSRC_END) {
        status = Power_EOUTOFRANGE;
    }

    /* make sure this resource is 'valid' for DSP control */
    else if ((ti_sysbios_family_c674_Power_database[resourceID].flags & VALID) 
        == 0) {
        status = Power_EINVALIDVALUE;
    }

    /* else, check reference count, activate resource if not already active */
    else {

        /* disable scheduling */
        key = Swi_disable();

        /* read reference count */
        refCount = ti_sysbios_family_c674_Power_database[resourceID].count;

        /* if resource already ON simply increment reference count and return */
        if (refCount > 0) {
            ti_sysbios_family_c674_Power_database[resourceID].count = 
                refCount + 1;
        }

        /* else, if resource not ON yet... */
        else {

            /* if resource has special handler - call it now */
            if (ti_sysbios_family_c674_Power_database[resourceID].specialHandler != NULL) {
                callStatus = (*ti_sysbios_family_c674_Power_database[resourceID].specialHandler)
                    (resourceID, Power_SET);
            }
            /* else, call to PMI to activate the resource */
            else {

                state = ENABLE;

                /* optionally assert force for the transition */
                if ((ti_sysbios_family_c674_Power_database[resourceID].flags 
                    & FORCE_MODE) != 0) {
                    state = ENABLE | FORCE_BIT;
                }

                /* initiate transition to active state */
                PMI_setModuleState(0,
                (UInt)ti_sysbios_family_c674_Power_database[resourceID].pscNum,
                (UInt)ti_sysbios_family_c674_Power_database[resourceID].lpscNum,
                state);

                /* now wait for the PSC transition to complete */
                while ((pmi == PMI_BUSY) && (checks++ < PSCWAITTHRESHOLD)) {
                    pmi = PMI_getModuleState(0,
                        (UInt)ti_sysbios_family_c674_Power_database[resourceID].pscNum,
                        (UInt)ti_sysbios_family_c674_Power_database[resourceID].lpscNum, &state);
                }

                /* check that transitioned to active state */
                if ((state == ENABLE) && (pmi == PMI_OK)) {
                    callStatus = TRUE;
                }
                else {
                    callStatus = FALSE;
                }
            }

            /* if returned status good, set reference count to 1 */
            if (callStatus == TRUE) {
                ti_sysbios_family_c674_Power_database[resourceID].count = 1;
            }
            /* else, don't modify reference count, return failure code */
            else {
                status = Power_EFAIL;
            }
        }

        /* re-enable scheduling */
        Swi_restore(key);
    }

    return(status);
}


/*
 *  ======== Power_getSetpointInfo ========
 *  Get the frequency and core voltage for a setpoint.
 *
 */
Power_Status Power_getSetpointInfo(Power_Domain domain, UInt setpoint,
    UInt *frequency, UInt *voltage)
{
    Power_Status status = Power_SOK;
    PSCL_Status psclStatus;
    PSCL_ClkID clk;
    UInt mode;

    /* make sure V/F scaling is supported */
    if (!ti_sysbios_family_c674_Power_enableScaling) {
        status = Power_ENOTIMPLEMENTED;
    }

    /* check to make sure V/F scaling initialized OK */
    else if (Power_module->PSCLinitOK == FALSE) {
        status = Power_EINITFAILURE;
    }

    /* check that domain ID is valid */
    else if ((domain != Power_CPU) && (domain != Power_PER)) {
        status = Power_EINVALIDVALUE;
    }

    /* next make sure info pointers are not NULL */
    else if ((frequency == NULL) || (voltage == NULL)) {
        status = Power_EINVALIDPOINTER;
    }

    else {

        /* determine PSCL clock ID */
        clk = (PSCL_ClkID) domain == Power_CPU ? PSCL_CPU_CLK : PSCL_PER_CLK;

        psclStatus = PSCL_querySetpoint(clk, setpoint, frequency, voltage,
            &mode);

        if (psclStatus == PSCL_INVALID_SETPOINT) {
            status = Power_EINVALIDVALUE;
        }
        else if (status != PSCL_OK) {
            status = Power_EFAIL;
        }
    }

    return (status);
}


/*
 *  ======== Power_getTransitionLatency ========
 *  Get the latency to scale from one setpoint to another setpoint.
 *
 */
Power_Status Power_getTransitionLatency(Power_Domain domain,
    UInt initialSetpoint, UInt finalSetpoint, UInt *frequencyLatency,
    UInt *voltageLatency)
{
    Power_Status status = Power_SOK;
    PSCL_Status psclStatus;
    PSCL_ClkID clk;

    /* make sure V/F scaling is supported */
    if (!ti_sysbios_family_c674_Power_enableScaling) {
        status = Power_ENOTIMPLEMENTED;
    }

    /* check to make sure V/F scaling initialized OK */
    else if (Power_module->PSCLinitOK == FALSE) {
        status = Power_EINITFAILURE;
    }

    /* check that domain ID is valid */
    else if ((domain != Power_CPU) && (domain != Power_PER)) {
        status = Power_EINVALIDVALUE;
    }

    /* make sure latency pointers are not NULL */
    else if ((frequencyLatency == NULL) || (voltageLatency == NULL)) {
        status = Power_EINVALIDPOINTER;
    }

    else {

        /* determine PSCL clock ID */
        clk = (PSCL_ClkID) domain == Power_CPU ? PSCL_CPU_CLK : PSCL_PER_CLK;

        /* call to PSCL to get transition latency estimates */
        psclStatus = PSCL_querySetpointTransition(clk, initialSetpoint,
            finalSetpoint, frequencyLatency, voltageLatency);

        if (psclStatus == PSCL_INVALID_SETPOINT) {
            status = Power_EINVALIDVALUE;
        }
        else if (psclStatus != PSCL_OK) {
            status = Power_EFAIL;
        }
    }

    return (status);
}


/*
 *  ======== Power_idleStopClock ========
 *
 */
Void Power_idleStopClock(Void)
{
    Hwi_disable();                      /* go ATOMIC */
    REG(PDCCMD_REGADDR) = PDCCMD_VALUE; /* configure power down control reg */
    _PMI_doIdle();                      /* end ATOMIC as invoke IDLE ... */
}

/*
 *  ======== Power_Module_startup ========
 */
Int Power_Module_startup(status)
{
    /* use template-based function for conditional init & symbol references */
    Power_init();

    return (Startup_DONE);
}

/*
 *  ======== Power_registerConstraint ========
 *  Register an operational constraint with Power.
 *
 */
Power_Status Power_registerConstraint(Power_Constraint type, UArg value,
    Power_ConstraintHandle *handle)
{
    Power_Status status = Power_SOK;
    Power_ConstraintObj * pConstraint;
    Error_Block eb;

    /* check for NULL handle pointer */
    if (handle == NULL) {
        status = Power_EINVALIDPOINTER;
    }

    /* else, check for invalid constraint type */
    else if ((type < Power_DISALLOWED_CPU_SETPOINT_MASK) ||
             (type > Power_DISALLOWEDSLEEPSTATE_MASK)) {
        status = Power_EINVALIDVALUE;
    }

    /* else, allocate a constraint object */
    else {
        Error_init(&eb);
        pConstraint = Memory_calloc(Power_Object_heap(), 
            sizeof(Power_ConstraintObj), 0, &eb);
        if ((pConstraint == NULL) || Error_check(&eb)) {
            status = Power_EFAIL;
        }

        /* fill in and enqueue the constraint, update aggregate constraints */
        else {

            /* fill in constraint object elements */
            pConstraint->type = type;
            pConstraint->value = value;

            /* place constraint object on the constraints queue */
            Queue_put(Power_Module_State_constraintsQ(), 
                (Queue_Elem*) pConstraint);

            /* update aggregated constraints with the new constraint */
            Power_updateConstraints(type, value);

            /* set out parameters */
            *handle = (UArg *) pConstraint;
        }
    }

    return (status);
}


/*
 *  ======== Power_registerNotify ========
 *  Register a function to be called on a specific power event.
 *
 */
Power_Status Power_registerNotify(Power_Event eventType, UInt eventMask,
    Fxn notifyFxn, UArg clientArg, Power_NotifyHandle * notifyHandle,
    Fxn *delayedCompletionFxn)
{
    Power_NotifyObj * pNotify;
    Queue_Handle notifyQ;
    Error_Block eb;

    /* check for out of range event type */
    if (((Int)eventType < 0) || (eventType >= Power_INVALIDEVENT)) {
        return (Power_EINVALIDEVENT);
    }

    /* check for NULL pointers for notifyFxn and out params */
    if ((notifyFxn == NULL) || (notifyHandle == NULL) ||
       (delayedCompletionFxn == NULL)) {
        return (Power_EINVALIDPOINTER);
    }

    /* allocate a notification object */
    Error_init(&eb);
    pNotify = Memory_calloc(Power_Object_heap(), sizeof(Power_NotifyObj), 0, 
        &eb);
    if ((pNotify == NULL) || Error_check(&eb)) {
        return (Power_EFAIL);
    }

    /* fill in notify object elements */
    pNotify->eventType = eventType;
    pNotify->notifyFxn = notifyFxn;
    pNotify->clientArg = clientArg;
    pNotify->eventMask = eventMask;

    /* determine the appropriate notification queue */
    notifyQ = (Queue_Handle)((UInt8 *)(Power_module->notifyQ) +
                (UInt)(eventType * (2 * sizeof(Ptr))));

    /* place notify object on appropriate event queue */
    Queue_put(notifyQ, (Queue_Elem*) pNotify);

    /* set out parameters */
    *notifyHandle = pNotify;
    *delayedCompletionFxn = 
        (Fxn) ti_sysbios_family_c674_Power_delayCompletionFxns[eventType];

    return(Power_SOK);
}


/*
 *  ======== Power_releaseDependency ========
 *  Release a dependency that has been previously declared by
 *  Power_setDependency.
 *
 */
Power_Status Power_releaseDependency(Power_Resource resourceID)
{
    Power_Status status = Power_SOK;
    PMI_Status pmi = PMI_BUSY;
    Bool callStatus;
    UInt checks = 0;
    UInt state = 0;
    UInt refCount;
    UInt key;

    /* make sure RT has been configured ON */
    if (!ti_sysbios_family_c674_Power_trackResources) {
        status = Power_ENOTSUPPORTED;
    }

    /* validate resource ID is within range of pre-defined  resources */
    else if (resourceID >= Power_RSRC_END) {
        status = Power_EOUTOFRANGE;
    }

    /* make sure this resource is 'valid' for DSP control */
    else if ((ti_sysbios_family_c674_Power_database[resourceID].flags & VALID)
        == 0) {
        status = Power_EINVALIDVALUE;
    }

    /* else, check reference count, de-activate resource */
    else {

        /* disable scheduling */
        key = Swi_disable();

        /* read reference count */
        refCount = ti_sysbios_family_c674_Power_database[resourceID].count;

        /* if reference count already zero return an error code */
        if (refCount == 0) {
            status = Power_ETOOMANYCALLS;
        }
        /* else, if dependencies remain simply decrement count */
        else if (refCount > 1) {
            ti_sysbios_family_c674_Power_database[resourceID].count = 
                refCount - 1;
        }

        /* else, one remaining dependency, and it is being released... */
        else {

            /* if resource has special handler - call it now */
            if (ti_sysbios_family_c674_Power_database[resourceID].specialHandler != NULL) {
                callStatus = (*ti_sysbios_family_c674_Power_database[resourceID].specialHandler)
                    (resourceID, Power_RELEASE);
            }
            /* else, call to PMI to deactivate the resource */
            else {

                state = ti_sysbios_family_c674_Power_database[resourceID].inactiveState;

                /* optionally assert force for the transition */
                if ((ti_sysbios_family_c674_Power_database[resourceID].flags 
                    & FORCE_MODE) != 0) {
                    state = state | FORCE_BIT;
                }

                /* initiate transition to inactive state */
                PMI_setModuleState(0,
                (UInt)ti_sysbios_family_c674_Power_database[resourceID].pscNum,
                (UInt)ti_sysbios_family_c674_Power_database[resourceID].lpscNum,
                 state);

                /* now wait for the PSC transition to complete */
                while ((pmi == PMI_BUSY) && (checks++ < PSCWAITTHRESHOLD)) {
                    pmi = PMI_getModuleState(0,
                        (UInt)ti_sysbios_family_c674_Power_database[resourceID].pscNum,
                        (UInt)ti_sysbios_family_c674_Power_database[resourceID].lpscNum, &state);
                }

                /* check that transitioned to inactive state */
                if ((pmi == PMI_OK) &&
                   (state == (UInt)ti_sysbios_family_c674_Power_database[resourceID].inactiveState)) {
                    callStatus = TRUE;
                }
                else {
                    callStatus = FALSE;
                }
            }

            /* if returned status is good, set reference count to 0 */
            if (callStatus == TRUE) {
                ti_sysbios_family_c674_Power_database[resourceID].count = 0;
            }
            /* else, don't modify reference count, return failure code */
            else {
                status = Power_EFAIL;
            }
        }

        /* re-enable scheduling */
        Swi_restore(key);
    }

    return (status);
}


/*
 *  ======== Power_signalEvent ========
 *  Signal a Power event to registered clients.
 *
 */
Power_Status Power_signalEvent(Power_Event eventType, UArg eventArg1,
    UArg eventArg2, UInt notifyTimeout)
{
    Power_Status status;
    UInt key;

    /* check for out of range event type */
    if (((Int)eventType < 0) || (eventType >= Power_INVALIDEVENT)) {
        return (Power_EINVALIDEVENT);
    }

    /* disable task scheduling */
    key = Task_disable();

    /* notify clients registered for this event */
    status = Power_notify(eventType, notifyTimeout, Power_SigType_EXTERNAL, 
        eventArg1, eventArg2);

    /* reenable task scheduling */
    Task_restore(key);

    /* map a non-timeout error to Power_EFAIL */
    if ((status != Power_ETIMEOUT) && (status != Power_SOK)) {
        status = Power_EFAIL;
    }

    return (status);
}


/*
 *  ======== Power_sleepDSP ========
 */
Power_Status Power_sleepDSP(UInt sleepCode, UInt sleepArg, UInt notifyTimeout)
{
    Power_Status status = Power_SOK;
    Bool exitNow = FALSE;
    Power_Event preEvent;
    Power_Event postEvent;
    PMI_Sleep sleepMode;
    UInt taskKey;
    UInt swiKey;
    UInt hwiKey;

    /* first validate the sleep code */
    if ( (sleepCode != Power_STANDBY) &&
         (sleepCode != Power_SLEEP) &&
         (sleepCode != Power_DEEPSLEEP) ) {
        status = Power_ENOTIMPLEMENTED;
    }

    /* make sure sleep request doesn't violate a registered constraint */
    else if ( ( (sleepCode == Power_STANDBY) &&
                ((Power_module->disallowedSleepModes & Power_STANDBY) != 0) ) ||
              ( (sleepCode == Power_SLEEP) &&
                ((Power_module->disallowedSleepModes & Power_SLEEP) != 0) ) ||
              ( (sleepCode == Power_DEEPSLEEP) &&
               ((Power_module->disallowedSleepModes & Power_DEEPSLEEP) != 0))) {
        status = Power_ENOTSUPPORTED;
    }

    /* check for valid sleepArg */
    else if (sleepCode == Power_DEEPSLEEP) {
        if ((sleepArg != Power_EXTERNAL) && (sleepArg != Power_RTC_ALARM)) {
            status = Power_EINVALIDVALUE;
        }
    }

    if (status == Power_SOK) {

        /* make sure Power is not still busy with a previous transition */
        hwiKey = Hwi_disable();

        if (Power_module->busy == FALSE) {
            Power_module->busy = TRUE;
        }
        else {
            exitNow = TRUE;
        }

        Hwi_restore(hwiKey);

        if (exitNow == TRUE) {
            status = Power_EBUSY;
        }

        else {

            /* setup sleep vars */
            if (sleepCode == Power_STANDBY) {
                preEvent = Power_GOINGTOSTANDBY;
                postEvent = Power_AWAKEFROMSTANDBY;
                sleepMode = PMI_STANDBY;
            }
            else if (sleepCode == Power_SLEEP) {
                preEvent = Power_GOINGTOSLEEP;
                postEvent = Power_AWAKEFROMSLEEP;
                sleepMode = PMI_SLEEP;
            }
            else {
                preEvent = Power_GOINGTODEEPSLEEP;
                postEvent = Power_AWAKEFROMDEEPSLEEP;
                sleepMode = PMI_DEEPSLEEP;
            }

            /* disable Task scheduling; allow Swis and Hwis for notifications */
            taskKey = Task_disable();

            /* signal all clients registered for pre-sleep notification */
            status = Power_notify(preEvent, notifyTimeout, 
                Power_SigType_INTERNAL, NULL, NULL);

            /* check for timeout or any other error */
            if (status != Power_SOK) {
                Power_module->busy = FALSE;     /* clear busy */
                Task_restore(taskKey);          /* re-enable scheduler */
                return (status);
            }

            /* now disable Swi scheduling */
            swiKey = Swi_disable();

            /* start the sleep sequence */
            hwiKey = Hwi_disable();

            /* call to PMI to go to and wake from sleep... */
            PMI_sleepCPU(sleepMode, Power_module->currentConfig.scaleVoltage,
                (UInt) sleepArg);

            /* when get here CPU has already processed the wakeup interrupt */

            /* restore the previous interrupt enable state */
            Hwi_restore(hwiKey);

            /* re-enable Swi scheduling */
            Swi_restore(swiKey);

            /* signal all clients registered for post-sleep notification */
            status = Power_notify(postEvent, notifyTimeout, 
                Power_SigType_INTERNAL, NULL, NULL);

            /* now clear the busy flag before re-enabling scheduler */
            Power_module->busy = FALSE;

            /* re-enable Task scheduling */
            Task_restore(taskKey);

            /* check for timeout or other notification error */
            if (status != Power_SOK) {
                return (status);
            }
        }
    }

    return (status);
}


/*
 *  ======== Power_unregisterConstraint ========
 *  Unregister for a power notification.
 *
 */
Power_Status Power_unregisterConstraint(Power_ConstraintHandle handle)
{
    Power_Status status = Power_SOK;
    Power_Constraint type;
    UInt key;

    /* check for NULL constraintHandle */
    if (handle == NULL) {
        status = Power_EINVALIDHANDLE;
    }

    /* else, remove and delete constraint object, update aggregate constraint */
    else {
        key = Hwi_disable();
        Queue_remove((Queue_Elem *)handle);
        Hwi_restore(key);

        /* recompute aggregate constraint w/absence of removed constraint */
        type = ((Power_ConstraintObj *) handle)->type;
        Power_rebuildConstraint(type);

        /* free the constraint object */
        Memory_free(Power_Object_heap(), handle, sizeof(Power_ConstraintObj));
    }

    return (status);
}


/*
 *  ======== Power_unregisterNotify ========
 *  Unregister for a power notification.
 *
 */
Power_Status Power_unregisterNotify(Power_NotifyHandle notifyHandle)
{
    Power_Status status = Power_SOK;
    UInt key;

    /* check for NULL notifyHandle */
    if (notifyHandle == NULL) {
        status = Power_EINVALIDHANDLE;
    }

    else {

        /* remove notify object from its event queue */
        key = Hwi_disable();
        Queue_remove((Queue_Elem *)notifyHandle);
        Hwi_restore(key);

        /* free the notify object */
        Memory_free(Power_Object_heap(), notifyHandle, sizeof(Power_NotifyObj));
    }

    return(status);
}


/* * * * * * * * * * * * internal support functions * * * * * * * * * * * */

/*
 *  ======== Power_delayCompletion0 ========
 */
Void Power_delayCompletion0(Void)
{
    UInt key;
 
    key = Hwi_disable();
    ti_sysbios_family_c674_Power_notifyWaitCount[0] -= 1;
    Hwi_restore(key);
}


/*
 *  ======== Power_delayCompletion1 ========
 */
Void Power_delayCompletion1(Void)
{
    UInt key;
 
    key = Hwi_disable();
    ti_sysbios_family_c674_Power_notifyWaitCount[1] -= 1;
    Hwi_restore(key);
}


/*
 *  ======== Power_delayCompletion2 ========
 */
Void Power_delayCompletion2(Void)
{
    UInt key;
 
    key = Hwi_disable();
    ti_sysbios_family_c674_Power_notifyWaitCount[2] -= 1;
    Hwi_restore(key);
}


/*
 *  ======== Power_delayCompletion3 ========
 */
Void Power_delayCompletion3(Void)
{
    UInt key;
 
    key = Hwi_disable();
    ti_sysbios_family_c674_Power_notifyWaitCount[3] -= 1;
    Hwi_restore(key);
}


/*
 *  ======== Power_delayCompletion4 ========
 */
Void Power_delayCompletion4(Void)
{
    UInt key;
 
    key = Hwi_disable();
    ti_sysbios_family_c674_Power_notifyWaitCount[4] -= 1;
    Hwi_restore(key);
}


/*
 *  ======== Power_delayCompletion5 ========
 */
Void Power_delayCompletion5(Void)
{
    UInt key;
 
    key = Hwi_disable();
    ti_sysbios_family_c674_Power_notifyWaitCount[5] -= 1;
    Hwi_restore(key);
}


/*
 *  ======== Power_delayCompletion6 ========
 */
Void Power_delayCompletion6(Void)
{
    UInt key;
 
    key = Hwi_disable();
    ti_sysbios_family_c674_Power_notifyWaitCount[6] -= 1;
    Hwi_restore(key);
}


/*
 *  ======== Power_delayCompletion7 ========
 */
Void Power_delayCompletion7(Void)
{
    UInt key;
 
    key = Hwi_disable();
    ti_sysbios_family_c674_Power_notifyWaitCount[7] -= 1;
    Hwi_restore(key);
}


/*
 *  ======== Power_delayCompletion8 ========
 */
Void Power_delayCompletion8(Void)
{
    UInt key;
 
    key = Hwi_disable();
    ti_sysbios_family_c674_Power_notifyWaitCount[8] -= 1;
    Hwi_restore(key);
}


/*
 *  ======== Power_delayCompletion9 ========
 */
Void Power_delayCompletion9(Void)
{
    UInt key;
 
    key = Hwi_disable();
    ti_sysbios_family_c674_Power_notifyWaitCount[9] -= 1;
    Hwi_restore(key);
}


/*
 *  ======== Power_initRefCounts ========
 *  Initialize resource reference counts.
 */
Void Power_initRefCounts(Void)
{
    PMI_Status pmi = PMI_BUSY;
    Bool status;
    UInt state;
    UInt id;

    /* walk database, query resource state, init reference counts */
    for (id = 0; id < Power_RSRC_END; id++) {

        /* make sure resource is 'valid' for DSP control */
        if ((ti_sysbios_family_c674_Power_database[id].flags & VALID) != 0) {

            /* if there is a special handler, query it ... */
            if (ti_sysbios_family_c674_Power_database[id].specialHandler 
                != NULL) {
                status = 
                    (*ti_sysbios_family_c674_Power_database[id].specialHandler)
                    (id, Power_QUERY);
                if (status == TRUE) {
                    ti_sysbios_family_c674_Power_database[id].count = 1;
                }
            }

            /* else, call to PMI to query resource state from LPSC */
            else {
                pmi = PMI_BUSY;
                while (pmi == PMI_BUSY) {
                    pmi = PMI_getModuleState(0, 
                       (UInt)ti_sysbios_family_c674_Power_database[id].pscNum,
                       (UInt)ti_sysbios_family_c674_Power_database[id].lpscNum,
                        &state);
                }
                if (state == ENABLE) {
                    ti_sysbios_family_c674_Power_database[id].count = 1;
                }
            }

        }
    }
}

/*
 *  ======== Power_notify ========
 *
 *  Note: when this function is called, Swi and Task scheduling are disabled,
 *  but interrupts are enabled.
 */
Power_Status Power_notify(Power_Event eventType, UInt timeout,
    Power_SigType sigType, UArg extArg1, UArg extArg2)
{
    Power_NotifyResponse clientStatus;
    UInt32 notifyStartTime;
    Queue_Handle notifyQ;
    Queue_Elem * elem;
    UArg eventArg1;
    UArg eventArg2;
    UInt clients = 0;
    Fxn notifyFxn;
    UArg clientArg;
    UInt key;

    /* determine the appropriate notification queue */
    notifyQ = (Queue_Handle)((UInt8 *)(Power_module->notifyQ) +
                (UInt)(eventType * (2 * sizeof(Ptr))));

    /* if queue is empty, return immediately */
    if (Queue_empty(notifyQ)) {
        return (Power_SOK);
    }

    /* reset the count of clients doing delayed completion */
    ti_sysbios_family_c674_Power_notifyWaitCount[(UInt)eventType] = 0;

    /* grab notification start time (# ticks) */
    notifyStartTime = Clock_getTicks();

    /* point to first client notify object */
    elem = Queue_head(notifyQ);

    /* walk the queue and notify each registered client of the event */
    do {
        clients++;      /* count each registered client being notified */

        /* pull params from notify object */
        notifyFxn = ((Power_NotifyObj *)elem)->notifyFxn;
        clientArg = ((Power_NotifyObj *)elem)->clientArg;

        /* determine the event arguments... */
        /* if event triggered internally then Power determines event args: */
        if (sigType == Power_SigType_INTERNAL) {

            if (eventType == Power_PENDING_CPU_SETPOINTCHANGE) {
                eventArg1 = Power_module->currentSetpointCPU;
                eventArg2 = Power_module->nextSP;
            }
            else if (eventType == Power_DONE_CPU_SETPOINTCHANGE) {
                eventArg1 = Power_module->previousSP;
                eventArg2 = Power_module->currentSetpointCPU;
            }
            else if (eventType == Power_PENDING_PER_SETPOINTCHANGE) {
                eventArg1 = Power_module->currentSetpointPER;
                eventArg2 = Power_module->nextSPPER;
            }
            else if (eventType == Power_DONE_PER_SETPOINTCHANGE) {
                eventArg1 = Power_module->previousSPPER;
                eventArg2 = Power_module->currentSetpointPER;
            }
            else {
                eventArg1 = NULL;
                eventArg2 = NULL;
            }
        }
        /* else for externally triggered events use client-specified args: */
        else {
            eventArg1 = extArg1;
            eventArg2 = extArg2;
        }

        asm(" .global _Power_ntfy");
        asm("_Power_ntfy:");

        clientStatus = (Power_NotifyResponse) (*(Fxn)notifyFxn)(eventType,
           eventArg1, eventArg2, clientArg);

        /* if client said not done, increment count of clients to wait for */
        if (clientStatus == Power_NOTIFYNOTDONE) {
            key = Hwi_disable();
            ti_sysbios_family_c674_Power_notifyWaitCount[(UInt)eventType] += 1;
            Hwi_restore(key);
        }
        else if (clientStatus == Power_NOTIFYERROR) {
            return (Power_EFAIL);
        }

        /* get next element in this notify queue */
        elem = Queue_next(elem);

    } while (elem != (Queue_Elem *) notifyQ);

    /* if no timout and a client said not done, return immediately  */
    if ((timeout == 0) 
      && (ti_sysbios_family_c674_Power_notifyWaitCount[(UInt)eventType] != 0)) {
        return (Power_ETIMEOUT);
    }

    /* if any client said not done: wait until they signal completion */
    while (ti_sysbios_family_c674_Power_notifyWaitCount[(UInt)eventType] != 0) {
        if ((Clock_getTicks() - notifyStartTime) > timeout) {
            return (Power_ETIMEOUT);
        }
    }

    return (Power_SOK);
}


/*
 *  ======== Power_rebuildConstraint ========
 */
Void Power_rebuildConstraint(Power_Constraint type)
{
    Queue_Handle constraintsQ;
    Queue_Elem * elem;
    UInt value;
    UInt key;

    /* disable scheduling */
    key = Swi_disable();

    /* first, re-initialize the aggregate constraint */
    if (type == Power_DISALLOWED_CPU_SETPOINT_MASK) {
        Power_module->disallowedSetpointsCPU = 0;
    }
    else if (type == Power_DISALLOWED_PER_SETPOINT_MASK) {
        Power_module->disallowedSetpointsPER = 0;
    }
    else if (type == Power_DISALLOWEDSLEEPSTATE_MASK) {
        Power_module->disallowedSleepModes = 0;
    }

    constraintsQ = Power_Module_State_constraintsQ();

    if (!Queue_empty(constraintsQ)) {
        elem = Queue_head(constraintsQ);

        do {
            /* only if constraint 'type' matches... */
            if (((Power_ConstraintObj *)elem)->type == type) {

                /* get the constraint value */
                value = (UInt) ((Power_ConstraintObj *)elem)->value;

                /* update the agregate constraint */
                if (type == Power_DISALLOWED_CPU_SETPOINT_MASK) {
                    Power_module->disallowedSetpointsCPU |= value;
                }
                else if (type == Power_DISALLOWED_PER_SETPOINT_MASK) {
                    Power_module->disallowedSetpointsPER |= value;
                }
                else if (type == Power_DISALLOWEDSLEEPSTATE_MASK) {
                    Power_module->disallowedSleepModes |= value;
                 }
            }

            elem = Queue_next(elem);

        } while (elem != (Queue_Elem *) constraintsQ);
    }        

    /* re-enable scheduling */
    Swi_restore(key);
}


/*
 *  ======== Power_updateConstraints ========
 */
Void Power_updateConstraints(Power_Constraint type, UArg value)
{
    UInt key;

    /* stop threading */
    key = Swi_disable();

    /* update the disallowed CPU domain setpoints mask(?) */
    if (type == Power_DISALLOWED_CPU_SETPOINT_MASK) {
        Power_module->disallowedSetpointsCPU |= (UInt) value;
    }

    /* or, update disallowed PER domain setpoints mask(?) */
    else if (type == Power_DISALLOWED_PER_SETPOINT_MASK) {
        Power_module->disallowedSetpointsPER |= (UInt) value;
    }

    /* or, update disallowed sleep modes mask(?) */
    else if (type == Power_DISALLOWEDSLEEPSTATE_MASK) {
        Power_module->disallowedSleepModes |= (UInt) value;
    }

    /* resume threading */
    Swi_restore(key);
}



