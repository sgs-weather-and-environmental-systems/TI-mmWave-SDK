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
* atan2dp.asm - double precision floating point divide                    *
*               optimized hand ASM single sample                          *
* ======================================================================= *

        .if     __TI_EABI__
           .asg    errno, _errno
           .asg    atan2dp, _atan2dp
           .asg    divdp,_divdp
           .asg    recipdp,_recipdp
        .endif

;        .global p0,p1,p2,p3,h0,h1,h2,h3,sr3,Tmsr3,pid2,pi                
;-------------------------------------------------------------------------+
;        .global Vatn2dp                  ; data ptr, Keep this order      |
        .data                                   ; data region             |
Vatn2dp: .double  0.0                           ; [0]                     |
         .double  0.52359877559829887308        ; [1] = pi/6              |
         .double  1.57079632679489661923        ; [2] = pi/2              |
         .double  1.04719755119659774615        ; [3] = pi/3              |
Tmsr3    .double  0.26794919243112270647        ; [4] = 2.0 - sqrt(3)     |
sr3      .double  1.73205080756887729353        ; [5] = sqrt(3)           |
p0       .double -0.13688768894191926929e+2     ; [6]                     |
p1       .double -0.20505855195861651981e+2     ; [7]                     |
p2       .double -0.84946240351320683534e+1     ; [8]                     |
p3       .double -0.83758299368150059274e+0     ; [9]                     |
h0       .double  0.41066306682575781263e+2     ; [10]                    |
h1       .double  0.86157349597130242515e+2     ; [11]                    |
h2       .double  0.59578436142597344465e+2     ; [12]                    |
h3       .double  0.15024001160028576121e+2     ; [13]  Note: h4=1.0      |
pid2     .double  1.57079632679489661923        ; [14] = pi/2             |
pi       .double  3.14159265358979323846        ; [15] = pi               |
                                                ;                         | 
SP      .set    B15                             ; stack pointer           |
;-------------------------------------------------------------------------+
                                        ;                                 |
        .global _recipdp                ; DP FP reciprocal entry labels   |
        .global _divdp                  ; DP FP divide entry labels       |
        
        .if (OVERRIDE_RTS = 1)
	        .global _atan2
_atan2 .set _atan2dp                    ; rts entry for DP FP atan2(Y,X)
	    .else
            .global _atan2dp                ; entry labels for arcTan2(Y,X)   |
	    .endif
        
        .global _errno			            ; error variable                  |		  
        .align  32                      ; fetch packet boundary           |
                                        ;                                 |
		    .sect	".text:optasm"            ;                                 |
                                        ;                                 |
                                        ;                                 |        
;--------------DP FP atan(Z)----------------------------------------------+
_atandp_:                               ; entry for DP FP atandp(Z)

        stw     .d2     A11,*SP--[6]            ; push A11 = FH          [6]
||      extu    .s1     A5,1,1,A11              ; F = abs(arg1)
||      zero    .l1     A3                      ; TH = 0

        stw     .d2     A10,*+SP[5]             ; push A10 = FL          [5]
||      mv      .d1     A4,A10                  ; FL = arg1L          
||      zero    .l1     A2                      ; TL = 0
||      set     .s1     A3,20,29,A3             ; T = 1.0 = 0x3ff0_0000
||	mvkl	.s2	_recipdp,b1		; far call to DP FP reciprocal

        stw     .d2     B10,*+SP[4]             ; push B10 = N           [4]
||      cmpltdp .s1     A3:A2, A11:A10, A2      ; is 1.0 < F ?
||	mvkh	.s2	_recipdp,b1

        stw     .d2     B3,*+SP[3]              ; push B3 = return addr. [3]
 [A2]   b       .s2     b1	                ; yes, call DP FP reciprocal

 [A2]   mvkl    .s2     BK1,b3
||      stw     .d2     A5,*+SP[2]              ; push A5 = arg1's sign  [2]

 [A2]   mvkh    .s2     BK1,b3
        zero    .l2     B10                     ; N = 0     when 1.0 > F
        
 [A2]   add     .l2     2,B10,B10               ; N = N + 2 when 1.0 < F
||      clr     .s1     A5,31,31,A5             ; clears sign bit

        mv      .d1     A4,A10                  ; end of [A2] b  _recipdp
||      clr     .s1     A5,31,31,A5             ; clears sign bit

BK1: 
        mvkl    .s2     Vatn2dp,B2               ; Ptr = address of data V     
        mvkh    .s2     Vatn2dp,B2

        extu    .s1     A5,1,1,A11              ; F = abs(arg1)
||      mv      .l1     A4,A10
||      lddw    .d2     *+B2[4], B1:B0          ; S = 2 - sqrt(3)

        lddw    .d2     *+B2[5], B9:B8          ; H = sqrt(3)
        nop             3                       ; wait for lddw of 64-bit S

        cmpltdp .s2x    B1:B0, A11:A10, B0      ; is [ 2-sqrt(3) ] < F ?
        nop             1                       ; wait for cmpltdp

  [!B0] b       .s2     BK2                     ; no,  skip arg.reduction
|| [B0] add     .l2     1,B10,B10               ; yes, N = N + 1

   [B0] adddp   .l2x    A11:A10, B9:B8, B5:B4   ; X = F + sqrt(3)
|| [B0] mpydp   .m1x    A11:A10, B9:B8, A5:A4   ; ans = F * sqrt(3)

   [B0] zero    .d2     B6
   [B0] zero    .l2     B7
   [B0] set     .s2     B7,20,29,B7             ; R = 1.0 = 0x3ff0_0000
        nop             1                       ; wait for [!B0] b BK2
	mvkl	.s2	_divdp,b3		; far call to DP FP divide
	mvkh	.s2	_divdp,b3
        nop             2                       ; wait for mpydp of ans

   [B0] subdp   .l1x    A5:A4, B7:B6, A5:A4     ; ans=F*sqrt(3)-1.0
   [B0] b       .s2     b3	                ; call DP FP divide
   [B0] mvkl    .s2     BK2,b3                  ; F = (F*sqrt(3)-1)/(F+sqrt(3))
   [B0] mvkh    .s2     BK2,b3
        nop             3                       ; wait for branch to _DIVDP

BK2:
        mvkl    .s2     Vatn2dp,B2               ; Ptr = address of data "V"     
        mvkh    .s2     Vatn2dp,B2
        
        clr     .s1     A5,31,31,A3             ; T = abs(ans)
||      mv      .l1     A4,A10
||      mv      .d1     A5,A11                  ; F = ans
||      zero    .l2     B7                      ; R = 0
||      mpy     .m2     0,B6,B6
||      mpydp   .m1     A5:A4, A5:A4, A9:A8     ; G = F*F
||      lddw    .d2     *+B2[9], A7:A6          ; P = p3 coef.

        mvklh   .s2     0x3e50,B7               ; R = Min=2^-26= 0x3e50_0000
||      mv      .l1     A4,A2                   ; T = abs(ans)
||      lddw    .d2     *+B2[13], B9:B8         ; H = h3 coef.

        cmpgtdp .s2     A3:A2, B7:B6, B0        ; is T > Min ?
        nop             1                       ; wait for cmpgtdp        
  [!B0] b       .s2     BK4                     ; no, skip poly.expansion
        nop             4                       ; wait for mpydp of G

  [B0]  mpydp   .m1     A7:A6, A9:A8, A5:A4     ; yes, ans = p3*G
||[B0]  adddp   .l2x    B9:B8, A9:A8, B5:B4     ; yes, X = G + h3

        lddw    .d2     *+B2[8], A7:A6          ; P = p2 coef.
        nop             4                       ; wait for adddp of X
        mpydp   .m2x    B5:B4, A9:A8, B5:B4     ; X = G*(G+h3)
        nop             2                       ; wait for mpydp of ans
        adddp   .l1     A5:A4, A7:A6, A5:A4     ; ans = p2 + (p3*G)
        lddw    .d2     *+B2[12], B9:B8         ; H = h2 coef.
        nop             4                       ; wait for adddp of ans

        mpydp   .m1     A5:A4, A9:A8, A5:A4     ; ans = G*[p2+(p3*G)]
||      adddp   .l2     B5:B4, B9:B8, B5:B4     ; X = h2+G*(h3+G)

        lddw    .d2     *+B2[11], B9:B8         ; H = h1 coef.
        lddw    .d2     *+B2[7], A7:A6          ; P = p1 coef.
        nop             3                       ; wait for adddp of X
        mpydp   .m2x    B5:B4, A9:A8, B5:B4     ; X = G*[h2+G*(h3+G)]
        nop             2                       ; wait for mpydp of ans
        adddp   .l1     A5:A4, A7:A6, A5:A4     ; ans=p1+G*[p2+(p3*G)]
        nop             5                       ; wait for adddp of ans

        mpydp   .m1     A5:A4, A9:A8, A5:A4     ; ans=G*{p1+G*[p2+p3*G)]}
||      adddp   .l2     B5:B4, B9:B8, B5:B4     ; X=h1+G*[h2+G*(h3+G)]

        lddw    .d2     *+B2[10], B9:B8         ; H = h0 coef.
        lddw    .d2     *+B2[6], A7:A6          ; P = p0 coef.
        nop             3                       ; wait for adddp of X

        mpydp   .m2x    B5:B4, A9:A8, B5:B4     ; X=G*{h1+G*[h2+G*(h3+G)]}     
        nop             2                       ; wait for mpydp of ans
        adddp   .l1     A5:A4, A7:A6, A5:A4     ; ans=p0+G*{p1+G*[p2+p3*G]}
        nop             5                       ; wait for mpydp of X
        mpydp   .m1     A5:A4, A9:A8, A5:A4     ; ans=g*(p0+G*{p1+G*[p2+p3*G]})
        adddp   .l2     B5:B4, B9:B8, B5:B4     ;arg2=h0+G*{h1+G*[h2+G*(h3+G)]}
        mvkl    .s2     _divdp,b3               ; far call to DP FP divide
        mvkh	.s2	_divdp,b3               ; wait for mpydp of X

        b       .s2     b3                  	; R =ans/arg2 using DP FP div.
        mvkl    .s2     BK3,b3
        mvkh    .s2     BK3,b3
        nop             3                       ; wait for DP FP divide branch

BK3:
        mpydp   .m1     A11:A10, A5:A4, A7:A6   ; P = F * R
        nop             8                       ; wait for mpydp
        adddp   .l1     A7:A6, A11:A10, A5:A4   ; ans = (F*R) + F
        nop             6                       ; wait for adddp

BK4:
        ldw     .d2     *+SP[3],b3              ; pop return addr. = B3
||      mvkl    .s2     Vatn2dp,B2               ; Ptr = pointer to "V" array
||      zero    .d1     A2                      ; T = 0

        mvkh    .s2     Vatn2dp,B2
||      ldw     .d2     *+SP[2],B0              ; S = original arg1's sign
||      set     .s1     A2,31,31,A2             ; T = 0x8000_0000

        lddw    .d2     *+B2[B10], B5:B4        ; X = V[N] where N=0,1,2,3

        cmpgt   .l2     B10,1,B1                ; is N > 1 ?
        ldw     .d2     *+SP[4],B10             ; pop B10 = N
        ldw     .d2     *+SP[5],A10             ; pop A10 = FH 

        ldw     .d2     *++SP[6],A11            ; pop A11 = FL and reset SP
|| [B1] xor     .l1     A2,A5,A5                ; if N>1, change sign of ansH

        adddp   .l1x    A5:A4, B5:B4, A5:A4     ; ans = ans + V[N]
        clr     .s2     B0,0,30,B0              ; get original sign bit only

        b       .s2     b3                      ; normal return
        nop             4                       ; wait for adddp of ans
        xor     .l1x    A5,B0,A5                ; ans = ans xor Sign

;------------ End of DP FP atan(Z) subroutine --------------------------------+
;													|
;-------------DP FP atan2(Y,X)------------------------------------------------+


* ======================================================================== *
*S Place source code here.                                                S*
* ======================================================================== *
_atan2dp:                               ; entry for DP FP atan2dp(Y,X)

        mvkl    .s2     Vatn2dp,B2
||      clr     .s1     A5,31,31,A3             ; T = abs(arg1)         [Y]
||      mv      .d1     A4,A2

        mvkh    .s2     Vatn2dp,B2               ; Ptr = address of data "V"
||      zero    .d1     A9                      ; G = 0
||      zero    .l1     A8
||      mv      .l2     B5,B0

        lddw    .d2     *+B2[14], A7:A6         ; P = pi/2        
||      clr     .s2     B5,31,31,B1             ; S = abs(arg2)         [X]

        cmpeqdp .s2     A9:A8, B1:B0, B0        ; is |X| = 0 ?
        cmpeqdp .s1     A9:A8, A3:A2, A2        ; is |Y| = 0 ?

  [B0]  mvk		1, B6           	; _errno = 1 for EDOM
  [B0]  mvkl   		_errno, A0      	; address for _errno

  [B0]  mvkh   		_errno, A0

  [B0]  b       .s2     b3                      ; early exit if X = 0
  [B0]  clr     .s1     A5,0,30,A5              ; X=0, save only Y's sign bit
  [B0]  xor     .l1     A5,A7,A5                ; X=0, ans=+/- pi/2 if Y is NZ
  [B0]  mv      .d1     A6,A4

  [A2]  zero    .d1     A5                      ; Y=0, ans=0 if (Y,X) = (0,0)
||	mvkl	.s2	_divdp,b1		; far call to DP FP divide

  [A2]  zero    .l1     A4
||[A2]  stw		B6, *A0			; Y=0, _errno = EDOM if (Y,X) = (0,0)
||	mvkh	.s2	_divdp,b1

 [!B0]  b       .s2     b1                  	; Z=arg1/arg2 using DP FP div.
        stw     .d2     B10,*SP--[2]            ; push b11 = N             [2]
        extu    .s2     B5,0,31,B10             ; save X's sign bit in N
        stw     .d2     b3,*+SP[1]              ; push b3 = return address [1]
        mvkl    .s2     BK7,b3
||	zero		B6				
        mvkh    .s2     BK7,b3                  ; end of SP FP divide call

BK7:
        clr     .s1     A5,31,31,A3             ; T = abs(Z)         [Z=Y/X]
||      mv      .d1     A4,A2
||      zero    .d2     B7                      ; R = 0
||      zero    .l2     B6

        cmpeqdp .s1     B7:B6, A3:A2, A2        ; is abs(Z) = 0 ?
|| [B0] stw		B6, *A0			; _errno = 0 if (Y,X) not eq (0,0)
        nop             1                       ; wait for cmpeqdp
  [A2]  b       .s1     BK8                     ; Z=0, don't call arcTan(Z)
  [!A2] b       .s2     _atandp_                ; Z is NZ, make near arcTan(Z) call
        mvkl    .s2     BK8,b3
        mvkh    .s2     BK8,b3
  [A2]  zero    .d1     A5                      ; if abs(Y/X)=0, force ans=0
  [A2]  zero    .d1     A4                      ; wait for [A2] branch to BK8
        nop             1                       ; wait for [!A2] b to arcTan(Z)

BK8:
        ldw     .d2     *+SP[1],b3              ; pop B3 = return address
||      mvkl    .s2     Vatn2dp,B2               ; Ptr = address of data "V"
||      mv      .l2     B10,B0                  ; X's original sign bit

        zero    .d1     A2                      ; if X!<0, clear the T switch
||      mvkh    .s2     Vatn2dp,B2
||      ldw     .d2     *++SP[2],B10            ; pop N = B10;  and restore SP

  [B0]  lddw    .d2     *+B2[15], A7:A6         ; P = pi if X < 0
  [!B0] zero    .d1     A7                      ; P = 0 if  X is not < 0
  [!B0] zero    .l1     A6
        nop             1
  [B0]  cmpgt   .l1     A5,0,A2                 ; if X<0, then is ans > 0 ?
  [A2]  set     .s1     A7,31,31,A7             ; set P's sign bit if atan(Z)>0

  [B0]  adddp   .l1     A5:A4, A7:A6, A5:A4     ; if X < 0, ans=ans +/- pi
        b       .s2     b3                      ; normal return
        nop             5                       ; wait for adddp of ans
       .end

;------------ End of DP FP arcTan(Y/X) subroutine -------------------------


* ======================================================================== *
*  End of file: atan2dp_h.asm                                              *
* ======================================================================== *
