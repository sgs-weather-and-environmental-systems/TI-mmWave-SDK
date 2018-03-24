/*
 *  ======== _pscl.h ========
 *
 *  Power Scaling Library (PSCL) internal definitions.
 *
 */

#ifndef _PSCL_
#define _PSCL_

#include <ti/sysbios/family/c674/pscl.h>
#include <ti/sysbios/family/c674/pscl/pscl_clkcfg.h>

#ifdef __cplusplus
extern "C" {
#endif

extern unsigned _PSCL_numSP[];
extern PSCL_Setpoint _PSCL_currSP[];
extern unsigned _PSCL_currVolt;
extern unsigned _PSCL_currFreq[];
extern unsigned _PSCL_currMode[];

extern const unsigned _PSCL_maxLockToBypassLatency;
extern const unsigned _PSCL_maxLockLatency;
extern const unsigned _PSCL_maxClkDividerLatency;
extern const unsigned _PSCL_maxVoltageUpLatency;
extern const unsigned _PSCL_maxVoltageDownLatency;

typedef struct {
    PMI_PllCfg *pllCfg;
    PMI_ClkDivCfg *divCfg;
    PMI_ClkSourceCfg *clkCfg;
    unsigned freq;
    unsigned volt;
} _PSCL_SP_Info;

extern _PSCL_SP_Info _PSCL_SP_table_CPU[];
extern _PSCL_SP_Info _PSCL_SP_table_PER[];

#define NUMBER_CLOCKS   2

/*
 *  ======== _PSCL_checkInitParams ========
 */
PSCL_Status _PSCL_checkInitParams(unsigned count, PSCL_ClkID * clks,
    unsigned * initSetpoint);

/*
 *  ======== _PSCL_scaleFreqVoltage ========
 */
unsigned _PSCL_scaleFreqVoltage(PSCL_ClkID clk, PSCL_Setpoint newSetpoint,
    int scaleVoltage, int waitForVoltScale);


#ifdef __cplusplus
}
#endif

#endif /* _PSCL_ */

