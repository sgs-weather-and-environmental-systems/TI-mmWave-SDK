* ======================================================================== *
* MATHLIB -- TI Floating-Point Math Function Library                       *
*                                                                          *
*                                                                          *
* Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/   *
*                                                                          *
*                                                                          *
*  Redistribution and use in source and binary forms, with or without      *
*  modification, are permitted provided that the following conditions      *
*  are met:                                                                *
*                                                                          *
*    Redistributions of source code must retain the above copyright        *
*    notice, this list of conditions and the following disclaimer.         *
*                                                                          *
*    Redistributions in binary form must reproduce the above copyright     *
*    notice, this list of conditions and the following disclaimer in the   *
*    documentation and/or other materials provided with the                *
*    distribution.                                                         *
*                                                                          *
*    Neither the name of Texas Instruments Incorporated nor the names of   *
*    its contributors may be used to endorse or promote products derived   *
*    from this software without specific prior written permission.         *
*                                                                          *
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     *
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       *
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   *
*  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT    *
*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   *
*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        *
*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   *
*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   *
*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT     *
*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   *
*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    *
* ======================================================================== *

* ======================================================================= *
* divsp.asm - single precision floating point divide                      *
*              optimized hand ASM single sample                           *
* ======================================================================= *

     .if     __TI_EABI__
        .asg    divsp, _divsp
     .endif

    .if (OVERRIDE_RTS = 1)
       .global __divf
       .global __c6xabi_divf
__divf  .set _divsp
__c6xabi_divf .set _divsp
    .else
       .global _divsp   ; entry label	
    .endif

            .sect    ".text:optasm"

_divsp:                                     ; entry to SP FP divide subroutine
                       

           rcpsp   .S2     B4,B5        ; x1 = 1/arg2 [8-bits]
       
           zero    .L1     A3           ; A3 = 0               
       
           mpysp   .M2     B4,B5,B6     ; B6 = arg2 * x1 
       
           extu    .S2     B4,1,24,B0   ; is exp2 = 0 ?    
           set     .S1     A3,30,30,A3  ; A3 = 2.0 in SP FP (0x4000_0000)
       nop             1

           subsp   .L2X    A3,B6,B6     ; B6 = 2.0 - (arg2*x1)
       nop             3
       
           mpysp   .M2     B5,B6,B5     ; x2 = x1*(2 - arg2*x1) [16-bits]
       nop             3
       
           mpysp   .M2     B4,B5,B6     ; B6 = arg2 * x2 
       nop             3
       
           subsp   .L2X    A3,B6,B6     ; B6 = 2.0 - (arg2*x2) 
       nop             3
       
           mpysp   .M2     B5,B6,B5     ; x3 = x2*(2 - arg2*x2) [32-bits]
       nop             1
           b       .S2     b3           ; normal return
       nop             1
   
   [B0]    mpysp   .M1     A4,B5,A4     ; ans = arg1*(x3) where x3 = 1/arg2
|| [!B0]   set     .S1     A4,0,30,A4   ; return exp/mant = all 1s (div.by 0)
 
           nop             3            ; wait for A4 in register
       
       .end
;---------------------End of DIVSP0.asm--------------------------------------

* ======================================================================== *
*  End of file: divsp.asm                                                  *
* ======================================================================== * 
