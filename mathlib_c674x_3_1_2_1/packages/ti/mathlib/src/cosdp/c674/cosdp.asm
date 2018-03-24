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

* ======================================================================== *
* cosdp.asm - double precision floating point cosine                       *
*              optimized hand ASM single sample                            *
* ======================================================================== *

                .if     __TI_EABI__
                     .asg    cosdp, _cosdp
                .endif
;       .global _InvPIsdp,_C1,_C2,_r8,_r7,_r6,_r5,_r4,_r3,_r2,_r1,_PIsdp   |
                                                  ;                        |
;           .global _HPisDP                        ; keep this order        |
           .data                                  ; data pointer           |
_HPisDP    .double  1.57079632679489661923        ; [-1]                   |
_InvPIsdp: .double  0.31830988618379067154        ; [0]                    |
_C1        .double  3.1416015625                  ; [1]                    |
_C2        .double -8.908910206761537356617e-6    ; [2]                    |
_r8        .double  2.7204790957888846175e-15     ; [3]                    |
_r7        .double -7.6429178068910467734e-13     ; [4]                    |
_r6        .double  1.6058936490371589114e-10     ; [5]                    |
_r5        .double -2.5052106798274584544e-8      ; [6]                    |
_r4        .double  2.7557319210152756119e-6      ; [7]                    |
_r3        .double -1.9841269841201840457e-4      ; [8]                    |
_r2        .double  8.3333333333331650314e-3      ; [9]                    |
_r1        .double -1.6666666666666665052e-1      ; [10]                   |
                                                  ;                        |
;_PIsdp    .double  3.14159265358979323846        ; [11] {not used}        |
                                       
        .if (OVERRIDE_RTS = 1)
          .global _cos
_cos .set _cosdp                  ; rts6701 library Cosine entry
        .else
          .global _cosdp          ; Cosine entry labels                      |
        .endif
        
        .align 32               ; Fetch packet boundary                    |
                                        ;                                  |
        .sect ".text:optasm"            ;                                  |
                                        ;                                  |
                                        ;                                  |
_HPiLsdp .set 0x54442d18        ; HalfPI in DP FP as two 32-bit hex-words  |
_HPiHsdp .set 0x3ff921fb        ; PI/2 = 1.57079632679489661923            |
;--------------------------------------------------------------------------+

;-----------------------------------------------------------------------+
;AH      .set    a5      ; arg1 = 64-bit DP FP input radian value       |
;AL      .set    a4                                                     |
;ansH    .set    a5      ; ans = 64-bit DP FP output Cosine answer      |
;ansL    .set    a4                                                     |
;P       .set    b2      ; 32-bit pointer to coefficients               |
;V       .set    a2      ; V switch for big arguments                   |
;Sign    .set    a1      ; sign switch (LS-bit)                         |
;Sbit    .set    b0      ; sign bit in MS-bit                           |
;exp     .set    a0      ; exp. value                                   |
;Z       .set    b0      ; Z switch for small arguments                 |
;OK      .set    b1      ; |arg| < PI (no reduction needed)             |
;TL      .set    b4      ; T = tmp LDDW value for one side of pipe      |
;TH      .set    b5                                                     |
;SL      .set    a0      ; S = tmp LDDW value for other side of pipe    |
;SH      .set    a1                                                     |
;FL      .set    a6      ; F = reduced argument                         |
;FH      .set    a7                                                     |
;ZL      .set    b6      ; Z = temp                                     |
;ZH      .set    b7                                                     |
;RL      .set    b8      ; R = work                                     |
;RH      .set    b9                                                     |
;GL      .set    a8      ; G = extra                                    |
;GH      .set    a9                                                     |
;XL      .set    a2      ; X = etc.                                     |
;XH      .set    a3                                                     |
;YL      .set    b0      ; Y = misc.                                    |
;YH      .set    b1                                                     |
;-----------------------------------------------------------------------+

_cosdp_asm:

* ======================================================================== *
*S Place source code here.                                                S*
* ======================================================================== *
;----------------------DP FP Cosine of arg1 radians-----------------------
_cosdp:                         ; DP FP Cosine of arg1 in radians

        mvkl    .s2     _HPiLsdp,B4             ; T = PI/2
||      mvkl    .s1     _HPiHsdp,A2             

        mvkh    .s2     _HPiLsdp,B4
||      mvkh    .s1     _HPiHsdp,A2

        mv      .l2x    A2,B5                   ; T = PI/2
||      clr     .s1     A5,31,31,A5             ; |arg1|

        adddp   .l1x    A5:A4, B5:B4, A5:A4     ; new arg1 = |old arg1| + PI/2
                                                ; continue into sindp

;----------------------DP FP Sine of arg1 radians-----------------------
;_sin:                           ; rts6701 library Sine entry
;_sindp:                         ; DP FP Sine of arg1 in radians

        mvkl    .s2     _InvPIsdp,B2            ; P = 32-bit pointer to 1/PI
        mvkh    .s2     _InvPIsdp,B2
        lddw    .d2     *-B2[1], B9:B8          ; R = PI/2
        lddw    .d2     *B2, B5:B4              ; T = 1/PI
        mvkl    .s2     1023-20,B0              ; small numbers exp.
        mvkl    .s1     1023+30,A2              ; large numbers exp.

        mv      .d1     A5,A1
||      clr     .s1     A5,31,31,A5             ; force + sign in arg1

        cmpltdp .s2x    A5:A4, B9:B8, B1        ; OK=true if |A| < PI/2 

        extu    .s1     A5,1,21,A0              ; exp of arg1

        cmpgt   .l1     A0,A2,A2                ; V=true for large numbers
|| [B1] b       .s2     LTpi                    ; |A|<PI/2, no reduction needed
||[!B1] mpydp   .m1x    A5:A4, B5:B4, A7:A6     ; F = arg1 * ( 1 / PI )
||      lddw    .d2     *+B2[1], B5:B4          ; T = C1 (approximate PI)

        cmplt   .l2     A0,B0,B0                ; Z=true for small numbers
||      lddw    .d2     *+B2[2], A9:A8          ; G = C2 (rest of PI)

        extu    .s1     A1,0,31,A1              ; sign bit of arg1 ---> bit 0

        nop             1                       ; wait for [OK] b LTpi instr

   [A2] b       .s2     b3                      ; return large number answer=0
|| [A2] and     .l1     A5,0,A5                 ; large number answer = 0
|| [A2] sub     .d1     A4,A4,A4                ; large number answer = 0

        nop             1                       ;end of [OK] b LTpi instruction
        nop             3                       ; wait for F
        nop             1                       ;end of [V]  b b3   instruction

        dpint   .l1     a7:a6, A2               ; V = nearest int(double F)
        nop             3                       ; wait for V
        intdp   .l2x    A2, B7:B6               ; Z = double(int V)
        nop             4                       ; wait for Z

        mpydp   .m2     B7:B6, B5:B4, B7:B6     ; Z = Z * C1
||      mpydp   .m1x    B7:B6, A9:A8, A7:A6     ; G = Z * C2

        nop             8                       ; wait for Z (and G)
        subdp   .l1x    A5:A4, B7:B6, A5:A4     ; A = A - Z*C1 = reducing arg.
        nop             3                       ; wait for A   
        and     .l1     A2,1,A2                 ; is V odd?
 [A2]   xor     .s1     1,A1,A1                 ;if Yes, reverse sign in bit 0
        subdp   .l1     A5:A4, A7:A6, A5:A4     ; A=(A-Z*C1)-Z*C2=reduced arg.
        nop             5                       ; wait for A

LTpi:                                           ; label if no arg. reduction
        mpydp   .m1     A5:A4, A5:A4, A7:A6     ; F = A*A
||      lddw    .d2     *+B2[3], B5:B4          ; T = r8
||      extu    .s1     A5,1,21,A2              ; reduced exp
||      mvkl    .s2     1023-20,B1              ; MIN exp

        cmplt   .l1x    A2,B1,A2                ; V = true for small exp
||      extu    .s1     A1,31,0,A1              ; move sign to bit 31

        lddw    .d2     *+B2[4], A1:A0          ; S = r7
||      mv      .l2x    A1,B0                   ; sign = bit 31 position

        nop             1                       ; wait for mpydp to finish

   [A2] b       .s2     b3                      ; return small answer exit
|| [A2] or      .l1x    A5,B0,A5                ; set sign bit for small ans

        nop             5                       ; wait for F (or take b b3)

  [!A2] mpydp   .m1     A7:A6, A7:A6, A9:A8     ; G = F*F = (A*A) * (A*A)
        nop             8                       ; wait for G

        mpydp   .m2x    A9:A8, B5:B4, B9:B8     ; R = G*r8
||      mpydp   .m1     A9:A8, A1:A0, A3:A2     ; S = G*r7
||      lddw    .d2     *+B2[5], B5:B4          ; T = r6

        lddw    .d2     *+B2[6], A1:A0          ; S = r5
        nop             7                       ; wait for R & X

        adddp   .l2     B9:B8, B5:B4, B9:B8     ; R = G*r8 + r6
||      adddp   .l1     A3:A2, A1:A0, A3:A2     ; X = G*r7 + r5

        nop             5                       ; wait for R & X

        mpydp   .m2x    A9:A8, B9:B8, B9:B8     ; R = (G*r8 + r6)*G
||      mpydp   .m1     A9:A8, A3:A2, A3:A2     ; X = (G*r7 + r5)*G
||      lddw    .d2     *+B2[7], B5:B4          ; T = r4

        lddw    .d2     *+B2[8], A1:A0          ; S = r3
        nop             7                       ; wait for R & X

        adddp   .l2     B9:B8, B5:B4, B9:B8     ; R = (G*r8 + r6)*G + r4
||      adddp   .l1     A3:A2, A1:A0, A3:A2     ; S = (G*r7 + r5)*G + r3

        nop             5                       ; wait for R & X

        mpydp   .m2x    A9:A8, B9:B8, B9:B8     ; R = { (G*r8 + r6)*G + r4 }*G
||      mpydp   .m1     A9:A8, A3:A2, A3:A2     ; X = { (G*r7 + r5)*G + r3 }*G
||      lddw    .d2     *+B2[9], B5:B4          ; T = r2

        lddw    .d2     *+B2[10], A1:A0         ; S = r1
        nop             7                       ; wait for R & X

        adddp   .l2     B9:B8, B5:B4, B9:B8     ; R = {(G*r8+r6)*G+r4}*G+r2
||      adddp   .l1     A3:A2, A1:A0, A3:A2     ; S = {(G*r7+r5)*G+r3}*G+r1

        nop             5                       ; wait for R & X

        mpydp   .m2x    A9:A8, B9:B8, B9:B8     ; R=[{(G*r8+r6)*G+r4}*G+r2]*G
||      mpydp   .m1     A7:A6, A3:A2, A3:A2     ; X=[{(G*r7+r5)*G+r3}*G+r1]*F

        nop             8                       ; wait for R & X
        adddp   .l2     B9:B8, A3:A2, B9:B8     ; R = R + X
        nop             5                       ; wait for R
        mpydp   .m2x    B9:B8, A5:A4, B9:B8     ; R = R * A
        nop             8                       ; wait for R
        adddp   .l1x    A5:A4, B9:B8, A5:A4     ; A = A + R (answer w/o sign)
        nop             1                       ; part of adddp wait
        b       .s2     b3                      ; normal exit (answer = A5:A4)
        nop             4                       ; wait for A
 [B0]   xor     .l1     A5,B0,A5                ; add the sign bit and return

        .end
;---------------------End of DP FP Cosine & Sine---------------------------------

* ======================================================================== *
*  End of file: cosdp_h.asm                                                *
* ======================================================================== *
