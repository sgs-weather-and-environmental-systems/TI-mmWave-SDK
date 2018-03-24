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
* powsp.asm - single precision raise to a power                           *
*              optimized hand ASM single sample                           *
* ======================================================================= *

        .if     __TI_EABI__
           .asg    powsp, _powsp
           .asg    expsp, _expsp
           .asg    errno, _errno
           .asg    logsp, _logsp
        .endif

		.global _expsp
        .global _logsp
        .if (OVERRIDE_RTS = 1)
          .global _powf
_powf .set _powsp                  ; rts entry label
        .else
          .global _powsp  ; SP FP raise X to Y power
        .endif                                                          

SP      .set    B15     ; Stack pointer  
Min     .set    0xc2aeac50      ; ln(2^-126) = -87.33654475
Max     .set    0x42b00f34      ; ln(2^+127) =  88.02969193

		    .sect	".text:optasm"

_powsp_asm:

_powsp:                 ; SP FP power function (A4 raised to power B4)

           zero    .d2     b0                ; 0.0
||         extu    .s1     a4,1,24,a3        ; get exp. of X 
||         mvkl    .s2     0xfe,b5           ; biased exp=254
||         sptrunc .l2     b4,b7             ; get int. part of Y
||         zero    .d1     a6                ; quick exit ans. 
||         or      .l1     1,a1,a1

           cmpeqsp .s2     b4,b0,b0          ; if Y=0, return 1.0
||         extu    .s1     a4,0,31,a2        ; sign of X (+/- ?)
||         or      .l2     1,b1,b1

   [!b0]   cmplt   .l1x    a3,b5,a1          ; if X exp >= 254, return Inf.
|| [!b0]   cmpgt   .l2x    a3,1,b1           ; if X exp <= 1,   return 0.0
|| [b0]    mvklh   .s1     0x3f80,a6         ; 1.0 exp. (X^0=1.0)
||         mvkl    .s2     1,b2              ; neg. x^Int Y sw.

   [!a1]   mvklh   .s1     0x7f80,a6         ; Inf. exp. (MAX^Y=Inf.)
|| [!a1]   or      .s2     1,b0,b0           ; update quick exit switch

   [!b1]   add     .d2     1,b0,b0           ; MIN^Y=0; update quick exit sw.
||         intsp   .l2     b7,b8             ; float int.part of Y

           and     .l2     1,b7,b6           ; int. Y odd or even ?       

    [a2]   clr     .s1     a4,31,31,a4       ; absolute (X) if X < 0

           mvkl    .s1     _logsp,a0         ; far call to SP FP Log(base e)
                 
    [a2]   cmpeqsp .s2     b4,b8,b2          ; if X<0, is Y also an int.?
|| [!a2]   zero    .d2     b6                ; -X ^ Y (Y=even)
||         mvkh    .s1     _logsp,a0       

   [!b2]   or      .l1     -1,a6,a6          ; x^non-Int Y = -NaN
|| [!b2]   or      .s2     1,b0,b0           ; update quick exit switch
||  [b2]   or      .l2     b6,b3,b3          ; -x^odd int. Y sw in bit-0

   [!b0]   stw     .D2     B10,*SP--[2]      ; push B10 if not quick exit
|| [!b0]   mv      .L2     B4,B10            ; B10 = argument Y          
|| [!b0]   b       .S2     a0                ; far call SP FP log (base e)

   [!b0]   stw     .D2     a10,*+SP[1]       ; push a10 if not quick exit
|| [!b0]   mv      .l1x    b3,a10            ; save return address in a10
|| [!b0]   mvkl    .S2     pw1,B3            ; return label = pw1

    [b0]   b       .s2     b3                ; quick exit is taken
||  [b0]   mv      .d1     a6,a4             ; get quick exit answer

   [!b0]   mvkh    .S2     pw1,B3

           nop             2                 ; end of branch to SP FP log
           nop             2                 ; end of quick exit branch

pw1:                                         ; return label from SP FP logf

           mvkl    .s1     _expsp,a0         ; far call SP FP exp (base e)
||         mpysp   .M1x    B10,A4,A4         ; arg1 = Y * logsp(X)
||         and     .l2x    a10,1,b0          ; -1^Y (odd/even) ?

           mvkh    .s1     _expsp,a0

           mvkl    .s1     Min,a2            ; log(2^-126)
||         mvkl    .s2     Max,b2            ; log(2^+127)

           mvkh    .s1     Min,a2
||         mvkh    .s2     Max,b2

           cmpltsp   .s1     a4,a2,a1        ; is Y*Log(|X|) < Min ?
||         cmpgtsp   .s2x    a4,b2,b1        ; is Y*Log(|X|) > Max ?

           or      .l1x    a1,b1,a1          ; out-of-bounds switch
|| [a1]    zero    .d1     a4                ; ans = 0 for e^Min

  [!a1]    b       .S2     a0                ; far call SP FP exp (base e)
|| [a1]    zero    .d2     b0                ; don't use pw2 (quick exit)

   [a1]    b       .s2     a10               ; out-of-bounds exit
|| [!b0]   ldw     .D2     *+SP[1],a10       ; pop a10

   [b1]    zero    .d1     a4
|| [!b0]   ldw     .D2     *++SP[2],B10      ; pop B10  
|| [!b0]   mv      .l2x    a10,b3            ; normal exit address > exp

   [b1]    mvklh   .s1     0x7f80,a4         ; ans = Inf. for e^Max
   [b0]    mvkl    .s2     pw2,b3            ; return from exp for -X^odd Yint.
   [b0]    mvkh    .s2     pw2,b3            ; end of branch to SP FP exp 
           nop             1                 ; end of branch to a10

pw2:                                         ; return label from exp for -x^Y
           ldw     .D2     *+SP[1],a10       ; pop a10 
||         b       .s2     a10               ; normal return (ignore LS-bit)

           ldw     .D2     *++SP[2],B10      ; pop B10 and restore SP
           zero    .s1     a5
           set     .s1     a5,31,31,a5       ; neg. sign bit
           xor     .l1     a5,a4,a4          ; reverse sign of ans. (-1^odd Y)
           nop             1                 ; wait for branch

           .end
;--------------------End of SP FP Power subroutine-------------------------------

* ======================================================================== *
*  End of file: powsp.asm                                                  *
* ======================================================================== *

