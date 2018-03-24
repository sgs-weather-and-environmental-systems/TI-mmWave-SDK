/*
 *  ======== pmi_ms.c ========
 *
 *  PMI functions for getting and setting a C6748 IP module's LPSC state.
 *
 */

#include <ti/sysbios/family/c674/pmi.h>

#pragma CODE_SECTION(PMI_getModuleState, ".ti_sysbios_family_c674_pmi_onchip");
#pragma CODE_SECTION(PMI_setModuleState, ".ti_sysbios_family_c674_pmi_onchip");

/*
 *  ======== PMI_getModuleState ========
 */
PMI_Status PMI_getModuleState(unsigned pd, unsigned psc, unsigned lpsc, unsigned *state)
{
    PMI_Status status = PMI_OK;
    unsigned mdstat_base_reg;
    unsigned mdstat_reg;
    unsigned ptstat_reg;
    unsigned go_bit;

    /* determine appropriate registers and bits */
    mdstat_base_reg = psc == 0 ? MDSTAT_BASE_PSC0 : MDSTAT_BASE_PSC1;
    mdstat_reg = mdstat_base_reg + (lpsc * 4);
    ptstat_reg = psc == 0 ? PTSTAT_REG_PSC0 : PTSTAT_REG_PSC1;
    go_bit = pd == 0 ? GO_BIT_PD0 : GO_BIT_PD1;

    /* check that no transitions are still in progress */
    if ((REG(ptstat_reg) & go_bit) != 0) {
        status = PMI_BUSY;
    }

    /* retrieve, mask, return the module state */
    else {
        *state = REG(mdstat_reg) & MODULE_STATE_MASK;
    }

    return(status);
}

/*
 *  ======== PMI_setModuleState ========
 */
PMI_Status PMI_setModuleState(unsigned pd, unsigned psc, unsigned lpsc, 
unsigned state)
{
    PMI_Status status = PMI_OK;
    unsigned mdctl_base_reg;
    unsigned mdctl_reg;
    unsigned ptstat_reg;
    unsigned ptcmd_reg;
    unsigned go_bit;

    /* determine appropriate registers and bits */
    go_bit = pd == 0 ? GO_BIT_PD0 : GO_BIT_PD1;
    ptcmd_reg = psc == 0 ? PTCMD_REG_PSC0 : PTCMD_REG_PSC1;
    ptstat_reg = psc == 0 ? PTSTAT_REG_PSC0 : PTSTAT_REG_PSC1;
    mdctl_base_reg = psc == 0 ? MDCTL_BASE_PSC0 : MDCTL_BASE_PSC1;
    mdctl_reg = mdctl_base_reg + (lpsc * 4);

    /* check that no transitions are still in progress */
    if ((REG(ptstat_reg) & go_bit) != 0) {
        status = PMI_BUSY;
    }

    /* else, set the NEXT module state */
    else {
        /* set the next state field */
        REG(mdctl_reg) = state;

        /* initiate the state transition */
        REG(ptcmd_reg) |= go_bit;
    }

    return(status);
}

