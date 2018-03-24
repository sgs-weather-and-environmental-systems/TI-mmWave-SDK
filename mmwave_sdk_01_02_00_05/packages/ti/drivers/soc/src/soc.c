/**
 *   @file  soc.c
 *
 *   @brief
 *      The file implements the SOC Driver
 *
 *  \par
 *  NOTE:
 *      (C) Copyright 2016 Texas Instruments, Inc.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *    Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the
 *    distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/**************************************************************************
 *************************** Include Files ********************************
 **************************************************************************/
#include <stdint.h>
#include <string.h>
#include <ti/drivers/osal/MemoryP.h>
#include <ti/drivers/soc/soc.h>
#include <ti/drivers/soc/include/soc_internal.h>

/**************************************************************************
 *************************** Extern Definitions ***************************
 **************************************************************************/

/**
 * @brief
 *  This is the global SOC hardware attributes which are defined for each
 *  supported SOC
 */
extern SOC_HwAttrib gSOCHwAttrib;

/**************************************************************************
 *************************** Extern Functions *****************************
 **************************************************************************/

/**************************************************************************
 *************************** Local Definitions ****************************
 **************************************************************************/
static void SOC_waitAPLLCalibration(SOC_DriverMCB* ptrSOCDriverMCB);

/**************************************************************************
 ************************** SOC Module Functions **************************
 **************************************************************************/

/**
 *  @b Description
 *  @n
 *      This function checks APLL status and wait until APLL clock Calibration
 *      is done from BSS.
 *
 *  @param[in] ptrSOCDriverMCB
 *      Pointer to the SOC Driver
 *
 *  \ingroup SOC_DRIVER_INTERNAL_FUNCTION
 *
 *  @retval
 *      Not Applicable
 */
static void SOC_waitAPLLCalibration(SOC_DriverMCB* ptrSOCDriverMCB)
{
    TOPRCMRegs* ptrTopRCMRegs;

    /* Get the TOP RCM registers: */
    ptrTopRCMRegs = ptrSOCDriverMCB->ptrTopRCMRegs;

    /* Wait until APLL clock calibration is done successfully */
    while (CSL_FEXTR(ptrTopRCMRegs->SPARE0, 17U, 16U) != 0x3);
}

/**
 *  @b Description
 *  @n
 *      The function is used to initialize and setup the SOC Driver. If the
 *      system clock configuration is initialized then the function will unhalt
 *      the BSS and will wait until the APLL calibiration is completed.
 *
 *  @param[in] ptrCfg
 *      Pointer to the SOC configuration
 *  @param[out] errCode
 *      Error code populated on error
 *
 *  \ingroup SOC_DRIVER_EXTERNAL_FUNCTION
 *
 *  @retval
 *      Success     - Pointer to the SOC Driver
 *  @retval
 *      Error       - NULL
 */
SOC_Handle SOC_init (SOC_Cfg* ptrCfg, int32_t* errCode)
{
    SOC_DriverMCB*    ptrSOCDriverMCB;

    /* Allocate memory for the SOC Driver: */
    ptrSOCDriverMCB = MemoryP_ctrlAlloc (sizeof(SOC_DriverMCB), 0);
    if (ptrSOCDriverMCB == NULL)
    {
        /* Error: Unable to allocate the memory */
        *errCode = SOC_ENOMEM;
    }
    else
    {
        /* Initialize the allocated memory */
        memset ((void *)ptrSOCDriverMCB, 0, sizeof(SOC_DriverMCB));

        /* Copy over the configuration: */
        memcpy ((void *)&ptrSOCDriverMCB->cfg, (void*)ptrCfg, sizeof(SOC_Cfg));

        /* Populate the SOC Driver block: */
        ptrSOCDriverMCB->ptrRCMRegs    = (RCMRegs*)gSOCHwAttrib.rcmBaseAddress;
        ptrSOCDriverMCB->ptrTopRCMRegs = (TOPRCMRegs*)gSOCHwAttrib.topRcmBaseAddress;
        ptrSOCDriverMCB->ptrGPCFGRegs  = (GPCFGRegs*)gSOCHwAttrib.gpcfgRegBaseAddress;
        ptrSOCDriverMCB->ptrDSSRegs    = (DSSRegs*)gSOCHwAttrib.dssRegBaseAddress;

        /* Do we need to initialize the system clock? */
        if (ptrCfg->clockCfg == SOC_SysClock_INIT)
        {
            /* YES: Unhalt the BSS: */
            SOC_unhaltBSS((SOC_Handle)ptrSOCDriverMCB, errCode);

            /* Switch to 200MHz clock, then wait for APLL calibration is done by BSS */
            SOC_waitAPLLCalibration(ptrSOCDriverMCB);
        }
        else
        {
            /* Fall through and bypass the clock configuration */
        }

        /* Perform any device specific initialization: */
        SOC_deviceInit (ptrSOCDriverMCB, errCode);
    }
    return (SOC_Handle)ptrSOCDriverMCB;
}

/**
 *  @b Description
 *  @n
 *      The function is used to unhalt the BSS
 *
 *  @param[in] handle
 *      Handle to the SOC Driver
 *  @param[out] errCode
 *      Error code populated on error
 *
 *  \ingroup SOC_DRIVER_EXTERNAL_FUNCTION
 *
 *  @retval
 *      Success     - 0
 *  @retval
 *      Error       - <0
 */
int32_t SOC_unhaltBSS(SOC_Handle handle, int32_t* errCode)
{
    SOC_DriverMCB*      ptrSOCDriverMCB;
    int32_t             retVal = 0;
    volatile uint16_t   unhaltStatus;

    /* Get the pointer to the SOC Driver Block: */
    ptrSOCDriverMCB = (SOC_DriverMCB*)handle;
    if (ptrSOCDriverMCB == NULL)
    {
        *errCode = SOC_EINVAL;
        retVal   = MINUS_ONE;
    }
    else
    {
        unhaltStatus = (uint16_t)CSL_FEXTR (ptrSOCDriverMCB->ptrTopRCMRegs->BSSCTL, 31U, 16U);
        if (unhaltStatus != 0x0) {
            /* Bring the BSS out of the HALT state */
            ptrSOCDriverMCB->ptrTopRCMRegs->BSSCTL = CSL_FINSR(ptrSOCDriverMCB->ptrTopRCMRegs->BSSCTL, 31U, 16U, 0U);
        }
    }
    return retVal;
}

/**
 *  @b Description
 *  @n
 *      The function is used to halt the BSS
 *
 *  @param[in] handle
 *      Handle to the SOC Driver
 *  @param[out] errCode
 *      Error code populated on error
 *
 *  \ingroup SOC_DRIVER_EXTERNAL_FUNCTION
 *
 *  @retval
 *      Success     - 0
 *  @retval
 *      Error       - <0
 */
int32_t SOC_haltBSS(SOC_Handle handle, int32_t* errCode)
{
    SOC_DriverMCB*      ptrSOCDriverMCB;
    int32_t             retVal = 0;

    /* Get the pointer to the SOC Driver Block: */
    ptrSOCDriverMCB = (SOC_DriverMCB*)handle;
    if (ptrSOCDriverMCB == NULL)
    {
        *errCode = SOC_EINVAL;
        retVal   = MINUS_ONE;
    }
    else
    {
        /* Halt the BSS: */
        ptrSOCDriverMCB->ptrTopRCMRegs->BSSCTL = CSL_FINSR(ptrSOCDriverMCB->ptrTopRCMRegs->BSSCTL, 31U, 16U, 0xADU);
    }
    return retVal;
}

/**
 *  @b Description
 *  @n
 *      The function is used to enable and power up the LVDS.
 *
 *  @param[in] handle
 *      Handle to the SOC Driver
 *  @param[out] errCode
 *      Error code populated on error
 *
 *  \ingroup SOC_DRIVER_EXTERNAL_FUNCTION
 *
 *  @retval
 *      Success     - 0
 *  @retval
 *      Error       - <0
 */
int32_t SOC_enableLVDS(SOC_Handle handle, int32_t* errCode)
{
    SOC_DriverMCB*      ptrSOCDriverMCB;
    int32_t             retVal = 0;

    /* Get the pointer to the SOC Driver Block: */
    ptrSOCDriverMCB = (SOC_DriverMCB*)handle;
    if (ptrSOCDriverMCB == NULL)
    {
        *errCode = SOC_EINVAL;
        retVal   = MINUS_ONE;
    }
    else
    {
        /*****************************************************************
         * LVDS Bandgap powerup:
         * - Pulse the PWRDN control for the LVDS Bias cell (0->1->0)
         ****************************************************************/
        ptrSOCDriverMCB->ptrTopRCMRegs->LVDSPADCTL1 = CSL_FINSR (ptrSOCDriverMCB->ptrTopRCMRegs->LVDSPADCTL1,
                                                                 24U, 24U, 1U);
        /* Delay: */
        SOC_microDelay (10U);
        ptrSOCDriverMCB->ptrTopRCMRegs->LVDSPADCTL1 = CSL_FINSR (ptrSOCDriverMCB->ptrTopRCMRegs->LVDSPADCTL1,
                                                                 24U, 24U, 0U);
        /* Enable & Power up the LVDS */
        ptrSOCDriverMCB->ptrTopRCMRegs->LVDSPADCTL0 = 0U;

        /* Set only bit 25 to enable BANDGAP trims to apply. Enables LVDS bangap
         * monitoring to work correctly. */
        ptrSOCDriverMCB->ptrTopRCMRegs->LVDSPADCTL1 = CSL_FMKR (25U, 25U, 1U);
    }
    return retVal;
}

/**
 *  @b Description
 *  @n
 *      The function is used to deinitialize and shutdown the SOC Driver module.
 *
 *  @param[in] handle
 *      Handle to the SOC Driver
 *  @param[out] errCode
 *      Error code populated on error
 *
 *  \ingroup SOC_DRIVER_EXTERNAL_FUNCTION
 *
 *  @retval
 *      Success     - 0
 *  @retval
 *      Error       - <0
 */
int32_t SOC_deinit (SOC_Handle handle, int32_t* errCode)
{
    SOC_DriverMCB*      ptrSOCDriverMCB;
    int32_t             retVal = MINUS_ONE;

    /* Get the pointer to the SOC Driver Block: */
    ptrSOCDriverMCB = (SOC_DriverMCB*)handle;
    if (ptrSOCDriverMCB == NULL)
    {
        *errCode = SOC_EINVAL;
        goto exit;
    }

    /* Shutdown and close the device layer: */
    SOC_deviceDeinit(ptrSOCDriverMCB, errCode);

    /* Cleanup the memory: */
    MemoryP_ctrlFree (ptrSOCDriverMCB, sizeof(SOC_DriverMCB));

    /* Setup the return value */
    retVal = 0;
exit:
    return retVal;
}

/**
 *  @b Description
 *  @n
 *      The function is used to enable/disable SPIA/SPIB output
 *
 *  @param[in] handle
 *      Handle to the SOC Driver
 *  @param[in] spiInst
 *      SPI instance, 0 -SPIA, 1 - SPIB
 *  @param[in] enable
 *      Output Enable flag, 0 -disable, 1 - enable
 *  @param[out] errCode
 *      Error code populated on error
 *
 *  \ingroup SOC_DRIVER_EXTERNAL_FUNCTION
 *
 *  @retval
 *      Success     - 0
 *  @retval
 *      Error       - <0
 */
int32_t SOC_SPIOutputCtrl (SOC_Handle handle, uint8_t spiInst, uint8_t enable, int32_t* errCode)
{
    SOC_DriverMCB*      ptrSOCDriverMCB;
    int32_t             retVal = 0;

    /* Get the pointer to the SOC Driver Block: */
    ptrSOCDriverMCB = (SOC_DriverMCB*)handle;
    if (ptrSOCDriverMCB == NULL)
    {
        *errCode = SOC_EINVAL;
        retVal   = MINUS_ONE;
    }
    else
    {
        enable = enable ? 0 : 1;
        if(spiInst == 0U)
        {
            /* SPIA OE Ctrl */
            ptrSOCDriverMCB->ptrTopRCMRegs->SPAREMULTIBIT = CSL_FINSR (ptrSOCDriverMCB->ptrTopRCMRegs->SPAREMULTIBIT,
                                                                       0U,
                                                                       0U,
                                                                       (uint32_t)enable);
        }
        else if (spiInst == 1U)
        {
            /* SPIB OE Ctrl */
            ptrSOCDriverMCB->ptrTopRCMRegs->SPAREMULTIBIT = CSL_FINSR (ptrSOCDriverMCB->ptrTopRCMRegs->SPAREMULTIBIT,
                                                                       4U,
                                                                       4U,
                                                                       (uint32_t)enable);
        }
        else
        {
            *errCode = SOC_EINVAL;
            retVal   = MINUS_ONE;
        }
    }
    return retVal;
}

/**
 *  @b Description
 *  @n
 *      The function is the interrupt handler which is registered for all the
 *      system interrupts. The function cycles through and notifies all the
 *      registered listeners
 *
 *  @param[in] arg
 *      System interrupt table entry.
 *
 *  \ingroup SOC_DRIVER_INTERNAL_FUNCTION
 *
 *  @retval
 *      Not applicable
 */
void SOC_SystemISR (uintptr_t arg)
{
    SOC_SysInterrupt*           ptrSysInterrupt;
    SOC_SysInterruptListener*   ptrSysInterruptListener;
    uint8_t                     index = 0U;

    /* Get the pointer to the system interrupt: */
    ptrSysInterrupt = (SOC_SysInterrupt*)arg;

    /* Increment the number of system interrupts received */
    ptrSysInterrupt->numInterrupts++;

    /* Cycle through all the registered listeners */
    for (index = 0U; index < SOC_MAX_LISTEN_TABLE; index++)
    {
        /* Get the listener block: Invoke the listener function if registered */
        ptrSysInterruptListener = (SOC_SysInterruptListener*)&ptrSysInterrupt->listenTable[index];
        if (ptrSysInterruptListener->hwiListenerFxn != NULL)
        {
            ptrSysInterruptListener->hwiListenerFxn (ptrSysInterruptListener->arg);
        }
    }
    return;
}

/**
 *  @b Description
 *  @n
 *      The function is used to register a listener for a system interrupts.
 *      It is possible to attach multiple listeners to a system interrupt and
 *      once the interrupt is triggered the SOC module will ensure that the
 *      registered listeners are invoked.
 *
 *  @param[in] handle
 *      Handle to the SOC Module
 *  @param[in] ptrListenerCfg
 *      Pointer to the listener configuration
 *  @param[out] errCode
 *      Error code populated on error
 *
 *  \ingroup SOC_DRIVER_EXTERNAL_FUNCTION
 *
 *  @retval
 *      Success -   Handle to the System Interrupt Listener
 *  @retval
 *      Error   -   NULL
 */
SOC_SysIntListenerHandle SOC_registerSysIntListener
(
    SOC_Handle              handle,
    SOC_SysIntListenerCfg*  ptrListenerCfg,
    int32_t*                errCode
)
{
    uint8_t                     index;
    uintptr_t                   key;
    SOC_DriverMCB*              ptrSOCDriverMCB;
    SOC_SysInterrupt*           ptrSysInterrupt;
    SOC_SysIntListenerHandle    retHandle = NULL;

    /* Sanity Check: Validate the arguments */
    ptrSOCDriverMCB = (SOC_DriverMCB*)handle;
    if ((ptrSOCDriverMCB == NULL) || (ptrListenerCfg->listenerFxn == NULL))
    {
        *errCode = SOC_EINVAL;
        goto exit;
    }

    /* Sanity Check: Ensure that the system interrupt is handled by the SOC Module */
    for (index = 0U; index < SOC_MAX_SYSTEM_INTERRUPT; index++)
    {
        /* Do we have a matching system interrupt? */
        ptrSysInterrupt = &ptrSOCDriverMCB->sysIntTable[index];
        if (ptrSysInterrupt->intNum == ptrListenerCfg->systemInterrupt)
        {
            /* YES: Excellent match found. */
            break;
        }
    }
    if (index == SOC_MAX_SYSTEM_INTERRUPT)
    {
        /* Error: The system interrupt specified in the argument is not handled by the SOC module. */
        *errCode = SOC_EINVAL;
        goto exit;
    }

    /* The listener table is a critical section */
    key = HwiP_disable();
    for (index = 0U; index < SOC_MAX_LISTEN_TABLE; index++)
    {
        /* Is the listener slot free? */
        if (ptrSysInterrupt->listenTable[index].hwiListenerFxn == NULL)
        {
            /* YES: Register the listener */
            ptrSysInterrupt->listenTable[index].hwiListenerFxn = ptrListenerCfg->listenerFxn;
            ptrSysInterrupt->listenTable[index].arg            = ptrListenerCfg->arg;

            /* Enable the interrupt: */
            HwiP_enableInterrupt (ptrSysInterrupt->intNum);

            /* Setup the return value: */
            retHandle = (SOC_SysIntListenerHandle)&ptrSysInterrupt->listenTable[index];
            break;
        }
    }
    HwiP_restore(key);

    /* Was the listener registeration successful? */
    if (index == SOC_MAX_LISTEN_TABLE)
    {
        /* NO; we ran out of space in the listener table. */
        *errCode = SOC_ENOSPACE;
        goto exit;
    }

exit:
    return retHandle;
}

/**
 *  @b Description
 *  @n
 *      The function is used to deregister a listener from a system interrupt
 *
 *  @param[in] handle
 *      Handle to the SOC Module
 *  @param[in] systemInterrupt
 *      System interrupt on which the listener is to be deregistered
 *  @param[in] listenerHandle
 *      System Interrupt Handler to be deregistered
 *  @param[out] errCode
 *      Error code populated on error
 *
 *  \ingroup SOC_DRIVER_EXTERNAL_FUNCTION
 *
 *  @retval
 *      Success -   0
 *  @retval
 *      Error   -   <0
 */
int32_t SOC_deregisterSysIntListener
(
    SOC_Handle                  handle,
    uint32_t                    systemInterrupt,
    SOC_SysIntListenerHandle    listenerHandle,
    int32_t*                    errCode
)
{
    SOC_DriverMCB*      ptrSOCDriverMCB;
    SOC_SysInterrupt*   ptrSysInterrupt;
    int32_t             retVal = MINUS_ONE;
    uint8_t             index;
    uintptr_t           key;

    /* Sanity Check: Validate the arguments */
    ptrSOCDriverMCB = (SOC_DriverMCB*)handle;
    if ((ptrSOCDriverMCB == NULL) || (listenerHandle == NULL))
    {
        *errCode = SOC_EINVAL;
        goto exit;
    }

    /* Sanity Check: Ensure that the system interrupt is handled by the SOC Module */
    for (index = 0U; index < SOC_MAX_SYSTEM_INTERRUPT; index++)
    {
        /* Do we have a matching system interrupt? */
        ptrSysInterrupt = &ptrSOCDriverMCB->sysIntTable[index];
        if (ptrSysInterrupt->intNum == systemInterrupt)
        {
            /* YES: Excellent match found. */
            break;
        }
    }
    if (index == SOC_MAX_SYSTEM_INTERRUPT)
    {
        /* Error: The system interrupt specified in the argument is not handled by the SOC module. */
        *errCode = SOC_EINVAL;
        goto exit;
    }

    /* The listener table is a critical section */
    key = HwiP_disable();
    for (index = 0U; index < SOC_MAX_LISTEN_TABLE; index++)
    {
        /* Is the listener we are trying to deregister */
        if (&ptrSysInterrupt->listenTable[index] == listenerHandle)
        {
            /* YES: Deregister the listener */
            ptrSysInterrupt->listenTable[index].hwiListenerFxn = NULL;

            /* Setup the return value: */
            retVal = 0;
            break;
        }
    }
    HwiP_restore(key);

    /* Was the listener deregisteration successful? */
    if (index == SOC_MAX_LISTEN_TABLE)
    {
        /* NO. This seems like a bad listener handle */
        *errCode = SOC_EINVAL;
        goto exit;
    }

    /* Disable the interrupts: If there are no active listeners disable the system interrupt.
     * The next listener registeration will enable the interrupt. */
    key = HwiP_disable();

    /* Disable the system interrupt: */
    HwiP_disableInterrupt (ptrSysInterrupt->intNum);

    /* Cycle through all the listeners: */
    for (index = 0U; index < SOC_MAX_LISTEN_TABLE; index++)
    {
        /* Is there an active listener for the system interrupt? */
        if (ptrSysInterrupt->listenTable[index].hwiListenerFxn != NULL)
        {
            /* YES: Activate the system interrupt. */
            HwiP_enableInterrupt (ptrSysInterrupt->intNum);
            break;
        }
    }
    HwiP_restore(key);

exit:
    return retVal;
}

/**
 *  @b Description
 *  @n
 *      The function is used to trigger a warm reset. Currently the warm reset is issued only upon MSS Watch dog reset.
 *
 *  @param[in] handle
 *      Handle to the SOC Driver
 *  @param[out] errCode
 *      Error code populated on error
 *
 *  \ingroup SOC_DRIVER_EXTERNAL_FUNCTION
 *
 *  @retval
 *      Success     - 0
 *  @retval
 *      Error       - <0
 */
int32_t SOC_triggerWarmReset(SOC_Handle handle, int32_t* errCode)
{
    SOC_DriverMCB*      ptrSOCDriverMCB;
    int32_t             retVal = 0;

    /* Get the pointer to the SOC Driver Block: */
    ptrSOCDriverMCB = (SOC_DriverMCB*)handle;
    if (ptrSOCDriverMCB == NULL)
    {
        *errCode = SOC_EINVAL;
        retVal   = MINUS_ONE;
    }
    else
    {
        /* Configure the register to issue Warm reset upon MSS Watch dog reset: */
        ptrSOCDriverMCB->ptrTopRCMRegs->WDRSTEN = CSL_FINSR(ptrSOCDriverMCB->ptrTopRCMRegs->WDRSTEN, 7U, 0U, 0xADU);
    }
    return retVal;
}
