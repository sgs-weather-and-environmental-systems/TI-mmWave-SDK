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
* atansp.asm - single precision floating point arctangent                 *
*              Optimized Hand ASM Single Sample                           *
* ======================================================================= *

    	.if     __TI_EABI__
           .asg    errno, _errno
           .asg    atansp, _atansp
        .endif
    .global _errno
    
        .if (OVERRIDE_RTS = 1)
		   .global _atanf
_atanf .set _atansp
        .else
	       .global _atansp
		.endif
                                    
		.sect	".text:optasm" 
                         
                         
atan_div_sr:
           RCPSP   .S1     A4, A3            ; g ~= 1/x
           MPYSP   .M1     A4, A3, A5        ; x*g
           ZERO    .D2     B5                ; 2.0f
           MVKH    .S2     0x40000000, B5    ; 2.0f
           NOP
           SUBSP   .L2X    B5, A5, B9        ; 2.0f - x*g
           NOP             3                 ; wait for (2.0f - x*g) 
           MPYSP   .M1X    A3, B9, A3        ; g = g*(2.0f - x*g)
           NOP             3                 ; wait for g
           MPYSP   .M1     A4, A3, A4        ; x*g
           NOP             3                 ; wait for x*g

           SUBSP   .L2X    B5, A4, B5        ;(2.0f - x*g)
|| [ A2]   MPYSP   .M1     A3, A9, A3        ; g = g*num if called from atan2f

           NOP             1                 ; wait for g
           B       .S2     atan_pol_eval     ; branch to polynomial eval.
           ZERO    .S1     A1                ; do the 1st mpy in atan_pol_eval
           MPYSP   .M1X    A3, B5, A4        ; g = g*(2.0f - x*g)
           NOP             3                 ; wait for g


_atansp_asm:

_atansp:

           CLR     .S1     A4, 0, 30, A8     ; x's sign
||         ABSSP   .S2X    A4, B5            ; abs(x)

           MVKL    .S1     0x3F866666, A9    ; 1.05f
||         MVK     .S2     127+25, B9        ; exponent for x large

           EXTU    .S1     A4, 1, 24, A3     ; x's exponent
||         MVK     .S2     127-13, b8        ; exponent for x small

           CMPLT   .L2X    A3, B8, B2        ; x small?
||         CMPGT   .L1X    A3, B9, A2        ; x large? else zero a2
||         MVKH    .S1     0x3F866666, A9    ; 1.05f

           OR      .L1X    B2, A2, A1        ; early exit?
||         CMPGTSP .S2X    B5, A9, B0        ; x>1.05f?

   [ A1]   B       .S2     B3                ; early exit for large or small
|| [ A1]   ZERO    .L2     B0                ; not early exit?

   [ B0]   B       .S1     atan_div_sr       ; B if x>1.05f and !early xit
||         MVKL    .S2     0x3FC90FDB, B4    ; pi/2

           MVKH    .S2     0x3FC90FDB, B4    ; pi/2
||         ZERO    .L2     B6                ; xn

   [ A2]   OR      .L1X    B4, A8, A4        ; +/- pi/2 for early exit
                                             ; we do not need to wait, see below
atan_pol_eval:
   [!A1]   MPYSP   .M1     A4, A4, A0        ; g^2, don't do if early exit of atanf
           MVKL    .S2     0xbc647bb5, B5    ; c2 = -0.0139455100f
           MVKL    .S1     0xbeaaaa23, A5    ; c8 = -0.3333293004f
           MVKH    .S1     0xbeaaaa23, A5    ; c8 = -0.3333293004f
           MPYSP   .M1     A0, A0, A3        ; g^4 = g^2 * g^2
           MVKL    .S2     0x3b16d624, B7    ; c1 = 0.00230158202f
           MVKH    .S2     0xbc647bb5, B5    ; c2 =-0.0139455100f

           MVKH    .S2     0x3b16d624, B7    ; c1 = 0.00230158202f
||         MPYSP   .M2X    B5, A0, B1        ; c2 * g^2

           MPYSP   .M2X    B7, A3, B2        ; c1 * g^4
           MVKL    .S2     0x3dd77af5, B9    ; c5 = 0.10521499322f

           MVKL    .S2     0x3e4cb0c1, B5    ; c7 = 0.19989300877f
||         MPYSP   .M1     A0, A3, A1        ; g^6 = g^2 * g^4

           MVKH    .S2     0x3e4cb0c1, B5    ; c7 = 0.19989300877f
||         MPYSP   .M1     A3, A3, A7        ; g^8 = g^4 * g^4

           MVKL    .S2     0xbe11271d, B7    ; c6 =-0.14175076797f
||         ADDSP   .L2     B2, B1, B1        ; tmp1 = c1 * g^4 + c2 * g^2

           MVKH    .S2     0xbe11271d, B7    ; c6 =-0.14175076797f
||         MPYSP   .M1X    B5, A3, A2        ; c7 * g^4

           MVKL    .S1     0x3d21435c, A5    ; c3 = 0.03937087815832f
||         MPYSP   .M2X    B7, A1, B7        ; c6 * g^6
||         MPYSP   .M1     A5, A0, A0        ; c8 * g^2
||         MVKH    .S2     0x3dd77af5, B9    ; c5 = 0.10521499322520f

           MPYSP   .M1     A1, A3, A1        ; g^10 = g^6 * g^4
||         MPYSP   .M2X    B9, A7, B5        ; c5 * g^8
||         MVKH    .S1     0x3d21435c, A5    ; c3 = 0.03937087815832f

           ADDSP   .L1X    B1, A5, A5        ; (c1 * g^4 + c2 * g^2) + c^3
||         MPYSP   .M1     A7, A3, A7        ; g^12 = g^8 * g^4

           MVKL    .S1     0xbd942fbf, A3    ; c4 = -0.0723566916f
           MVKH    .S1     0xbd942fbf, A3    ; c4 = -0.0723566916f

           MPYSP   .M1     A3, A1, A0        ; c4 * g^10
||         ADDSP   .L1     A2, A0, A3        ; (c7 * g^4) + (c8 * g^2)
||         ADDSP   .L2     B5, B7, B5        ; (c5 * g^8) + (c6 * g^6)

           MPYSP   .M1     A5, A7, A5        ; ((c1 * g^4 + c2 * g^2) + c^3) * g^12
           NOP
           OR      .S2     B0, B6, B1        ; ns_nxn = s | xn
           ADDSP   .L1X    B5, A3, A3        ; ((c5 * g^8) + (c6 * g^6)) + ((c7 * g^4) + (c8 * g^2))
           ADDSP   .L1     A5, A0, A0        ; (((c1 * g^4 + c2 * g^2) + c^3) * g^12) + (c4 * g^10)
           MV      .S1     A8, A1            ; x's sign
           NOP             2                 ; wait for sum
           ADDSP   .L1     A3, A0, A0        ; pol
           NOP             3                 ; wait for pol
           MPYSP   .M1     A0, A4, A3        ; pol = pol * g;
           MV      .S1X    B4, A0            ; coef = pi/2
   [!B0]   MVKL    .S1     0x40490fdb, A0    ; if(!s) coef = pi
   [!B0]   MVKH    .S1     0x40490fdb, A0    ; if(!s) coef = pi
           ADDSP   .L1     A3, A4, A3        ; pol = pol + g
   [!B1]   ZERO    .D1     A0                ; if(!ns_nxn) coef = 0
   [ A1]   SET     .S1     A0,0x1f,0x1f,A0   ; if(yn) coef = -coef
           B       .S2     B3                ; B to return
   [ B0]   SUBSP   .L1     A0, A3, A4        ; return (coef - pol)
   [!B0]   ADDSP   .L1     A0, A3, A4        ; return (coef + pol)
           NOP             3
;*************************************************************************
;               end of file                                              *
;*************************************************************************

              .end

* ======================================================================== *
*  End of file: atansp.asm                                                 *
* ======================================================================== * 
