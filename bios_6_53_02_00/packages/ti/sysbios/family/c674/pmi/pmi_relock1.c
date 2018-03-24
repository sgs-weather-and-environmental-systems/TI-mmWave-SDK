/*
 *  ======== pmi_relock1.c ========
 *
 *  PMI function for re-configure and relock of PLL1, ensuring on-chip accesses
 *  only.
 *
 */

#include <ti/sysbios/family/c674/pmi.h>
#include <pmi_defs6748.h>

extern cregister volatile unsigned int TSCL;

#pragma CODE_SECTION(_PMI_doRelockPLL1, ".ti_sysbios_family_c674_pmi_onchip");
#pragma CODE_SECTION(PMI_waitCpuCycles, ".ti_sysbios_family_c674_pmi_onchip");

void _PMI_doRelockPLL1(unsigned pllbase, unsigned pllm, unsigned postdiv);

#define L1PCFG       0x01840020
#define L1PCC        0x01840024
#define L1DCFG       0x01840040
#define L1DCC        0x01840044
#define L2CFG        0x01840000
#define L1_FREEZE    0x1
#define L1_POPER     0x10000
#define L2_MODEMASK  0x7
#define L2_FREEZE    0x8
#define NOACTION     0xffffffff

/*
 *  ======== _PMI_doRelockPLL1 ========
 *  Relock PLL1, without making any off-chip memory accesses.
 *  When this functions runs global interrupts are disabled, and a temporary,
 *  local, on-chip stack is used.
 */
void _PMI_doRelockPLL1(unsigned pllbase, unsigned pllm, unsigned postdiv)
{
    unsigned gatedClockDDR = 0;
    unsigned entryDDRCTL;
    unsigned lpscState;
    unsigned frozeL1P = NOACTION;
    unsigned frozeL1D = NOACTION;
    unsigned frozeL2 = NOACTION;
    unsigned previousL2;
    unsigned waitBypass;

    /* 1. Pre-calculate cycles to wait for bypass */
    waitBypass = PMI_calcWaitBypass(PMI_PER);

    /* 2. Freeze any enabled caches */
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

    /* 3. Put DDR into self-refresh; gate DDR clocks */

    /* put DDR into self-refresh */
    entryDDRCTL = REG(SDRCR_REG);
    REG(SDRCR_REG) &= ~SR_PD_BIT;   /* select self-refresh mode */
    REG(SDRCR_REG) |= LPMODEN_BIT;  /* enable low-power mode */

    /* set MCLKSTOPEN bit to enable shutdown of MCLK */
    REG(SDRCR_REG) |= MCLKSTOPEN_BIT; /* enable MCLK stop */

    /* now gate OFF VCLK (if enabled) */
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

    /* 4. BYPASS the PLL */

    /* clear PLLEN bit in PLLCTL to bypass PLL */
    REG(pllbase + PLLCTL) &= ~PLL_PLLEN_BIT;

    /* now, wait for bypass transition to complete... */
    PMI_waitCpuCycles(waitBypass);

    /* 5. Reconfigure the PLL */

    /* clear the PLLRST bit to reset PLL */
    REG(pllbase + PLLCTL) &= ~PLL_PLLRST_BIT;

    /* clear PLLDIS bit to enable toggling */
    REG(pllbase + PLLCTL) &= ~PLL_PLLDIS_BIT;

    /* set multiplier value */
    REG(pllbase + PLLM) = pllm;

    /* set post divider value */
    REG(pllbase + POSTDIV) = postdiv;

    /* 6. Lock the PLL */

    /* set the PLLRST bit to release PLL from reset */
    REG(pllbase + PLLCTL) |= PLL_PLLRST_BIT;

    /* wait for PLL to lock */
    PMI_waitCpuCycles(0x1e6);     /* TODO: update with optimized value */

    /* 7. Re-enable the PLL */

    /* set PLLEN bit in PLLCTL */
    REG(pllbase + PLLCTL) |= PLL_PLLEN_BIT;

    /* 8. Restore DDR clock; take out of refresh */

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

    /* release DDR from self-refresh */
    REG(SDRCR_REG) = entryDDRCTL;

    /* 9. Unfreeze any caches that froze above */
    if (frozeL1P != NOACTION) {
        if ((frozeL1P & L1_POPER) == 0) {  
            REG(L1PCC) = 0;          /* was normal before, so unfreeze now */
         }
    }
    if (frozeL1D != NOACTION) {
        if ((frozeL1D & L1_POPER) == 0) {  
            REG(L1DCC) = 0;          /* was normal before, so unfreeze now */
        }
    }
    if (frozeL2 != NOACTION) {
        REG(L2CFG) = previousL2;     /* restore previous mode */
    }
}


/*
 *  ======== PMI_waitCpuCycles ========
 */
void PMI_waitCpuCycles(unsigned cycles)
{
    unsigned start;
    unsigned current;

    /* get current timestamp count */
    start = current = TSCL;

    /* spin waiting for 'cycles' number of additional cycles */
    while (current < (start + cycles)) {
        current = TSCL;
    };
}
