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
* powdp.asm - double precision raise to a power                           *
*              optimized hand ASM single sample                           *
* ======================================================================= *

                .if     __TI_EABI__
                    .asg    powdp, _powdp
                    .asg    expdp, _expdp
                    .asg    logdp, _logdp
                .endif

;-----------------------------------------------------------------------+
;       powdp.asm   orig.    11-19-99  DP FP power function = X ^ Y     |
;                    rev.    10-17-00   for 'C67xx DSPs                 |
;-----------------------------------------------------------------------+
;       X^Y = exp ^ [Y * log(X) ]  where ^ means raise base to power    |
;                       and log = log (base e) of argument X.           |
;                                                                       |
; 09/28/00  (0=e^Min) -708.396.. < Y*Log(X) < +709.089... (Inf=e^Max)   |
;                                                                       |
; 10/17/00      Does support -X raised to Y (all integer) power.        |
;									|
; Note order:	1.0 = X^0 = 1.0 [value of X is ignored]			|
;		Inf.= |X| > 2^+1023 (8.988e+307) [value of Y ignored]	|
;		0.0 = |X| < 2^-1022 (2.225e-308) [value of Y ignored]	|
;		NaN = X<0 and Y is not a 32-bit integer			|
;		   If X<0 and Y is an integer, -1^Y * |X|^Y is formed	|
;		Form W = Y * log (base e) of |X|			|
;		Inf.= W > 709.089... = log (2^+1023 = 8.988e+307)	|
;		0.0 = W <-708.396... = log (2^-1022 = 2.225e-308)	|
; 	else	X^Y = e^W = returned answer				|
;-----------------------------------------------------------------------+
; extern  double  expdp(double)                                         |
; extern  double  logdp(double)                                         |
;         double  pow  (double X, double Y)                             |
;         double  powdp(double X, double Y)                             |
;-----------------------------------------------------------------------+
        .global _exp, _expdp   ; far call to DP FP exp (base e)         |
        .global _log, _logdp   ; far call to DP FP log (base e)         |
        ;.global _powdp, _pow   ; DP FP raise x to Y power               |
		.global _divdp

	   .if (OVERRIDE_RTS = 1)
          .global _pow
_pow .set _powdp                   ; rts entry label
       .else
		  .global _powdp
	   .endif 

;-----------------------------------------------------------------------+
SP      .set    B15     ; Stack pointer                                 |                        ;                                               |

Min     .double -708.3964185322641   ; ln(2^-1022)  [0]  Keep this order
Max     .double  709.0895657128241   ; ln(2^+1023)  [1]

        .align  32              ; fetch packet boundary

		    .sect	".text:optasm"

_powdp:                 ; DP FP power function (A5:A4 raised to power B5:B4)

           zero    .l2     b1:b0             ; 0.0
||         extu    .s1     a5,1,20,a3        ; get exp. of X 
||         mvkl    .s2     0xffe,b6          ; biased exp=2046=2^+1023
||         zero    .l1     a7:a6             ; quick exit ans. 

           cmpeqdp .s2     b5:b4, b1:b0, b0  ; if Y=0, return 1.0
||         extu    .s1     a5,0,31,a2        ; sign of X (+/- ?)
||         dptrunc .l2     b5:b4, b7         ; get int. part of Y
||         or      .l1     1,a1,a1

           or      .l2     1,b0,b2           ; neg. x^Int Y sw.
||         add     .d2     1,b1,b1

   [!b0]   cmplt   .l1x    a3,b6,a1          ; if X exp >= 2046, return Inf.
|| [!b0]   cmpgt   .l2x    a3,1,b1           ; if X exp <= 1,   return 0.0
|| [b0]    mvklh   .s1     0x3ff0,a7         ; 1.0 exp. (X^0=1.0)


   [!a1]   mvklh   .s1     0x7ff0,a7         ; Inf. exp. (MAX^Y=Inf.)
|| [!a1]   or      .s2     1,b0,b0           ; update quick exit switch

   [!b1]   add     .d2     1,b0,b0           ; MIN^Y=0; update quick exit sw.
||         intdp   .l2     b7, b9:b8         ; float int.part of Y

           and     .l2     1,b7,b6           ; int. Y odd or even ?       
    [a2]   clr     .s1     a5,31,31,a5       ; absolute (X) if X < 0
           mvkl    .s1     _logdp,a0         ; far call to DP FP Log(base e)
                 
    [a2]   cmpeqdp .s2     b5:b4, b9:b8, b2  ; if X<0, is Y also an int.?
|| [!a2]   zero    .d2     b6                ; -X ^ Y (Y=even)

           mvkh    .s1     _logdp,a0

   [!b2]   or      .l1     -1,a6,a6          ; x^non-Int Y = -NaN
|| [!b2]   or      .s1     -1,a7,a7
|| [!b2]   or      .s2     1,b0,b0           ; update quick exit switch
||  [b2]   or      .l2     b6,b3,b3          ; -x^odd int. Y sw in bit-0

   [!b0]   stw     .D2     B10,*SP--[4]      ; push B10 if not quick exit
|| [!b0]   mv      .L2     B4,B10            ; B11:B10 = argument Y          
|| [!b0]   b       .S2     a0                ; far call DP FP log (base e)

   [!b0]   stw     .D2     B11,*+SP[3]       ; push B11 if not quick exit
|| [!b0]   mv      .L2     B5,B11            ; B11:B10 = argument Y          

   [!b0]   stw     .D2     a10,*+SP[1]       ; push a10 if not quick exit
|| [!b0]   mv      .l1x    b3,a10            ; save return address in a10
|| [!b0]   mvkl    .S2     pw1,B3            ; return label = pw1

    [b0]   b       .s2     b3                ; quick exit is taken
||  [b0]   mv      .d1     a6,a4             ; get quick exit answer

   [!b0]   mvkh    .S2     pw1,B3 
||  [b0]   mv      .d1     a7,a5   

           nop             1                 ; end of branch to SP FP log
           nop             3                 ; end of quick exit branch

pw1:                                         ; return label from DP FP log

           mvkl    .s1     _expdp,a0              ; far call DP FP exp (base e)
||         mpydp   .M1x    B11:B10, A5:A4, A5:A4  ; arg1 = Y * logsp(X)
||         and     .l2x    a10,1,b0               ; -1^Y (odd/even) ?
||         mvkl    .s2     Min,b1                 ; ptr to &Min

           mvkh    .s1     _expdp,a0
||         mvkh    .s2     Min,b1

           lddw    .d2     *b1, a7:a6        ; DP FP lne(2^-1022)
           lddw    .d2     *+b1[1], b7:b6    ; DP FP lne(2^+1023)
           nop             5                 ; wait for mpydp

           cmpltdp   .s1   a5:a4, a7:a6, a1  ; is Y*Log(|X|) < Min ?
||         cmpgtdp   .s2x  a5:a4, b7:b6, b1  ; is Y*Log(|X|) > Max ?

           nop             1                 ; wait for cmpdp

           or      .l1x    a1,b1,a1          ; out-of-bounds switch
|| [a1]    zero    .d1     a4                ; ans = 0 for e^Min
|| [a1]    zero    .s1     a5

  [!a1]    b       .S2     a0                ; far call DP FP exp (base e)
|| [a1]    zero    .d2     b0                ; don't use pw2 (quick exit)

   [a1]    b       .s2     a10               ; out-of-bounds exit
|| [!b0]   ldw     .D2T1   *+SP[1],a10       ; pop a10

   [b1]    zero    .l1     a5:a4
|| [!b0]   ldw     .D2     *+SP[3],B11       ; pop B11  
|| [!b0]   mv      .l2x    a10,b3            ; normal exit address > exp

   [b1]    mvklh   .s1     0x7ff0,a5         ; ans = Inf. for e^Max
|| [!b0]   ldw     .D2     *++SP[4],B10      ; pop B10, restore SP  
                                                       
   [b0]    mvkl    .s2     pw2,b3            ; return from exp for -X^odd Yint.
   [b0]    mvkh    .s2     pw2,b3            ; end of branch to SP FP exp 
           nop             1                 ; end of branch to a10

pw2:                                         ; return label from exp for -X^Y
           ldw     .D2     *+SP[3],B11       ; pop B11
||         zero    .s1     a6

           ldw     .D2     *+SP[1],a10       ; pop a10
||         b       .s2     a10               ; normal return (ignore LS-bit)

           ldw     .D2     *++SP[4],B10      ; pop B10 and restore SP
           set     .s1     a6,31,31,a6       ; neg. sign bit
           xor     .l1     a6,a5,a5          ; reverse sign of ans. (-1^odd Y)
           nop             2                 ; wait for branch & ldw

           .end
;--------------------End of DP FP Power subroutine-------------------------------

* ======================================================================== *
*  End of file: powdp.asm                                                  *
* ======================================================================== *
