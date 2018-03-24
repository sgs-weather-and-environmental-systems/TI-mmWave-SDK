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
* exp2sp.asm - double precision floating point exp base 2                 *
*              optimized hand ASM single sample                           *
* ======================================================================= *

                .if     __TI_EABI__
                    .asg    exp2dp, _exp2dp
                    .asg    divdp, _divdp
                    .asg    errno, _errno
                .endif

;---------------------------------------------------------------------------+
; name = expdp.asm in Fast67 library	7/12/00		        	    |
;---------------------------------------------------------------------------+
;      expdp1.asm              11-18-99  DP FP exp function for 'C67xx DSPs |
;---------------------------------------------------------------------------+
;      expdp   = DP FP exp (base e)  function in C for 'C67xx DSPs          |
;      exp10dp = DP FP exp (base 10) function in C for 'C67xx DSPs          |
;      exp2dp  = DP FP exp (base 2)  function in C for 'C67xx DSPs          |
;---------------------------------------------------------------------------+
        ;.global _expdp,   _exp                  ; DP FP exp(base e)         |
        ;.global _exp10dp, _exp10                ; DP FP exp(base10)         |
        ;.global _exp2dp,  _exp2                 ; DP FP exp(base 2)         |
        .global _divdp,   __divd                ; DP FP divide
        
	    .if (OVERRIDE_RTS = 1)
           .global _exp2
_exp2 .set _exp2dp                  ; rts entry
        .else
           .global _exp2dp
	    .endif
                      
	.global _errno      			; error number		    |
;---------------------------------------------------------------------------+
; #include <math.h>
;
; extern double exp(double)   ;    /* DP FP exp (base  e)  */
; extern double exp10(double) ;    /* DP FP exp (base 10)  */
; extern double exp2(double)  ;    /* DP FP exp (base  2)  */

; extern double fxexpE(int)    ;    /* fix DP exp as a power of 2  */
; extern int    gtintE(double) ;    /* get unbiased DP int  */
;--------------------------------------------------------------------------+
        .data                                   ;                          |
Mine    .double  2.2250738585072014e-308        ; smallest DP FP #         |
                                                ;                          |
C2E     .double -2.1219444005469058277e-4       ; [-4] lne(2) - 355/512    |
c1E     .double  0.693359375                    ; [-3] 355/512             |
Halfe   .double  0.5                            ; [-2]                     |
Zeroe   .double  0.0                            ; [-1]                     |
;        .global	 OneExp2			; Data pointer, Keep this order    |
OneExp2 .double  1.0                            ; [0]                      |
LnMine  .double -708.3964185322641              ; [1] lne of Mine          |
LnMaxe  .double  709.7827138470578              ; [2] lne of Maxe          |
Maxe    .double  1.7976931348623157e+308        ; [3] largest DP FP #      |
L2e     .double  1.4426950408889634074          ; [4] log (base  2) of e   |
c1e     .double  0.693359375                    ; [5] 355/512              |
C2e     .double -2.1219444005469058277e-4       ; [6] lne(2) - 355/512     |
a0e     .double  2.49999999999999993e-1         ; [7] numerator coefs.     |
a1e     .double  6.94360001511792852e-3         ; [8]                      |
a2e     .double  1.65203300268279130e-5         ; [9]                      |
b0e     .double  0.5                            ; [10] denominator coefs.  |
b1e     .double  5.55538666969001188e-2         ; [11]                     |
b2e     .double  4.95862884905441294e-4         ; [12]                     |
                                                ;                          |
L10e    .double  0.43429448190325182765         ; log (base 10) of e       |
                                                ;                          |
Ln2     .double  0.6931471805599453094172321    ; log (base  e) of 2       |
Epse    .double  1.110223025e-16                ;  2^-53                   |
c10E    .double  0.434294481903251              ; log(base 10) of e        |
Ln10    .double  2.302585092994046              ; ln (base e) of 10        |
;--------------------------------------------------------------------------+

;a1H     .set    a5      ; argument 1
;a1L     .set    a4
;a2H     .set    b5      ; argument 2
;a2L     .set    b4
;YH      .set    a7      ; Y
;YL      .set    a6
;ZH      .set    a9      ; Z
;ZL      .set    a8
;XH      .set    a3      ; X
;XL      .set    a2
;WH      .set    b9      ; W
;WL      .set    b8
;Q       .set    b2      ; quick exit switch
;S       .set    a1      ; switch
;P       .set    a0      ; pointer to DP FP data
;N       .set    b10     ; int N in 2^N
;Save    .set    a10     ; return address save reg.

;-------------------------------------------------------------------------+
SP:     .set    b15             ; stack pointer.                          |
Ln10H   .set    0x40026bb1      ; 2.302585092994046                       |
Ln10L   .set    0xbbb55516      ;                                         |
Ln2H    .set    0x3fe62e42      ; 0.6931471805599453094172321             |
Ln2L    .set    0xfefA39ef      ;                                         |
epsExp  .set    0x3ca0          ; exp of 2^-53 = 1.11e-16                 |
halfExp .set    0x3fe0          ; exp of 0.5                              |
;-------------------------------------------------------------------------+
        .align  32              ; fetch packet boundary
;______________________________________________________________________
;_exp:                   ; rts entry

		    .sect	".text:optasm"

_expdp:                 ; DP FP exp (base e) of LnMIN < Arg1 < LnMAX

        mvkl    OneExp2,A0                ; P = ptr to Data
||      mv      A4,A8
||      zero    B5                      ; arg2 = 0

        mvkh    OneExp2,A0
||      zero    B4

        lddw    *+A0[1], A3:A2          ; X = lne MIN

        extu    A5,1,1,A9               ; Z = | arg1 |
||      mvklh   epsExp,B5               ; arg2 = eps = 2^-53
||      lddw    *+A0[2], B9:B8          ; W = lne MAX

        cmpltdp A9:A8, B5:B4, A1        ; is | arg1 | < eps ?
        lddw    *+A0[0], A7:A6          ; yes arg1 < eps, Y = 1.0
        mv      A1,B2                   ; quick exit switch

        cmpltdp A5:A4, A3:A2, A1        ; is arg1 < lne MIN ?
        lddw    *+A0[4], B5:B4          ; arg2 = Ln(base 2) of e
        or      A1,B2,B2                ; update quick exit switch

        cmpgtdp A5:A4, B9:B8, A1        ; is arg1 > lne MAX ?
|| [A1] zero    A7                      ; yes arg1 < lne MIN, Y=0.0 (0 exp)
        
        nop     1                       ; wait for cmpgtdp S

   	mvk	2, B8		        ; _errno = 2 for ERANGE
 	mvkl    _errno, B9      	; address for _errno

   	mvkh    _errno, B9

        
   [A1] lddw    *+A0[3], A7:A6          ; yes arg1 > lne MAX, Y = MAX
||      or      A1,B2,B2                ; update quick exit switch
|| [A1] stw	B8, *B9			; yes arg1 > lne MAX, _errno = ERANGE

   [B2] b       b3                      ; quick exit
||[!B2] mpydp   A5:A4, B5:B4, B5:B4     ; arg2 = arg1*ln2(e) if not quick exit

        nop     3                       ; wait for lddw Y
 [B2]   mv      A7,A5                   ; ans=arg1 = Y for the quick exit
 [B2]   mv      A6,A4                   ; end of quick exit branch to b3

        stw     B10,*SP--[2]            ; push N
        stw     A10,*+SP[1]             ; push Save
        mv      b3,A10                  ; save b3; wait for mpydp arg2
        lddw    *+A0[5], A7:A6          ; Y = c1
        dpint   B5:B4, B10                ; get integer part of |arg1|*ln2(e)
        nop     3                       ; wait for dpint N

        intdp   B10, B5:B4              ; convert int N to DP FP arg2
||      lddw    *+A0[6], A9:A8          ; Z = c2
||      extu    A5,0,31,A1              ; S = sign of arg1

        nop     4                       ; wait for intdp arg2
        
        mpydp   B5:B4, A7:A6, A3:A2     ; X = N*c1
||      mpydp   B5:B4, A9:A8, B5:B4     ; arg2 = N*c2

        nop     8                       ; wait for mpydp X & arg2
        subdp   A5:A4, A3:A2, A5:A4     ; arg1 = arg1 - N*c1
        nop     5                       ; wait for subdp arg1
        subdp   A5:A4, B5:B4, A5:A4     ; arg1 = arg1 - N*c2
        nop     5                       ; wait for subdp arg1
        mpydp   A5:A4, A5:A4, A3:A2     ; X = arg1 * arg1
        lddw    *+A0[12], A9:A8         ; Z = b2
        lddw    *+A0[9], B9:B8          ; W = a2
        nop     6                       ; wait for mpydp X

        mpydp   A9:A8, A3:A2, A7:A6     ; Y = b2 * X
||      mpydp   B9:B8, A3:A2, B5:B4     ; arg2 = a2 * X

        lddw    *+A0[11], A9:A8         ; Z = b1
        lddw    *+A0[8], B9:B8          ; W = a1
        nop     6                       ; wait for mpydp Y & arg2

        adddp   A7:A6, A9:A8, A7:A6     ; Y = b2*X + b1
||      adddp   B5:B4, B9:B8, B5:B4     ; arg2 = a2*X + a1
||      lddw    *+A0[10], A9:A8         ; Z = b0

        lddw    *+A0[7], B9:B8          ; W = a0
        nop     4                       ; wait for adddp Y & arg2 & lddw W

        mpydp   A7:A6, A3:A2, A7:A6     ; Y = (b2*X+b1) * X
||      mpydp   B5:B4, A3:A2, B5:B4     ; arg2 = (a2*X+a0) * X

        nop     8                       ; wait for mpydp Y & arg2

        adddp   A7:A6, A9:A8, A7:A6     ; Y = (b2*X+b1)*X + b0
||      adddp   B5:B4, B9:B8, B5:B4     ; arg2 = (a2*X+a1)*X + a0

        nop     5                       ; wait for adddp Y & arg2
        mpydp   B5:B4, A5:A4, A5:A4     ; arg1 = {(a2*X+a1)*X+a0}*arg1
        nop     8                       ; wait for mpydp arg1

        subdp   A7:A6, A5:A4, A7:A6     ; Y = Y - arg1
||      mvkl    _divdp,b3               ; far call to DP FP divide

        mvkh    _divdp,b3
        b       b3                      ; far call to DP FP divide
        nop     1
        mvkl    RetE2,b3
        mvkh    RetE2,b3
        mv      A6,B4                   ; arg2 = Y
        mv      A7,B5                   ; end of branch to DP FP DIV

RetE2:  zero    B4                      ; return label from DP FP DIV
||      zero    B5

        mvklh   halfExp,B5              ; arg2 = DP FP 0.5 = 0x3fe_0000

        adddp   A5:A4, B5:B4, A5:A4     ; arg1 = arg1 + 0.5
        zero    b4
        mvkl    1024,B5                 ; exp. bias of 2^1
        add     B5,B10,B5               ; biased exp. of N
        extu    B5, 20, 0, B5           ; arg2 = 2^N in DP FP
        nop     1                       ; wait for adddp arg1
        mpydp   A5:A4, B5:B4, A5:A4     ; arg1 = arg1 * 2^N
        nop     3 
        
        ldw     *+SP[1],A10             ; pop Save
||      b       A10                     ; normal return 

        ldw     *++SP[2],B10            ; pop N
        nop     4                       ; wait for mpydp ans, ldw & branch


_exp2dp_asm:


_exp2dp:               ; DP FP exp (base 2) of Arg1

        mvkl    Ln2H,B5                 ; Lne(2)=0.6931471805599453094172321
||      mvkl    Ln2L,A6

        mvkh    Ln2H,B5                 ; convert from base 2 to base e
||      mvkh    Ln2L,A6

        mv      B5,A7
        mpydp   A5:A4, A7:A6, A5:A4     ; arg1 = arg1 * Lne(2)
        nop     3
        b       _expdp                  ; near branch to expdp(base e)
        nop     5                       ; wait for mpydp

        .end
;-------------------End of 3 DP FP Exps----------------------------------

* ======================================================================== *
*  End of file: exp2dp_h.asm                                               *
* ======================================================================== *
