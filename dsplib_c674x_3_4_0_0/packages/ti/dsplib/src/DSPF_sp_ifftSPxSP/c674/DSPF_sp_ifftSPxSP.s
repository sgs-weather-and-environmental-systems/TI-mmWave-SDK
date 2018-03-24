* ======================================================================= *
* DSPF_sp_ifftSPxSP.asm -- Inverse FFT with Mixed Radix                   *
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

	.sect	".text:optimized"
    .if __TI_EABI__
    .asg  DSPF_sp_ifftSPxSP, _DSPF_sp_ifftSPxSP
    .endif			
	
    .global _DSPF_sp_ifftSPxSP
	.clink

_DSPF_sp_ifftSPxSP:

	.map	A_xt2/A10
	.map	A_xh20/A13
	.map	B_next/B3
	.map	A_xh21/A20
	.map	A_yt0/A16
	.map	A_yt0'/A3
	.map	A_yt0''/A17
	.map	A_yt1/A17
	.map	A_yt1'/A3
	.map	A_yt1''/A4
	.map	A_yt2/A28
	.map	A_yt2'/A16
	.map	A_yt2''/A11
	.map	A_yt3/A29
	.map	A_yt3'/A16
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
	.map	A_i'/A8
	.map	B_sum5/B22
	.map	B_sum6/B23
	.map	A_j/A14
	.map	A_j'/A8
	.map	A_k/A3
	.map	B_sum7/B6
	.map	B_xh0/B17
	.map	B_sum8/B7
	.map	B_xh1/B5
	.map	B_xl0/B7
	.map	B_x_h2p/B27
	.map	B_xl1/B9
	.map	A_2f/A3
	.map	B_i/B5
	.map	B_i'/B4
	.map	A_w/A5
	.map	A_x/A31
	.map	A_y/A30
	.map	B_n/B2
	.map	B_n$1/A4
	.map	B_n$2/B30
	.map	B_n$3/A31
	.map	A_p_x0/A7
	.map	A_p_x0'/A9
	.map	A_p_y0/A6
	.map	B_x_l1p/B31
	.map	B_p_y/B28
	.map	B_xt0/B7
	.map	B_x_l2p/B29
	.map	B_w/B18
	.map	B_xt1/B5
	.map	B_x/B26
	.map	B_xt2/B17
	.map	B_y/B16
	.map	A_x_h2p/A7
	.map	A_offset/A10
	.map	A_offset'/A29
	.map	B_yt0/B11
	.map	B_fft_jmp/B12
	.map	B_yt1/B9
	.map	B_yt2/B8
	.map	B_yt4/B20
	.map	B_yt4'/B4
	.map	B_yt5/B21
	.map	B_yt5'/B4
	.map	B_yt6/B22
	.map	B_yt6'/B4
	.map	B_yt7/B23
	.map	B_yt7'/B4
	.map	B_scale/B19
	.map	B_scale'/B4
	.map	B_tw_offset/B13
	.map	A_x_l1p/A23
	.map	A_x_l2p/A21
	.map	A_radix/A2
	.map	A_x_h2/A6
	.map	B_prod10/B8
	.map	B_prod11/B6
	.map	B_prod12/B4
	.map	A_scale/A5
	.map	A_x_l1/A22
	.map	A_x_l2/A20
	.map	A_h2/A29
	.map	A_l0/A4
	.map	A_l0'/A30
	.map	B_outjmp2/B18
	.map	B_xh20/B20
	.map	B_xh21/B21
	.map	B_xl20/B20
	.map	B_h2/B19
	.map	A_prod10/A11
	.map	B_xl21/B5
	.map	A_temp1/A3
	.map	A_prod11/A6
	.map	A_prod12/A5
	.map	A_next/A28
	.map	B_xh0_1/B24
	.map	A_w0/A27
	.map	A_co1/A24
	.map	B_flag/B1
	.map	A_co2/A6
	.map	A_x0/A26
	.map	A_x0'/A16
	.map	A_co3/A18
	.map	B_prod1/B17
	.map	A_x1/A27
	.map	A_x1'/A17
	.map	B_xh1_1/B25
	.map	B_prod2/B8
	.map	B_prod3/B18
	.map	A_x4/A24
	.map	B_prod4/B7
	.map	A_x5/A25
	.map	B_prod5/B10
	.map	B_prod6/B6
	.map	B_prod7/B20
	.map	B_prod8/B22
	.map	A_fft_jmp/A26
	.map	B_prod9/B6
	.map	B_outjmp/B17
	.map	A_sum1/A8
	.map	A_sum2/A9
	.map	A_sum3/A8
	.map	A_xh0_0/A18
	.map	A_sum4/A9
	.map	A_sum5/A22
	.map	B_p_x0/B16
	.map	B_p_x0'/B5
	.map	A_sum6/A23
	.map	A_sum7/A20
	.map	A_xh1_0/A19
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
	.map	B_x2/B26
	.map	A_prod7/A15
	.map	B_x3/B27
	.map	A_prod8/A12
	.map	A_prod9/A21
	.map	B_xl0_1/B9
	.map	B_x6/B6
	.map	B_x7/B7
	.map	B_xl1_1/B8
	.map	B_radix2/B0
	.map	B_radix2'/B5
	.map	A_predj/A1
	.map	A_predj'/A0
	.map	B_co1/B0
	.map	B_co2/B28
	.map	A_xl0_0/A22
	.map	A_outjmp/A20
	.map	B_co3/B24
	.map	A_si1/A25
	.map	A_si2/A7
	.map	A_xl1_0/A23
	.map	B_x_h2/B26
	.map	A_si3/A19
	.map	B_x_l1/B30
	.map	B_x_l2/B28
	.map	A_iscale/A4
	.map	A_xh0/A4
	.map	A_xh1/A3
	.map	B_stride/B2
	.map	B_6/B4
	.map	A_xl0/A5
	.map	A_xl1/A9
	.map	B_while/B0
	.map	B_n_max/B10
	.map	B_n_max'/B5
	.map	A_p_y/A21
	.map	B_ptr_x/B4
	.map	B_ptr_x$1/A31
	.map	B_ptr_x$2/A30
	.map	B_ptr_x$3/A7
	.map	A_xt0/A8
	.map	B_n_min/B8
	.map	B_n_min'/B31
	.map	B_ptr_y/B6
	.map	B_ptr_y'/A6
	.map	A_xt1/A13

           STW     .D2T1   A11,*SP--(8)      ; |415| 
           STW     .D2T1   A10,*SP--(8)      ; |415| 
           STDW    .D2T2   B13:B12,*SP--     ; |415| 
           STDW    .D2T2   B11:B10,*SP--     ; |415| 
           STDW    .D2T1   A15:A14,*SP--     ; |415| 
           STDW    .D2T1   A13:A12,*SP--     ; |415| 
           STW     .D2T2   B3,*SP--(40)      ; |415| 
           STW     .D2T2   B_ptr_x,*+SP(28)  ; |415| 
           STW     .D2T2   B_n_max,*+SP(24)  ; |415| 
           STW     .D2T1   A_offset,*+SP(20) ; |415| 

           STW     .D2T2   B_n_min,*+SP(16)  ; |415| 
||         MV      .L2X    B_n$1,B_n         ; |415| 

           STW     .D2T2   B_ptr_y,*+SP(12)  ; |415| 
||         NORM    .L2     B_n,B_radix2'     ; |460| 

           STW     .D2T1   A_ptr_w,*+SP(8)   ; |415| 
||         AND     .L2     0x1,B_radix2',B_radix2 ; |461| 
||         MVK     .L1     0x4,A_radix       ; |458| 

           STW     .D2T1   B_n$1,*+SP(4)     ; |415| 
||         ZERO    .L2     B_tw_offset       ; |466| 
|| [ B_radix2] MVK .L1     0x2,A_radix       ; |462| 

$C$L1:    
;          EXCLUSIVE CPU CYCLES: 9
; ILOOP: .trip 8
           LDW     .D2T2   *+SP(4),B_n$2     ; |479| 
           LDW     .D2T1   *+SP(28),B_ptr_x$2 ; |476| 
           LDW     .D2T2   *+SP(8),A_ptr_w'
           MVK     .L2     0x6,B_6           ; |467| 
           MPY32   .M2     B_6,B_stride,B_fft_jmp ; |473| 
           SHRU    .S2     B_n$2,0x3,B_i     ; |491| 
           ADD     .L2     0xfffffffe,B_i,B_i' ; |492| 

           ADD     .L2     2,B_i',B_i
||         SHRU    .S2     B_stride,0x2,B_h2 ; |476| 

           MVC     .S2     B_i,RILC
||         ADD     .L2     1,B_i',B4
||         MV      .L1     B_ptr_x$2,B_ptr_x$1 ; |480| 

;*----------------------------------------------------------------------------*
$C$L2:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 29

           SPLOOPD 14      ;42               ; (P) 
||         MV      .L1X    B_h2,A_h2         ; |477| 
||         ADDAH   .D2     A_ptr_w',B_tw_offset,B_w0 ; |484| 
||         MVC     .S2     B4,ILC

;** --------------------------------------------------------------------------*
$C$L3:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 14

           ADD     .D2X    0x8,A_x,B_x       ; |505| (P) <0,0> x_copy =x
||         LDDW    .D1T1   *A_x++[A_h2],A_x1':A_x0' ; |507| (P) <0,0> Load x1, x0

           SPMASK          S1
||         SHRU    .S1X    B_fft_jmp,0x3,A_fft_jmp ; |474| 
||         LDDW    .D1T1   *A_x++[A_h2],A_x_h2p:A_x_h2 ; |508| (P) <0,1> Load x_h2p, x_h2
||         LDDW    .D2T2   *B_x++[B_h2],B_x1:B_x0 ; |512| (P) <0,1> Load x1, x0

           SPMASK          L1
||         ADD     .L1     0xfffffffe,A_fft_jmp,A_next ; |481| 
||         LDDW    .D1T1   *A_x++[A_h2],A_x_l1p:A_x_l1 ; |509| (P) <0,2> Load x_l1p, x_l1
||         LDDW    .D2T2   *B_x++[B_h2],B_x_h2p:B_x_h2 ; |513| (P) <0,2> Load x_h2p, x_h2

           SPMASK          L1,S1,L2,S2
||         ZERO    .L1     A_j               ; |471| 
||         SHRU    .S2     B_fft_jmp,0x1,B_fft_jmp_1 ; |487| 
||         MV      .S1X    B_w0,A_w0         ; |485| 
||         ADD     .L2X    0xfffffffe,A_fft_jmp,B_next ; |481| 
||         LDDW    .D1T1   *A_x--[A_next],A_x_l2p:A_x_l2 ; |510| (P) <0,3> Load x_l2p, x_l2
||         LDDW    .D2T2   *B_x++[B_h2],B_x_l1p:B_x_l1 ; |514| (P) <0,3> Load x_l1p, x_l1

           SPMASK          L2
||         ADD     .L2     B_tw_offset,B_fft_jmp_1,B_tw_offset ; |488| 
||         ADDAD   .D1     A_w0,A_j,A_w      ; |495| (P) <0,4> 
||         LDDW    .D2T2   *B_x--[B_next],B_x_l2p:B_x_l2 ; |515| (P) <0,4> Load x_l2p, x_l2

           NOP             1

           MV      .D2X    A_w,B_w           ; |496| (P) <0,6> 
||         ADD     .S1     0x6,A_j,A_j       ; |535| (P) <0,6> j += 6

           ADDSP   .S1     A_x0',A_x_l1,A_xh0 ; |517| (P) <0,7> xh0 = x0 + x_l1
||         ADDSP   .L1     A_x1',A_x_l1p,A_xh1 ; |518| (P) <0,7> xh1 = x1 + x_l1p

           LDDW    .D2T2   *+B_w(32),B_si2:B_co2 ; |502| (P) <0,8> Load si2, co2
||         SUBSP   .S2     B_x0,B_x_l1,B_xl0 ; |528| (P) <0,8> xl0 = x0 - x_l1
||         ADDSP   .L2     B_x0,B_x_l1,B_xh0 ; |526| (P) <0,8> xh0 = x0 + x_l1
||         ADDSP   .L1     A_x_h2p,A_x_l2p,A_xh21 ; |522| (P) <0,8> xh21 = x_h2p + x_l2p
||         LDDW    .D1T1   *A_w,A_si1:A_co1  ; |498| (P) <0,8> Load si1, co1

           SUBSP   .S1     A_x_h2,A_x_l2,A_xl20 ; |523| (P) <0,9> xl20 = x_h2 - x_l2
||         ADDSP   .L1     A_x_h2,A_x_l2,A_xh20 ; |521| (P) <0,9> xh20 = x_h2 + x_l2
||         ADDSP   .S2     B_x_h2,B_x_l2,B_xh20 ; |530| (P) <0,9> xh20 = x_h2 + x_l2
||         SUBSP   .L2     B_x_h2p,B_x_l2p,B_xl21 ; |533| (P) <0,9> xl21 = x_h2p - x_l2p

           SUBSP   .S2     B_x1,B_x_l1p,B_xl1 ; |529| (P) <0,10> xl1 = x1 - x_l1p
||         ADDSP   .L2     B_x_h2p,B_x_l2p,B_xh21 ; |531| (P) <0,10> xh21 = x_h2p + x_l2p
||         LDDW    .D1T1   *+A_w(16),A_si3:A_co3 ; |500| (P) <0,10> Load si3, co3
||         SUBSP   .L1     A_x_h2p,A_x_l2p,A_xl21 ; |524| (P) <0,10> xl21 = x_h2p - x_l2p

           ADDSP   .S2     B_x1,B_x_l1p,B_xh1 ; |527| (P) <0,11> xh1 = x1 + x_l1p
||         LDDW    .D1T1   *+A_w(8),A_si2:A_co2 ; |499| (P) <0,11> Load si2, co2
||         SUBSP   .L1     A_x1',A_x_l1p,A_xl1 ; |520| (P) <0,11> xl1 = x1 - x_l1p
||         SUB     .S1     A_j,A_fft_jmp,A_predj ; |536| (P) <0,11> predj = j - fft_jmp
||         SUBSP   .L2     B_x_h2,B_x_l2,B_xl20 ; |532| (P) <0,11> xl20 = x_h2 - x_l2

           SUBSP   .S1     A_x0',A_x_l1,A_xl0 ; |519| (P) <0,12> xl0 = x0 - x_l1
||         SUBSP   .L1     A_xh1,A_xh21,A_yt0'' ; |547| (P) <0,12>  ^ yt0 = xh1 - xh21
|| [!A_predj] ADD  .D1X    A_x,B_fft_jmp,A_x ; |537| (P) <0,12> *x = *x + fft_jmp
||         LDDW    .D2T2   *+B_w(40),B_si3:B_co3 ; |503| (P) <0,12> Load si3, co3

           LDDW    .D2T2   *+B_w(24),B_si1:B_co1 ; |501| (P) <0,13> Load si1, co1
||         SUBSP   .L1     A_xh0,A_xh20,A_xt0 ; |546| (P) <0,13>  ^ xt0 = xh0 - xh20
||         SUBSP   .L2     B_xl0,B_xl21,B_xt1 ; |592| (P) <0,13> xt1 = xl0 - xl21;
||         SUBSP   .S2     B_xh0,B_xh20,B_xt0 ; |582| (P) <0,13> xt0 = xh0 - xh20

           ADDSP   .L2     B_xh0,B_xh20,B_sum1 ; |578| (P) <0,14> temp1 = xh0 + xh20
||         ADDSP   .S2     B_xl0,B_xl21,B_xt2 ; |602| (P) <0,14> xt2 = xl0 + xl21
|| [!A_predj] ZERO .S1     A_j               ; |538| (P) <0,14> j=0

           SUBSP   .L2     B_xh1,B_xh21,B_yt0 ; |583| (P) <0,15> yt0 = xh1 - xh21
||         ADDSP   .S2     B_xl1,B_xl20,B_yt1 ; |593| (P) <0,15> yt1 = xl1 + xl20;
||         SUBSP   .S1     A_xl1,A_xl20,A_yt2'' ; |567| (P) <0,15> yt2 = xl1 - xl20; 

           ADDSP   .S2     B_xh1,B_xh21,B_sum2 ; |579| (P) <0,16> temp2 = xh1 + xh21
||         ADDSP   .S1     A_xl0,A_xl21,A_xt2 ; |566| (P) <0,16> xt2 = xl0 + xl21
||         MPYSP   .M1     A_yt0'',A_co2,A_prod7 ; |550| (P) <0,16>  ^ prod3 = yt0 * co2

           SUBSP   .S2     B_xl1,B_xl20,B_yt2 ; |603| (P) <0,17> yt2 = xl1 - xl20;
||         MPYSP   .M1     A_xt0,A_si2,A_prod8 ; |551| (P) <0,17>  ^ prod4 = xt0 * si2

           SUBSP   .S1     A_xl0,A_xl21,A_xt1 ; |556| (P) <0,18> xt1 = xl0 - xl21
||         ADDSP   .L1     A_xl1,A_xl20,A_yt1'' ; |557| (P) <0,18> yt1 = xl1 + xl20;
||         MPYSP   .M2     B_xt0,B_co2,B_prod5 ; |584| (P) <0,18> prod1 = xt0 * co2
||         MPYSP   .M1     A_yt0'',A_si2,A_prod6 ; |549| (P) <0,18>  ^ prod2 = yt0 * si2

           ADDSP   .L1     A_xh0,A_xh20,A_sum1 ; |542| (P) <0,19> temp1 = xh0 + xh20
||         MPYSP   .M2     B_xt0,B_si2,B_prod8 ; |587| (P) <0,19> prod4 = xt0 * si2
||         MPYSP   .M1     A_xt0,A_co2,A_prod5 ; |548| (P) <0,19>  ^ prod1 = xt0 * co2

           ADDSP   .L1     A_xh1,A_xh21,A_sum2 ; |543| (P) <0,20> temp2 = xh1 + xh21
||         MPYSP   .M2     B_yt0,B_si2,B_prod6 ; |585| (P) <0,20> prod2 = yt0 * si2
||         MPYSP   .M1     A_yt2'',A_si3,A_prod10 ; |569| (P) <0,20> prod2 = yt2 * si3

           SPMASK          S2
||         SHRU    .S2     B_stride,0x2,B_stride ; |489| 
||         MPYSP   .M2     B_xt2,B_si3,B_prod12 ; |607| (P) <0,21> prod4 = xt2 * si3
||         MPYSP   .M1     A_yt2'',A_co3,A_prod11 ; |570| (P) <0,21> prod3 = yt2 * co3

           MPYSP   .M2     B_yt0,B_co2,B_prod7 ; |586| (P) <0,22> prod3 = yt0 * co2
||         MPYSP   .M1     A_xt2,A_si3,A_prod12 ; |571| (P) <0,22> prod4 = xt2 * si3

           MPYSP   .M2     B_xt2,B_co3,B_prod9 ; |604| (P) <0,23> prod1 = xt2 * co3
||         MV      .D1     A_predj,A_predj'  ; |536| (P) <0,23>  ^ Split a long life
||         MPYSP   .M1     A_yt1'',A_si1,A_prod2 ; |559| (P) <0,23> prod2 = yt1 * si1

           MPYSP   .M2     B_yt1,B_co1,B_prod3 ; |596| (P) <0,24> prod3 = yt1 * co1
||         ADD     .D2X    0x8,A_y,B_y       ; |540| (P) <0,24> 
||         MPYSP   .M1     A_yt1'',A_co1,A_prod3 ; |560| (P) <0,24> prod3 = yt1 * co1
||         SUBSP   .S1     A_prod5,A_prod6,A_sum5 ; |552| (P) <0,24>  ^ sum1 = prod1 - prod2

           MPYSP   .M2     B_xt1,B_co1,B_prod1 ; |594| (P) <0,25> prod1 = xt1 * co1
||         STDW    .D2T2   B_sum2:B_sum1,*B_y++[B_h2] ; |580| (P) <0,25> ptr_x0[0] = temp1
||         MPYSP   .M1     A_xt1,A_si1,A_prod4 ; |561| (P) <0,25> prod4 = xt1 * si1

           MPYSP   .M2     B_xt1,B_si1,B_prod4 ; |597| (P) <0,26> prod4 = xt1 * si1
||         SUBSP   .S2     B_prod5,B_prod6,B_sum5 ; |588| (P) <0,26> sum1 = prod1 - prod2
||         ADDSP   .L2     B_prod7,B_prod8,B_sum6 ; |589| (P) <0,26> sum2 = prod3 + prod4
||         MPYSP   .M1     A_xt1,A_co1,A_prod1 ; |558| (P) <0,26> prod1 = xt1 * co1

           MPYSP   .M2     B_yt1,B_si1,B_prod2 ; |595| (P) <0,27> prod2 = yt1 * si1
||         STDW    .D1T1   A_sum2:A_sum1,*A_y++[A_h2] ; |544| (P) <0,27> ptr_x0[0] = temp1
||         ADDSP   .S1     A_prod7,A_prod8,A_sum6 ; |553| (P) <0,27>  ^ sum2 = prod3 + prod4
||         MPYSP   .M1     A_xt2,A_co3,A_prod9 ; |568| (P) <0,27> prod1 = xt2 * co3

           MPYSP   .M2     B_yt2,B_si3,B_prod10 ; |605| <0,28> prod2 = yt2 * si3
||         ADDSP   .L1     A_prod11,A_prod12,A_sum8 ; |573| <0,28> sum2 = prod3 + prod4

           MPYSP   .M2     B_yt2,B_co3,B_prod11 ; |606| <0,29> prod3 = yt2 * co3
||         ADDSP   .L1     A_prod3,A_prod4,A_sum4 ; |563| <0,29> sum2 = prod3 + prod4

           ADDSP   .L2     B_prod3,B_prod4,B_sum4 ; |599| <0,30> sum2 = prod3 + prod4
||         SUBSP   .L1     A_prod1,A_prod2,A_sum3 ; |562| <0,30> sum1 = prod1 - prod2

           SUBSP   .L2     B_prod1,B_prod2,B_sum3 ; |598| <0,31> sum1 = prod1 - prod2
||         SUBSP   .L1     A_prod9,A_prod10,A_sum7 ; |572| <0,31> sum1 = prod1 - prod2

           SUBSP   .L2     B_prod9,B_prod10,B_sum7 ; |608| <0,32> sum1 = prod1 - prod2

           ADDSP   .L2     B_prod11,B_prod12,B_sum8 ; |609| <0,33> sum2 = prod3 + prod4
||         STDW    .D1T1   A_sum6:A_sum5,*A_y++[A_h2] ; |554| <0,33> ptr_x2[l1] = sum1
||         STDW    .D2T2   B_sum6:B_sum5,*B_y++[B_h2] ; |590| <0,33> ptr_x2[l1] = sum1

           STDW    .D1T1   A_sum4:A_sum3,*A_y++[A_h2] ; |564| <0,34> ptr_x2[l1] = sum1

           STDW    .D2T2   B_sum4:B_sum3,*B_y++[B_h2] ; |600| <0,35> ptr_x2[l1] = sum1
||         STDW    .D1T1   A_sum8:A_sum7,*A_y--[A_next] ; |574| <0,35> ptr_x2[l1] = sum1

   [!A_predj'] ADD .S1X    A_y,B_fft_jmp,A_y ; |576| <0,36> 

           SPKERNEL 0,11
||         STDW    .D2T2   B_sum8:B_sum7,*B_y++[B_h2] ; |610| <0,37> ptr_x2[l1] = sum1

;** --------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP EPILOG
;          EXCLUSIVE CPU CYCLES: 24
           CMPGTU  .L2X    B_stride,A_radix,B_while ; |614| 
           NOP             6
   [ B_while] BNOP .S2     $C$L1,5           ; |615| 
           ; BRANCHCC OCCURS {$C$L1}         ; |615| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 27

           LDW     .D2T2   *+SP(24),B_n_max'
||         ZERO    .L1     A_2f              ; |637| 

           MVKH    .S1     0x40000000,A_2f   ; |638| 
||         LDW     .D2T2   *+SP(16),B_n_min' ; |640| 

           LDW     .D2T1   *+SP(4),B_n$3
           LDW     .D2T1   *+SP(20),A_offset' ; |645| 
           LDW     .D2T1   *+SP(28),B_ptr_x$3 ; |647| 
           INTSP   .L2     B_n_max',B_scale' ; |634| 
           LDW     .D2T1   *+SP(12),B_ptr_y' ; |631| 
           NORM    .L1X    B_n_max',A_l0'    ; |628| l0 =_NORM(n_max)
           SHR     .S2     B_n_max',0x2,B_outjmp ; |644| nmax >>= 1
           SHL     .S2     B_outjmp,0x1,B_outjmp2 ; |646| 
           RCPSP   .S1X    B_scale',A_iscale ; |635| 
           CMPLT   .L2     0x4,B_n_min',B_flag ; |631| Check whether radix is > 4
           MPYSP   .M2X    A_iscale,B_scale',B_scale' ; |636| 
           CMPEQ   .L2     0x2,B_n_min',B_radix2 ; |643| Check whether radix ==2
           MV      .L1X    B_outjmp,A_outjmp ; |645| 
           SHRU    .S1     B_n$3,0x2,A_i'    ; |647| 
           SUBSP   .L2X    A_2f,B_scale',B_scale' ; |639| 
           SHR     .S1     A_offset',0x2,A_j ; |623| j = offset>>2
           ADD     .L2X    0x8,A_p_x0,B_p_x0 ; |625| 
           ADD     .L1     0xfffffffe,A_i',A_i ; |648| 
   [!B_flag] ADD   .L1     1,A_i,A3

   [ B_flag] BNOP  .S1     $C$L8,4           ; |632| If radix > 4 No bitreversal
||         MPYSP   .M1X    B_scale',A_iscale,A_scale ; |640| 
||         ADD     .L1     0x3,A_l0',A_l0    ; |629| l0 += 3

           MV      .L2X    A_scale,B_scale   ; |641| 
           ; BRANCHCC OCCURS {$C$L8}         ; |632| 
;*----------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 22

           SPLOOPD 7       ;28               ; (P) 
||         ADD     .D1     A7,16,A_p_x0'
||         MVC     .S2X    A3,ILC

;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 7

           SPMASK          D2
||         ADD     .D2     B16,16,B_p_x0'
||         LDDW    .D1T1   *A_p_x0++(32),A_x1:A_x0 ; |652| (P) <0,0>  ^ load ptr_x0[0], ptr_x0[1]

           LDDW    .D2T2   *B_p_x0++(32),B_x3:B_x2 ; |653| (P) <0,1>  ^ load ptr_x0[2], ptr_x0[3]
||         LDDW    .D1T1   *A_p_x0'++(32),A_x5:A_x4 ; |654| (P) <0,1>  ^ load ptr_x0[4], ptr_x0[5]

           LDDW    .D2T2   *B_p_x0'++(32),B_x7:B_x6 ; |655| (P) <0,2>  ^ load ptr_x0[6], ptr_x0[7]
           NOP             3

           ADDSP   .S1     A_x0,A_x4,A_xh0_0 ; |657| (P) <0,6>  ^ xh0_0 = x0 + x4
||         ADDSP   .L1     A_x1,A_x5,A_xh1_0 ; |658| (P) <0,6>  ^ xh1_0 = x1 + x5

           ADDSP   .S2     B_x2,B_x6,B_xh0_1 ; |659| (P) <0,7>  ^ xh0_1 = x2 + x6
||         ADDSP   .L2     B_x3,B_x7,B_xh1_1 ; |660| (P) <0,7>  ^ xh1_1 = x3 + x7

           SUBSP   .S1     A_x0,A_x4,A_xl0_0 ; |670| (P) <0,8>  ^ xl0_0 = x0 - x4
||         SUBSP   .L1     A_x1,A_x5,A_xl1_0 ; |671| (P) <0,8>  ^ xl1_0 = x1 - x5

           SUBSP   .S2     B_x2,B_x6,B_xl0_1 ; |672| (P) <0,9>  ^ xl0_1 = x2 - x6
||         SUBSP   .L2     B_x7,B_x3,B_xl1_1 ; |673| (P) <0,9>  ^ xl1_1 = x7 - x3

   [ B_radix2] DMV .S1     A_x1,A_x0,A_xh1_0:A_xh0_0 ; |662| (P) <0,10>  ^ xh0_0 = x0;xh1_0 = x1;
   [ B_radix2] DMV .S2     B_x3,B_x2,B_xh1_1:B_xh0_1 ; |663| (P) <0,11>  ^ xh0_1 = x2;xh1_1 = x3;

           SUBSP   .L2X    A_xh1_0,B_xh1_1,B_yt5' ; |668| (P) <0,12> yt5 =xh1_0 - xh1_1
|| [ B_radix2] DMV .S1     A_x5,A_x4,A_xl1_0:A_xl0_0 ; |675| (P) <0,12>  ^ xl0_0 = x4;xl1_0 = x5;

           SUBSP   .L2X    A_xh0_0,B_xh0_1,B_yt4' ; |667| (P) <0,13> yt4 =xh0_0 - xh0_1
|| [ B_radix2] DMV .S2     B_x7,B_x6,B_xl0_1:B_xl1_1 ; |676| (P) <0,13>  ^ xl1_1 = x6;xl0_1 = x7;

           ADDSP   .L1X    A_xh1_0,B_xh1_1,A_yt1' ; |666| (P) <0,14> yt1 =xh1_0 + xh1_1
           SUBSP   .L2X    A_xl1_0,B_xl0_1,B_yt7' ; |681| (P) <0,15> yt7 = xl1_0 - xl0_1

           MPYSP   .M2     B_yt5',B_scale,B_yt5 ; |689| (P) <0,16> yt5 = scale*yt5
||         ADDSP   .L1X    A_xh0_0,B_xh0_1,A_yt0' ; |665| (P) <0,16> yt0 =xh0_0 + xh0_1

           MPYSP   .M2     B_yt4',B_scale,B_yt4 ; |688| (P) <0,17> yt4 = scale*yt4
||         SUBSP   .L2X    A_xl0_0,B_xl1_1,B_yt6' ; |680| (P) <0,17> yt6 = xl0_0 - xl1_1
||         ADDSP   .L1X    A_xl1_0,B_xl0_1,A_yt3' ; |679| (P) <0,17> yt3 = xl1_0 + xl0_1

           SPMASK          D1
||         MV      .D1     A_j,A_j'
||         MPYSP   .M1     A_yt1',A_scale,A_yt1 ; |684| (P) <0,18> yt1 = scale*yt1
||         ADDSP   .L1X    A_xl0_0,B_xl1_1,A_yt2' ; |678| (P) <0,18> yt2 = xl0_0 + xl1_1

           BITR    .M1     A_j',A_temp1      ; |693| (P) <0,19> k = _bitr(j) >> l0;
||         MPYSP   .M2     B_yt7',B_scale,B_yt7 ; |691| (P) <0,19> yt7 = scale*yt7

           MPYSP   .M1     A_yt0',A_scale,A_yt0 ; |683| (P) <0,20> yt0 = scale*yt0

           SHRU    .S1     A_temp1,A_l0,A_k  ; |694| <0,21> k = _bitr(j) >> l0;
||         MPYSP   .M2     B_yt6',B_scale,B_yt6 ; |690| <0,21> yt6 = scale*yt6
||         MPYSP   .M1     A_yt3',A_scale,A_yt3 ; |686| <0,21> yt3 = scale*yt3

           MPYSP   .M1     A_yt2',A_scale,A_yt2 ; |685| <0,22> yt2 = scale*yt2
           ADDAW   .D1     A_p_y0,A_k,A_p_y  ; |698| <0,23> *y1 = *y0 + k
           ADD     .D1     0x1,A_j',A_j'     ; |696| <0,24> j = j+1

           STDW    .D1T1   A_yt1:A_yt0,*A_p_y++[A_outjmp] ; |701| <0,25> store yt0, yt1
||         MV      .D2X    A_p_y,B_p_y       ; |699| <0,25> 

           STDW    .D1T1   A_yt3:A_yt2,*A_p_y++[A_outjmp] ; |702| <0,26> store yt2, yt3
||         STDW    .D2T2   B_yt5:B_yt4,*++B_p_y[B_outjmp2] ; |704| <0,26> store yt4, yt5

           SPKERNEL 3,0
||         STDW    .D2T2   B_yt7:B_yt6,*++B_p_y[B_outjmp] ; |705| <0,27> store yt6, yt7

;** --------------------------------------------------------------------------*
$C$L7:    ; PIPED LOOP EPILOG
;          EXCLUSIVE CPU CYCLES: 21
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(40),B3      ; |712| 
           LDDW    .D2T1   *++SP,A13:A12     ; |712| 
           LDDW    .D2T1   *++SP,A15:A14     ; |712| 
           LDDW    .D2T2   *++SP,B11:B10     ; |712| 
           LDDW    .D2T2   *++SP,B13:B12     ; |712| 

           LDW     .D2T1   *++SP(8),A10      ; |712| 
||         RET     .S2     B3                ; |712| 

           LDW     .D2T1   *++SP(8),A11      ; |712| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |712| 
	.clearmap


;     .endproc                     
                                 
* ======================================================================= *
*  End of file:  DSPF_sp_ifftSPxSP.asm                                    *
* ----------------------------------------------------------------------- *
*            Copyright (c) 2011 Texas Instruments, Incorporated.          *
*                          All Rights Reserved.                           *
* ======================================================================= *

