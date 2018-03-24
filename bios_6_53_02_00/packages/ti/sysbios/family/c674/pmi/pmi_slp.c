/* 
 *  ======== pmi_slp.c ======== 
 * 
 *  PMI functions for sleep and wake of the C6748 DSP.
 *
 */

#include <stdlib.h>
#include <ti/sysbios/family/c674/pmi.h>
#include <pmi_defs6748.h>

extern void _PMI_doIdle(void);

#define SLEEP_VOLTS     1000    /* V = 1000 mV in SLEEP */
#define DEEPSLEEP_VOLTS 1000    /* V = 1000 mV in DEEPSLEEP */

#define L1PCFG       0x01840020 /* cache defines */
#define L1PCC        0x01840024
#define L1DCFG       0x01840040
#define L1DCC        0x01840044
#define L2CFG        0x01840000
#define L1_FREEZE    0x1
#define L1_POPER     0x10000
#define L2_MODEMASK  0x7
#define L2_FREEZE    0x8
#define NOACTION     0xffffffff

#pragma CODE_SECTION(PMI_sleepCPU, ".ti_sysbios_family_c674_pmi_onchip:slp");

/*
 *  ======== PMI_sleepCPU ========
 */
PMI_Status PMI_sleepCPU(PMI_Sleep state, unsigned scaleVoltage, 
    unsigned sleepArg)
{
    unsigned sleepVolts = SLEEP_VOLTS;  /* default: sleep voltage */
    unsigned bypassPLL0 = 1;            /* default: bypass PLL0 */
    unsigned bypassPLL1 = 1;            /* default: bypass PLL1 */
    PMI_SleepOverride * override;
    unsigned poweredDownPLL0 = 0;
    unsigned poweredDownPLL1 = 0;
    PMI_Status status = PMI_OK;
    unsigned gatedClockDDR = 0;
    unsigned bypassedPLL0 = 0;
    unsigned bypassedPLL1 = 0;
    unsigned waitBypassPLL0 = 0;
    unsigned waitBypassPLL1 = 0;
    unsigned entryDDRCTL = 0;
    unsigned sleepcount = 0;
    unsigned frozeL1P = NOACTION;
    unsigned frozeL1D = NOACTION;
    unsigned frozeL2 = NOACTION;
    unsigned previousL2;
    unsigned entryVolts;
    unsigned lpscState;
    unsigned entryPDC;
    unsigned awake;

    /* stash entry value of PDCCMD register */
    entryPDC = REG(PDCCMD_REG);
    REG(PDCCMD_REG) = PDCCMD_STANDBY;

    if (state == PMI_STANDBY) {
        _PMI_doIdle();
    }
    else if (state == PMI_SLEEP) {

        /* check for override via sleepArg */
        if (sleepArg != NULL) {
            override = (PMI_SleepOverride *) sleepArg;
            sleepVolts = override->sleepVoltage;
            bypassPLL0 = override->bypassedPLLs & PMI_PLL0;
            bypassPLL1 = override->bypassedPLLs & PMI_PLL1;
        }

        /* get and stash the current voltage */
        if (scaleVoltage != 0) {
            PMI_getVoltage(&entryVolts);
        }

        /* calculate cycles to wait for PLL bypass */
        if (bypassPLL0) {
            waitBypassPLL0 = PMI_calcWaitBypass(PMI_CPU);
        }
        if (bypassPLL1) {
            waitBypassPLL1 = PMI_calcWaitBypass(PMI_PER);
        }

        /* if going to bypass PLL1 freeze the caches... */
        if (bypassPLL1) {
            if (REG(L1PCFG) != 0) {
                asm(" nop 2");
                REG(L1PCC) = L1_FREEZE;
                frozeL1P = REG(L1PCC);
            }
            if (REG(L1DCFG) != 0) {
                asm(" nop 2");
                REG(L1DCC) = L1_FREEZE;
                frozeL1D = REG(L1DCC);
            }
            if ((REG(L2CFG) & L2_MODEMASK) != 0) {
                previousL2 = REG(L2CFG);
                asm(" nop 2");
                REG(L2CFG) = previousL2 | L2_FREEZE;
                frozeL2 = REG(L2CFG);
            }
        }

        /* put DDR into self-refresh mode */
        entryDDRCTL = REG(SDRCR_REG);
        REG(SDRCR_REG) &= ~SR_PD_BIT;   /* select self-refresh mode */
        REG(SDRCR_REG) |= LPMODEN_BIT;  /* enable low-power mode */

        /* if bypassing PLL1 then gate DDR clocks */
        if (bypassPLL1) {

            /* now gate OFF VCLK and MCLK (if enabled) */
            PMI_getModuleState(0, DDR_PSC, DDR_LPSC, &lpscState);
            if (lpscState == DDR_LPSC_ENABLE_STATE) {

                /* set MCLKSTOPEN bit to enable shutdown of MCLK */
                REG(SDRCR_REG) |= MCLKSTOPEN_BIT; /* enable MCLK stop */

                /* gate the VCLK at the PSC */
                PMI_setModuleState(0, DDR_PSC, DDR_LPSC, 
                    DDR_LPSC_DISABLE_STATE);
       
                /* wait for transition to complete */
                do {
                    PMI_getModuleState(0, DDR_PSC, DDR_LPSC, &lpscState);
                } while(lpscState != DDR_LPSC_DISABLE_STATE);

                gatedClockDDR = 1;
            }
        }

        /* bypass the PLLs (only if they are enabled) */
        if ((bypassPLL0) && ((REG(BASE_PLL0 + PLLCTL) & PLL_PLLEN_BIT) != 0)) {
            REG(BASE_PLL0 + PLLCTL) &= ~PLL_PLLEN_BIT;  /* bypass the PLL */
            PMI_waitCpuCycles(waitBypassPLL0);          /* wait for it */
            bypassedPLL0 = 1;
        }
        if ((bypassPLL1) && ((REG(BASE_PLL1 + PLLCTL) & PLL_PLLEN_BIT) != 0)) {
            REG(BASE_PLL1 + PLLCTL) &= ~PLL_PLLEN_BIT;  /* bypass the PLL */
            PMI_waitCpuCycles(waitBypassPLL1);          /* wait for it */
            bypassedPLL1 = 1;
        }

        /* scale to the sleep voltage; don't have to wait for transition */
        if (scaleVoltage != 0) {
            PMI_setVoltage(sleepVolts, 0);
        }

        /* now put GEM in standby... */
        _PMI_doIdle();

        /* scale back to the entry voltage; must wait for transition */
        if (scaleVoltage != 0) {
            PMI_setVoltage(entryVolts, 1);
        }

        /* re-enable the PLLs (if bypassed them above) */
        if (bypassedPLL0 != 0) {
            PMI_enablePLL(PMI_CPU);
        }
        if (bypassedPLL1 != 0) {
            PMI_enablePLL(PMI_PER);
        }

        /* gate ON the DDR clocks (if gated OFF above) */
        if (gatedClockDDR != 0) {

            /* re-enable VCLK at the PSC */
            PMI_setModuleState(0, DDR_PSC, DDR_LPSC, DDR_LPSC_ENABLE_STATE);

            /* wait for transition to complete */
            do {
                PMI_getModuleState(0, DDR_PSC, DDR_LPSC, &lpscState);
            } while(lpscState != DDR_LPSC_ENABLE_STATE);

            /* clear MCLKSTOPEN bit to re-enable MCLK */
            REG(SDRCR_REG) &= ~MCLKSTOPEN_BIT; 
        }

        /* restore DDR mode */
        REG(SDRCR_REG) = entryDDRCTL;

        /* unfreeze the caches if frozen above */
        if (frozeL1P != NOACTION) {
            if ((frozeL1P & L1_POPER) == 0) {
                REG(L1PCC) = 0;         /* was normal before, so unfreeze now */
             }
        }
        if (frozeL1D != NOACTION) {
            if ((frozeL1D & L1_POPER) == 0) {
                REG(L1DCC) = 0;         /* was normal before, so unfreeze now */
            }
        }
        if (frozeL2 != NOACTION) {
            REG(L2CFG) = previousL2;    /* restore previous mode */
        }

    }
    else if (state == PMI_DEEPSLEEP) {

        /* get and stash the current voltage */
        if (scaleVoltage != 0) {
            PMI_getVoltage(&entryVolts);
        }

        /* calculate cycles to wait for PLL bypass */
        waitBypassPLL0 = PMI_calcWaitBypass(PMI_CPU);
        waitBypassPLL1 = PMI_calcWaitBypass(PMI_PER);

        /* freeze the caches... */
        if (REG(L1PCFG) != 0) {
            asm(" nop 2");
            REG(L1PCC) = L1_FREEZE;
            frozeL1P = REG(L1PCC);
        }
        if (REG(L1DCFG) != 0) {
            asm(" nop 2");
            REG(L1DCC) = L1_FREEZE;
            frozeL1D = REG(L1DCC);
        }
        if ((REG(L2CFG) & L2_MODEMASK) != 0) {
            previousL2 = REG(L2CFG);
            asm(" nop 2");
            REG(L2CFG) = previousL2 | L2_FREEZE;
            frozeL2 = REG(L2CFG);
        }

        /* put DDR into self-refresh mode */
        entryDDRCTL = REG(SDRCR_REG);
        REG(SDRCR_REG) &= ~SR_PD_BIT;   /* select self-refresh mode */
        REG(SDRCR_REG) |= LPMODEN_BIT;  /* enable selected low-power mode */

        /* set MCLKSTOPEN bit to enable shutdown of MCLK */
        REG(SDRCR_REG) |= MCLKSTOPEN_BIT; /* enable MCLK stop */

        /* now gate OFF VCLK and MCLK (if enabled) */
        PMI_getModuleState(0, DDR_PSC, DDR_LPSC, &lpscState);
        if (lpscState == DDR_LPSC_ENABLE_STATE) {

            /* gate the VCLK at the PSC */
            PMI_setModuleState(0, DDR_PSC, DDR_LPSC, DDR_LPSC_DISABLE_STATE);
       
            /* wait for transition to complete */
            do {
                PMI_getModuleState(0, DDR_PSC, DDR_LPSC, &lpscState);
            } while(lpscState != DDR_LPSC_DISABLE_STATE);

            gatedClockDDR = 1;
        }

        /* bypass the PLLs (if they are enabled) */
        if ((REG(BASE_PLL0 + PLLCTL) & PLL_PLLEN_BIT) != 0) {
            REG(BASE_PLL0 + PLLCTL) &= ~PLL_PLLEN_BIT;  /* bypass the PLL */
            PMI_waitCpuCycles(waitBypassPLL0);          /* wait for it */
            bypassedPLL0 = 1;
        }
        if ((REG(BASE_PLL1 + PLLCTL) & PLL_PLLEN_BIT) != 0) {
            REG(BASE_PLL1 + PLLCTL) &= ~PLL_PLLEN_BIT;  /* bypass the PLL */
            PMI_waitCpuCycles(waitBypassPLL1);          /* wait for it */
            bypassedPLL1 = 1;
        }

        /* power down PLL0 and PLL1 (if they are powered up) */
        if ((REG(BASE_PLL0 + PLLCTL) & PLL_PLLPWRDN_BIT) == 0) {
            REG(BASE_PLL0 + PLLCTL) |= PLL_PLLPWRDN_BIT;
            poweredDownPLL0 = 1;
        }
        if ((REG(BASE_PLL1 + PLLCTL) & PLL_PLLPWRDN_BIT) == 0) {
           REG(BASE_PLL1 + PLLCTL) |= PLL_PLLPWRDN_BIT;
            poweredDownPLL1 = 1;
        }

        /* scale to the sleep voltage; don't have to wait for transition */
        if (scaleVoltage != 0) {
            PMI_setVoltage(DEEPSLEEP_VOLTS, 0);
        }

        /* configure the DEEPSLEEP pin as specified by caller */
        REG(PINMUX0_REG) &= ~MASK_31_29;
        if (sleepArg == PMI_EXTERNAL) {
            REG(PINMUX0_REG) |= FXN_DEEPSLEEP;
        }
        else if (sleepArg == PMI_RTC_ALARM) {
            REG(PINMUX0_REG) |= FXN_RTC_ALARM;
        }

        /* configure SLEEPCOUNT for wake from deep sleep */
        if ( ((REG(BASE_PLL0 + PLLCTL) & PLL_CLKMODE_BIT) == 0) ||
             ((REG(BASE_PLL1 + PLLCTL) & PLL_CLKMODE_BIT) == 0) ) {

            /* if OSCIN used by either PLL require non-0 stabilization count */
            sleepcount = OSC_SLEEPCOUNT;
        }
        REG(DEEPSLEEP_REG) = (REG(DEEPSLEEP_REG) & ~SLEEPCOUNT_MASK) | 
            sleepcount;

        asm(" .global _PMI_deepSleepInit");
        asm("_PMI_deepSleepInit:");

        /* set SLEEPENABLE bit to initiate deep sleep.................. */
        REG(DEEPSLEEP_REG) |= SLEEPENABLE_BIT;

        /* poll until SLEEPCOMPLETE bit indicates awake from deep sleep */
        do {
            awake = REG(DEEPSLEEP_REG) & SLEEPCOMPLETE_BIT;
        } while (awake == 0);

        /* ... now awake from deep sleep */

        /* clear the SLEEPENABLE bit */
        REG(DEEPSLEEP_REG) &= ~SLEEPENABLE_BIT;

        /* scale back to the entry voltage; must wait for transition */
        if (scaleVoltage != 0) {
            PMI_setVoltage(entryVolts, 1);
        }

        /* remove PLL0 and PLL1 from power down (if powered down above) */
        if (poweredDownPLL0 != 0) {
            REG(BASE_PLL0 + PLLCTL) &= ~PLL_PLLRST_BIT;   /* reset */
            REG(BASE_PLL0 + PLLCTL) |= PLL_PLLDIS_BIT;    /* disable output */
            REG(BASE_PLL0 + PLLCTL) &= ~PLL_PLLPWRDN_BIT; /* power up */
            REG(BASE_PLL0 + PLLCTL) &= ~PLL_PLLDIS_BIT;   /* enable toggle */
            asm(" nop 9");                                /* wait reset */
            REG(BASE_PLL0 + PLLCTL) |= PLL_PLLRST_BIT;    /* release reset */
        }
        if (poweredDownPLL1 != 0) {
            REG(BASE_PLL1 + PLLCTL) &= ~PLL_PLLRST_BIT;   /* reset */
            REG(BASE_PLL1 + PLLCTL) |= PLL_PLLDIS_BIT;    /* disable output */
            REG(BASE_PLL1 + PLLCTL) &= ~PLL_PLLPWRDN_BIT; /* power up */
            REG(BASE_PLL1 + PLLCTL) &= ~PLL_PLLDIS_BIT;   /* enable toggle */
            asm(" nop 9");                                /* wait reset */
            REG(BASE_PLL1 + PLLCTL) |= PLL_PLLRST_BIT;    /* release reset */
        }

        if ((poweredDownPLL0 != 0) || (poweredDownPLL1 != 0)) {
            PMI_waitCpuCycles(PLL_MAXLOCKCYCLES);         /* wait re-lock */
        }

        /* re-enable the PLLs (if bypassed them above) */
        if (bypassedPLL0 != 0) {
            PMI_enablePLL(PMI_CPU);
        }
        if (bypassedPLL1 != 0) {
            PMI_enablePLL(PMI_PER);
        }

        /* gate ON the DDR clocks (if gated OFF above) */
        if (gatedClockDDR != 0) {

            /* re-enable VCLK at the PSC */
            PMI_setModuleState(0, DDR_PSC, DDR_LPSC, DDR_LPSC_ENABLE_STATE);

            /* wait for transition to complete */
            do {
                PMI_getModuleState(0, DDR_PSC, DDR_LPSC, &lpscState);
            } while(lpscState != DDR_LPSC_ENABLE_STATE);
        }

        /* clear MCLKSTOPEN bit to re-enable MCLK */
        REG(SDRCR_REG) &= ~MCLKSTOPEN_BIT; 

        /* restore DDR mode */
        REG(SDRCR_REG) = entryDDRCTL;

        /* unfreeze the caches if frozen above */
        if (frozeL1P != NOACTION) {
            if ((frozeL1P & L1_POPER) == 0) {
                REG(L1PCC) = 0;         /* was normal before, so unfreeze now */
             }
        }
        if (frozeL1D != NOACTION) {
            if ((frozeL1D & L1_POPER) == 0) {
                REG(L1DCC) = 0;         /* was normal before, so unfreeze now */
            }
        }
        if (frozeL2 != NOACTION) {
            REG(L2CFG) = previousL2;    /* restore previous mode */
        }
    }

    else {
        status = PMI_FAIL;
    }

    /* restore PDCCMD register value */
    REG(PDCCMD_REG) = entryPDC;

    return(status);
}
