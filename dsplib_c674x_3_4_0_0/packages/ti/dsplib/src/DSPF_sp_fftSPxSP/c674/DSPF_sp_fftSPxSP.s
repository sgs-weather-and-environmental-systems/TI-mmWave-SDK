* ======================================================================= *
* DSPF_sp_fftSPxSP.asm -- Forward FFT with Mixed Radix                    *
*                 ASM Implementation                                      *
*                                                                         *
* Rev 0.0.2                                                               *
*                                                                         *
* Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/  * 
*                                                                         *
*                                                                         *
*  Redistribution and use in source and binary forms, with or without     *
*  modification, are permitted provided that the following conditions     *
*  are met:                                                               *
*                                                                         *
*    Redistributions of source code must retain the above copyright       *
*    notice, this list of conditions and the following disclaimer.        *
*                                                                         *
*    Redistributions in binary form must reproduce the above copyright    *
*    notice, this list of conditions and the following disclaimer in the  *
*    documentation and/or other materials provided with the               *
*    distribution.                                                        *
*                                                                         *
*    Neither the name of Texas Instruments Incorporated nor the names of  *
*    its contributors may be used to endorse or promote products derived  *
*    from this software without specific prior written permission.        *
*                                                                         *
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    *
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      *
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  *
*  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   *
*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,  *
*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       *
*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  *
*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  *
*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    *
*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  *
*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   *
*                                                                         *
* ======================================================================= *

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP

    .sect ".text:optimized"
    .if __TI_EABI__
    .asg  DSPF_sp_fftSPxSP, _DSPF_sp_fftSPxSP
    .endif
	
    .global _DSPF_sp_fftSPxSP

	.clink

_DSPF_sp_fftSPxSP:

	.map	A_xt2/A10
	.map	A_xh20/A13
	.map	B_next/B3
	.map	A_xh21/A20
	.map	A_yt0/A28
	.map	A_yt0'/A17
	.map	A_yt1/A29
	.map	A_yt1'/A4
	.map	A_yt2/A4
	.map	A_yt2'/A11
	.map	A_yt3/A5
	.map	B_si1/B1
	.map	B_si2/B29
	.map	B_si3/B25
	.map	A_ptr_w/A6
	.map	A_ptr_w'/B31
	.map	B_sum1/B20
	.map	A_xl20/A16
	.map	B_sum2/B21
	.map	A_xl21/A15
	.map	B_fft_jmp_1/B29
	.map	B_sum3/B6
	.map	B_sum4/B7
	.map	A_i/A3
	.map	A_i'/A4
	.map	B_sum5/B22
	.map	B_sum6/B23
	.map	A_j/A14
	.map	A_j'/A16
	.map	A_k/A4
	.map	B_sum7/B6
	.map	B_xh0/B17
	.map	B_temp/B4
	.map	B_sum8/B7
	.map	B_xh1/B5
	.map	B_xl0/B7
	.map	B_x_h2p/B27
	.map	B_xl1/B9
	.map	B_i/B4
	.map	A_w/A5
	.map	A_x/A31
	.map	A_y/A30
	.map	B_n/B2
	.map	B_n$1/A4
	.map	B_n$2/A3
	.map	B_n$3/B30
	.map	A_p_x0/A9
	.map	A_p_x0'/A3
	.map	A_p_y0/A8
	.map	B_x_l1p/B31
	.map	B_p_y/B16
	.map	B_xt0/B7
	.map	B_x_l2p/B29
	.map	B_w/B18
	.map	B_xt1/B5
	.map	B_x/B26
	.map	B_xt2/B17
	.map	B_y/B16
	.map	A_x_h2p/A7
	.map	A_offset/A10
	.map	A_offset'/A31
	.map	B_yt0/B11
	.map	B_fft_jmp/B12
	.map	B_yt1/B9
	.map	B_yt2/B8
	.map	B_yt4/B20
	.map	B_yt5/B21
	.map	B_yt6/B24
	.map	B_yt7/B25
	.map	B_tw_offset/B13
	.map	A_x_l1p/A23
	.map	A_x_l2p/A21
	.map	A_radix/A2
	.map	A_x_h2/A6
	.map	B_prod10/B8
	.map	B_prod11/B6
	.map	B_prod12/B4
	.map	A_x_l1/A22
	.map	A_x_l2/A20
	.map	A_h2/A29
	.map	A_l0/A7
	.map	B_outjmp2/B9
	.map	B_xh20/B20
	.map	B_xh21/B21
	.map	B_xl20/B20
	.map	B_h2/B19
	.map	A_prod10/A11
	.map	B_xl21/B5
	.map	A_temp1/A19
	.map	A_prod11/A6
	.map	A_prod12/A5
	.map	A_next/A28
	.map	B_xh0_1/B26
	.map	A_w0/A27
	.map	A_co1/A24
	.map	B_flag/B1
	.map	A_co2/A6
	.map	B_l0/B6
	.map	A_x0/A26
	.map	A_x0'/A5
	.map	A_x0''/A16
	.map	A_co3/A18
	.map	B_prod1/B17
	.map	A_x1/A27
	.map	A_x1'/A4
	.map	A_x1''/A17
	.map	B_xh1_1/B27
	.map	B_prod2/B8
	.map	B_prod3/B18
	.map	A_x4/A24
	.map	A_x4'/A18
	.map	B_prod4/B7
	.map	A_x5/A25
	.map	A_x5'/A19
	.map	B_prod5/B10
	.map	B_prod6/B6
	.map	B_prod7/B20
	.map	B_prod8/B22
	.map	A_fft_jmp/A26
	.map	B_prod9/B6
	.map	B_outjmp/B8
	.map	A_sum1/A8
	.map	A_sum2/A9
	.map	A_sum3/A8
	.map	A_xh0_0/A20
	.map	A_sum4/A9
	.map	A_sum5/A22
	.map	B_p_x0/B7
	.map	B_p_x0'/B6
	.map	A_sum6/A23
	.map	A_sum7/A20
	.map	A_xh1_0/A21
	.map	A_sum8/A21
	.map	A_prod1/A8
	.map	A_prod2/A21
	.map	A_prod3/A7
	.map	B_w0/B29
	.map	A_prod4/A5
	.map	A_prod5/A19
	.map	B_x0/B22
	.map	A_prod6/A3
	.map	B_x1/B23
	.map	B_x2/B28
	.map	B_x2'/B30
	.map	A_prod7/A15
	.map	B_x3/B29
	.map	B_x3'/B19
	.map	A_prod8/A12
	.map	A_prod9/A21
	.map	B_xl0_1/B23
	.map	B_x6/B4
	.map	B_x6'/B17
	.map	B_x7/B5
	.map	B_x7'/B18
	.map	B_xl1_1/B22
	.map	B_radix2/B0
	.map	B_radix2'/B5
	.map	A_predj/A1
	.map	A_predj'/A0
	.map	B_co1/B0
	.map	B_co2/B28
	.map	A_xl0_0/A22
	.map	A_outjmp/A6
	.map	B_co3/B24
	.map	A_si1/A25
	.map	A_si2/A7
	.map	A_xl1_0/A23
	.map	B_x_h2/B26
	.map	A_si3/A19
	.map	B_x_l1/B30
	.map	B_x_l2/B28
	.map	A_xh0/A4
	.map	A_xh1/A3
	.map	B_stride/B2
	.map	B_6/B4
	.map	A_xl0/A5
	.map	A_xl1/A9
	.map	B_while/B0
	.map	B_n_max/B10
	.map	B_n_max'/B5
	.map	A_p_y/A17
	.map	B_ptr_x/B4
	.map	B_ptr_x$1/A31
	.map	B_ptr_x$2/A30
	.map	B_ptr_x$3/A9
	.map	A_xt0/A8
	.map	B_n_min/B8
	.map	B_n_min'/B4
	.map	B_ptr_y/B6
	.map	B_ptr_y'/A8
	.map	A_xt1/A13

           STW     .D2T1   A11,*SP--(8)      ; |419| 
           STW     .D2T1   A10,*SP--(8)      ; |419| 
           STDW    .D2T2   B13:B12,*SP--     ; |419| 
           STDW    .D2T2   B11:B10,*SP--     ; |419| 
           STDW    .D2T1   A15:A14,*SP--     ; |419| 
           STDW    .D2T1   A13:A12,*SP--     ; |419| 
           STW     .D2T2   B3,*SP--(40)      ; |419| 
           STW     .D2T2   B_ptr_x,*+SP(28)  ; |419| 
           STW     .D2T2   B_n_max,*+SP(24)  ; |419| 
           STW     .D2T1   A_offset,*+SP(20) ; |419| 

           STW     .D2T2   B_n_min,*+SP(16)  ; |419| 
||         MV      .L2X    B_n$1,B_n         ; |419| 

           STW     .D2T2   B_ptr_y,*+SP(12)  ; |419| 
||         NORM    .L2     B_n,B_radix2'     ; |464| 

           STW     .D2T1   A_ptr_w,*+SP(8)   ; |419| 
||         AND     .L2     0x1,B_radix2',B_radix2 ; |465| 
||         MVK     .L1     0x4,A_radix       ; |462| 

           STW     .D2T1   B_n$1,*+SP(4)     ; |419| 
||         ZERO    .L2     B_tw_offset       ; |470| 
|| [ B_radix2] MVK .L1     0x2,A_radix       ; |466| 

;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L1
;** --------------------------------------------------------------------------*
$C$L1:    

; ILOOP: .trip 8
           LDW     .D2T2   *+SP(4),B_n$3     ; |484| 
           LDW     .D2T1   *+SP(28),B_ptr_x$2 ; |481| 
           LDW     .D2T2   *+SP(8),A_ptr_w'
           MVK     .L2     0x6,B_6           ; |472| 
           SHRU    .S2     B_stride,0x2,B_h2 ; |481| 

           MPY32   .M2     B_6,B_stride,B_fft_jmp ; |478| 
||         SHRU    .S2     B_n$3,0x3,B_i     ; |496| 

           MVC     .S2     B_i,RILC
||         ADD     .L2     -1,B_i,B5         ; |497| 
||         MV      .L1     B_ptr_x$2,B_ptr_x$1 ; |485| 

$C$L2:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 29

           SPLOOPD 14      ;42               ; (P) 
||         MV      .L1X    B_h2,A_h2         ; |482| 
||         ADDAH   .D2     A_ptr_w',B_tw_offset,B_w0 ; |489| 
||         MVC     .S2     B5,ILC

;** --------------------------------------------------------------------------*
$C$L3:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 14

           ADD     .D2X    0x8,A_x,B_x       ; |510| (P) <0,0> x_copy =x
||         LDDW    .D1T1   *A_x++[A_h2],A_x1'':A_x0'' ; |512| (P) <0,0> Load x1, x0

           SPMASK          S1
||         SHRU    .S1X    B_fft_jmp,0x3,A_fft_jmp ; |479| 
||         LDDW    .D1T1   *A_x++[A_h2],A_x_h2p:A_x_h2 ; |513| (P) <0,1> Load x_h2p, x_h2
||         LDDW    .D2T2   *B_x++[B_h2],B_x1:B_x0 ; |517| (P) <0,1> Load x1, x0

           SPMASK          L1
||         ADD     .L1     0xfffffffe,A_fft_jmp,A_next ; |486| 
||         LDDW    .D1T1   *A_x++[A_h2],A_x_l1p:A_x_l1 ; |514| (P) <0,2> Load x_l1p, x_l1
||         LDDW    .D2T2   *B_x++[B_h2],B_x_h2p:B_x_h2 ; |518| (P) <0,2> Load x_h2p, x_h2

           SPMASK          L1,S1,L2,S2
||         ZERO    .L1     A_j               ; |476| 
||         SHRU    .S2     B_fft_jmp,0x1,B_fft_jmp_1 ; |492| 
||         MV      .S1X    B_w0,A_w0         ; |490| 
||         ADD     .L2X    0xfffffffe,A_fft_jmp,B_next ; |486| 
||         LDDW    .D1T1   *A_x--[A_next],A_x_l2p:A_x_l2 ; |515| (P) <0,3> Load x_l2p, x_l2
||         LDDW    .D2T2   *B_x++[B_h2],B_x_l1p:B_x_l1 ; |519| (P) <0,3> Load x_l1p, x_l1

           SPMASK          L2
||         ADD     .L2     B_tw_offset,B_fft_jmp_1,B_tw_offset ; |493| 
||         ADDAD   .D1     A_w0,A_j,A_w      ; |500| (P) <0,4> 
||         LDDW    .D2T2   *B_x--[B_next],B_x_l2p:B_x_l2 ; |520| (P) <0,4> Load x_l2p, x_l2

           NOP             1

           MV      .D2X    A_w,B_w           ; |501| (P) <0,6> 
||         ADD     .S1     0x6,A_j,A_j       ; |540| (P) <0,6> j += 6

           ADDSP   .S1     A_x0'',A_x_l1,A_xh0 ; |522| (P) <0,7> xh0 = x0 + x_l1
||         ADDSP   .L1     A_x1'',A_x_l1p,A_xh1 ; |523| (P) <0,7> xh1 = x1 + x_l1p

           LDDW    .D2T2   *+B_w(32),B_si2:B_co2 ; |507| (P) <0,8> Load si2, co2
||         SUBSP   .S2     B_x0,B_x_l1,B_xl0 ; |533| (P) <0,8> xl0 = x0 - x_l1
||         ADDSP   .L2     B_x0,B_x_l1,B_xh0 ; |531| (P) <0,8> xh0 = x0 + x_l1
||         ADDSP   .L1     A_x_h2p,A_x_l2p,A_xh21 ; |527| (P) <0,8> xh21 = x_h2p + x_l2p
||         LDDW    .D1T1   *A_w,A_si1:A_co1  ; |503| (P) <0,8> Load si1, co1

           SUBSP   .S1     A_x_h2,A_x_l2,A_xl20 ; |528| (P) <0,9> xl20 = x_h2 - x_l2
||         ADDSP   .L1     A_x_h2,A_x_l2,A_xh20 ; |526| (P) <0,9> xh20 = x_h2 + x_l2
||         ADDSP   .S2     B_x_h2,B_x_l2,B_xh20 ; |535| (P) <0,9> xh20 = x_h2 + x_l2
||         SUBSP   .L2     B_x_h2p,B_x_l2p,B_xl21 ; |538| (P) <0,9> xl21 = x_h2p - x_l2p

           SUBSP   .S2     B_x1,B_x_l1p,B_xl1 ; |534| (P) <0,10> xl1 = x1 - x_l1p
||         ADDSP   .L2     B_x_h2p,B_x_l2p,B_xh21 ; |536| (P) <0,10> xh21 = x_h2p + x_l2p
||         LDDW    .D1T1   *+A_w(16),A_si3:A_co3 ; |505| (P) <0,10> Load si3, co3
||         SUBSP   .L1     A_x_h2p,A_x_l2p,A_xl21 ; |529| (P) <0,10> xl21 = x_h2p - x_l2p

           ADDSP   .S2     B_x1,B_x_l1p,B_xh1 ; |532| (P) <0,11> xh1 = x1 + x_l1p
||         LDDW    .D1T1   *+A_w(8),A_si2:A_co2 ; |504| (P) <0,11> Load si2, co2
||         SUBSP   .L1     A_x1'',A_x_l1p,A_xl1 ; |525| (P) <0,11> xl1 = x1 - x_l1p
||         SUB     .S1     A_j,A_fft_jmp,A_predj ; |541| (P) <0,11> predj = j - fft_jmp
||         SUBSP   .L2     B_x_h2,B_x_l2,B_xl20 ; |537| (P) <0,11> xl20 = x_h2 - x_l2

           SUBSP   .S1     A_x0'',A_x_l1,A_xl0 ; |524| (P) <0,12> xl0 = x0 - x_l1
||         SUBSP   .L1     A_xh1,A_xh21,A_yt0' ; |552| (P) <0,12>  ^ yt0 = xh1 - xh21
|| [!A_predj] ADD  .D1X    A_x,B_fft_jmp,A_x ; |542| (P) <0,12> *x = *x + fft_jmp
||         LDDW    .D2T2   *+B_w(40),B_si3:B_co3 ; |508| (P) <0,12> Load si3, co3

           LDDW    .D2T2   *+B_w(24),B_si1:B_co1 ; |506| (P) <0,13> Load si1, co1
||         SUBSP   .L1     A_xh0,A_xh20,A_xt0 ; |551| (P) <0,13>  ^ xt0 = xh0 - xh20
||         ADDSP   .L2     B_xl0,B_xl21,B_xt1 ; |597| (P) <0,13> xt1 = xl0 + xl21
||         SUBSP   .S2     B_xh0,B_xh20,B_xt0 ; |587| (P) <0,13> xt0 = xh0 - xh20

           ADDSP   .L2     B_xh0,B_xh20,B_sum1 ; |583| (P) <0,14> temp1 = xh0 + xh20
||         SUBSP   .S2     B_xl0,B_xl21,B_xt2 ; |607| (P) <0,14> xt2 = xl0 - xl21
|| [!A_predj] ZERO .S1     A_j               ; |543| (P) <0,14> j=0

           SUBSP   .L2     B_xh1,B_xh21,B_yt0 ; |588| (P) <0,15> yt0 = xh1 - xh21
||         SUBSP   .S2     B_xl1,B_xl20,B_yt1 ; |598| (P) <0,15> yt1 = xl1 - xl20
||         ADDSP   .S1     A_xl1,A_xl20,A_yt2' ; |572| (P) <0,15> yt2 = xl1 + xl20

           ADDSP   .S2     B_xh1,B_xh21,B_sum2 ; |584| (P) <0,16> temp2 = xh1 + xh21
||         SUBSP   .S1     A_xl0,A_xl21,A_xt2 ; |571| (P) <0,16> xt2 = xl0 - xl21
||         MPYSP   .M1     A_yt0',A_co2,A_prod7 ; |555| (P) <0,16>  ^ prod3 = yt0 * co2

           ADDSP   .S2     B_xl1,B_xl20,B_yt2 ; |608| (P) <0,17> yt2 = xl1 + xl20
||         MPYSP   .M1     A_xt0,A_si2,A_prod8 ; |556| (P) <0,17>  ^ prod4 = xt0 * si2

           ADDSP   .S1     A_xl0,A_xl21,A_xt1 ; |561| (P) <0,18> xt1 = xl0 + xl21
||         SUBSP   .L1     A_xl1,A_xl20,A_yt1' ; |562| (P) <0,18> yt1 = xl1 - xl20
||         MPYSP   .M2     B_xt0,B_co2,B_prod5 ; |589| (P) <0,18> prod1 = xt0 * co2
||         MPYSP   .M1     A_yt0',A_si2,A_prod6 ; |554| (P) <0,18>  ^ prod2 = yt0 * si2

           ADDSP   .L1     A_xh0,A_xh20,A_sum1 ; |547| (P) <0,19> temp1 = xh0 + xh20
||         MPYSP   .M2     B_xt0,B_si2,B_prod8 ; |592| (P) <0,19> prod4 = xt0 * si2
||         MPYSP   .M1     A_xt0,A_co2,A_prod5 ; |553| (P) <0,19>  ^ prod1 = xt0 * co2

           ADDSP   .L1     A_xh1,A_xh21,A_sum2 ; |548| (P) <0,20> temp2 = xh1 + xh21
||         MPYSP   .M2     B_yt0,B_si2,B_prod6 ; |590| (P) <0,20> prod2 = yt0 * si2
||         MPYSP   .M1     A_yt2',A_si3,A_prod10 ; |574| (P) <0,20> prod2 = yt2 * si3

           SPMASK          S2
||         SHRU    .S2     B_stride,0x2,B_stride ; |494| 
||         MPYSP   .M2     B_xt2,B_si3,B_prod12 ; |612| (P) <0,21> prod4 = xt2 * si3
||         MPYSP   .M1     A_yt2',A_co3,A_prod11 ; |575| (P) <0,21> prod3 = yt2 * co3

           MPYSP   .M2     B_yt0,B_co2,B_prod7 ; |591| (P) <0,22> prod3 = yt0 * co2
||         MPYSP   .M1     A_xt2,A_si3,A_prod12 ; |576| (P) <0,22> prod4 = xt2 * si3

           MPYSP   .M2     B_xt2,B_co3,B_prod9 ; |609| (P) <0,23> prod1 = xt2 * co3
||         MV      .D1     A_predj,A_predj'  ; |541| (P) <0,23>  ^ Split a long life
||         MPYSP   .M1     A_yt1',A_si1,A_prod2 ; |564| (P) <0,23> prod2 = yt1 * si1

           MPYSP   .M2     B_yt1,B_co1,B_prod3 ; |601| (P) <0,24> prod3 = yt1 * co1
||         ADD     .D2X    0x8,A_y,B_y       ; |545| (P) <0,24> 
||         MPYSP   .M1     A_yt1',A_co1,A_prod3 ; |565| (P) <0,24> prod3 = yt1 * co1
||         ADDSP   .S1     A_prod5,A_prod6,A_sum5 ; |557| (P) <0,24>  ^ sum1 = prod1 + prod2

           MPYSP   .M2     B_xt1,B_co1,B_prod1 ; |599| (P) <0,25> prod1 = xt1 * co1
||         STDW    .D2T2   B_sum2:B_sum1,*B_y++[B_h2] ; |585| (P) <0,25> ptr_x0[0] = temp1
||         MPYSP   .M1     A_xt1,A_si1,A_prod4 ; |566| (P) <0,25> prod4 = xt1 * si1

           MPYSP   .M2     B_xt1,B_si1,B_prod4 ; |602| (P) <0,26> prod4 = xt1 * si1
||         ADDSP   .S2     B_prod5,B_prod6,B_sum5 ; |593| (P) <0,26> sum1 = prod1 + prod2
||         SUBSP   .L2     B_prod7,B_prod8,B_sum6 ; |594| (P) <0,26> sum2 = prod3 - prod4
||         MPYSP   .M1     A_xt1,A_co1,A_prod1 ; |563| (P) <0,26> prod1 = xt1 * co1

           MPYSP   .M2     B_yt1,B_si1,B_prod2 ; |600| (P) <0,27> prod2 = yt1 * si1
||         STDW    .D1T1   A_sum2:A_sum1,*A_y++[A_h2] ; |549| (P) <0,27> ptr_x0[0] = temp1
||         SUBSP   .S1     A_prod7,A_prod8,A_sum6 ; |558| (P) <0,27>  ^ sum2 = prod3 - prod4
||         MPYSP   .M1     A_xt2,A_co3,A_prod9 ; |573| (P) <0,27> prod1 = xt2 * co3

           MPYSP   .M2     B_yt2,B_si3,B_prod10 ; |610| <0,28> prod2 = yt2 * si3
||         SUBSP   .L1     A_prod11,A_prod12,A_sum8 ; |578| <0,28> sum2 = prod3 - prod4

           MPYSP   .M2     B_yt2,B_co3,B_prod11 ; |611| <0,29> prod3 = yt2 * co3
||         SUBSP   .L1     A_prod3,A_prod4,A_sum4 ; |568| <0,29> sum2 = prod3 - prod4

           SUBSP   .L2     B_prod3,B_prod4,B_sum4 ; |604| <0,30> sum2 = prod3 - prod4
||         ADDSP   .L1     A_prod1,A_prod2,A_sum3 ; |567| <0,30> sum1 = prod1 + prod2

           ADDSP   .L2     B_prod1,B_prod2,B_sum3 ; |603| <0,31> sum1 = prod1 + prod2
||         ADDSP   .L1     A_prod9,A_prod10,A_sum7 ; |577| <0,31> sum1 = prod1 + prod2

           ADDSP   .L2     B_prod9,B_prod10,B_sum7 ; |613| <0,32> sum1 = prod1 + prod2

           SUBSP   .L2     B_prod11,B_prod12,B_sum8 ; |614| <0,33> sum2 = prod3 - prod4
||         STDW    .D1T1   A_sum6:A_sum5,*A_y++[A_h2] ; |559| <0,33> ptr_x2[l1] = sum1
||         STDW    .D2T2   B_sum6:B_sum5,*B_y++[B_h2] ; |595| <0,33> ptr_x2[l1] = sum1

           STDW    .D1T1   A_sum4:A_sum3,*A_y++[A_h2] ; |569| <0,34> ptr_x2[l1] = sum1

           STDW    .D2T2   B_sum4:B_sum3,*B_y++[B_h2] ; |605| <0,35> ptr_x2[l1] = sum1
||         STDW    .D1T1   A_sum8:A_sum7,*A_y--[A_next] ; |579| <0,35> ptr_x2[l1] = sum1

   [!A_predj'] ADD .S1X    A_y,B_fft_jmp,A_y ; |581| <0,36> 

           SPKERNEL 0,11
||         STDW    .D2T2   B_sum8:B_sum7,*B_y++[B_h2] ; |615| <0,37> ptr_x2[l1] = sum1

;** --------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP EPILOG
;          EXCLUSIVE CPU CYCLES: 24
           CMPGTU  .L2X    B_stride,A_radix,B_while ; |619| 
           NOP             6
   [ B_while] BNOP .S2     $C$L1,5           ; |620| 
           ; BRANCHCC OCCURS {$C$L1}         ; |620| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(16),B_n_min' ; |630| 
           LDW     .D2T2   *+SP(24),B_n_max'
           LDW     .D2T1   *+SP(4),B_n$2     ; |630| 
           LDW     .D2T1   *+SP(20),A_offset' ; |642| 
           LDW     .D2T1   *+SP(28),B_ptr_x$3 ; |634| 

           CMPLT   .L2     0x4,B_n_min',B_flag ; |637| Check whether radix is > 4
||         LDW     .D2T1   *+SP(12),B_ptr_y' ; |635| 

   [ B_flag] B     .S1     $C$L8             ; |638| If radix > 4 No bitreversal
||         NORM    .L2     B_n_max',B_l0     ; |634| l0 =_NORM(n_max)
||         SHR     .S2     B_n_max',0x2,B_outjmp ; |641| nmax >>= 1

           SHRU    .S1     B_n$2,0x2,A_i'    ; |644| 
||         SHL     .S2     B_outjmp,0x1,B_outjmp2 ; |643| 
||         CMPEQ   .L2     0x2,B_n_min',B_radix2 ; |640| Check whether radix ==2

           ADD     .L1     0xfffffffe,A_i',A_i ; |645| 
||         ADD     .D1X    0x3,B_l0,A_l0     ; |635| 
||         SHR     .S1     A_offset',0x2,A_j ; |629| j = offset>>2

           ADD     .L2X    0x8,A_p_x0,B_p_x0 ; |631| 
           MV      .L1X    B_outjmp,A_outjmp ; |642| 
   [!B_flag] ADD   .L1     1,A_i,A4
           ; BRANCHCC OCCURS {$C$L8}         ; |638| 

$C$L5:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 22

           SPLOOPD 7       ;28               ; (P) 
||         ADD     .D2     B7,16,B_p_x0'
||         MVC     .S2X    A4,ILC

;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 7
           LDDW    .D2T2   *B_p_x0++(32),B_x3:B_x2 ; |650| (P) <0,0> load ptr_x0[2], ptr_x0[3]
           NOP             1

           SPMASK          D1
||         ADD     .D1     A9,16,A_p_x0'

           LDDW    .D1T1   *A_p_x0'++(32),A_x5:A_x4 ; |651| (P) <0,3> load ptr_x0[4], ptr_x0[5]
||         LDDW    .D2T2   *B_p_x0'++(32),B_x7:B_x6 ; |652| (P) <0,3> load ptr_x0[6], ptr_x0[7]

           LDDW    .D1T1   *A_p_x0++(32),A_x1:A_x0 ; |649| (P) <0,4> load ptr_x0[0], ptr_x0[1]
           MVD     .M2     B_x2,B_x2'        ; |650| (P) <0,5> Split a long life
           MVD     .M2     B_x3,B_x3'        ; |650| (P) <0,6> Split a long life
           NOP             1
           MVD     .M2     B_x6,B_x6'        ; |652| (P) <0,8> Split a long life

           MVD     .M2     B_x7,B_x7'        ; |652| (P) <0,9> Split a long life
||         MVD     .M1     A_x4,A_x4'        ; |651| (P) <0,9> Split a long life

           MVD     .M1     A_x5,A_x5'        ; |651| (P) <0,10> Split a long life
||         ADDSP   .L2     B_x2',B_x6,B_xh0_1 ; |656| (P) <0,10> xh0_1 = x2 + x6

           ADDSP   .S1     A_x1,A_x5,A_xh1_0 ; |655| (P) <0,11> xh1_0 = x1 + x5
||         ADDSP   .L2     B_x3',B_x7,B_xh1_1 ; |657| (P) <0,11> xh1_1 = x3 + x7

           ROTL    .M1     A_x0,0,A_x0'      ; |649| (P) <0,12> Split a long life
||         ADDSP   .L1     A_x0,A_x4,A_xh0_0 ; |654| (P) <0,12> xh0_0 = x0 + x4

           ROTL    .M1     A_x1,0,A_x1'      ; |649| (P) <0,13> Split a long life
||         SUBSP   .S2     B_x2',B_x6',B_xl0_1 ; |669| (P) <0,13> xl0_1 = x2 - x6

           SUBSP   .S2     B_x3',B_x7',B_xl1_1 ; |670| (P) <0,14> xl1_1 = x3 - x7

           SUBSP   .S1     A_x1',A_x5',A_xl1_0 ; |668| (P) <0,15> xl1_0 = x1 - x5
||         SUBSP   .L1     A_x0',A_x4',A_xl0_0 ; |667| (P) <0,15> xl0_0 = x0 - x4
|| [ B_radix2] DMV .S2     B_x3',B_x2',B_xh1_1:B_xh0_1 ; |660| (P) <0,15> xh0_1 = x2;xh1_1 = x3;

   [ B_radix2] DMV .S1     A_x1',A_x0',A_xh1_0:A_xh0_0 ; |659| (P) <0,16> xh0_0 = x0;xh1_0 = x1;

           SPMASK          S1
||         MV      .S1     A_j,A_j'
||         ADDSP   .L1X    A_xh1_0,B_xh1_1,A_yt1 ; |663| (P) <0,17> yt1 =xh1_0 + xh1_1

           BITR    .M1     A_j',A_temp1      ; |684| (P) <0,18> k = _bitr(j) >> l0;
|| [ B_radix2] DMV .S2     B_x7',B_x6',B_xl0_1:B_xl1_1 ; |673| (P) <0,18> xl1_1 = x6;xl0_1 = x7;
||         ADDSP   .L1X    A_xh0_0,B_xh0_1,A_yt0 ; |662| (P) <0,18> yt0 =xh0_0 + xh0_1

           SUBSP   .L2X    A_xh0_0,B_xh0_1,B_yt4 ; |664| (P) <0,19> yt4 =xh0_0 - xh0_1
|| [ B_radix2] DMV .S1     A_x5',A_x4',A_xl1_0:A_xl0_0 ; |672| (P) <0,19> xl0_0 = x4;xl1_0 = x5;

           SHRU    .S1     A_temp1,A_l0,A_k  ; |685| (P) <0,20> k = _bitr(j) >> l0;
||         SUBSP   .L2X    A_xh1_0,B_xh1_1,B_yt5 ; |665| (P) <0,20> yt5 =xh1_0 - xh1_1
||         SUBSP   .L1X    A_xl1_0,B_xl0_1,A_yt3 ; |676| (P) <0,20> yt3 = xl1_0 - xl0_1

           ADDAW   .D1     A_p_y0,A_k,A_p_y  ; |689| <0,21>  ^ *y1 = *y0 + k
||         ADDSP   .L2X    A_xl1_0,B_xl0_1,B_yt7 ; |678| <0,21> yt7 = xl1_0 + xl0_1

           SUBSP   .L2X    A_xl0_0,B_xl1_1,B_yt6 ; |677| <0,22> yt6 = xl0_0 - xl1_1

           MV      .D2X    A_p_y,B_p_y       ; |690| <0,23>  ^ 
||         ADDSP   .L1X    A_xl0_0,B_xl1_1,A_yt2 ; |675| <0,23> yt2 = xl0_0 + xl1_1
||         STDW    .D1T1   A_yt1:A_yt0,*A_p_y++[A_outjmp] ; |692| <0,23>  ^ store yt0, yt1

           ADD     .S1     0x1,A_j',A_j'     ; |687| <0,24> j = j+1
   [ B_radix2] MV  .D2X    A_yt3,B_temp      ; |680| <0,25> if radix ==2

           STDW    .D2T2   B_yt5:B_yt4,*++B_p_y[B_outjmp2] ; |695| <0,26> store yt4, yt5
|| [ B_radix2] MV  .D1X    B_yt7,A_yt3       ; |681| <0,26> swap yt3, yt7
|| [ B_radix2] MV  .S2     B_temp,B_yt7      ; |682| <0,26> 

           SPKERNEL 3,0
||         STDW    .D1T1   A_yt3:A_yt2,*A_p_y++[A_outjmp] ; |693| <0,27>  ^ store yt2, yt3
||         STDW    .D2T2   B_yt7:B_yt6,*++B_p_y[B_outjmp] ; |696| <0,27> store yt6, yt7

;** --------------------------------------------------------------------------*
$C$L7:    ; PIPED LOOP EPILOG
;          EXCLUSIVE CPU CYCLES: 21
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(40),B3      ; |703| 
           LDDW    .D2T1   *++SP,A13:A12     ; |703| 
           LDDW    .D2T1   *++SP,A15:A14     ; |703| 
           LDDW    .D2T2   *++SP,B11:B10     ; |703| 
           LDDW    .D2T2   *++SP,B13:B12     ; |703| 

           LDW     .D2T1   *++SP(8),A10      ; |703| 
||         RET     .S2     B3                ; |703| 

           LDW     .D2T1   *++SP(8),A11      ; |703| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |703| 
	.clearmap


;     .endproc                     
                                 
* ======================================================================== *
*  End of file:  DSPF_sp_fftSPxSP.asm                                      *
* ------------------------------------------------------------------------ *
*            Copyright (c) 2011 Texas Instruments, Incorporated.           *
*                          All Rights Reserved.                            *
* ======================================================================== *
                                 

