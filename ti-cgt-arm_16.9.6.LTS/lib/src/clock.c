/****************************************************************************/
/*  clock v16.9.6                                                           */
/*                                                                          */
/* Copyright (c) 1993-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/


#include <time.h>
#include <abi_prefix.h>
extern clock_t HOSTclock();

/****************************************************************************/
/* This is the standard default implementation of clock(). It dispatches    */
/* to HOSTclock(), which uses the CIO ABI to request a cycle count from     */
/* the host. For many devices the host side implementation doesn't work and */
/* this function will always return 0.                                      */
/****************************************************************************/
_CODE_ACCESS clock_t clock(void)   
{
    return (clock_t)HOSTclock();
}

/****************************************************************************/
/* We use a const variable for CLOCKS_PER_SEC so clock() and CLOCKS_PER_SEC */
/* can be provided by user code. The values below are just the defaults for */
/* CLOCKS_PER_SEC. Their values are historical.                             */
/****************************************************************************/
#define DEFAULT_CLOCKS_PER_SEC 1000

_DATA_ACCESS const __clocks_per_sec_t __TI_P(CLOCKS_PER_SEC) = DEFAULT_CLOCKS_PER_SEC;




