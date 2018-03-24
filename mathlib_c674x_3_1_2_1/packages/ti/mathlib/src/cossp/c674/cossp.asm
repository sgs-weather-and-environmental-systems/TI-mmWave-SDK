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
* cossp.asm - single precision floating point cosine                      *
*              optimized hand ASM single sample                           *
* ======================================================================= *

;---------------------------------------------------------------+
PIo2ssp  .set    0x3fc90fdb      ; PI/2 = 1.5707964 (in SP FP)	|
InvPissp .set    0x3ea2f983      ; 1/PI = 0.31830987            |
C1ssp    .set    0x40490000      ; C1   = 3.1406250             |
C2ssp    .set    0x3a7daa22      ; C2   = 9.6765358e-4          |
s4ssp    .set    0x362e9c5b      ; s4   = 2.6019031e-6          |
s3ssp    .set    0xb94fb222      ; s3   =-1.9807418e-4          |
s2ssp    .set    0x3c08873e      ; s2   = 8.3330255e-3          |
s1ssp    .set    0xbe2aaaa4      ; s1   =-1.6666657e-1          |
PIssp    .set    0x40490fdb      ; PI   = 3.1415927             |
                                          ;                     |
;-------------SP FP Cosine--------------------------------------+
        .if     __TI_EABI__
           .asg    cossp, _cossp
        .endif          
        
        .if (OVERRIDE_RTS = 1)
		    .global _cosf
_cosf .set _cossp               ; rts entry for SP FP Cosine function (radians)
		.else
        .global _cossp          ; cosine entry labels                   
        .endif

		    .sect	".text:optasm"


;-------------SP FP Cosine------------------------------------------------
_cossp:                 ; entry for SP FP Cosine function (radians)

           mvkl    .S2     PIo2ssp,B6           ; SP FP PI/2 = 1.5707964
||         clr     .S1     A4,31,31,A4          ; arg1 = |arg1|

           mvkh    .S2     PIo2ssp,B6

           addsp   .L1x    B6,A4,A4             ; new arg1 = |arg1| + PI/2
           nop             1                    ; wait for cosine new arg1
                                                ; continues into SP FP Sine

;-------------SP FP Sine--------------------------------------------------
;_sinf:                  ; rts entry for SP FP Sine function (radians)
;_sinsp:                 ; entry for SP FP Sine function (radians)

           mvkl    .S1     InvPissp,A5          ; T = 1/Pi
           mvkh    .S1     InvPissp,A5
           mv      .L2X    A4,B4       
           extu    .S2     B4,1,1,B4            ; Y = absolute arg1
           mpysp   .M2X    B4,A5,B5             ; X = Y*(1/Pi)
           nop             3                    ; wait for mpysp X
           spint   .L2     B5,B5                ; X = int(X)
           mvkl    .S1     C1ssp,A5             ; T = C1 coef.
           mvkh    .S1     C1ssp,A5
           nop             1                    ; wait for spint X
           intsp   .L2     B5,B1                ; Z = float (X)
           nop             3                    ; wait for intsp Z
           mpysp   .M1X    B1,A5,A3             ; F = X * C1
           mvkl    .S1     C2ssp,A5             ; T = C2 coef.
           mvkh    .S1     C2ssp,A5
           nop             1                    ; wait for mpysp F 

           subsp   .L2X    B4,A3,B4             ; Y = Y - X*C1
||         mpysp   .M1X    B1,A5,A7             ; G = X * C2
           nop             3                    ; wait for mpysp G

           subsp   .L1X    B4,A7,A3             ; F = (Y - X*C1) - X*C2
           nop             3                    ; wait for subsp F
           mpysp   .M1     A3,A3,A7             ; G = F*F

           mvkl    .S1     s4ssp,A5             ; T = s4 coef.
||         mvkl    .S2     s3ssp,B6             ; Tmp = s3 coef.

           mvkh    .S1     s4ssp,A5
||         mvkh    .S2     s3ssp,B6

           nop             1                    ; wait for mpysp G

           mpysp   .M1     A7,A7,A8             ; H = G*G = F*F*F*F
           nop             3                    ; wait for mpysp H

           mpysp   .M1     A8,A5,A0             ; R = H*s4
||         mpysp   .M2X    A8,B6,B2             ; S = H*s3

           mvkl    .S1     s2ssp,A5             ; T = s2 coef.
||         mvkl    .S2     s1ssp,B6             ; Tmp = s1 coef.

           mvkh    .S1     s2ssp,A5      
||         mvkh    .S2     s1ssp,B6

           nop             1                    ; wait for mpysp R & S

           addsp   .L1     A5,A0,A0             ; R = s2 + H*s4
||         addsp   .L2     B6,B2,B2             ; S = s1 + H*s3

           nop             3                    ; wait for addsp R & S

           mpysp   .M1     A8,A0,A0             ; R = H*(s2 + H*s4)
||         mpysp   .M2     A7,B2,B2             ; S = G*(s1 + H*s3)

           nop             3                    ; wait for mpysp R & S
           addsp   .L1     B2,A0,A0             ; R = G*(s1+H*s3) + H*(s2+H*s4)
           nop             2
           mvkl    .S1     127+20,A2            ; large exp. = 2^+20

           mpysp   .M1     A3,A0,A0             ; R = F*R
||         mv      .L2X    A4,B4                ; Y = arg1
||         extu    .S1     A4,1,24,A1           ; input arg1's exponent

           extu    .S2     B4,0,31,B0           ; input arg1's sign
||         and     .S1X    1,B5,A1              ; is X odd ?
||         cmpgt   .L1     A1,A2,A2             ; return ans=0 for large exps.

           extu    .S1     A3,1,24,A1           ; new reduced exp
|| [ A1]   xor     .L2     1,B0,B0              ; yes (X is odd), reverse sign
||         mvkl    .S2     127-12,B1            ; small exp. = 2^-12

           cmplt   .L2X    A1,B1,B1             ; reduced exp < small exp ?

   [!B1]   addsp   .L1     A3,A0,A4             ; abs. answer (not small exp1)
|| [ B1]   mv      .S1     A3,A4                ; return small F
||         b       .S2     b3                   ; normal  return

           extu    .S2     B0,31,0,B0           ; move to sign bit
           nop             2                    ; wait for addsp ans
   [ B0]   xor     .L1X    B0,A4,A4             ; flip negative sign
   [ A2]   zero    .D1     A4                   ; large arg1, return 0

           .end
;------------------------End of SP FP Sine/Cosine-----------------------------


* ======================================================================== *
*  End of file: cossp.asm                                                  *
* ======================================================================== * 

