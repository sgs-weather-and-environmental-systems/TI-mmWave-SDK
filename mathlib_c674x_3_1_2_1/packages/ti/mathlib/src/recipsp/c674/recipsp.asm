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
* recipsp.asm - single precision floating point reciprocal                *
*              optimized hand ASM single sample                           *
* ======================================================================= *
        
        .if     __TI_EABI__
           .asg    recipsp, _recipsp
        .endif

        .if (OVERRIDE_RTS = 1)
          .global _recipf
_recipf .set _recipsp                 ; entry in rts67xx library [not specified]
        .else
          .global _recipsp            ; entry labels		
	    .endif 

		    .sect	".text:optasm"

_recipsp:                               ; entry to SP FP reciprocal subroutine

           rcpsp   .S1     A4,A5        ; x1 = 1/A4 [8-bits]
	   
           zero    .L1     A3           ; two = 0
	   
           mpysp   .M1     A4,A5,A6     ; tmp = arg1 * x1 
 ||        mvkl    .S1     0xff,A2      ; maximum exponent = 255
	   
           extu    .S1     A4,1,24,A1   ; is exp1 = 0 ?    

           set     .S1     A3,30,30,A3  ; two = 2.0 in SP FP (0x4000_0000)

           xor     .L1     A1,A2,A2     ; check for exp1=255=0xff

           subsp   .L1     A3,A6,A6     ; tmp = 2.0 - (arg1*x1)

           nop             3
	   
           mpysp   .M1     A5,A6,A5     ; x2 = x1*(2 - arg1*x1) [16-bits]

           nop             3
	   
           mpysp   .M1     A4,A5,A6     ; tmp = arg1 * x2 

           nop             3

   [A2]    subsp   .L1     A3,A6,A6     ; tmp = 2.0 - (arg1*x2) 

   [!A2]   zero    .D1     A5           ; force xn=0 for exp=255=0xff           

           b       .S2     b3           ; normal return           

   [!A2]   zero    .D1     A6           ; force tmp=0 for exp=255=0xff

   [A1]    mpysp   .M1     A5,A6,A4     ; x3 = x2*(2 - arg1*x2) [32-bits]

           nop             2
  
   [!A1]   set     .S1     A4,0,30,A4   ; return exp/mant = all 1s (div.by 0)
	   
	   .end
;------------------End of RECIPSP0.asm---------------------------------------

* ======================================================================== *
*  End of file: recipsp.asm                                                *
* ======================================================================== *
