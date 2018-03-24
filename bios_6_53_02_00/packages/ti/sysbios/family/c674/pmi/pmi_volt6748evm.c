/*
 *  ======== pmi_volt6748evm.c ========
 *
 *  PMI functions for voltage control on the C6748 EVM.
 *
 */

#include <ti/sysbios/family/c674/pmi.h>
#include <pmi_i2cdefs.h>
#include <pmi_i2cfxns.h>
#include <pmi_defs65070.h>

/* ESTIMATED max latencies (in usec) for voltage up/down ramping.
   These values may change after formal characterization! */
const unsigned _PMI_maxVoltageUpLatency = 451;
const unsigned _PMI_maxVoltageDownLatency = 2000;

/* max PLL lock latency: when PREDIV=1, MULT=17, w/24MHz input */
const unsigned _PMI_maxLockLatency = 21;   /* in usec */

unsigned _PMI_readBackDelay = 0;  /* opt. cycles to delay when change DCDC3 */

#pragma CODE_SECTION(PMI_getVoltage, ".ti_sysbios_family_c674_pmi_onchip:slp");
#pragma CODE_SECTION(PMI_setVoltage, ".ti_sysbios_family_c674_pmi_onchip:slp");


/*
 *  ======== PMI_getVoltage ========
 */
PMI_Status PMI_getVoltage(unsigned * voltage) 
{
    PMI_Status status = PMI_OK;
    unsigned data;

    PMI_readI2C(PMIC_ADDR, DEFDCDC3_REG, &data);

    /* look up the voltage corresponding to the PMIC voltage code */
    switch (data) {

        case SP_1_3_VOLT:
            *voltage = 1300;    /* 1300 mV */
            break;

        case SP_1_2_VOLT:
            *voltage = 1200;    /* 1200 mV */
            break;

        case SP_1_1_VOLT:
            *voltage = 1100;    /* 1100 mV */
            break;

        case SP_1_0_VOLT:
            *voltage = 1000;    /* 1000 mV */
            break;

        default:
            status = PMI_FAIL;
    }

    return (status);
}


/*
 *  ======== PMI_getVoltageLatency ========
 */
PMI_Status PMI_getVoltageLatency(unsigned fromVolt, unsigned toVolt,
    unsigned * latency) 
{
    if (fromVolt > toVolt) {
        *latency = _PMI_maxVoltageDownLatency;
    }
    else if (fromVolt < toVolt) {
        *latency = _PMI_maxVoltageUpLatency;
    }
    else {
        *latency = 0;
    }

    return (PMI_OK);
}


/*
 *  ======== PMI_initVoltageControl ========
 */
PMI_Status PMI_initVoltageControl(void)
{
    unsigned state;
    unsigned mask;
    unsigned temp;

    /* drive BUFF_OEn low to enable I2C clock on Beta EVM boards and later... */
    /*  a. setup PINMUX to select GPIO function */
    temp = REG(PINMUX6);
    REG(PINMUX6) = (temp & SELECT_6_7_4_MASK) | SELECT_GP2_FXN;

    /*  b. make sure GPIO module is enabled */
    PMI_getModuleState(0, GPIO_PSC, GPIO_LPSC, &state);
    if (state != GPIO_LPSC_ENABLE_STATE) {
        PMI_setModuleState(0, GPIO_PSC, GPIO_LPSC, GPIO_LPSC_ENABLE_STATE);
    }

    /*  c. setup GPIO direction and data register to drive GP2[6] low */ 
    REG(GPIO_DIR23) &= ~GPIO_BIT6;
    REG(GPIO_CLR_DATA23) |= GPIO_BIT6;

    /* now initialize I2C bus control... */
    PMI_initI2C();

    /* setup PMIC's  max SLEW rate for voltage transitions */
    PMI_writeI2C(PMIC_ADDR, DEFSLEW_REG, DEFSLEW_VALUE);

    /* setup PMIC's PGOODMASK to avoid resets during core voltage scaling */
    PMI_readI2C(PMIC_ADDR, PGOODMASK_REG, &mask);
    mask &= ~PGOODMASK_BITS;
    PMI_writeI2C(PMIC_ADDR, PGOODMASK_REG, mask);

    return (PMI_OK);
}


/*
 *  ======== PMI_setVoltage ========
 */
PMI_Status PMI_setVoltage(unsigned voltage, unsigned wait) 
{
    PMI_Status status = PMI_OK;
    unsigned voltageCode;
    unsigned data;

    /* lookup the voltage code corresponding to the new voltage */
    switch (voltage) {

        case 1300:
            voltageCode = SP_1_3_VOLT;  /* 1300 mV */
            break;

        case 1200:
            voltageCode = SP_1_2_VOLT;  /* 1200 mV */
            break;

        case 1100:
            voltageCode = SP_1_1_VOLT;  /* 1200 mV */
            break;

        case 1000:
            voltageCode = SP_1_0_VOLT;  /* 1200 mV */
            break;

        default:
            status = PMI_FAIL;
    }

    /* command the PMIC to the new voltage */
    if (status == PMI_OK) {

        /* write the new voltage code */
        PMI_writeI2C(PMIC_ADDR, DEFDCDC3_REG, voltageCode);

        /* number of cycles to wait after initiating change to DCDC3 */
        PMI_waitCpuCycles(_PMI_readBackDelay);

        /* read back the voltage code to confirm new setting */
        PMI_readI2C(PMIC_ADDR, DEFDCDC3_REG, &data);

        if (data != voltageCode) {
            status = PMI_FAIL;
        }
    }

    /* optionally wait for voltage transition to complete */
    if ((status == PMI_OK) && (wait != 0)) {
    
        /* wait until power good is asserted by the PMIC */
        do
        {
            PMI_readI2C(PMIC_ADDR, PGOOD_REG, &data);
        }
        while ((data & PGOOD_BIT) == 0);

    }

    return (status);
}
