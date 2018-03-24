/*
 *  ======== pscl_config_null.c ========
 *
 *  Minimal (null) PSCL configuration library.
 *
 */

#include <stdlib.h>

#include <ti/sysbios/family/c674/pmi.h>
#include <ti/sysbios/family/c674/pscl/_pscl.h>

#define NUMBER_PER_SETPOINTS    1 
#define NUMBER_CPU_SETPOINTS    1 

unsigned _PSCL_numSP[NUMBER_CLOCKS] = {NUMBER_CPU_SETPOINTS, 
    NUMBER_PER_SETPOINTS};

const unsigned PSCL_voltScalingSupported = FALSE;

// ******************** PLL0 setpoint configuration ********************

PMI_PllCfg PSCL_pllCfgTableCPU[NUMBER_CPU_SETPOINTS] = {
//  pllm  postdiv prediv    mode       lockCycles   powerDown      SYSCLK1 
//  ----  ------- ------  ---------    ----------  -----------    --------- 
   {0x18, 0x8001, 0x8000, PMI_LOCK,      0x190,         0   }, //  300 MHz
};

PMI_ClkDivCfg PSCL_divCfgTableCPU[NUMBER_CPU_SETPOINTS] = {
//    div1    div3    div7  
//   ------  ------  ------  
   { 0x8000, 0x800B, 0x8005 },
};

PMI_ClkSourceCfg clkCfg = {
//        clkmode             bypass clksrc         EMIFA clksrc
//    -----------------     ----------------     ------------------
        CLKMODE_OSCIN,      EXTCLKSRC_OSCIN,     EMA_CLKSRC_SYSCLK3
};

_PSCL_SP_Info _PSCL_SP_table_CPU[NUMBER_CPU_SETPOINTS] = {
//        PLL config             divider config       clk cfg   freq    voltage
//  -----------------------  -----------------------  ------- --------   ------
   {&PSCL_pllCfgTableCPU[0], &PSCL_divCfgTableCPU[0], &clkCfg, 300000,   1200 },
};


// ******************** PLL1 setpoint configuration ********************

PMI_PllCfg PSCL_pllCfgTablePER[NUMBER_PER_SETPOINTS] = {
//  pllm  postdiv prediv    mode       lockCycles   powerDown      SYSCLK1 
//  ----  ------- ------  ---------    ----------  -----------    --------- 
   {0x18, 0x8001, 0x8000, PMI_LOCK,      0x190,         0   }, //  300 MHz
};

PMI_ClkDivCfg PSCL_divCfgTablePER[NUMBER_PER_SETPOINTS] = {
//    div1    div2    div3  
//   ------  ------  ------  
   { 0x8000, 0x8001, 0x8002  },
};

_PSCL_SP_Info _PSCL_SP_table_PER[NUMBER_PER_SETPOINTS] = {
//        PLL config             divider config       clk cfg   freq  voltage
//  -----------------------  -----------------------  -------  ------ -------
   {&PSCL_pllCfgTablePER[0], &PSCL_divCfgTablePER[0],   NULL,  150000, 1000 },
};


