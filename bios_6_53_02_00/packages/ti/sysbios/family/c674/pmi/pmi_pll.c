/*
 *  ======== pmi_pll.c ========
 *
 *  PMI functions for C6748 PLL control.
 *
 */

#include <ti/sysbios/family/c674/pmi.h>

extern cregister volatile unsigned int TSCL;

/* max possible PLL lock to bypass latency: 4 OSCIN @ 12MHz = 1.3 usec */
const unsigned _PMI_maxLockToBypassLatency = 2; 

/* max PLL lock latency depends on OSCIN; defined in voltage control lib */
extern const unsigned _PMI_maxLockLatency;

void PMI_goRelockPLL1(unsigned pllbase, unsigned pllm, unsigned postdiv);

#pragma CODE_SECTION(PMI_bypassPLL, ".ti_sysbios_family_c674_pmi_onchip:slp");
#pragma CODE_SECTION(PMI_enablePLL, ".ti_sysbios_family_c674_pmi_onchip:slp");

/*
 *  ======== PMI_bypassPLL ========
 */
PMI_Status PMI_bypassPLL(PMI_Pll pll) 
{
    unsigned pllbase;
    unsigned cpuCycles;
    unsigned postdiv = 1;
    unsigned prediv = 1;
    unsigned mult;

    /* determine appropriate PLL base address */
    pllbase = pll == PMI_CPU  ? BASE_PLL0 : BASE_PLL1;

    /* only do something if PLL is not already in bypass ... */
    if ((REG(pllbase + PLLCTL) & PLL_PLLEN_BIT) != 0) {

        /* clear PLLEN bit in PLLCTL to bypass PLL */
        REG(pllbase + PLLCTL) &= ~PLL_PLLEN_BIT;

        /* compute number CPU cycles to wait (for 4 OSCIN/CLKIN cycles) */
        mult = (REG(pllbase + PLLM) & PLL_RATIO_MASK) + 1;
        if ((REG(pllbase + PREDIV) & PLL_ENABLE_MASK) != 0) {
            prediv = (REG(pllbase + PREDIV) & PLL_RATIO_MASK) + 1;
        }
        if ((REG(pllbase + POSTDIV) & PLL_ENABLE_MASK) != 0) {
            postdiv = (REG(pllbase + POSTDIV) & PLL_RATIO_MASK) + 1;
        }
        cpuCycles = ((4 * mult) / postdiv) / prediv;

        /* now, wait for bypass transition to complete... */
        PMI_waitCpuCycles(cpuCycles);
    }

    return(PMI_OK);
}


/*
 *  ======== PMI_calcWaitBypass ========
 */
unsigned PMI_calcWaitBypass(PMI_Pll pll) 
{
    unsigned pllbase;
    unsigned cpuCycles;
    unsigned postdiv = 1;
    unsigned prediv = 1;
    unsigned mult;

    /* determine appropriate PLL base address */
    pllbase = pll == PMI_CPU  ? BASE_PLL0 : BASE_PLL1;

    /* compute number CPU cycles to wait (for 4 OSCIN/CLKIN cycles) */
    mult = (REG(pllbase + PLLM) & PLL_RATIO_MASK) + 1;
    if ((REG(pllbase + PREDIV) & PLL_ENABLE_MASK) != 0) {
        prediv = (REG(pllbase + PREDIV) & PLL_RATIO_MASK) + 1;
    }
    if ((REG(pllbase + POSTDIV) & PLL_ENABLE_MASK) != 0) {
        postdiv = (REG(pllbase + POSTDIV) & PLL_RATIO_MASK) + 1;
    }
    cpuCycles = ((4 * mult) / postdiv) / prediv;

    return(cpuCycles);
}


/*
 *  ======== PMI_configurePLL ========
 */
PMI_Status PMI_configurePLL(PMI_Pll pll, PMI_PllCfg * cfg) 
{
    unsigned pllbase;

    /* determine appropriate PLL base address */
    pllbase = pll == PMI_CPU  ? BASE_PLL0 : BASE_PLL1;

    /* clear the PLLRST bit to reset PLL */
    REG(pllbase + PLLCTL) &= ~PLL_PLLRST_BIT;

    /* clear PLLDIS bit to enable toggling */
    REG(pllbase + PLLCTL) &= ~PLL_PLLDIS_BIT;

    /* set pre divider value */
    REG(pllbase + PREDIV) = cfg->prediv;

    /* set multiplier value */
    REG(pllbase + PLLM) = cfg->pllm;

    /* set post divider value */
    REG(pllbase + POSTDIV) = cfg->postdiv;

    return(PMI_OK);
}


/*
 *  ======== PMI_configureSources ========
 */
PMI_Status PMI_configureSources(PMI_Pll pll, PMI_ClkSourceCfg * clkCfg) 
{
    PMI_Status status = PMI_OK;
    unsigned pllbase = BASE_PLL0;
    unsigned curState;

    /* only applicable for PLL0 */
    if (pll == PMI_CPU) {

        /* CLKMODE */
        curState = REG(pllbase + PLLCTL) & PLL_CLKMODE_BIT;
        if (curState != clkCfg->clkmode) {

            /* toggle the CLKMODE bit */
            if (curState == 0) {
                REG(pllbase + PLLCTL) |= PLL_CLKMODE_BIT;
            }
            else {
                REG(pllbase + PLLCTL) &= ~PLL_CLKMODE_BIT;
            }
        }

        /* EXTCLKSRC */
        curState = REG(pllbase + PLLCTL) & PLL_EXTCLKSRC_BIT;
        if (curState != clkCfg->bypassClksrc) {

            /* toggle the EXTCLKSRC bit */
            if (curState == 0) {
                REG(pllbase + PLLCTL) |= PLL_EXTCLKSRC_BIT;
            }
            else {
                REG(pllbase + PLLCTL) &= ~PLL_EXTCLKSRC_BIT;
            }
        }

        /* EMA_CLKSRC */
        curState = REG(CFGCHIP3) & EMA_CLKSRC_BIT;
        if (curState != clkCfg->emifaClksrc) {

            /* toggle the EMA_CLKSRC_BIT */
            if (curState == 0) {
                REG(CFGCHIP3) |= EMA_CLKSRC_BIT;
            }
            else {
                REG(CFGCHIP3) &= ~EMA_CLKSRC_BIT;
            }

            /* now enable or disable the DIV4.5 divider */
            if (curState != 0) {                 /* new select is SYSCLK3 */
                REG(CFGCHIP3) &= ~DIV45PENA_BIT; /* disable DIV4.5 */ 
            }
            else {                               /* new select is DIV4.5 */
                REG(CFGCHIP3) |= DIV45PENA_BIT;  /* enable DIV4.5 */ 
            }
        }
    }
    else {
        status = PMI_FAIL;
    }

    return (status);
}


/*
 *  ======== PMI_enablePLL ========
 */
PMI_Status PMI_enablePLL(PMI_Pll pll) 
{
    unsigned pllbase;

    /* determine appropriate PLL base address */
    pllbase = pll == PMI_CPU  ? BASE_PLL0 : BASE_PLL1;

    /* set PLLEN bit in PLLCTL */
    REG(pllbase + PLLCTL) |= PLL_PLLEN_BIT;

    return(PMI_OK);
}


/*
 *  ======== PMI_getStatePLL ========
 */
PMI_Status PMI_getStatePLL(PMI_Pll pll, PMI_PllState * state) 
{
    unsigned pllbase;

    /* determine appropriate PLL base address */
    pllbase = pll == PMI_CPU  ? BASE_PLL0 : BASE_PLL1;

    state->pllctl = REG(pllbase + PLLCTL);
    state->prediv = REG(pllbase + PREDIV);
    state->postdiv = REG(pllbase + POSTDIV);
    state->pllm = REG(pllbase + PLLM);
    state->pllstat = REG(pllbase + PLLSTAT);
    state->plldiv1 = REG(pllbase + PLLDIV1);
    state->plldiv2 = REG(pllbase + PLLDIV2);
    state->plldiv3 = REG(pllbase + PLLDIV3);

    if (pll == PMI_CPU) {
        state->plldiv4 = REG(pllbase + PLLDIV4);
        state->plldiv5 = REG(pllbase + PLLDIV5);
        state->plldiv6 = REG(pllbase + PLLDIV6);
        state->plldiv7 = REG(pllbase + PLLDIV7);
    }

    return(PMI_OK);
}


/*
 *  ======== PMI_getFrequencyLatency ========
 */
PMI_Status PMI_getFrequencyLatency(PMI_PllCfg * fromPllCfg, 
    PMI_PllCfg * toPllCfg, PMI_ClkDivCfg * fromDivCfg, 
    PMI_ClkDivCfg * toDivCfg, unsigned * latency)
{
    unsigned newLock = 0;
    unsigned lat = 0;

    /* add lock latency? */
    if (toPllCfg->mode == PMI_LOCK) {
        if ( (fromPllCfg->prediv != toPllCfg->prediv) ||
             (fromPllCfg->postdiv != toPllCfg->postdiv) ||
             (fromPllCfg->pllm != toPllCfg->pllm)) {
            lat += _PMI_maxLockLatency;
            newLock = 1;
        }
    }

    /* add lock to bypass latency? */
    if ( ( (fromPllCfg->mode == PMI_LOCK) &&
           (toPllCfg->mode == PMI_BYPASS) ) ||
         ( (fromPllCfg->mode == PMI_LOCK) &&
           (newLock == 1) ) ) {
        lat += _PMI_maxLockToBypassLatency;
    }

    *latency = lat;

    return(PMI_OK);

}


/*
 *  ======== PMI_initPLL ========
 */
PMI_Status PMI_initPLL(PMI_Pll pll) 
{
    unsigned pllbase;
    unsigned chipconfig;
    unsigned unlock;

    /* determine appropriate PLL addresses */
    pllbase = pll == PMI_CPU  ? BASE_PLL0 : BASE_PLL1;
    chipconfig = pll == PMI_CPU  ? CFGCHIP0 : CFGCHIP3;
    unlock = pll == PMI_CPU  ? PLL_MASTER_LOCK_BIT : PLL1_MASTER_LOCK_BIT;
 
    /* ensure PLL registers are unlocked and accessible */
    REG(chipconfig) &= ~unlock;

    /* clear PLLENSRC bit in PLLCTL */
    REG(pllbase + PLLCTL) &= ~PLL_PLLENSRC_BIT;

    return(PMI_OK);
}


/*
 *  ======== PMI_lockPLL ========
 */
PMI_Status PMI_lockPLL(PMI_Pll pll, unsigned lockCycles) 
{
    unsigned pllbase;

    /* determine appropriate PLL base address */
    pllbase = pll == PMI_CPU  ? BASE_PLL0 : BASE_PLL1;

    /* Note - per spec, PLL reset must be asserted for 125nsec; at the fastest
       bypass frequency (50MHz) this would correspond to max of 7 CPU cycles;
       these cycles have already been consumed between time of reset assertion
       in PMI_configurePLL, and getting here, so no additional delay cycles
       are added. */

    /* set the PLLRST bit to release PLL from reset */
    REG(pllbase + PLLCTL) |= PLL_PLLRST_BIT;

    /* wait for PLL to lock */
    PMI_waitCpuCycles(lockCycles);

    return (PMI_OK);
}


/*
 *  ======== PMI_powerDownPLL ========
 */
PMI_Status PMI_powerDownPLL(PMI_Pll pll) 
{
    unsigned pllbase;

    /* determine appropriate PLL base address */
    pllbase = pll == PMI_CPU  ? BASE_PLL0 : BASE_PLL1;

    /* assert PLLPWRDN */
    REG(pllbase + PLLCTL) |= PLL_PLLPWRDN_BIT;

    return (PMI_OK);
}


/*
 *  ======== PMI_powerUpPLL ========
 */
PMI_Status PMI_powerUpPLL(PMI_Pll pll, PMI_ClkSourceCfg * clkCfg) 
{
    unsigned pllbase;

    /* determine appropriate PLL base address */
    pllbase = pll == PMI_CPU  ? BASE_PLL0 : BASE_PLL1;

    /* set CLKMODE (PLL0 only) */
    if (pll == PMI_CPU) {
        if (clkCfg->clkmode == 0) {
            REG(pllbase + PLLCTL) &= ~PLL_CLKMODE_BIT;
        }
        else {
            REG(pllbase + PLLCTL) |= PLL_CLKMODE_BIT;
        }
    }
  
    /* bypass PLL */
    PMI_bypassPLL(pll);

    /* clear the PLLRST bit to reset PLL */
    REG(pllbase + PLLCTL) &= ~PLL_PLLRST_BIT;

    /* disable PLL output */
    REG(pllbase + PLLCTL) |= PLL_PLLDIS_BIT;

    /* de-assert PLLPWRDN */
    REG(pllbase + PLLCTL) &= ~PLL_PLLPWRDN_BIT;

    /* clear PLLDIS bit to enable toggling */
    REG(pllbase + PLLCTL) &= ~PLL_PLLDIS_BIT;

    return (PMI_OK);
}


/*
 *  ======== PMI_setDividersPLL ========
 */
PMI_Status PMI_setDividersPLL(PMI_Pll pll, PMI_ClkDivCfg * cfg) 
{
    unsigned pllbase;
    unsigned status;
    unsigned div1;
    unsigned div;

    /* determine appropriate PLL base address */
    pllbase = pll == PMI_CPU  ? BASE_PLL0 : BASE_PLL1;

    /* wait for the GOSTAT bit to clear before changing dividers */
    do
        status = REG(pllbase + PLLSTAT) & PLL_GOSTAT_BIT;
    while(status != 0);

    /* PLL0 dividers */
    if (pll == PMI_CPU) {

        REG(pllbase + PLLDIV1) = cfg->div1;                     /* div1 */
        div1 = cfg->div1 & ~SYSCLK_ENABLE_BIT;

        div = ((div1 + 1) * 2) - 1;
        REG(pllbase + PLLDIV2) = div | SYSCLK_ENABLE_BIT;       /* div2 */

        REG(pllbase + PLLDIV3) = cfg->div3;                     /* div3 */

        div = ((div1 + 1) * 4) - 1;
        REG(pllbase + PLLDIV4) = div | SYSCLK_ENABLE_BIT;       /* div4 */

        REG(pllbase + PLLDIV6) = cfg->div1;                     /* div6 */

        REG(pllbase + PLLDIV7) = cfg->div7;                     /* div7 */
    }

    /* PLL1 dividers */
    else {

        REG(pllbase + PLLDIV1) = cfg->div1;                     /* div1 */

        REG(pllbase + PLLDIV2) = cfg->div2;                     /* div2 */

        REG(pllbase + PLLDIV3) = cfg->div3;                     /* div3 */
    }

    asm(" .global PMI_goDiv");
    asm("PMI_goDiv:");

    /* set GOSET to initiate new divider transition */
    REG(pllbase + PLLCMD) |= PLL_GOSET_BIT;

    /* wait for the GOSTAT bit to clear indicating transition is complete */
    do
        status = REG(pllbase + PLLSTAT) & PLL_GOSTAT_BIT;
    while(status != 0);

    return(PMI_OK);
}

/*
 *  ======== PMI_scaleFrequency ========
 */
PMI_Status PMI_scaleFrequency(PMI_Pll pll, PMI_PllCfg * pllCfg,
    PMI_ClkDivCfg * divCfg, PMI_ClkSourceCfg * clkCfg)
{
    PMI_Status status = PMI_OK;
    unsigned poweredUpPLL = 0;
    unsigned pwrState;
    unsigned pllbase;
    unsigned postdiv;
    unsigned prediv;
    unsigned pllm;

    /* determine appropriate PLL base address */
    pllbase = pll == PMI_CPU  ? BASE_PLL0 : BASE_PLL1;

    /* check if need to power up the PLL */
    pwrState = REG(pllbase + PLLCTL) & PLL_PLLPWRDN_BIT;
    if ((pwrState != 0) && (pllCfg->powerDown == 0)) {
        PMI_powerUpPLL(pll, clkCfg);
        poweredUpPLL = 1;
    }

    /* check/set clock sources */
    if (pll == PMI_CPU) {
        PMI_configureSources(pll, clkCfg);
    }

    /* check if new PLL config is BYPASS... */
    if (pllCfg->mode == PMI_BYPASS) {

        /* yes, put the PLL into BYPASS */
        PMI_bypassPLL(pll);

        /* check if should power down the PLL */
        if (pllCfg->powerDown != 0) {
            PMI_powerDownPLL(pll);
        } 
    }

    /* if new mode is LOCKED... */
    else {

        /* get the current pllm and postdiv from the PLL */
        pllm = REG(pllbase + PLLM);
        postdiv = REG(pllbase + POSTDIV);

        /* check if need to re-configure and re-lock the PLL... */
        if (pll == PMI_PER) {
            if ( (postdiv != pllCfg->postdiv) ||
                 (pllm != pllCfg->pllm) || 
                 (poweredUpPLL == 1) ) {

                /* 
                   For PLL1 must put DDR into self-refresh and must not make ANY
                   DDR accesses while PLL is bypassed.  Go thru special 
                   function call mechanism to ensure this... 
                 */
                PMI_goRelockPLL1(pllbase, pllCfg->pllm, pllCfg->postdiv);
            }
        }

        else {
            prediv = REG(pllbase + PREDIV);
            if ( (postdiv != pllCfg->postdiv) ||
                 (prediv != pllCfg->prediv) || 
                 (pllm != pllCfg->pllm) || 
                 (poweredUpPLL == 1) ) {

                /* bypass, re-configure and re-lock the PLL */
                PMI_bypassPLL(pll);
                PMI_configurePLL(pll, pllCfg);
                PMI_lockPLL(pll, pllCfg->lockCycles);
            }
        }

        /* 
         *  Will need to re-enable the PLL if:
         *    - just re-locked above
         *    - if didn't need to do a re-lock, but coming out of BYPASS
         *
         *  Don't need to re-enable the PLL if going from locked to locked
         *  mode, with no change to prediv, postdiv, or PLLM.
         *
         *  Since re-enabling the PLL is just asserting the enable bit in the
         *  PLL controller register, with no wait cycles needed, it is most
         *  efficient to simply re-enable always, and not add checking logic.
         */
        PMI_enablePLL(pll);
    }

    /* now, update the sysclk dividers */
    if (status == PMI_OK) {
        PMI_setDividersPLL(pll, divCfg);
    }

    return(PMI_OK);
}
