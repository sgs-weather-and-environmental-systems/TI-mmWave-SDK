/*
 * Copyright (c) 2012, Texas Instruments Incorporated
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

#ifndef xdc__CSTRING__

#define CString String    /* CString type is new with XDCTOOLS 3.25 */

#endif

#define UART3_BASE          0x48020000
#define UART_BASE           UART3_BASE

#define UART_THR            (UART_BASE + 0x00000000)
#define UART_RHR            (UART_BASE + 0x00000000)
#define UART_DLL            (UART_BASE + 0x00000000)
#define UART_IER            (UART_BASE + 0x00000004)
#define UART_IIR            (UART_BASE + 0x00000008)
#define UART_DLH            (UART_BASE + 0x00000004)
#define UART_FCR            (UART_BASE + 0x00000008)
#define UART_EFR            (UART_BASE + 0x00000008)
#define UART_LCR            (UART_BASE + 0x0000000C)
#define UART_XON1_ADDR1     (UART_BASE + 0x00000010)
#define UART_MCR            (UART_BASE + 0x00000010)
#define UART_LSR            (UART_BASE + 0x00000014)
#define UART_XON2_ADDR2     (UART_BASE + 0x00000014)
#define UART_TCR            (UART_BASE + 0x00000018)
#define UART_XOFF1          (UART_BASE + 0x00000018)
#define UART_MSR            (UART_BASE + 0x00000018)
#define UART_SPR            (UART_BASE + 0x0000001C)
#define UART_TLR            (UART_BASE + 0x0000001C)
#define UART_XOFF2          (UART_BASE + 0x0000001C)
#define UART_MDR1           (UART_BASE + 0x00000020)
#define UART_MDR2           (UART_BASE + 0x00000024)
#define UART_SFLSR          (UART_BASE + 0x00000028)
#define UART_TXFLL          (UART_BASE + 0x00000028)
#define UART_RESUME         (UART_BASE + 0x0000002C)
#define UART_TXFLH          (UART_BASE + 0x0000002C)
#define UART_SFREGL         (UART_BASE + 0x00000030)
#define UART_RXFLL          (UART_BASE + 0x00000030)
#define UART_SFREGH         (UART_BASE + 0x00000034)
#define UART_RXFLH          (UART_BASE + 0x00000034)
#define UART_BLR            (UART_BASE + 0x00000038)
#define UART_UASR           (UART_BASE + 0x00000038)
#define UART_ACREG          (UART_BASE + 0x0000003C)
#define UART_SCR            (UART_BASE + 0x00000040)
#define UART_SSR            (UART_BASE + 0x00000044)
#define UART_EBLR           (UART_BASE + 0x00000048)
#define UART_MVR            (UART_BASE + 0x00000050)
#define UART_SYSC           (UART_BASE + 0x00000054)
#define UART_SYSS           (UART_BASE + 0x00000058)

/*
 *  ======== SysUart_Module_startup ========
 */
Int SysUart_Module_startup(Int phase)
{
    volatile UInt32 *fcrReg = (UInt32*) UART_FCR;
    volatile UInt32 *ierReg = (UInt32*) UART_IER;

    /* ROM Code does the initial config for UART */

    /* Change to FIFO polling mode */
    *fcrReg = (*fcrReg) & (~0x1);

    /* Disable UART Interrupts */
    *ierReg = 0x0;

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
    volatile UInt32 *lsrReg = (UInt32*) UART_LSR;
    volatile UInt32 *ssrReg = (UInt32*) UART_SSR;
    volatile UInt32 *thrReg = (UInt32*) UART_THR;

    /* Check if TX FIFO is empty */
    while (((*ssrReg) & 0x1) || !((*lsrReg) & 0x40));

    *thrReg= (UInt32)ch;
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
