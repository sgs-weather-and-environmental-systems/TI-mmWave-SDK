/*
 *  ======== pscl.c ========
 *
 *  Power Scaling Library (PSCL) implementation.
 *
 */

#include <stdlib.h>

#include <ti/sysbios/family/c674/pmi.h>
#include <ti/sysbios/family/c674/pscl.h>
#include <ti/sysbios/family/c674/pscl/_pscl.h>

extern const unsigned PSCL_voltScalingSupported;
extern unsigned _PSCL_numSP[];

PSCL_Setpoint _PSCL_currSP[NUMBER_CLOCKS] = {0, 0};
unsigned _PSCL_currFreq[NUMBER_CLOCKS] = {0, 0};
unsigned _PSCL_currMode[NUMBER_CLOCKS] = {PMI_BYPASS, PMI_BYPASS};

unsigned _PSCL_currVolt = 0;  /* assume shared common voltage for clocks */

int _PSCL_initialized = FALSE;

/*
 *  ======== PSCL_initialize ========
 *
 */
PSCL_Status PSCL_initialize(unsigned count, PSCL_ClkID * clks, 
    unsigned * initSetpoint, unsigned goToSetpoints) 
{
    PSCL_Status status = PSCL_OK;
    PMI_Status pmiStatus;
    unsigned voltCPU;
    unsigned voltPER;
    unsigned i;
   
    /* continue only if PSCL has not initialized yet */
    if (_PSCL_initialized != TRUE) {

        /* make sure PMI has initialized */
        pmiStatus = PMI_init();
        if (pmiStatus != PMI_OK) {
            status = PSCL_INCOMPLETE_INITIALIZATION;
        }
        else {

            /* do some basic error checks on the init params... */
            status = _PSCL_checkInitParams(count, clks, initSetpoint);
 
            /* if all OK proceed with init... */
            if (status == PSCL_OK) {

                /* init the current setpoint array */
                for (i = 0; i < count; i++) {
                    _PSCL_currSP[i] = initSetpoint[i];
                }

                /* init the current clock frequency array */
                _PSCL_currFreq[PSCL_CPU_CLK] = 
                    _PSCL_SP_table_CPU[initSetpoint[PSCL_CPU_CLK]].freq;
                _PSCL_currFreq[PSCL_PER_CLK] = 
                    _PSCL_SP_table_PER[initSetpoint[PSCL_PER_CLK]].freq;
    
                /* init the current clock mode array */
                _PSCL_currMode[PSCL_CPU_CLK] = 
                    _PSCL_SP_table_CPU[initSetpoint[PSCL_CPU_CLK]].pllCfg->mode;
                _PSCL_currMode[PSCL_PER_CLK] = 
                    _PSCL_SP_table_PER[initSetpoint[PSCL_PER_CLK]].pllCfg->mode;

                /* set the common voltage to the highest common voltage, per
                   the user-specified intial setpoint values */
                voltCPU = _PSCL_SP_table_CPU[initSetpoint[PSCL_CPU_CLK]].volt;
                voltPER = _PSCL_SP_table_PER[initSetpoint[PSCL_PER_CLK]].volt;
                if (voltCPU > voltPER) {
                    _PSCL_currVolt = voltCPU;
                }
                else {
                    _PSCL_currVolt = voltPER;
                }

                /* set PSCL initialized flag to TRUE; this is a bit premature
                   if need to scale to the specified setpoints, but is
                   necessary so that PSCL_changeSetpoint will try; if the
                   scaling fails, the initialized flag will be reset below */
                _PSCL_initialized = TRUE;

                /* if should actually go to the setpoints, do it now... */ 
                if (goToSetpoints == TRUE) {

                    /* first, query the actual voltage from the PMI layer */
                    PMI_getVoltage(&_PSCL_currVolt);

                    /* go to highest-voltage-requiring setpoint first, then
                       to frequencies for setpoints for remaining clks */

                    if (voltCPU >= voltPER) {
                        status = PSCL_changeSetpoint(PSCL_CPU_CLK, 
                            initSetpoint[PSCL_CPU_CLK], 
                            PSCL_voltScalingSupported, TRUE, NULL, NULL);
                        if (status == PSCL_OK) {
                            status = PSCL_changeSetpoint(PSCL_PER_CLK, 
                                initSetpoint[PSCL_PER_CLK], 
                                FALSE, FALSE, NULL, NULL);
                        }
                    }
                    else {
                        status = PSCL_changeSetpoint(PSCL_PER_CLK, 
                            initSetpoint[PSCL_PER_CLK], 
                            PSCL_voltScalingSupported, TRUE, NULL, NULL);
                        if (status == PSCL_OK) {
                            status = PSCL_changeSetpoint(PSCL_CPU_CLK, 
                                initSetpoint[PSCL_CPU_CLK], 
                                FALSE, FALSE, NULL, NULL);
                        }
                    }

                    /* if change setpoint failed reset the initialized flag */
                    if (status != PSCL_OK) {
                        _PSCL_initialized = FALSE;
                    }
                }
            }
        }    
    }

    return (status);
}


/*
 *  ======== PSCL_getNumSetpoints ========
 *
 */
PSCL_Status PSCL_getNumSetpoints(PSCL_ClkID clk, unsigned *numSetpoints) 
{
    PSCL_Status status = PSCL_OK;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status = PSCL_NOT_INITIALIZED;
    }
    else {
        *numSetpoints = _PSCL_numSP[clk];
    } 

    return (status);
}


/*
 *  ======== PSCL_getSetpoint ========
 *
 */
PSCL_Status PSCL_getSetpoint(PSCL_ClkID clk, PSCL_Setpoint * setpoint) 
{
    PSCL_Status status = PSCL_OK;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status = PSCL_NOT_INITIALIZED;
    }
    else {
        *setpoint = _PSCL_currSP[clk];
    }
   
    return (status);
}


/*
 *  ======== PSCL_changeSetpoint ========
 *
 */
PSCL_Status PSCL_changeSetpoint(PSCL_ClkID clk, PSCL_Setpoint newSetpoint, 
    int scaleVoltage, int waitForVoltScale, PSCL_PrologFunc prologFunc, 
    PSCL_EpilogFunc epilogFunc) 
{
    PSCL_Status status = PSCL_OK;
    unsigned newVoltage;
    PSCL_Setpoint oldSP;
    PSCL_Setpoint newSP;
    unsigned scaled;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status = PSCL_NOT_INITIALIZED;
    }

    else {

        /* look up voltage for new setpoint */
        if (clk == PSCL_CPU_CLK) {
            newVoltage = _PSCL_SP_table_CPU[newSetpoint].volt;
        } 
        else if (clk == PSCL_PER_CLK) {
            newVoltage = _PSCL_SP_table_PER[newSetpoint].volt;
        }
        else {
            status = PSCL_INVALID_CLK;
        }

        if (status == PSCL_OK) {

            /* if not scaling voltage make sure current voltage not too low */
            if (!scaleVoltage && (_PSCL_currVolt < newVoltage)) {
               status = PSCL_INCOMPATIBLE_VOLTAGE;
            }

            /* now, scale to the new setpoint */
            else {
   
                oldSP = _PSCL_currSP[clk];

                /* if defined, call the prolog hook function */
                if (prologFunc != NULL) {
                    prologFunc(clk, oldSP, newSetpoint);
                }

                /* scale to new frequency and voltage */
                scaled = _PSCL_scaleFreqVoltage(clk, newSetpoint, scaleVoltage, 
                    waitForVoltScale);

                /* if scaled OK, then update current SP global */
                if (scaled == TRUE) {
                    newSP = _PSCL_currSP[clk] = newSetpoint;
                }

                /* else if failed, don't change current SP, set error */
                else {
                   newSP = oldSP;
                   status = PSCL_CANNOT_CHANGE_SETPOINT;
                }
   
                /* if defined, call the prolog hook function */
                if (epilogFunc != NULL) {
                    /* call whether scaled OK, or not */
                    epilogFunc(clk, oldSP, newSP);
                }
            }
        }
    }

    return (status);  
}


/*
 *  ======== PSCL_querySetpoint ========
 *
 */
PSCL_Status PSCL_querySetpoint(PSCL_ClkID clk, PSCL_Setpoint setpoint, 
    unsigned * frequency, unsigned * voltage, unsigned * mode)
{
    PSCL_Status status = PSCL_OK;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status = PSCL_NOT_INITIALIZED;
    }
    else if (clk == PSCL_CPU_CLK) {
        *frequency = _PSCL_SP_table_CPU[setpoint].freq;
        *voltage = _PSCL_SP_table_CPU[setpoint].volt;
        *mode = _PSCL_SP_table_CPU[setpoint].pllCfg->mode;
    }
    else if (clk == PSCL_PER_CLK) {
        *frequency = _PSCL_SP_table_PER[setpoint].freq;
        *voltage = _PSCL_SP_table_PER[setpoint].volt;
        *mode = _PSCL_SP_table_PER[setpoint].pllCfg->mode;
    }
    else {
        status = PSCL_INVALID_CLK;
    }
   
    /* last check if clk is in range: make sure setpoint ID is in range too */
    if (status == PSCL_OK) {
        if (setpoint > (_PSCL_numSP[clk] - 1)) {
            status = PSCL_INVALID_SETPOINT;
        }
    }

    return (status);                          
}


/*
 *  ======== PSCL_querySetpointFrequency ========
 *
 */
PSCL_Status PSCL_querySetpointFrequency(PSCL_ClkID clk, PSCL_Setpoint setpoint,
    unsigned *frequency) 
{
    PSCL_Status status = PSCL_OK;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status = PSCL_NOT_INITIALIZED;
    }
    else if (clk == PSCL_CPU_CLK) {
        *frequency = _PSCL_SP_table_CPU[setpoint].freq;
    } 
    else if (clk == PSCL_PER_CLK) {
        *frequency = _PSCL_SP_table_PER[setpoint].freq;
    }
    else {
        status = PSCL_INVALID_CLK;
    }
   
    /* last check if clk is in range: make sure setpoint ID is in range too */
    if (status == PSCL_OK) {
        if (setpoint > (_PSCL_numSP[clk] - 1)) {
            status = PSCL_INVALID_SETPOINT;
        }
    }

    return (status);
}


/*
 *  ======== PSCL_querySetpointVoltage ========
 *
 */
PSCL_Status PSCL_querySetpointVoltage(PSCL_ClkID clk, PSCL_Setpoint setpoint,
    unsigned *voltage) 
{
    PSCL_Status status = PSCL_OK;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status = PSCL_NOT_INITIALIZED;
    }
    else if (clk == PSCL_CPU_CLK) {
        *voltage = _PSCL_SP_table_CPU[setpoint].volt;
    }
    else if (clk == PSCL_PER_CLK) {
        *voltage = _PSCL_SP_table_PER[setpoint].volt;
    }
    else {
        status = PSCL_INVALID_CLK;
    }

    /* last check if clk is in range: make sure setpoint ID is in range too */
    if (status == PSCL_OK) {
        if (setpoint > (_PSCL_numSP[clk] - 1)) {
            status = PSCL_INVALID_SETPOINT;
        }
    }

    return (status);
}

                                               
/*
 *  ======== PSCL_querySetpointMode ========
 *
 */
PSCL_Status PSCL_querySetpointMode(PSCL_ClkID clk, PSCL_Setpoint setpoint,
    unsigned *mode) {

    PSCL_Status status = PSCL_OK;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status = PSCL_NOT_INITIALIZED;
    }
    else if (clk == PSCL_CPU_CLK) {
        *mode = _PSCL_SP_table_CPU[setpoint].pllCfg->mode;
    }
    else if (clk == PSCL_PER_CLK) {
        *mode = _PSCL_SP_table_PER[setpoint].pllCfg->mode;
    }
    else {
        status = PSCL_INVALID_CLK;
    }

    /* last check if clk is in range: make sure setpoint ID is in range too */
    if (status == PSCL_OK) {
        if (setpoint > (_PSCL_numSP[clk] - 1)) {
            status = PSCL_INVALID_SETPOINT;
        }
    }

    return (status);
}
                                            

/*
 *  ======== PSCL_querySetpointTransition ========
 *
 */
PSCL_Status PSCL_querySetpointTransition(PSCL_ClkID clk, 
    PSCL_Setpoint fromSetpoint, PSCL_Setpoint toSetpoint, 
    unsigned * freqScalingLatency, unsigned * voltageScalingLatency) 
{
    PSCL_Status status = PSCL_OK;
    PMI_ClkDivCfg * fromDivCfg;
    PMI_ClkDivCfg * toDivCfg;
    PMI_PllCfg * fromPllCfg;
    PMI_PllCfg * toPllCfg;
    unsigned fromVolt;
    unsigned toVolt;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status =  PSCL_NOT_INITIALIZED;
    }

    /* check that clk ID is valid */
    else if ((clk != PSCL_CPU_CLK) && (clk != PSCL_PER_CLK)) {
        status = PSCL_INVALID_CLK;
    }

    /* check that setpoint IDs are in range */
    else if ( (fromSetpoint > (_PSCL_numSP[clk] - 1)) ||
        (toSetpoint   > (_PSCL_numSP[clk] - 1)) ) {
        status = PSCL_INVALID_SETPOINT;
    }

    else {

        /* initialize the latencies to zero */
        *freqScalingLatency = 0;
        *voltageScalingLatency = 0;

        /* if to/from is the same setpoint then done */
        if (fromSetpoint != toSetpoint) {

            /* setup pointers to PLL and clock divider config registers */
            if (clk == PSCL_CPU_CLK) {
                fromDivCfg = _PSCL_SP_table_CPU[fromSetpoint].divCfg;
                toDivCfg = _PSCL_SP_table_CPU[toSetpoint].divCfg;
                fromPllCfg = _PSCL_SP_table_CPU[fromSetpoint].pllCfg;
                toPllCfg = _PSCL_SP_table_CPU[toSetpoint].pllCfg;
                fromVolt = _PSCL_SP_table_CPU[fromSetpoint].volt;
                toVolt = _PSCL_SP_table_CPU[toSetpoint].volt;
            }
            else {
                fromDivCfg = _PSCL_SP_table_PER[fromSetpoint].divCfg;
                toDivCfg = _PSCL_SP_table_PER[toSetpoint].divCfg;
                fromPllCfg = _PSCL_SP_table_PER[fromSetpoint].pllCfg;
                toPllCfg = _PSCL_SP_table_PER[toSetpoint].pllCfg;
                fromVolt = _PSCL_SP_table_PER[fromSetpoint].volt;
                toVolt = _PSCL_SP_table_PER[toSetpoint].volt;
            }

            /* calculate latency to scale between frequency configurations */
            PMI_getFrequencyLatency(fromPllCfg, toPllCfg, fromDivCfg, toDivCfg,
                freqScalingLatency);
        
            /* add voltage ramp latency? */
            PMI_getVoltageLatency(fromVolt, toVolt, voltageScalingLatency);
        }
    }
                            
    return (status);
}


/*
 *  ======== PSCL_queryWillChangeVoltage ========
 *
 */
PSCL_Status PSCL_queryWillChangeVoltage(PSCL_ClkID clk, PSCL_Setpoint setpoint, 
    unsigned * change)
{
    PSCL_Status status = PSCL_OK;
    unsigned voltageSP;

    /* as default say NO */
    *change = FALSE;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status =  PSCL_NOT_INITIALIZED;
    }

    /* check if PSCL voltage scaling is enabled... */
    else if (PSCL_voltScalingSupported == TRUE) {

        /* look up voltage for the new setpoint */
        if (clk == PSCL_CPU_CLK) {
            voltageSP = _PSCL_SP_table_CPU[setpoint].volt;
        }
        else if (clk == PSCL_PER_CLK) {
            voltageSP = _PSCL_SP_table_PER[setpoint].volt;
        }
        else {
            status = PSCL_INVALID_CLK;
        }

        if ((status == PSCL_OK) && (voltageSP > _PSCL_currVolt)) {
            *change = TRUE;
        }
    }

    return (status);
}


/*
 *  ======== PSCL_getFrequency ========
 *
 */
PSCL_Status PSCL_getFrequency(PSCL_ClkID clk, unsigned * frequency) 
{
    PSCL_Status status = PSCL_OK;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status = PSCL_NOT_INITIALIZED;
    }
    else {
        *frequency = _PSCL_currFreq[clk];
    }
   
    return (status);
}


/*
 *  ======== PSCL_getMode ========
 *
 */
PSCL_Status PSCL_getMode(PSCL_ClkID clk, unsigned * mode) 
{
    PSCL_Status status = PSCL_OK;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status = PSCL_NOT_INITIALIZED;
    }
    else {
        *mode = _PSCL_currMode[clk];
    }
   
    return (status);
}


/*
 *  ======== PSCL_getVoltage ========
 */
PSCL_Status PSCL_getVoltage(unsigned * voltage)
{
    PSCL_Status status = PSCL_OK;

    /* make sure initialized OK */
    if (_PSCL_initialized == FALSE) {
        status = PSCL_NOT_INITIALIZED;
    }
    else {
        *voltage = _PSCL_currVolt;
    }
   
    return (status);
}


/*
 *  ======== _PSCL_checkInitParams ========
 *
 */
PSCL_Status _PSCL_checkInitParams(unsigned count, PSCL_ClkID * clks, 
    unsigned * initSetpoint) 
{
    PSCL_Status status = PSCL_OK;
    unsigned i;
   
    /* check that the number of clocks is in range */
    if (count > NUMBER_CLOCKS) {
        status = PSCL_INVALID_CLK;
    }

    else {

        /* check that each clk ID value is within range */
        for (i = 0; i < count; i++) {
            if ((clks[i] != PSCL_CPU_CLK) && (clks[i] != PSCL_PER_CLK)) {
                status = PSCL_INVALID_CLK;
            }
        }

        if (status == PSCL_OK) {

            /* check that each setpoint ID is within range for the clk */
            for (i = 0; i < count; i++) {
                if (initSetpoint[i] > (_PSCL_numSP[i] - 1)){
                    status = PSCL_INVALID_SETPOINT;
                }
            }
        }
    }

    return (status);

}


/*
 *  ======== _PSCL_scaleFreqVoltage ========
 *
 */
unsigned _PSCL_scaleFreqVoltage(PSCL_ClkID clk, PSCL_Setpoint newSetpoint, 
    int scaleVoltage, int waitForVoltScale) 
{
    PMI_ClkSourceCfg * newClkCfg = NULL;
    unsigned needsVoltScaling = 0;
    PSCL_Status status = PSCL_OK;
    unsigned retStatus = TRUE;
    PMI_ClkDivCfg * newDivCfg;
    PMI_PllCfg * newPllCfg;
    unsigned otherVoltReqd;
    PMI_Status pmiStatus;
    unsigned newVolt;
    unsigned newMode;
    PMI_Pll pll;
    unsigned newFreq;

    /* make sure clk ID is valid; get params for the change */
    if (clk == PSCL_CPU_CLK) {
        pll = PMI_CPU;
        newFreq = _PSCL_SP_table_CPU[newSetpoint].freq;
        newVolt = scaleVoltage ? _PSCL_SP_table_CPU[newSetpoint].volt : 
            _PSCL_currVolt;
        newMode = _PSCL_SP_table_CPU[newSetpoint].pllCfg->mode;
        newPllCfg = _PSCL_SP_table_CPU[newSetpoint].pllCfg;
        newDivCfg = _PSCL_SP_table_CPU[newSetpoint].divCfg;
        newClkCfg = _PSCL_SP_table_CPU[newSetpoint].clkCfg;
        otherVoltReqd = _PSCL_SP_table_PER[_PSCL_currSP[PSCL_PER_CLK]].volt;
    }
    else if (clk == PSCL_PER_CLK) {
        pll = PMI_PER;
        newFreq = _PSCL_SP_table_PER[newSetpoint].freq;
        newVolt = scaleVoltage ? _PSCL_SP_table_PER[newSetpoint].volt : 
            _PSCL_currVolt;
        newMode = _PSCL_SP_table_PER[newSetpoint].pllCfg->mode;
        newPllCfg = _PSCL_SP_table_PER[newSetpoint].pllCfg;
        newDivCfg = _PSCL_SP_table_PER[newSetpoint].divCfg;
        otherVoltReqd = _PSCL_SP_table_CPU[_PSCL_currSP[PSCL_CPU_CLK]].volt;
    }
    else {
        retStatus = FALSE;
    }

    if (retStatus == TRUE) {

        /* adjust new voltage to be the minimum *compatible* voltage */
        if (newVolt < otherVoltReqd) {
            newVolt = otherVoltReqd;
        }
   
        /* set 'need volt scale flag' if: supported AND voltage change */
        needsVoltScaling = (PSCL_voltScalingSupported != 0) && 
            (newVolt != _PSCL_currVolt);  
   
        /* if increasing voltage: do it now... */
        if (needsVoltScaling && (newVolt > _PSCL_currVolt)) {
            pmiStatus = PMI_setVoltage(newVolt, TRUE);
            if (pmiStatus != PMI_OK) {
                status = PSCL_CANNOT_CHANGE_VOLTAGE;
                retStatus = FALSE;
            }
        }

        /* continue only if voltage scaled OK... */
        if (status == PSCL_OK) {

            /* now scale the frequency... */
            PMI_scaleFrequency(pll, newPllCfg, newDivCfg, newClkCfg);

            /* if decreasing voltage: do it now... */
            if (needsVoltScaling && (newVolt < _PSCL_currVolt)) {
                pmiStatus = PMI_setVoltage(newVolt, waitForVoltScale);
                if (pmiStatus != PMI_OK) {
                    status = PSCL_CANNOT_CHANGE_VOLTAGE;
                    retStatus = FALSE;
                }
            }
        }   

        /* if here, everything OK, update globals */
        if (status == PSCL_OK) {
            _PSCL_currFreq[clk] = newFreq;
            _PSCL_currMode[clk] = newMode;
            if (needsVoltScaling) {
                _PSCL_currVolt = newVolt;
            }
        }
    }

    return(retStatus);
}
