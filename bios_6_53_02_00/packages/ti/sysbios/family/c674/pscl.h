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
 * EXEMPLARY, OR CONSEQueueNTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 *  ======== pscl.h ========
 *
 *  Power Scaling Library (PSCL) definitions for C6748.
 *
 */

#ifndef PSCL_
#define PSCL_

#include <ti/sysbios/family/c674/pscl/pscl_clkcfg.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef TRUE 
#define FALSE 0 
#define TRUE  1 
#endif

typedef enum {
   PSCL_OK,
   PSCL_INVALID_CLK,
   PSCL_INVALID_FREQ,
   PSCL_INVALID_INITIAL_FREQ,
   PSCL_INVALID_INITIAL_VOLTAGE,
   PSCL_INVALID_SETPOINT,
   PSCL_INCOMPATIBLE_VOLTAGE,
   PSCL_INCOMPLETE_INITIALIZATION,
   PSCL_CANNOT_CHANGE_SETPOINT,
   PSCL_CANNOT_CHANGE_VOLTAGE,
   PSCL_NOT_INITIALIZED
} PSCL_Status;

typedef unsigned PSCL_Setpoint;

typedef void (* PSCL_PrologFunc)(PSCL_ClkID clk, 
    PSCL_Setpoint currentSetpoint, PSCL_Setpoint newSetpoint);

typedef void (* PSCL_EpilogFunc)(PSCL_ClkID clk, 
    PSCL_Setpoint oldSetpoint, PSCL_Setpoint newSetpoint);


/*
 *  ======== PSCL_initialize ========
 *
 *
 */
extern PSCL_Status PSCL_initialize(unsigned count, PSCL_ClkID *clks,
    unsigned  *initSetpoint, unsigned goToSetpoints);


/*
 *  ======== PSCL_getNumSetpoints ========
 *
 *
 */
extern PSCL_Status PSCL_getNumSetpoints(PSCL_ClkID clk, 
    unsigned * numSetpoints);


/*
 *  ======== PSCL_getSetpoint ========
 *
 *
 */
extern PSCL_Status PSCL_getSetpoint(PSCL_ClkID clk, PSCL_Setpoint *setpoint);


/*
 *  ======== PSCL_changeSetpoint ========
 *
 *
 */
extern PSCL_Status PSCL_changeSetpoint(PSCL_ClkID clk, 
    PSCL_Setpoint newSetpoint, int scaleVoltage, int waitForVoltScale,
    PSCL_PrologFunc prologFunc, PSCL_EpilogFunc epilogFunc);


/*
 *  ======== PSCL_querySetpoint ========
 *
 *
 */
extern PSCL_Status PSCL_querySetpoint(PSCL_ClkID clk, PSCL_Setpoint setpoint,
     unsigned *frequency, unsigned *voltage, unsigned *mode);


/*
 *  ======== PSCL_querySetpointFrequency ========
 *
 *
 */
extern PSCL_Status PSCL_querySetpointFrequency(PSCL_ClkID clk, 
    PSCL_Setpoint setpoint, unsigned * frequency);


/*
 *  ======== PSCL_querySetpointVoltage ========
 *
 *
 */
extern PSCL_Status PSCL_querySetpointVoltage(PSCL_ClkID clk, 
    PSCL_Setpoint setpoint, unsigned * voltage);
                                            
                                               
/*
 *  ======== PSCL_querySetpointMode ========
 *
 *
 */
extern PSCL_Status PSCL_querySetpointMode(PSCL_ClkID clk, 
    PSCL_Setpoint setpoint, unsigned * mode);
                                            

/*
 *  ======== PSCL_querySetpointTransition ========
 *
 *
 */
extern PSCL_Status PSCL_querySetpointTransition(PSCL_ClkID clk, 
    PSCL_Setpoint fromSetpoint, PSCL_Setpoint toSetpoint,
    unsigned * freqScalingLatency, unsigned * voltageScalingLatency);   
                               

/*
 *  ======== PSCL_getFrequency ========
 *
 *
 */
extern PSCL_Status PSCL_getFrequency(PSCL_ClkID clk, unsigned * frequency);


/*
 *  ======== PSCL_getMode ========
 *
 *
 */
extern PSCL_Status PSCL_getMode(PSCL_ClkID clk, unsigned * mode);

/*
 *  ======== PSCL_getVoltage ========
 *
 *
 */
extern PSCL_Status PSCL_getVoltage(unsigned * voltage);

/*
 *  ======== PSCL_willChangeVoltage ========
 *
 *
 */
extern PSCL_Status PSCL_queryWillChangeVoltage(PSCL_ClkID clk, PSCL_Setpoint
    setpoint, unsigned * change);

#ifdef __cplusplus
}
#endif

#endif /* PSCL_ */
