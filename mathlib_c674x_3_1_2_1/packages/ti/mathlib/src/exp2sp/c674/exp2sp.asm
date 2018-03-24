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
* exp2sp.asm - single precision floating point exp base 2                 *
*              optimized hand ASM single sample                           *
* ======================================================================= *

      .if     __TI_EABI__
           .asg    exp2sp, _exp2sp
       .endif

	    .if (OVERRIDE_RTS = 1)
           .global _exp2f
_exp2f .set _exp2sp
        .else
           .global _exp2sp
	    .endif
	  	  
;      .global expon_ktable

expon_ktable:   .double  1.0
      .double  1.189207115
      .double  1.414213562
      .double  1.681792831
      .double  1.044273782
      .double  1.090507733
      .double  1.138788635

;      .global expon_ctable
      .data

expon_ctable:    .float  0.16673619103811
     .float  0.49999996512085
     .float  0.99999988814853
     .float  0.0555272619
     .float  0.2402264902
     .float  0.6931471030
     .float  2.0355273507
     .float  2.6509488703
     .float  2.3025848354


      .sect	".text:optasm"
      
_exp2sp:
           B       .S1     exp_gen             ; B to common kernel
||         MVKL    .S2     0x41800000, B0      ; log2_base_x16 = 16.0f

           MVKL    .S1     0x3D800000, A8      ; P1 = 0.0625000f
||         MVKH    .S2     0x41800000, B0      ; log2_base_x16 = 16.0f

           MVKH    .S1     0x3D800000, A8      ; P1 = 0.0625000f
||         MPYSP   .M1     A4, B0, A3          ; x * log2_base_x16
||         MVKL    .S2     0x3F317218, B9      ; ln(base) = 0.6931471825

           ZERO    .L1     A7                  ; P2 = 0.0f
||         MVKH    .S2     0x3F317218, B9      ; ln(base) = 0.6931471825

           ZERO    .L2     B5:B4               ; 0.5f; 0.0f
           MVK     .S2     12, B8              ; offset in bytes within coeff table


;_exp10f:
_exp10sp:
           B       .S1     exp_gen             ; B to common kernel
||         MVKL    .S2     0x42549A78, B0      ; log2_base_x16 = 53.15084839

           MVKL    .S1     0x3C9A2000, A8      ; P1 = 0.01881408691406
||         MVKH    .S2     0x42549A78, B0      ; log2_base_x16 = 53.15084839

           MVKH    .S1     0x3C9A2000, A8      ; P1 = 0.01881408691406
||         MPYSP   .M1     A4, B0, A3          ; x * log2_base_x16
||         MVKL    .S2     0x40135D8E, B9      ; ln(base) = 2.302585125

           MVKL    .S1     0x349A84FC, A7      ; P2 = 2.8781494e-7
||         ZERO    .L2     B5:B4               ; 0.5f; 0.0f 
||         MVKH    .S2     0x40135D8E, B9      ; ln(base) = 2.302585125

           MVKH    .S1     0x349A84FC, A7      ; P2 = 2.8781494e-7
           ADD     .D2     B4, 24, B8          ; offset in bytes within coeff table


;_expf:
_expsp:
           MVKL    .S1     0x3D317000, A8      ; P1 = 0.043319702
||         MVKL    .S2     0x41b8aa3b, B0      ; log2_base_x16 = 23.08312

           MVKH    .S1     0x3D317000, A8      ; P1 = 0.043319702
||         MVKH    .S2     0x41b8aa3b, B0      ; 23.08312 = 16/ln(2)

           MVKL    .S1     0x3605FDF4, A7      ; P2 = 1.99664E-06
||         MPYSP   .M1     A4, B0, A3          ; x * log2_base_x16

           MVKH    .S1     0x3605FDF4, A7      ; P2 = 1.99664E-06
||         ZERO    .L2     B9:B8               ; ln(base) = 1.0f; table offset = 0

           ZERO    .L2     B5:B4               ; 0.5f; 0.0f
||         MVKH    .S2     0x3F800000, B9      ; ln(base) = 1.0f


exp_gen 

           MVKH    .S2     0x3f000000,B5       ; 0.5f
||         MPYSP   .M1X    A4, B9, A6          ; x * ln(base)

           ADDSP   .L1X    B5, A3, A3          ; 0.5 + x * log2_base_x16
           MVK     .S2     114, B1             ; 114
           SET     .S2     B5, 23, 23, B6      ; to get 1.0f
           EXTU    .S1     A6, 1, 24, A9       ; expo of (x * ln(base))
           SPTRUNC .L1     A3, A0              ; N = (int) (0.5 + x * 16/ln(2))
           CMPLT   .L1X    A9, B1, A2          ; |x * ln(base)| small ?

   [ A2]   ADDSP   .L1X    A6, B6, A4          ; if small return 1.0f + ln(base) * x
|| [ A2]   B       .S2     B3                  ; early exit!

           CMPLTSP .S2X    A3, B4, B0          ; (0.5f + x * log2_base_x16) < 0.0f ?
   [ B0]   ADD     .D1     0xffffffff, A0, A0  ; if((0.5f + x * log2_base_x16) < 0.0f) N--
   [!A2]   INTSP   .L1     A0, A3              ; (float) N
           MVKL    .S2     0x42B17217, B1      ; 88.722831726f
           MVKH    .S2     0x42B17217, B1      ; 88.722831726f
           CMPGTSP .S2X    A6, B1, B1          ; result would be > 0x7f7fffff ?
           MPYSP   .M1     A3, A8, A5          ; NP1 = (float) N * P1
   [ B1]   MVKL    .S1     0x7f7fffff, A4      ; return 0x7f7fffff
   [ B1]   MVKH    .S1     0x7f7fffff, A4      ; return 0x7f7fffff
   [ B1]   B       .S2     B3                  ; early exit!

   [!B1]   MPYSP   .M1     A3, A7, A3          ; NP2 = (float) N * P2
|| [!B1]   SUBSP   .L1     A4, A5, A5          ; x - NP1

   [!B1]   MVKL    .S2     expon_ctable, B9      ; address of table
   [!B1]   MVKH    .S2     expon_ctable, B9      ; address of table
   [!B1]   ADD     .D2     B8, B9, B9          ; table address + offset

   [!B1]   SUBSP   .L1     A5, A3, A7          ; r = x - NP1 - NP2;
|| [!B1]   EXTU    .S1     A0, 0x1c, 0x1e, A2  ; K = _extu(N, 28, 30)
  
           LDW     .D2T2   *B9++[2], B8        ; c0
           LDW     .D2T1   *B9--, A9           ; c2
           LDW     .D2T2   *B9++, B9           ; c1
           MPYSP   .M1     A7, A7, A6          ; r2 = r * r 
           MVKL    .S1     expon_ktable, A3      ; address of ktable  
           MVKH    .S1     expon_ktable, A3      ; address of ktable 
           AND     .L1     0x3, A0, A1         ; J = N&0x3
           MPYSP   .M1     A7, A6, A8          ; r3 = r * r2 
           LDDW    .D1T1   *+A3[A2], A5:A4     ; ktable[K] 
   [ A1]   ADD     .S1     0x3, A1, A1         ; if(J) J += 3;
           MPYSP   .M2X    A6, B9, B5          ; r2 * c1

           MPYSP   .M2X    A8, B8, B4          ; r3 * c0 
||         LDDW    .D1T1   *+A3[A1], A3:A2     ; jtable[J]

           MPYSP   .M1     A7, A9, A6          ; r * c2         
           NOP             2                   ; wait for LDDW and MPYSP
           ADDSP   .L2     B4, B5,B4           ; (r3 * c0) + (r2 * c1)
           MPYDP   .M1     A5:A4, A3:A2, A5:A4 ; dT = ktable[K] * jtable[J];
           NOP             2                   ; wait for ADDSP
           ADDSP   .L2X    A6, B4, B4          ; pol = (r * c2) + ((r3 * c0) + (r2 * c1))
           NOP                                 ; wait for MPYDP
           ZERO    .L2     B9:B8               ; 1.0
           MVKH    .S2     0x3ff00000, B9      ; 1.0
           SPDP    .S2     B4, B7:B6           ; (double) pol
           ADDDP   .L2     B7:B6, B9:B8, B7:B6 ; (double) pol + 1.0 
           SHR     .S2X    A0, 0x4, B4         ; N>>4
           SHL     .S2     B4, 0x14, B4        ; (N>>4)<<20
           NOP                                 ; wait for ADDDP
           ADDU    .L2X    A5, B4, B5:B4       ; add in expo
           MV      .S1X    B4, A5              ; move expo back
           MPYDP   .M1X    A5:A4, B7:B6, A5:A4 ; resdp = dT * ((double) pol + 1.0)
           NOP             7                   ; wait for MPYDP
           B       .S2     B3                  ; B to return
           NOP                                 ; wait for MPYDP
           DPSP    .L1     A5:A4, A4           ; return ((float) resdp)
           NOP             3                   ; wait for DPSP
	.end


        .end

* ======================================================================== *
*  End of file: exp2sp.asm                                                 *
* ======================================================================== *

