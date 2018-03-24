/*
 * Copyright (c) 2016, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 *  ======== SysUart.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Startup.h>

#include <stdio.h>
#include <stdlib.h>

#include "package/internal/SysUart.xdc.h"

/*
 * UART structure
 */
struct Uart {
    UInt32 THR_DLL_RHR;    /* 0x00 RX/TX data  */
    UInt32 IER_DLH;        /* 0x04 IER_DLH     */
    UInt32 IIR_FCR_EFR;    /* 0x08 IIR_FCR_EFR */
    UInt32 LCR;            /* 0x0C LCR         */
    UInt32 MCR_XON1;       /* 0x10 MCR_XON1    */
    UInt32 LSR;            /* 0x14 LSR         */
    UInt32 hole0[2];       /* 0x18-0x1F        */
    UInt32 MDR1;           /* 0x20 MDR1        */
    UInt32 hole1[12];      /* 0x24-0x53        */
    UInt32 SYSC;           /* 0x54 SYSC        */
    UInt32 SYSS;           /* 0x58 SYSS        */
};

/*
 *  ======== SysUart_Module_startup ========
 *  Configure UART0 with below settings:
 *   + 1 stop bit
 *   + No parity
 *   + 8-bit word length
 */
Int SysUart_Module_startup(Int phase)
{
    volatile struct Uart *uart = SysUart_uartBaseAddr;

    /* Disable UART */
    uart->MDR1 = 7;

    /* Reset the UART peripheral */
    uart->SYSC |= 0x2;

    /* Wait for reset to complete */
    while (!(uart->SYSS & 0x1));

    /* Disable all interrupts */
    uart->IER_DLH = 0;

    /* Enter cfg mode A (set LCR:DIV_EN = 0x1) */
    uart->LCR = 0x83;
    uart->THR_DLL_RHR = 0x0;
    uart->IER_DLH = 0x0;

    /* Re-enter normal operational mode */
    uart->LCR = 0x3;
    uart->MCR_XON1 = 0x3;
    uart->IIR_FCR_EFR = 0x7;

    /* Enter cfg mode A (set LCR:DIV_EN = 0x1) */
    uart->LCR = 0x83;

    /* Configure clock divisor (DLL and DLH regs) */
    uart->THR_DLL_RHR = (UInt32)0x1F;
    uart->IER_DLH = (UInt32)0;

    /* Re-enter normal operational mode */
    uart->LCR = 0x3;

    /* Enable UART */
    uart->MDR1 = 0x0;

    return (Startup_DONE);
}

/*
 *  ======== SysUart_abort ========
 */
Void SysUart_abort(CString str)
{
    Char ch;

    if (str != NULL) {
        while ((ch = *str++) != '\0') {
            SysUart_putch(ch);
        }
    }
}

/*
 *  ======== SysUart_exit ========
 */
Void SysUart_exit(Int stat)
{
}

/*
 *  ======== SysUart_putch ========
 */
Void SysUart_putch(Char ch)
{
    volatile struct Uart *uart = SysUart_uartBaseAddr;

    /* Wait for TX FIFO to become empty */
    while ((uart->LSR & 0x20) == 0);

    uart->THR_DLL_RHR = ch;
}

/*
 *  ======== SysUart_flush ========
 */
Void SysUart_flush()
{
}

/*
 *  ======== SysUart_ready ========
 */
Bool SysUart_ready()
{
    return (TRUE);
}
