* ======================================================================= *
* DSPF_sp_icfftr2.asm -- Inverse FFT with Radix 2 and DIF                 *
*                 Legacy ASM Implementation from C67x DSPLIB              *
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


* ======================================================================== *
* ======================================================================== *

        .asg    B3,  B_RET_ADDR
        .asg    B15, B_SP
        .asg    A2,  A_SP
        .asg    B4,  B_w1
        .asg    B5,  B_wptr
        .asg    B11, B_w
        .asg    B8,  B_w2
        .asg    A3,  A_n2
        .asg    A6,  A_n
        .asg    B7,  B_n1
        .asg    B13, B_n
        .asg    B12, B_k
        .asg    A14, A_sr
        .asg    B14, B_CSR
        .asg    B9,  B_CSR_gie
        .asg    B10, B_x
        .asg    A4,  A_x
        .asg    A4,  A_xptr
        .asg    A10, A_rtemp
        .asg    B4,  B_n2_mul8
        .asg    A1,  A_j
        .asg    A11, A_itemp
        .asg    B0,  B_i
        .asg    A2,  A_i
        .asg    B1,  B_i1
        .asg    B2,  B_i2
        .asg    A5,  A_n2_mul8
        .asg    A0,  A_xtemp
        .asg    B6,  B_xtemp1
        .asg    A9,  A_xm1
        .asg    A8,  A_xm
        .asg    B9,  B_xa1
        .asg    B8,  B_xa
        .asg    A7,  A_s
        .asg    A6,  A_c
        .asg    A15, A_str1
        .asg    A12, A_cr
        .asg    A12, A_ci
        .asg    A13, A_si
        .asg    A13, A_str2
        .asg    B7,  B_str1
        .asg    B7,  B_str2
        .sect ".text:optimized"
        .if __TI_EABI__
        .asg  DSPF_sp_icfftr2_dif, _DSPF_sp_icfftr2_dif
        .endif		
		
        .global _DSPF_sp_icfftr2_dif
_DSPF_sp_icfftr2_dif:

* ======================================================================== *
* ======================================================================== *

; -------------------------------------------------
; INITIALISATION
; -------------------------------------------------
         SUBAW .D2   B_SP,       12,        B_SP     ; Save Stack Space
||       MV    .L1X  B_SP,       A_SP                ; Copy Stack Pointer
||       MV    .L2   B_w1,       B_wptr              ; Copy w pointer
||       MVK   .S1   1,          A_n2                ; n2 = 1
||       SHR   .S2X  A_n,        1,         B_n1     ; n/2

         STW   .D2T1 A_sr,       *B_SP[5]            ; Save Register
||       STW   .D1T2 B_CSR,      *-A_SP[1]           ; Save Register
||       MV    .L1X  B_SP,       A_SP                ; Copy Stack pointer
||       MVC   .S2   CSR,        B_CSR               ; Get CSR
||       MV    .L2   B_w1,       B_w2                ; Copy w pointer

         STW   .D2T1 A_rtemp,    *B_SP[1]            ; Save Register
||       STW   .D1T2 B_x,        *A_SP[7]            ; Save Register
||       AND   .L2   B_CSR,      -2,        B_CSR_gie ; Disable GIE bit
||       MVK   .S2   8,          B_n2_mul8           ; 8*n2
||       SUB   .S1X  B_n1,       6,         A_j      ; j = n/2 - 6

         STW   .D2T1 A_itemp,    *B_SP[2]            ; Save Register
||       STW   .D1T2 B_w,        *A_SP[8]            ; Save Register
||       MVC   .S2   B_CSR_gie,  CSR                 ; Disable Interrupts
||       MV    .L2   B_n2_mul8,  B_i                 ; 8*n2

         STW   .D2T1 A_cr,       *B_SP[3]            ; Save Register
||       STW   .D1T2 B_k,        *A_SP[9]            ; Save Register
||       MV    .S1X  B_n2_mul8,  A_n2_mul8           ; 8*n2
||       MV    .L2   B_n2_mul8,  B_i1                ; i1 = 8 * n2
||       MV    .S2   B_n2_mul8,  B_i2                ; i2 = 8 * n2

         STW   .D2T1 A_si,       *B_SP[4]            ; Save Register
||       STW   .D1T2 B_n,        *A_SP[10]           ; Save Register
||       ADD   .S2X  A_x,        B_n2_mul8, B_xtemp1 ; x_temp1=x+2*n2
||       MV    .L1   A_x,        A_xtemp             ; x_temp=x
||       MV    .L2   B_w2,       B_w                 ; Save a copy of w pointer

; -------------------------------------------------
         LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; load xm1:xm
||       MV    .L2X  A_x,        B_x                 ; Save  a copy of x pointer

         LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; load xa1:xa
||       MV    .L2   B_n1,       B_n                 ; Save n/2
||       MV    .S2   B_n1,       B_k                 ; k = n/2
||       STW   .D2T1 A_str1,     *B_SP[6]            ; Save Register

         SUB   .S2   B_i,        8,         B_i      ; i = i - 8
||       SUB   .S1X  A_n2_mul8,  B_i,       A_i      ; Save i for next cycle

   [!B_i]ADD   .S1   A_x,        A_n2_mul8, A_x      ; x_ptr = x_ptr + 2*n2

   [!B_i]MPY   .M2   B_n2_mul8,  1,         B_i      ; i=8*n2
||       LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; load xm1:xm
; -------------------------------------------------
         LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; load xa1:xa

         ADDSP .L2X  B_xa,       A_xm,      B_str1   ; str1 = xm + xa
|| [!A_i]LDDW  .D2T1 *B_wptr++,  A_s:A_c             ; load sin:cos
||       SUB   .S2   B_i,        8,         B_i      ; i = i - 8
||       SUB   .S1X  A_n2_mul8,  B_i,       A_i      ; Save i for next cycle

         SUBSP .L1X  B_xa,       A_xm,      A_rtemp  ; rtemp = xa -xm
||       ADDSP .L2X  B_xa1,      A_xm1,     B_str2   ; str2 = xm1 + xa1
|| [!B_i]ADD   .S1   A_x,        A_n2_mul8, A_x      ; x_ptr = x_ptr + 2*n2

   [!B_i]MPY   .M2   B_n2_mul8,  1,         B_i      ; i=8*n2
||       SUBSP .L1X  B_xa1,      A_xm1,     A_itemp  ; itemp = xa1 -xm1
||       LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; load xm1:xm
; ---------
         LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; load xa1:xa

         STW   .D1T2 B_str1,     *A_xtemp++          ; store str1
||       ADDSP .L2X  B_xa,       A_xm,      B_str1   ; str1 = xm + xa
|| [!A_i]LDDW  .D2T1 *B_wptr++,  A_s:A_c             ; load sin:cos
||       SUB   .S2   B_i,        8,         B_i      ; i = i - 8
||       SUB   .S1X  A_n2_mul8,  B_i,       A_i      ; Save i for next cycle

         STW   .D1T2 B_str2,     *A_xtemp++          ; store str2
||       MPYSP .M1   A_c,        A_rtemp,   A_cr     ; cr = cos * rtemp
||       SUBSP .L1X  B_xa,       A_xm,      A_rtemp  ; rtemp = xa -xm
||       ADDSP .L2X  B_xa1,      A_xm1,     B_str2   ; str2 = xm1 + xa1
|| [!B_i]ADD   .S1   A_x,        A_n2_mul8, A_x      ; x_ptr = x_ptr + 2*n2

         MPYSP .M1   A_s,        A_itemp,   A_si     ; si = sin * itemp
||       SUB   .S2   B_i1,       8,         B_i1     ; i1= i1-8
||       SUBSP .L1X  B_xa1,      A_xm1,     A_itemp  ; itemp = xa1 -xm1
||       LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; load xm1:xm
|| [!B_i]MPY   .M2   B_n2_mul8,  1,         B_i      ; i=8*n2
; ---------

         MPYSP .M1   A_s,        A_rtemp,   A_sr     ; sr = sin * rtemp
||[!B_i1]ADD   .S1   A_xtemp,    A_n2_mul8, A_xtemp  ; x_temp = x_temp + 2*n2
||       LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; load xa1:xa

         MPYSP .M1   A_c,        A_itemp,   A_ci     ; ci = cos * itemp
||[!B_i1]MPY   .M2   B_n2_mul8,  1,         B_i1     ; i1=8*n2
||       STW   .D1T2 B_str1,     *A_xtemp++          ; store str1
||       ADDSP .L2X  B_xa,       A_xm,      B_str1   ; str1 = xm + xa
|| [!A_i]LDDW  .D2T1 *B_wptr++,  A_s:A_c             ; load sin:cos
||       SUB   .S2   B_i,        8,         B_i      ; i = i - 8
||       SUB   .S1X  A_n2_mul8,  B_i,       A_i      ; Save i for next cycle

         STW   .D1T2 B_str2,     *A_xtemp++          ; store str2
||       MPYSP .M1   A_c,        A_rtemp,   A_cr     ; cr = cos * rtemp
||       SUBSP .L1X  B_xa,       A_xm,      A_rtemp  ; rtemp = xa -xm
||       ADDSP .L2X  B_xa1,      A_xm1,     B_str2   ; str2 = xm1 + xa1
|| [!B_i]ADD   .S1   A_x,        A_n2_mul8, A_x      ; x_ptr = x_ptr + 2*n2

    [A_j]SUB   .S1   A_j,        1,         A_j      ; j = j - 1
||       MPYSP .M1   A_s,        A_itemp,   A_si     ; si = sin * itemp
||       SUB   .S2   B_i1,       8,         B_i1     ; i1= i1-8
||       SUBSP .L1X  B_xa1,      A_xm1,     A_itemp  ; itemp = xa1 -xm1
||       LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; load xm1:xm
|| [!B_i]MPY   .M2   B_n2_mul8,  1,         B_i      ; i=8*n2
; ---------
         SUBSP .L1   A_cr,       A_si,      A_str1   ; str1 = cr - si
||       MPYSP .M1   A_s,        A_rtemp,   A_sr     ; sr = sin * rtemp
||[!B_i1]ADD   .S1   A_xtemp,    A_n2_mul8, A_xtemp  ;x_temp = x_temp + 2*n2
||       LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; load xa1:xa

         ADDSP .L1   A_ci,       A_sr,      A_str2   ; str2 = ci + sr
||       MPYSP .M1   A_c,        A_itemp,   A_ci     ; ci = cos * itemp
||[!B_i1]MPY   .M2   B_n2_mul8,  1,         B_i1     ; i1=8*n2
||       STW   .D1T2 B_str1,     *A_xtemp++          ; store str1
||       ADDSP .L2X  B_xa,       A_xm,      B_str1   ; str1 = xm + xa
|| [!A_i]LDDW  .D2T1 *B_wptr++,  A_s:A_c             ; load sin:cos
||       SUB   .S2   B_i,        8,         B_i      ; i = i - 8
||       SUB   .S1X  A_n2_mul8,  B_i,       A_i      ; Save i for next cycle

    [A_j]B     .S2   LOOP                            ; Branch to Inner Loop
||       STW   .D1T2 B_str2,     *A_xtemp++          ; store str2
||       MPYSP .M1   A_c,        A_rtemp,   A_cr     ; cr = cos * rtemp
||       SUBSP .L1X  B_xa,       A_xm,      A_rtemp  ; rtemp = xa -xm
||       ADDSP .L2X  B_xa1,      A_xm1,     B_str2   ; str2 = xm1 + xa1
|| [!B_i]ADD   .S1   A_x,        A_n2_mul8, A_x      ; x_ptr = x_ptr + 2*n2

    [A_j]SUB   .S1   A_j,        1,         A_j      ; j = j - 1
||       MPYSP .M1   A_s,        A_itemp,   A_si     ; si = sin * itemp
||       SUB   .S2   B_i1,       8,         B_i1     ; i1= i1-8
||       SUBSP .L1X  B_xa1,      A_xm1,     A_itemp  ; itemp = xa1 -xm1
||       LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; load xm1:xm
|| [!B_i]MPY   .M2   B_n2_mul8,  1,         B_i      ; i=8*n2
; ---------
LOOP:

         STW   .D2T1 A_str1,     *B_xtemp1++         ; Store str1
||       SUB   .S2   B_i2,       8,         B_i2     ; i2 = i2 - 8
||       SUBSP .L1   A_cr,       A_si,      A_str1   ; str1 = cr - si
||       MPYSP .M1   A_s,        A_rtemp,   A_sr     ; sr = sin * rtemp
||[!B_i1]ADD   .S1   A_xtemp,    A_n2_mul8, A_xtemp  ; x_temp = x_temp + 2*n2
||       LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; load xa1:xa

         ADDSP .L1   A_ci,       A_sr,      A_str2   ; str2 = ci + sr
||       MPYSP .M1   A_c,        A_itemp,   A_ci     ; ci = cos * itemp
||[!B_i1]MPY   .M2   B_n2_mul8,  1,         B_i1     ; i1=8*n2
||       STW   .D1T2 B_str1,     *A_xtemp++          ; store str1
||       ADDSP .L2X  B_xa,       A_xm,      B_str1   ; str1 = xm + xa
|| [!A_i]LDDW  .D2T1 *B_wptr++,  A_s:A_c             ; load sin:cos
||       SUB   .S2   B_i,        8,         B_i      ; i = i - 8
||       SUB   .S1X  A_n2_mul8,  B_i,       A_i      ; Save i for next cycle

         STW   .D2T1 A_str2,     *B_xtemp1++         ; store str2
|| [!B_i2]MPY   .M2   B_n2_mul8,  1,        B_i2     ; i2=8*n2
||  [A_j]B     .S2   LOOP                            ; Branch to Inner Loop
||       STW   .D1T2 B_str2,     *A_xtemp++          ; store str2
||       MPYSP .M1   A_c,        A_rtemp,   A_cr     ; cr = cos * rtemp
||       SUBSP .L1X  B_xa,       A_xm,      A_rtemp  ; rtemp = xa -xm
||       ADDSP .L2X  B_xa1,      A_xm1,     B_str2   ; str2 = xm1 + xa1
|| [!B_i]ADD   .S1   A_x,        A_n2_mul8, A_x      ; x_ptr = x_ptr + 2*n2

  [!B_i2]ADD   .L2   B_xtemp1,   B_n2_mul8, B_xtemp1 ; x_temp1 = x_temp1 + 2*n2
||  [A_j]SUB   .S1   A_j,        1,         A_j      ; j = j - 1
||       MPYSP .M1   A_s,        A_itemp,   A_si     ; si = sin * itemp
||       SUB   .S2   B_i1,       8, B_i1             ; i1= i1-8
||       SUBSP .L1X  B_xa1,      A_xm1,     A_itemp  ; itemp = xa1 -xm1
||       LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; load xm1:xm
|| [!B_i]MPY   .M2   B_n2_mul8,  1,         B_i      ; i=8*n2
; -------------------------------------------------
         STW   .D2T1 A_str1,     *B_xtemp1++         ; Store str1
||       SUB   .S2   B_i2,       8,         B_i2     ; i2 = i2 - 8
||       SUBSP .L1   A_cr,       A_si,      A_str1   ; str1 = cr - si
||       MPYSP .M1   A_s,        A_rtemp,   A_sr     ; sr = sin * rtemp
||[!B_i1]ADD   .S1   A_xtemp,    A_n2_mul8, A_xtemp  ; x_temp = x_temp + 2*n2
||       LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; load xa1:xa

         ADDSP .L1   A_ci,       A_sr,      A_str2   ; str2 = ci + sr
||       MPYSP .M1   A_c,        A_itemp,   A_ci     ; ci = cos * itemp
||[!B_i1]MPY   .M2   B_n2_mul8,  1, B_i1             ; i1=8*n2
||       STW   .D1T2 B_str1,     *A_xtemp++          ; store str1
||       ADDSP .L2X  B_xa,       A_xm,      B_str1   ; str1 = xm + xa
|| [!A_i]LDDW  .D2T1 *B_wptr++,  A_s:A_c             ; load sin:cos
||       SUB   .S2   B_i,        8,         B_i      ; i = i - 8
||       MV    .S1X  B_x,        A_x                 ; x_ptr=x

         STW   .D2T1 A_str2,     *B_xtemp1++         ; store str2
||[!B_i2]MPY   .M2   B_n2_mul8,  1,         B_i2     ; i2=8*n2
||       STW   .D1T2 B_str2,     *A_xtemp++          ; store str2
||       MPYSP .M1   A_c,        A_rtemp,   A_cr     ; cr = cos * rtemp
||       SUBSP .L1X  B_xa,       A_xm,      A_rtemp  ; rtemp = xa -xm
||       ADDSP .L2X  B_xa1,      A_xm1,     B_str2   ; str2 = xm1 + xa1
||       SHL   .S1   A_n2,       1, A_n2             ; n2=>>1

  [!B_i2]ADD   .L2   B_xtemp1,   B_n2_mul8, B_xtemp1 ; x_temp1 = x_temp1 + 2*n2
||       MPYSP .M1   A_s,        A_itemp,   A_si     ; si = sin * itemp
||       SUB   .S2   B_i1,       8,         B_i1     ; i1= i1-8
||       SUBSP .L1X  B_xa1,      A_xm1,     A_itemp  ; itemp = xa1 -xm1
||       LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; load xm1:xm
|| [!B_i]MPY   .M2   B_n2_mul8,  2,         B_i      ; i=8*n2
||       SUB   .S1   A_n2_mul8,  8,         A_i      ; In the last it. B_i will be 8
; -------------------------------------------------
; --------------------- EPILOG --------------------
; -------------------------------------------------
         STW   .D2T1 A_str1,     *B_xtemp1++         ; E Store str1
||       SUB   .S2   B_i2,       8,         B_i2     ; E i2 = i2 - 8
||       SUBSP .L1   A_cr,       A_si,      A_str1   ; E str1 = cr - si
||       MPYSP .M1   A_s,        A_rtemp,   A_sr     ; E sr = sin * rtemp
||[!B_i1]ADD   .S1X  A_xtemp,    B_n2_mul8, A_xtemp  ; E x_temp = x_temp + 2*n2
||       LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; P load xa1:xa

         ADDSP .L1   A_ci,       A_sr,      A_str2   ; E str2 = ci + sr
||       MPYSP .M1   A_c,        A_itemp,   A_ci     ; E ci = cos * itemp
||[!B_i1]MPY   .M2   B_n2_mul8,  1,         B_i1     ; E i1=8*n2
||       STW   .D1T2 B_str1,     *A_xtemp++          ; E store str1
||       ADDSP .L2X  B_xa,       A_xm,      B_str1   ; E str1 = xm + xa
|| [!A_i]LDDW  .D2T1 *B_wptr++,  A_s:A_c             ; E load sin:cos
||       ZERO  .S1   A_i                             ; P i=0 as Initially w should be loaded

         STW   .D2T1 A_str2,     *B_xtemp1++         ; E store str2
||[!B_i2]MPY   .M2   B_n2_mul8,  1,         B_i2     ; E i2=8*n2
||       STW   .D1T2 B_str2,     *A_xtemp++          ; E store str2
||       MPYSP .M1   A_c,        A_rtemp,   A_cr     ; E cr = cos * rtemp
||       SUBSP .L1X  B_xa,       A_xm,      A_rtemp  ; E rtemp = xa -xm
||       ADDSP .L2X  B_xa1,      A_xm1,     B_str2   ; E str2 = xm1 + xa1

  [!B_i2]ADD   .L2   B_xtemp1,   B_n2_mul8, B_xtemp1 ; E x_temp1 = x_temp1 + 2*n2
||       MPYSP .M1   A_s,        A_itemp,   A_si     ; E si = sin * itemp
||       SUB   .S2   B_i1,       8,         B_i1     ; E i1= i1-8
||       SUBSP .L1X  B_xa1,      A_xm1,     A_itemp  ; E itemp = xa1 -xm1
||       SHL   .S1   A_n2_mul8,  1,         A_n2_mul8; E N2=N2<<1
||       LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; P load xm1:xm
||       MV    .D2   B_w,        B_wptr              ; load w

; ------------------------------------------------------------

         STW   .D2T1 A_str1,     *B_xtemp1++         ; E  Store str1
||       SUB   .S2   B_i2,       8,         B_i2     ; E i2 = i2 - 8
||       SUBSP .L1   A_cr,       A_si,      A_str1   ; E str1 = cr - si
||       MPYSP .M1   A_s,        A_rtemp,   A_sr     ; E sr = sin * rtemp
||[!B_i1]ADD   .S1X  A_xtemp,    B_n2_mul8, A_xtemp  ; E x_temp = x_temp + 2*n2
||       LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; P load xa1:xa

         ADDSP .L1   A_ci,       A_sr,      A_str2   ; E str2 = ci + sr
||       MPYSP .M1   A_c,        A_itemp,   A_ci     ; E ci = cos * itemp
||[!B_i1]MPY   .M2   B_n2_mul8,  1,         B_i1     ; E i1=8*n2
||       STW   .D1T2 B_str1,     *A_xtemp++          ; E store str1
||       SUB   .S2   B_i,        16,        B_i      ; P i = i - 8
||       ADDSP .L2X  B_xa,       A_xm,      B_str1   ; P str1 = xm + xa
|| [!A_i]LDDW  .D2T1 *B_wptr++,  A_s:A_c             ; P load sin:cos

         STW   .D2T1 A_str2,     *B_xtemp1++         ; E store str2
||[!B_i2]MPY   .M2   B_n2_mul8,  1,         B_i2     ; E i2=8*n2
||       STW   .D1T2 B_str2,     *A_xtemp++          ; E store str2
||       MPYSP .M1   A_c,        A_rtemp,   A_cr     ; E cr = cos * rtemp
|| [!B_i]ADD   .S1   A_x,        A_n2_mul8, A_x      ; P x_ptr = x_ptr + 2*n2
||       SUBSP .L1X  B_xa,       A_xm,      A_rtemp  ; P rtemp = xa -xm
||       ADDSP .L2X  B_xa1,      A_xm1,     B_str2   ; P str2 = xm1 + xa1
||       SHR   .S2   B_k,        1,         B_k      ; k =>> 1

  [!B_i2]ADD   .L2   B_xtemp1,   B_n2_mul8, B_xtemp1 ; E x_temp1 = x_temp1 + 2*n2
||       MPYSP .M1   A_s,        A_itemp,   A_si     ; E si = sin * itemp
|| [!B_i]MPY   .M2   B_n2_mul8,  2,         B_i      ; P i=8*n2
||       LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; P load xm1:xm
||       SUBSP .L1X  B_xa1,      A_xm1,     A_itemp  ; P itemp = xa1 -xm1
||       MV    .D2   B_k,        B_i1                ; Get k

; -----------------------------------------------------------

         STW   .D2T1 A_str1,     *B_xtemp1++         ; E Store str1
||       SUB   .S2   B_i2,       8,         B_i2     ; E i2 = i2 - 8
||       SUBSP .L1   A_cr,       A_si,      A_str1   ; E str1 = cr - si
||       MPYSP .M1   A_s,        A_rtemp,   A_sr     ; E sr = sin * rtemp
||       MV    .S1X  B_x,        A_xtemp             ; E  x_temp=x
|| [B_i1]LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; P load xa1:xa

         ADDSP .L1   A_ci,       A_sr,      A_str2   ; E str2 = ci + sr
||       MPYSP .M1   A_c,        A_itemp,   A_ci     ; E ci = cos * itemp
||       SUB   .D2   B_i,        8,         B_i      ; P i = i - 8
||       SUB   .S1X  A_n2_mul8,  B_i,       A_i      ; P Save i for next cycle
||       ADDSP .L2X  B_xa,       A_xm,      B_str1   ; P str1 = xm + xa
|| [B_i1]STW   .D1T2 B_str1,     *A_xtemp++          ; P store str1

         STW   .D2T1 A_str2,     *B_xtemp1++         ; E store str2
||[!B_i2]MPY   .M2   B_n2_mul8,  1,         B_i2     ; E i2=8*n2
||       SUBSP .L1X  B_xa,       A_xm,      A_rtemp  ; P rtemp = xa -xm
||       ADDSP .L2X  B_xa1,      A_xm1,     B_str2   ; P str2 = xm1 + xa1
|| [B_i1]STW   .D1T2 B_str2,     *A_xtemp++          ; P store str2
||       MPYSP .M1   A_c,        A_rtemp,   A_cr     ; P cr = cos * rtemp

  [!B_i2]ADD   .L2   B_xtemp1,   B_n2_mul8, B_xtemp1 ; E x_temp1 = x_temp1 + 2*n2
|| [B_i1]LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; P load xm1:xm
||       SUBSP .L1X  B_xa1,      A_xm1,     A_itemp  ; P itemp = xa1 -xm1
||       MPYSP .M1   A_s,        A_itemp,   A_si     ; P si = sin * itemp

; ----------------------------------------------------
         STW   .D2T1 A_str1,     *B_xtemp1++         ; E Store str1
||       SUB   .S2   B_i2,       8,         B_i2     ; E i2 = i2 - 8
||       SUBSP .L1   A_cr,       A_si,      A_str1   ; E str1 = cr - si
|| [B_i1]LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; P load xa1:xa
||       MPYSP .M1   A_s,        A_rtemp,   A_sr     ; P sr = sin * rtemp

         ADDSP .L1   A_ci,       A_sr,      A_str2   ; E str2 = ci + sr
||       SUB   .S2   B_i,        8,         B_i      ; P i = i - 8
||       ADDSP .L2X  B_xa,       A_xm,      B_str1   ; P str1 = xm + xa
|| [!A_i]LDDW  .D2T1 *B_wptr++,  A_s:A_c             ; P load sin:cos
|| [B_i1]STW   .D1T2 B_str1,     *A_xtemp++          ; P store str1
||       MPYSP .M1   A_c,        A_itemp,   A_ci     ; P ci = cos * itemp
||       MPY   .M2   B_n2_mul8,  2,         B_i1     ; P  i1=8*n2
||  [B_i1]SUB   .S1X  B_n,       6,         A_j      ; j = n/2 - 6

         STW   .D2T1 A_str2,     *B_xtemp1++         ; E store str2
||[!B_i2]MPY   .M2   B_n2_mul8,  1,         B_i2     ; E i2=8*n2
|| [!B_i]ADD   .S1   A_x,        A_n2_mul8, A_x      ; P x_ptr = x_ptr + 2*n2
||       SUBSP .L1X  B_xa,       A_xm,      A_rtemp  ; P rtemp = xa -xm
||       ADDSP .L2X  B_xa1,      A_xm1,     B_str2   ; P str2 = xm1 + xa1
|| [B_i1]STW   .D1T2 B_str2,     *A_xtemp++          ; P store str2
||       MPYSP .M1   A_c,        A_rtemp,   A_cr     ; P cr = cos * rtemp
||  [A_j]B     .S2   LOOP                            ; P Branch to Inner Loop

  [!B_i2]ADD   .L2   B_xtemp1,   B_n2_mul8, B_xtemp1 ; E x_temp1 = x_temp1 + 2*n2
|| [!B_i]MPY   .M2   B_n2_mul8,  2,         B_i      ; P i=8*n2
||  [A_j]LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; P load xm1:xm
||       SUBSP .L1X  B_xa1,      A_xm1,     A_itemp  ; P itemp = xa1 -xm1
||       MPYSP .M1   A_s,        A_itemp,   A_si     ; P si = sin * itemp
||       SUB   .S2   B_i1,       16,        B_i1     ; P i1= i1-16, 16 as last one was removed
||  [A_j]SUB   .S1   A_j,        1,         A_j      ; P j = j - 1
;------------------------------------------------------
         STW   .D2T1 A_str1,     *B_xtemp1++         ; E Store str1
||  [A_j]LDDW  .D1T2 *A_x++,     B_xa1:B_xa          ; P load xa1:xa
||       MPYSP .M1   A_s,        A_rtemp,   A_sr     ; P sr = sin * rtemp
||[!B_i1]ADD   .S1   A_xtemp,    A_n2_mul8, A_xtemp  ; P x_temp = x_temp + 2*n2
||       SUBSP .L1   A_cr,       A_si,      A_str1   ; P str1 = cr - si
||       MPY   .M2   B_n2_mul8,  2,         B_n2_mul8; n2 = n2 << 1

         SUB   .S2   B_i,        8,         B_i      ; P i = i - 8
||       SUB   .S1X  A_n2_mul8,  B_i,       A_i      ; P Save i for next cycle
||       ADDSP .L2X  B_xa, A_xm, B_str1              ; P str1 = xm + xa
||  [A_j]STW   .D1T2 B_str1,     *A_xtemp++          ; P store str1
||       MPYSP .M1   A_c,        A_itemp,   A_ci     ; P ci = cos * itemp
||[!B_i1]MPY   .M2   B_n2_mul8,  2,         B_i1     ; P i1=8*n2
||       ADDSP .L1   A_ci,       A_sr,      A_str2   ; P str2 = ci + sr

         STW   .D2T1 A_str2,     *B_xtemp1++         ; E store str2
||       MPY   .M2   B_n2_mul8,  1,         B_i2     ; E i2=8*n2
||       SUBSP .L1X  B_xa,       A_xm,      A_rtemp  ; P rtemp = xa -xm
||       ADDSP .L2X  B_xa1,      A_xm1,     B_str2   ; P str2 = xm1 + xa1
||  [A_j]STW   .D1T2 B_str2,     *A_xtemp++          ; P store str2
||       MPYSP .M1   A_c,        A_rtemp,   A_cr     ; P cr = cos * rtemp
||  [A_j]B     .S2   LOOP                            ; P Branch to Inner Loop

         ADD   .L2   B_x,        B_n2_mul8, B_xtemp1 ; E  ;x_temp1=x+2*n2
||  [A_j]LDDW  .D1T1 *A_x[A_n2], A_xm1:A_xm          ; P load xm1:xm
||       SUBSP .L1X  B_xa1,      A_xm1,     A_itemp  ; P itemp = xa1 -xm1
||       MPYSP .M1   A_s,        A_itemp,   A_si     ; P si = sin * itemp
||       SUB   .S2   B_i1,       8, B_i1             ; P i1= i1-8
||  [A_j]SUB   .S1   A_j,        1, A_j              ; P j = j - 1
; --------------------------------------------------

         MVC   .S2   B_CSR,      CSR                 ; Enable Interrupt
||       LDW   .D2T1 *B_SP[6],   A_str1              ; Restore register
||       MV    .S1X  B_SP,       A_SP                ; Copy Stack Pointer

         LDW   .D2T1 *B_SP[1],   A_rtemp             ; Restore register
||       LDW   .D1T2 *A_SP[7],   B_x                 ; Restore register

         LDW   .D2T1 *B_SP[2],   A_itemp             ; Restore register
||       LDW   .D1T2 *A_SP[8],   B_w                 ; Restore register

         LDW   .D2T1 *B_SP[3],   A_cr                ; Restore register
||       LDW   .D1T2 *A_SP[9],   B_k                 ; Restore register

         LDW   .D2T1 *B_SP[4],   A_si                ; Restore register
||       LDW   .D1T2 *A_SP[10],  B_n                 ; Restore register
||       B     .S2   B_RET_ADDR

         LDW   .D2T1 *B_SP[5],   A_sr                ; Restore register
||       LDW   .D1T2 *A_SP[11],  B_CSR               ; Restore register

         ADDAW .D2   B_SP,         12,        B_SP     ; Restore Stack Space

         NOP         3

                .end

* ======================================================================= *
*  End of file:  DSPF_sp_icfftr2.asm                                      *
* ----------------------------------------------------------------------- *
*            Copyright (c) 2011 Texas Instruments, Incorporated.          *
*                           All Rights Reserved.                          *
* ======================================================================= *

