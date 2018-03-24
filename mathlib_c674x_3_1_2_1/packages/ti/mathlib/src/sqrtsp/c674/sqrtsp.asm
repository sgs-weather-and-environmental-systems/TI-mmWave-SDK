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
* sqrtsp.asm - single precision floating point sqrt                       *
*              optimized hand ASM single sample                           *
* ======================================================================= *

        .if     __TI_EABI__
           .asg    sqrtsp, _sqrtsp
           .asg    errno,  _errno
        .endif
        .global _errno     	; entry labels			  
        
        .if (OVERRIDE_RTS = 1)
          .global _sqrtf
_sqrtf .set _sqrtsp                  ; entry labels
        .else
          .global _sqrtsp            ; entry labels			  
	    .endif

		    .sect	".text:optasm"  

_sqrtsp:                  ; find square root of arg1 all in SP FP

		mvk		1, A5           ; _errno = 1 for EDOM
|| 		mvkl   		_errno, B6      ; address for _errno

		extu		A4,0,31,A2	; extract sign bit
||		mvkh		_errno, B6

        extu    .S1     A4,1,24,A1      ; get exponent field
||      zero    .L2     b5:B4           ; 1.5:0

        clr     .S1     A4,31,31,A4     ; force + sign (abs. of arg1)
||      set     .S2     B4,23,23,B4     ; one in exp. field = 0x0080_0000

        rsqrsp  .S1     A4,A0           ; X0 = TLU to 8-bits
|| [A2] stw 		A5, *B6		; yes arg1 < 0, _errno = EDOM


  [a1]  mpysp   .M1     A4,a0,A3        ; arg1*X0 if 0 < exp1
||[!a1] b       .s2     b3              ; quick exit (exp1=0)

  [!a1] zero    .d1     a4              ; ans = 0 (exp1=0)
        sub     .L2x    A0,b4,b6        ; x0 * 0.5 = x0/2
        set     .S2     B5,22,29,B5     ; 1.5 in SP FP = 0x3fc0_0000

  [a1]  mpysp   .M1x    a3,b6,A5        ; (arg1*X0) * (X0/2)
        nop             1               ; end of b b3 quick exit (exp1=0)
        nop             2               ; wait for mpysp

        subsp   .L1x    B5,A5,A2        ; 1.5 - (arg1*X0)*(X0/2)
        nop             3               ; wait for subsp

        mpysp   .M1     A0,A2,A0        ; X1 = X0*(1.5 - (arg1*X0)*(X0/2) )
        nop             3               ; wait for mpysp

        mpysp   .M1     A4,a0,A3        ; arg1*X1
        sub     .L2x    A0,b4,b6        ; x1 * 0.5 = x1/2
        nop             2               ; wait for mpysp

        mpysp   .M1x    A3,b6,A5        ; (arg1*X1) * (X1/2)
        nop             3               ; wait for mpysp

        subsp   .L1x    B5,A5,A2        ; 1.5 - (arg1*X1)*(X1/2)
        nop             3               ; wait for subsp

        mpysp   .M1     A0,A2,A0        ; X2 = X1*{1.5 - (arg1*X1)*(X1/2)}
        nop             1
        b       .S2     b3              ; normal return
        nop             1               ; wait for mpysp

        mpysp   .m1     a0,a4,a4        ; ans = X2 * arg1
        nop             3               ; wait for mpysp ans in register
       .end

;--------------------End of SP FP sqrt(arg1)----------------------------

                .end

* ======================================================================== *
*  End of file: sqrtsp.asm                                                 *
* ======================================================================== *
