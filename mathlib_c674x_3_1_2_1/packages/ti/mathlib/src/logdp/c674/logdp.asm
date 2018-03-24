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
* logdp.asm - double precision floating point log                         *
*             optimized hand ASM single sample                            *
* ======================================================================= * 
                
                .if     __TI_EABI__
                    .asg    logdp, _logdp
                    .asg    errno, _errno
                    .asg    divdp, _divdp
                .endif

;----------------------------------------------------------------------------+
; name = logdp.asm in Fast67 library	7/12/00		        	     |
;----------------------------------------------------------------------------+
;       logdp1.asm                     11-01-99   DP FP logs for 'C67xx DSPs |
;----------------------------------------------------------------------------+
;       logdp   = DP FP log (base e)  function in ASM for 'C67xx DSPs        |
;       log10dp = DP FP log (base 10) function in ASM for 'C67xx DSPs        |
;       log2dp  = DP FP log (base 2)  function in ASM for 'C67xx DSPs        |
;----------------------------------------------------------------------------+
;       log2dp   = [logdp(base e) of arg1] * [Log(base 2)  of e] uses logdp  |
;       log10dp  = [logdp(base e) of arg1] * [Log(base 10) of e] uses logdp  |
;----------------------------------------------------------------------------+
;       2^-1022 (2.25e-307) < arg1 < 2^+1023 (8.99e+307) for logdp (base e)  |
;       If arg1 > 2^+1023, ans = +709.783 = Log (1.7977e+308) logdp (base e) |
;       If arg1 < 2^-1022, ans = -708.396 = Log (2.225e-307) logdp (base e)  |
;       If arg1 < 0, ans = -1.7977e+308 = negative largest DP FP number      |
;                                                                            |
;       logdp calls fast DP FP divide ASM program twice                      |
;----------------------------------------------------------------------------+
;        .include math.h
;        .global _LnMin,_LnMax,_Ln2,_srHalf,_Half,_un,_Ke,_K10,_K2
;        .global _p0,_p1,_p2,_q0,_q1,q2
;----------------------------------------------------------------------------+        
;        .global _numnL2                     ; data ptr. Keep this order       |
        .data                              ; data 		             |
_numnL2  .double -1.7976931348623157e+308   ; [0]  neg. max SP FP number      |
_LnMin  .double -708.3964185322641         ; [1]  lne of small num.          |
_LnMax  .double  709.7827138470578         ; [2]  lne of large num.          |
_Ln2    .double  0.69314718055994530941    ; [3]  lne of 2.0                 |
_srHalf .double  0.70710678118654752440    ; [4]  sqrt(0.5]                  |
_Half   .double  0.5                       ; [5]  1/2                        |
_Ke     .double  1.0                       ; [6]  Konstant for Lne   scalar  |
_K10    .double  0.43429448190325182765    ; [7]  Konstant for Log10 scalar  |
_K2     .double  1.4426950408889634074     ; [8]  Konstant for Log2  scalar  |
_p0     .double -6.4124943423745581147e+1  ; [9]  part of zn                 |
_p1     .double  1.6383943563021534222e+1  ;[10]                             |
_p2     .double -7.8956112887491257267e-1  ;[11]                             |
_q0     .double -7.6949932108494879777e+2  ;[12]  part of zd                 |
_q1     .double  3.1203222091924538544e+2  ;[13]                             |
_q2     .double -3.5667977739034646171e+1  ;[14]   Note: _q3=1.0             |
                                           ;                                 |
SP      .set    B15                        ; stack pointer                   |
;----------------------------------------------------------------------------+                                        
        ;.global _log,   _logdp          ; DP FP log (base e)                 |
        ;.global _log10, _log10dp        ; DP FP log (base 10)                |
        ;.global _log2,  _log2dp         ; DP FP log (base 2)                 |
        .global _divdp, __divd          ; DP FP divide (arg1/arg2)           |
	
	   .if (OVERRIDE_RTS = 1)
          .global _log
_log .set _logdp                         ; rts lib DP FP log (base e)
       .else
	      .global _logdp
	   .endif 
	
	
		 .sect	".text:optasm"

	
	.global _errno			; error number			     |
        .align  32                      ; fetch packet boundary              |
;----------------------------------------------------------------------------+
;DP      .set    B14                     ; data pointer
;a1L     .set    a4
;a1H     .set    a5
;ansL    .set    a4
;ansH    .set    a5
;a2L     .set    b4
;a2H     .set    b5
;TL      .set    b6
;TH      .set    b7
;RL      .set    a0
;RH      .set    a1
;exp     .set    a3
;sw      .set    a1
;nsw     .set    a2
;GL      .set    a6
;GH      .set    a7
;FL      .set    a8
;FH      .set    a9
;XL      .set    b8
;XH      .set    b9
;xit     .set    b2
;SL      .set    a10
;SH      .set    a11
;N       .set    b12
;ZH      .set    a13
;ZL      .set    a12
;P       .set    b13
;WL      .set    b0
;WH      .set    b1
;HL      .set    b8
_logdp_asm:

* ======================================================================== *
*S Place source code here.                                                S*
* ======================================================================== *
_logdp:                                 ; DP FP log (base e) of arg1   

 	mvk		1, B6           	; _errno = 1 for EDOM
|| 	mvkl    	_errno, A6      	; address for _errno

        stw     .d2     B13,*SP--[8]            ; push P = B13           [8]
||      mvkl    .s2     _numnL2,B13              ; P = pointer to ".data"
||      extu    .s1     A5,1,21,A3              ; exp = arg1's exp. field

        cmpgt   .l1     1,A3,A1                 ; is 1 > exp1 ?
||      stw     .d2     A10,*+SP[1]             ; push SL = A10          [1]
||      mvkh    .s2     _numnL2,B13
||      mvkl    .s1     2046,A0                 ; R = 2046 = max DP exp.

  [A1]  lddw    .d2     *+B13[1],B5:B4          ; 1>exp1, arg2 = lne of MIN 
||      cmpgt   .l1     A3,A0,A1                ; is exp1 > 2046 ?
||      mv      .l2x    A1,B2                   ; xit = sw
||	mvkh		_errno, A6

 [A1]   lddw    .d2     *+B13[2],B5:B4          ; exp1>2046, arg2 = lne of MAX
||      extu    .s1     A5,0,31,A2              ; nsw = is arg1's sign bit - ?
||      or      .l2x    A1,B2,B2                ; xit = xit OR sw
 
        lddw    .d2     *+B13[4],A9:A8          ; F = sqrt(0.5) = 0.7071067812
|| [A2] stw  		B6, *A6	   		; yes arg1 < 0, _errno = EDOM
||      cmpeq   .l1     A3,0,A1                 ; is exp1 = 0 ?
                                                
        or      .l2x    A2,B2,B2                ; xit = nsw OR xit
||      stw     .d2     A11,*+SP[2]             ; push SH               [2]
||      or      .l1     A1,A2,A2                ; nsw=sw OR nsw  (exp=0,arg1<0)

        lddw    .d2     *+B13[6],A11:A10        ; S=log(base e) of e = 1.0
||      mvkl    .s2     1022,B0                 ; exp. bias 

Here:   ;------------Common Label for all 3 log functions--------------------

  [B2]  b       .s2     Bye             	; quick exit (<0, exp<1, or exp>2046)
||      lddw    .d2     *+B13[5],B9:B8          ; X = 0.5
||      clr     .s1     A5,20,31,A7             ; G = arg1 with exp=sign=0
||      mv      .d1     A4,A6

        stw     .d2     B12,*+SP[7]             ; push N = B12         [7]
||      sub     .l2x    A3,B0,B12               ; N = exp1 - 1022 as an int.
||      set     .s1     A7,21,29,A7             ; exp = 0x3fe = 1022
||[A2]  or      .s2     B5,-1,B5                ; arg2 = all ones

        cmpgtdp .s1     A7:A6, A9:A8, A1        ; is G > sqrt(0.5) ?
||      stw     .d2     B3,*+SP[6]              ; push B3=return addr.  [6]
||[A2]  or      .l2     B4,-1,B4                ; arg2 = neg. max DP FP num.

        stw     .d2     A12,*+SP[3]             ; push ZL = A12         [3]
||[B2]  mv      .l1x    B4,A4           	; return fixed value on quick exit 
||[A2]  clr     .s2     B5,20,20,B5     	; yes, arg2 = 0xffef_ffff_ffff_ffff

  [B2]  mv      .l1x    B5,A5                   ; wait for lddw of X
||      stw     .d2     A13,*+SP[4]             ; push ZH =A13          [4]

  [!B2] subdp   .l1x    A7:A6, B9:B8, A5:A4     ; zn = G - 0.5 {end of b Bye}  
||[!B2] mpydp   .m2x    A7:A6, B9:B8, B5:B4     ; zd = G * 0.5  
    
  [!A1] sub     .d2     B12,1,B12               ; N = N-1 if G !> sqrt(0.5)
        nop             4                       ; wait for subdp

  [!A1] mpydp   .m2x    A5:A4, B9:B8, B5:B4     ; no,  arg2=zn*0.5 = newer zd
|| [A1] subdp   .l1x    A5:A4, B9:B8, A5:A4     ; yes, arg1=zn-0.5 = newer zn

        nop             7                       ; wait for mpydp
        mvkl    .s2     _divdp,b3               ; long call to DP FP divide

        adddp   .l2     B5:B4, B9:B8, B5:B4     ; zd = zd + 0.5 = final zd
||      mvkh    .s2     _divdp,b3

        b       .s2     b3                      ; far call DP FP divide
        mvkl    .s2     L1,b3                   ; return to L1 from DP FP div.
        mvkh    .s2     L1,b3
        nop             3                       ; wait for addsp, end of b divd
         
L1:	;-----------------------------------------; arg1 = zn / zd = Z

        mpydp   .m1     A5:A4, A5:A4, A1:A0     ; R = Z*Z
        lddw    .d2     *+B13[14],B7:B6         ; T = q2
        lddw    .d2     *+B13[11],B9:B8         ; H = p2
        mv      .d1     A5,A13                  ; save Z = arg1 = zn/zd
        mv      .d1     A4,A12                
        nop             4                       ; wait for mpydp R 

        adddp   .l2x    A1:A0, B7:B6, B5:B4     ; arg2 = R + q2
||      mpydp   .m1x    A1:A0, B9:B8, A5:A4     ; arg1 = R * p2

        lddw    .d2     *+B13[13],B7:B6         ; T = q1
        lddw    .d2     *+B13[10],B9:B8         ; H = p1
        nop             3                       ; wait for adddp arg2

        mpydp   .m2x    A1:A0, B5:B4, B5:B4     ; arg2 = R * (R+q2)
        nop             2                       ; wait for mpydp arg1

        adddp   .l1x    B9:B8, A5:A4, A5:A4     ; arg1 = p1 + (R*p2)
        lddw    .d2     *+B13[9], B9:B8         ; H = p0
        nop             4                       ; wait for adddp arg1

        mpydp   .m1     A1:A0, A5:A4, A5:A4     ; arg1 = R * (p1 +R*p2)
||      adddp   .l2     B7:B6, B5:B4, B5:B4     ; arg2 = q1 + R*(R+q2)

        lddw    .d2     *+B13[12], B7:B6        ; T = q0
        nop             4                       ; wait for adddp arg2

        mpydp   .m2x    A1:A0, B5:B4, B5:B4     ; arg2 = R*[q1+R*(q2+R)]
        nop             2                       ; wait for mpydp arg1

        adddp   .l1x    B9:B8, A5:A4, A5:A4     ; arg1 = p0+[R*(p1+R*p2)]
        nop             5                       ; wait for mpydp arg2

        mpydp   .m1     A1:A0, A5:A4, A5:A4     ; arg1 = R*{p0+[R*(p1+R*p2)]} 
        adddp   .l2     B7:B6, B5:B4, B5:B4     ; arg2 = q0+{R*[q1+R*(q2+R)]}
        mvkl    .s2     _divdp,b3               ; long call to DP FP divide
        mvkh    .s2     _divdp,b3               ; delays for mpydp 
        b       .s2     b3                      ; R = arg1 / arg2 (long call)
        mvkl    .s2     L2,b3                   ; return to L2 from DP FP div.
        mvkh    .s2     L2,b3
        nop             3                       ; wait for mpydp arg1, b  divd

L2:	;-----------------------------------------; arg1 = H*q0/(H+p0) = R

        mpydp   .m1     A5:A4, A13:A12, A5:A4   ; arg1 = R*Z
||      intdp   .l2     B12, B1:B0              ; W = float(int N)
||      lddw    .d2     *+B13[3], B9:B8         ; H=log(base e)of 2=0.69314718

        nop             4                       ; wait for intdp and lddw H
        mpydp   .m2     B1:B0, B9:B8, B9:B8     ; H = (float N) * Ln2
        nop             3                       ; wait for mpydp arg1
        adddp   .l1     A5:A4, A13:A12, A5:A4   ; arg1 = R*Z + Z
        ldw     .d2     *+SP[6],b3              ; pop B3        
        nop             4                       ; wait for adddp and mpydp
        adddp   .l1x    A5:A4, B9:B8, A5:A4     ; ans = arg1 + N*Ln2
        nop             2                       ; part of adddp wait
        
Bye:	;---------------Bye is a quick exit label---------------------------

        ldw     .d2     *+SP[7],B12             ; pop N  = B12
        ldw     .d2     *+SP[4],A13             ; pop ZH = A13
        ldw     .d2     *+SP[3],A12             ; pop ZL = A12
        
        mpydp   .m1     A5:A4, A11:A10, A5:A4   ; ans=arg1*S  (base conversion)
        ldw     .d2     *+SP[2],A11             ; pop SH = A11
        ldw     .d2     *+SP[1],A10             ; pop SL = A10
        ldw     .d2     *++SP[8],B13            ; pop P = B13; restore SP    
        b       .s2     b3                      ; normal return
        nop             5                       ; wait for b  b3, mpydp ans
 
        .end
;-----------------------End of DP FP log (base e,2,10)----------------------


* ======================================================================== *
*  End of file: logdp.asm                                                  *
* ======================================================================== *
