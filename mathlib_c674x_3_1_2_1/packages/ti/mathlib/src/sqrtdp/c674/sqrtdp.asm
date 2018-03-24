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
* sqrtdp.asm - double precision floating point sqrt                       *
*              optimized hand ASM single sample                           *
* ======================================================================= *
         .if     __TI_EABI__
                    .asg    sqrtdp, _sqrtdp
                    .asg    errno, _errno
         .endif

        .if (OVERRIDE_RTS = 1)
          .global _sqrt
_sqrt .set _sqrtdp                      ; entry in rts6701 library (12-7-99 mod)
        .else
        .global _sqrtdp                 ; entry labels
	    .endif 

		    .global _errno

		    .sect	".text:optasm"


;-------------------------------------------------------------------------+
;       rsqrtdp.asm    Syd Poland    06-24-98  'C67xx DSPs (12-7-99 mod)  |
;       a5:a4 = a5:a4                                                     |
;         ans = 1/Square Root (|arg1|)        DP FP reciprocal SqRt Sub   |
;         ans = all 1s (exp/mant) if biased exp1 = 0                      |
;         ans = 0 if biased exp1 = 0x7ff = 2047                           |
;		where arg1 => 2^(-1022) = 2.225e-308 	biased exp1 > 0   |
;-------------------------------------------------------------------------+
;       9/15/00 mods for biased exp1 = 1                                  |
;-------------------------------------------------------------------------+
;--------------------------------------------------------------------------
;arg1H   .set    a5      ; input DP FP argument1 register pair
;arg1L   .set    a4
;ansH    .set    a5      ; output DP FP answer register pair
;ansL    .set    a4
;VH      .set    a1      ; arg1/2 register pair
;VL      .set    a0
;KH      .set    b5      ; constant 1.5 register pair
;KL      .set    b4
;xH      .set    a7      ; xn register pair
;xL      .set    a6
;tH      .set    a9      ; temp register pair
;tL      .set    a8
;exp1    .set    a2      ; exp1 = 0 switch
;----------------------------------------------------------------------------
_sqrtdp:                                 ; entry to DP FP square root function

 	mvk		1, A8           	; _errno = 1 for EDOM
|| 	mvkl   		_errno, B6      	; address for _errno

	extu		A5,0,31,A1		; extract sign bit
||	mvkh		_errno, B6

        extu    .S1     A5,1,21,A2              ; get exponent 1 field                  
||      zero    .D2     B1                      ; V = 0

        clr     .S1     A5,31,31,A5             ; force arg1 sign bit to +             
|| [A1] stw 		A8, *B6			; yes arg1 < 0, _errno = EDOM
||[!a2] b       .s2     b3                      ; quick exit (exp1=0)

   [a2] rsqrdp  .S1     A5:A4, A7:A6            ; x1 = TLU (1/arg1) [8-bits]

        set     .S2     b1,20,20,b1             ; V = 1 in exponent field
||[!A2] zero    .L1     A5:A4                   ; ans = 0 if exp1 < 1

   [a2] mpydp   .M1     A5:A4, A7:A6, A9:A8     ; t = (arg1) * x1 if exp1>0
        zero    .L2     B5:b4                   ; K = 0            
        set     .S2     B5,19,29,B5             ; 1.5 in DP FP (0x3ff8_0000)
                                                ; end of b b3 exit (exp1=0)
        sub     .L2x    a7,b1,b7                ; w = x1 * 0.5 = x1 / 2
        mv      .L2x    a6,b6
        nop             4
        mpydp   .M1x    b7:b6, A9:A8, A9:A8     ; t = [(arg1*x1)] * (x1 / 2)
        nop             8
        subdp   .L1x    B5:B4, A9:A8, A9:A8     ; t = 1.5-[(arg1*x1)]*(x1/2)
        nop             5
        mpydp   .M1     A7:A6, A9:A8, A7:A6     ; x2=x1*{1.5-(arg1*x1)*(x1/2)}
        nop             8

        mpydp   .M1     A5:A4, A7:A6, A9:A8     ; t = (arg1) * x2
        sub     .L2x    a7,b1,b7                ; w = x2 * 0.5 = x2 / 2
        mv      .L2x    a6,b6
        nop             6
        mpydp   .M1x    b7:b6, A9:A8, A9:A8     ; t = [(arg1*x2)] * (x2 / 2)
        nop             8
        subdp   .L1x    B5:B4, A9:A8, A9:A8     ; t = 1.5-[(arg1*x2)]*(x2/2)
        nop             5
        mpydp   .M1     A7:A6, A9:A8, A7:A6     ; x3=x2*{1.5-(arg1*x2)*(x2/2)}
        nop             8

        mpydp   .M1     A5:A4, A7:A6, A9:A8     ; t = (arg1) * x3
        sub     .L2x    a7,b1,b7                ; w = x3 * 0.5 = x3 / 2
        mv      .L2x    a6,b6
        nop             6
        mpydp   .M1x    b7:b6, A9:A8, A9:A8     ; t = [(arg1*x3)] * (x3 / 2)
        nop             8
        subdp   .L1x    B5:B4, A9:A8, A9:A8     ; t = 1.5-[(arg1*x3)]*(x3/2)
        nop             5
        mpydp   .M1     A7:A6, A9:A8, A7:A6     ; x4=x3*{1.5-(arg1*x3)*(x3/2)}
        nop             8

   [A2] mpydp   .M1     A5:A4, A7:A6, A5:A4     ; ans=arg1*x4 if exp1>0

         nop            3
         b      .S2     b3                      ; normal return
         nop            5                       ; wait for ans in register pair
         .end
;--------------End of DP FP Square Root-----------------------------

* ======================================================================== *
*  End of file: rsqrtdp.asm                                                *
* ======================================================================== *
