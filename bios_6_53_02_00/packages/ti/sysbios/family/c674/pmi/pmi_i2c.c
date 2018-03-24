/*
 *  ======== pmi_i2c.c ========
 *
 *  PMI functions for C6748 I2C control.
 *
 */

#include <ti/sysbios/family/c674/pmi.h>
#include <pmi_i2cdefs.h>
#include <pmi_i2cfxns.h>

#pragma CODE_SECTION(PMI_initI2C, ".ti_sysbios_family_c674_pmi_onchip:slp");
#pragma CODE_SECTION(PMI_readI2C, ".ti_sysbios_family_c674_pmi_onchip:slp");
#pragma CODE_SECTION(PMI_writeI2C, ".ti_sysbios_family_c674_pmi_onchip:slp");

/*
 *  ======== PMI_initI2C ========
 */
PMI_Status PMI_initI2C(void) 
{
    unsigned busy;
    unsigned temp;

    /* setup C6748 PINMUX register to select I2C functionality */
    temp = REG(PINMUX4);
    REG(PINMUX4) = (temp & SELECT_I2C_MASK) | SELECT_I2C_VALUE;

    /* put I2C into reset */
    REG(ICMDR) &= ~IRS_BIT;

    /* write initial config to I2C mode register */
    REG(ICMDR) = MASTERCONFIG;

    /* setup I2C clock frequency */
    REG(ICPSC) = PRESCALEDIVIDE;

    /* setup I2C clock divider registers */
    REG(ICCLKL) = CLOCKDIVIDE_LO;
    REG(ICCLKH) = CLOCKDIVIDE_HI;

    /* write back to clear the interrupt status register */
    REG(ICSTR) = REG(ICSTR);

    /* release the I2C controller from reset */
    REG(ICMDR) |= IRS_BIT;

    /* wait until busy busy bit is cleared indicating bus is free */
    do
    {
        busy = REG(ICSTR) & BUSY_BIT;
    }
    while (busy != 0);

    return(PMI_OK);
}


/*
 *  ======== PMI_readI2C ========
 *  Read a PMIC register via I2C.
 */
PMI_Status PMI_readI2C(unsigned addr, unsigned reg, unsigned * data)
{
    unsigned status; 
    unsigned busy; 

    /* wait for any previously sent STOP to auto complete ...*/
    do
    {
        busy = REG(ICMDR) & STP_BIT;
    }
    while (busy != 0);

    /* wait for any in progress bus transaction to complete... */
    do 
    {
        busy = REG(ICSTR) & BUSY_BIT;
    }
    while (busy != 0);

    /* set slave address to be the PMIC */
    REG(ICSAR) = addr;

    /* set transmit byte count (ICCNT) to one byte (i.e., PMIC register ID) */ 
    REG(ICCNT) = 1;

    /* set controller mode to be master transmit */
    REG(ICMDR) |= (TRX_BIT | MST_BIT);

    /* put the PMIC register ID into the transmit data register */
    REG(ICDXR) = reg;

    /* start the transaction */
    REG(ICMDR) |= STT_BIT;

    asm(" .global _PMI_waitR1");
    asm("_PMI_waitR1:");

    /* wait for TX ready status */
    do
    {
        status = REG(ICSTR) & ICXRDY_BIT;
    }
    while (status == 0);

    /* wait for ARDY to indicate new register access is OK */
    do
    {
        status = REG(ICSTR) & ARDY_BIT;
    }
    while (status == 0);

    /* set controller mode to receive */
    REG(ICMDR) &= ~TRX_BIT;

    /* re-assert master bit, indicate NACK reply to slave data byte */
    REG(ICMDR) |= (MST_BIT | NACKMOD_BIT);

    /* start the read operation */
    REG(ICMDR) |= STT_BIT;

    asm(" .global _PMI_waitR2");
    asm("_PMI_waitR2:");

    /* wait for RX ready status */
    do
    {
        status = REG(ICSTR) & ICRRDY_BIT;
    }
    while (status == 0);

    /* read the received byte */
    *data = REG(ICDRR);

    /* signal bus STOP */
    REG(ICMDR) |= STP_BIT;

    return(PMI_OK);
}


/*
 *  ======== PMI_writeI2C ========
 *  Write a PMIC register via I2C.
 */
PMI_Status PMI_writeI2C(unsigned addr, unsigned reg, unsigned data)
{
    unsigned status;
    unsigned busy;

    /* wait for any previously sent STOP to auto complete ...*/
    do 
    {
        busy = REG(ICMDR) & STP_BIT;
    }
    while (busy != 0);

    /* wait for any previous bus transaction to complete... */
    do
    {
        busy = REG(ICSTR) & BUSY_BIT;
    }
    while (busy != 0);

    /* set slave address to be the PMIC */
    REG(ICSAR) = addr;

    /* set transmit byte count (ICCNT) to two bytes (register ID + value) */
    REG(ICCNT) = 2;

    /* set controller mode to master transmit */
    REG(ICMDR) |= (TRX_BIT | MST_BIT);

    /* put the PMIC register ID into the transmit data register */
    REG(ICDXR) = reg;

    /* start the transaction */
    REG(ICMDR) |= STT_BIT;

    asm(" .global _PMI_waitT1");
    asm("_PMI_waitT1:");

    /* wait for TX ready status */
    do
    {
        status = REG(ICSTR) & ICXRDY_BIT;
    }
    while (status == 0);

    /* put the PMIC register data value into the transmit data register */
    REG(ICDXR) = data;

    asm(" .global _PMI_waitT2");
    asm("_PMI_waitT2:");

    /* wait for TX ready status */
    do
    {
        status = REG(ICSTR) & ICXRDY_BIT;
    }
    while (status == 0);

    /* signal bus STOP */
    REG(ICMDR) |= STP_BIT;

    return(PMI_OK);
}

