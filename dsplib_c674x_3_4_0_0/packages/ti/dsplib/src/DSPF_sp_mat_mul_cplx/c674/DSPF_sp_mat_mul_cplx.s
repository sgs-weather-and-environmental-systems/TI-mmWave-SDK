* ======================================================================= *
* DSPF_sp_mat_mul_cplx.asm -- Complex Matrix Multiply                     *
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
                .asg  B15, B_SP
                .asg  B3,  B_RET_ADDR
                .asg  B2,  B_CSR
                .asg  A0,  A_CSR
                .asg  B1,  B_CSR_gie
                .asg  A7,  A_SP
                .asg  A4,  A_x
                .asg  A5,  A_x_ptr
                .asg  B6,  B_y
                .asg  B5,  B_y_ptr
                .asg  A6,  A_c1
                .asg  A8,  A_c2
                .asg  B9,  B_c2
                .asg  B4,  B_8c2
                .asg  B4,  B_r1
                .asg  B0,  B_k
                .asg  B8,  B_r
                .asg  A9,  A_r
                .asg  A11, A_y1
                .asg  A11, A_y3
                .asg  A10, A_y0
                .asg  A10, A_y2
                .asg  B11, B_x1
                .asg  B10, B_x0
                .asg  A12, A_p00
                .asg  A12, A_p02
                .asg  B12, B_p01
                .asg  B12, B_p03
                .asg  A13, A_p11
                .asg  A13, A_p13
                .asg  B13, B_p10
                .asg  B13, B_p12
                .asg  A14, A_s0011
                .asg  A14, A_s0213
                .asg  B14, B_s0110
                .asg  B14, B_s0312
                .asg  A13, A_real1
                .asg  A13, A_real2
                .asg  B13, B_imag1
                .asg  B13, B_imag2
                .asg  A8,  A_zero
                .asg  B3,  B_zero
                .asg  B1,  B_i
                .asg  A1,  A_j
                .asg  A2,  A_row_fg
                .asg  B2,  B_mul_fg
                .asg  B7,  B_multiple
                .asg  A1,  A_temp
                .asg  B15, B_mult
                

        .sect ".text:optimized"
        .if __TI_EABI__
        .asg  DSPF_sp_mat_mul_cplx, _DSPF_sp_mat_mul_cplx
        .endif				
        .global _DSPF_sp_mat_mul_cplx
_DSPF_sp_mat_mul_cplx:

* ======================================================================== *
* ======================================================================== *

             SUBAW .D2   B_SP,       13,        B_SP      ; Save stack space
||           MV    .L1X  B_SP,       A_SP                 ; Copy stack pointer
||           SUB   .L2X  A_c2,       1,         B_c2      ; Index for y
||           AND   .S1   A_c2,       1,         A_temp    ; Checking multiple of 2
||           MVC   .S2   CSR,        B_CSR                ; Get CSR
||           MV    .D1   A_x,        A_x_ptr              ; x_ptr = x
                
             STW   .D2T1 A_y0,       *B_SP[1]             ; Save A_y0
||           STW   .D1T2 B_x0,       *-A_SP[6]            ; Save B_x0
||           MV    .L1X  B_SP,       A_SP                 ; Copy stack pointer 
||           AND   .L2   B_CSR,      -2,        B_CSR_gie ; Disable gie bit
||   [A_temp]ADD   .S1   A_c2,       1,         A_c2      ; Make c2 multiple of 2
||   [A_temp]MVK   .S2   16,         B_multiple           ; Set flag for multiple of 2
                
             STW   .D2T1 A_y1,       *B_SP[2]             ; Save A_y1
||           STW   .D1T2 B_x1,       *A_SP[8]             ; Save B_x1
||           MPY   .M2X  B_r1,       A_c2,      B_i       ; i = r1 * c2
||           MV    .L2   B_y,        B_y_ptr              ; y_ptr=y
||           MVC   .S2   B_CSR_gie,  CSR                  ; Disable Interrupts
||           MV    .L1X  B_CSR,      A_CSR                ; Save CSR

; -------------------------------------------------                
             LDDW  .D1T2 *A_x_ptr++, B_x1:B_x0            ; load x1:x0
||           LDDW  .D2T1 *B_y_ptr++, A_y1:A_y0            ; load y1:y0

             STW   .D2T1 A_p00,      *B_SP[3]             ; Save A_p00
||           STW   .D1T2 B_p01,      *A_SP[9]             ; Save B_p01
||           MPY   .M2   A_c2,       8,         B_8c2     ; 8c2 = 8*C2
||  [!A_temp]MVK   .S2   0,          B_multiple           ; flag for multiple of 2
                
             LDDW  .D2T1 *B_y_ptr++[B_c2], A_y3:A_y2      ; load y3:y2

; -------------------------------------------------                
             STW   .D2T1 A_p11,      *B_SP[4]             ; Save A_p11
||           STW   .D1T2 B_p10,      *A_SP[10]            ; Save B_p10
||           SHR   .S2   B_i,        1, B_i               ; i = r1 * c2/2
||           ADD   .S1   A_c1,       0, A_j               ; j = c1
||           ADD   .L1X  B_r,        4, A_r               ; r1 = r + 4
                
             LDDW  .D1T2 *A_x_ptr++, B_x1:B_x0            ; load x1:x0
||           LDDW  .D2T1 *B_y_ptr++, A_y1:A_y0            ; load y1:y0
                
             MPYSP .M1X  B_x0,       A_y0,      A_p00     ; p00 = x[0] * y[0]                                                                                                                                                                                                                                       
||           MPYSP .M2X  B_x0,       A_y1,      B_p01     ; p01 = x[0] * y[1]
||           STW   .D2T1 A_s0011,    *B_SP[5]             ; Save A_s0011
||           STW   .D1T2 B_s0110,    *A_SP[11]            ; Save B_s0110
||           MV    .L2   B_8c2,      B_k                  ; K=8*C2
||           ADD   .S2   B_y,        B_8c2,     B_y       ; Y=Y+2*C2

             MPYSP .M1X  B_x1,       A_y1,      A_p11     ; p11 = x[1] * y[1]
||           MPYSP .M2X  B_x1,       A_y0,      B_p10     ; p10 = x[1] * y[0]
||           LDDW  .D2T1 *B_y_ptr++[B_c2], A_y3:A_y2      ; load y3:y2
; -------------------------------------------------

             MPYSP .M1X  B_x0,       A_y2,      A_p02     ; p02 = x[0] * y[2]
||           MPYSP .M2X  B_x0,       A_y3,      B_p03     ; p03 = x[0] * y[3]
||           STW   .D1T2 B_RET_ADDR, *A_SP[12]            ; Save Return address
||           ZERO  .S2   B_zero                           ; Set ZERO
||           ZERO  .S1   A_zero                           ; Set ZERO
||           MV    .L2   B_8c2,      B_mult               ; To avoid store, not mult of 2

             MPYSP .M1X  B_x1,       A_y3,      A_p13     ; p13 = x[1] * y[3]
||           MPYSP .M2X  B_x1,       A_y2,      B_p12     ; p12 = x[1] * y[2]
||           LDDW  .D1T2 *A_x_ptr++, B_x1:B_x0            ; load x1:x0
||           LDDW  .D2T1 *B_y_ptr++, A_y1:A_y0            ; load y1:y0

             MPYSP .M1X  B_x0,       A_y0,      A_p00     ; p00 = x[0] * y[0]                                                                                                                                                                                                                                        
||           MPYSP .M2X  B_x0,       A_y1,      B_p01     ; p01 = x[0] * y[1]
                
             MPYSP .M1X  B_x1,       A_y1,      A_p11     ; p11 = x[1] * y[1]
||           MPYSP .M2X  B_x1,       A_y0,      B_p10     ; p10 = x[1] * y[0]
||           SUBSP .L1   A_p00,      A_p11,     A_s0011   ; s0011 = p00 - p11
||           ADDSP .L2   B_p01,      B_p10,     B_s0110   ; s0110 = p01 + p10
||           LDDW  .D2T1 *B_y_ptr++[B_c2], A_y3:A_y2      ; load y3:y2
||      [B_i]SUB   .D1   A_j,        1, A_j               ; SUB J,1,J

; ------------------------------------------------
             MPYSP .M1X  B_x0,       A_y2,      A_p02     ; p02 = x[0] * y[2]
||           MPYSP .M2X  B_x0,       A_y3,      B_p03     ; p03 = x[0] * y[3]
||           ADDSP .L1   A_zero,     A_zero,    A_real1   ; real1 = 0
||           ADDSP .L2   B_zero,     B_zero,    B_imag1   ; imag1 = 0

             MPYSP .M1X  B_x1,       A_y3,      A_p13     ; p13 = x[1] * y[3]
||           MPYSP .M2X  B_x1,       A_y2,      B_p12     ; p12 = x[1] * y[2]
||           SUBSP .L1   A_p02,      A_p13,     A_s0213   ; s0213 = p02 - p13
||           ADDSP .L2   B_p03,      B_p12,     B_s0312   ; s0312 = p03 + p12
||           LDDW  .D1T2 *A_x_ptr++, B_x1:B_x0            ; load x1:x0
||           LDDW  .D2T1 *B_y_ptr++, A_y1:A_y0            ; load y1:y0
||           SUB   .S1   A_j,        3,         A_row_fg  ; Flag for going to next row

             MPYSP .M1X  B_x0,       A_y0,      A_p00     ; p00 = x[0] * y[0]                                                                                                                                                                                                                                        
||           MPYSP .M2X  B_x0,       A_y1,      B_p01     ; p01 = x[0] * y[1]
||      [A_j]B     .S1   LOOP                             ; Branch to loop
||[!A_row_fg]ADD   .D2   B_k,        -16,       B_k       ; k = k -16
||           ADDSP .L1   A_zero,     A_zero,    A_real2   ; real2 = 0
||           ADDSP .L2   B_zero,     B_zero,    B_imag2   ; imag2 = 0
                
             MPYSP .M1X  B_x1,       A_y1,      A_p11     ; p11 = x[1] * y[1]
||           MPYSP .M2X  B_x1,       A_y0,      B_p10     ; p10 = x[1] * y[0]
||           SUBSP .L1   A_p00,      A_p11,     A_s0011   ; s0011 = p00 - p11
||           ADDSP .L2   B_p01,      B_p10,     B_s0110   ; s0110 = p01 + p10
||     [!A_j]ADD   .S1   A_c1,       0,         A_j       ; j = c1
||     [!B_k]MV    .S2   B_8c2,      B_k                  ; k = 8 *c2
||     [!B_k]ADDAD .D1   A_x,        A_c1,      A_x       ; x= x + 2*c1
||           LDDW  .D2T1 *B_y_ptr++[B_c2], A_y3:A_y2      ; load y3:y2

; ---------------------------- KERNEL -------------------------------
LOOP:

             MPYSP .M1X  B_x0,       A_y2,      A_p02     ; p02 = x[0] * y[2]
||           MPYSP .M2X  B_x0,       A_y3,      B_p03     ; p03 = x[0] * y[3]
||           ADDSP .L1   A_real1,    A_s0011,   A_real1   ; real1 = real1 + s0011
||           ADDSP .L2   B_imag1,    B_s0110,   B_imag1   ; imag1 = imag1 + s0110
||      [B_i]SUB   .D1   A_j,        1,         A_j       ; j = j - 1
||[!A_row_fg]MV    .S1   A_x,        A_x_ptr              ; x_ptr = x
||[!A_row_fg]SUB   .S2   B_y,        B_k,       B_y_ptr   ; y_ptr = y - k(8*c2)
||           MV    .D2   B_mult,     B_mul_fg             ; To avoid store, not mult of 2 

             MPYSP .M1X  B_x1,       A_y3,      A_p13     ; p13 = x[1] * y[3]
||           MPYSP .M2X  B_x1,       A_y2,      B_p12     ; p12 = x[1] * y[2]
||      [B_i]LDDW  .D1T2 *A_x_ptr++, B_x1:B_x0            ; load x1:x0
||           LDDW  .D2T1 *B_y_ptr++, A_y1:A_y0            ; load y1:y0
||           SUBSP .L1   A_p02,      A_p13,     A_s0213   ; s0213 = p02 - p13
||           ADDSP .L2   B_p03,      B_p12,     B_s0312   ; s0312 = p03 + p12
||           SUB   .S1   A_j,        3,         A_row_fg  ; Flag for going to next row
||     [!A_j]SUB   .S2   B_i,        1,         B_i       ; i = i - 1

             MPYSP .M1X  B_x0,       A_y0,      A_p00     ; p00 = x[0] * y[0]                                                                                                                                                                                                                                        
||           MPYSP .M2X  B_x0,       A_y1,      B_p01     ; p01 = x[0] * y[1]
||           ADDSP .L1   A_real2,    A_s0213,   A_real2   ; real2 = real2 + s0213
||           ADDSP .L2   B_imag2,    B_s0312,   B_imag2   ; imag2 = imag2 + s0312
||     [!B_i]ZERO  .D1   A_c1                             ; To stop jumping at the end
||      [A_j]B     .S1   LOOP                             ; Branch to loop
||[!A_row_fg]ADD   .S2   B_k,        -16,       B_k       ; k = k - 16
||     [!A_j]SUB   .D2   B_mult,     B_multiple,B_mult    ; To avoid store, not mult of 2
                
             MPYSP .M1X  B_x1,       A_y1,      A_p11     ; p11 = x[1] * y[1]
||           MPYSP .M2X  B_x1,       A_y0,      B_p10     ; p10 = x[1] * y[0]
||           SUBSP .L1   A_p00,      A_p11,     A_s0011   ; s0011 = p00 - p11
||           ADDSP .L2   B_p01,      B_p10,     B_s0110   ; s0110 = p01 + p10
||     [!A_j]ADD   .S1   A_c1,       0,         A_j       ; j = c1
||     [!B_k]MV    .S2   B_8c2,      B_k                  ; k = 8*c2
||     [!B_k]ADDAD .D1   A_x,        A_c1,      A_x       ; x = x + 2*c1
||           LDDW  .D2T1 *B_y_ptr++[B_c2], A_y3:A_y2      ; load y3:y2

; --------------------------------------------------------------------
 
             MPYSP .M1X  B_x0,       A_y2,      A_p02     ; p02 = x[0] * y[2]
||           MPYSP .M2X  B_x0,       A_y3,      B_p03     ; p03 = x[0] * y[3]
||           ADDSP .L1   A_zero,     A_s0011,   A_real1   ; real1 = s0011
||           ADDSP .L2   B_zero,     B_s0110,   B_imag1   ; imag1 = s0110
||           STW   .D2T1 A_real1,    *B_r++[2]            ; store real1
||           STW   .D1T2 B_imag1,    *A_r++[2]            ; store imag1
||[!A_row_fg]MV    .S1   A_x,        A_x_ptr              ; x_ptr = x
||[!A_row_fg]SUB   .S2   B_y,        B_k,       B_y_ptr   ; y_ptr = y - k(8*c2)

             MPYSP .M1X  B_x1,       A_y3,      A_p13     ; p13 = x[1] * y[3]
||           MPYSP .M2X  B_x1,       A_y2,      B_p12     ; p12 = x[1] * y[2]
||      [A_j]LDDW  .D1T2 *A_x_ptr++, B_x1:B_x0            ; load x1:x0
||      [A_j]LDDW  .D2T1 *B_y_ptr++, A_y1:A_y0            ; load y1:y0
||           SUBSP .L1   A_p02,      A_p13,     A_s0213   ; s0213 = p02 - p13
||           ADDSP .L2   B_p03,      B_p12,     B_s0312   ; s0312 = p03 + p12
||           SUB   .S1   A_j,        4, A_row_fg          ; Flag for going to next row
||[!B_mul_fg]MV    .S2   B_8c2,      B_mult               ; To avoid store, not mult of 2

             MPYSP .M1X  B_x0,       A_y0,      A_p00     ; p00 = x[0] * y[0]                                                                                                                                                                                                                                        
||           MPYSP .M2X  B_x0,       A_y1,      B_p01     ; p01 = x[0] * y[1]
||           ADDSP .L1   A_zero,     A_s0213,   A_real2   ; real2 = s0213
||           ADDSP .L2   B_zero,     B_s0312,   B_imag2   ; imag2 = s0312
|| [B_mul_fg]STW   .D2T1 A_real2,    *B_r++[2]            ; store real2
|| [B_mul_fg]STW   .D1T2 B_imag2,    *A_r++[2]            ; store imag2
||      [A_j]B     .S1   LOOP                             ; Branch to loop
||[!A_row_fg]ADD   .S2   B_k,        -16,       B_k       ; k = k - 16
                
             MPYSP .M1X  B_x1,       A_y1,      A_p11     ; p11 = x[1] * y[1]
||           MPYSP .M2X  B_x1,       A_y0,      B_p10     ; p10 = x[1] * y[0]
||           SUBSP .L1   A_p00,      A_p11,     A_s0011   ; s0011 = p00 - p11
||           ADDSP .L2   B_p01,      B_p10,     B_s0110   ; s0110 = p01 + p10
||      [B_i]SUB   .S1   A_j,        1, A_j               ; j = c1
||     [!B_k]MV    .S2   B_8c2,      B_k                  ; k = 8*c2
||     [!B_k]ADDAD .D1   A_x,        A_c1,      A_x       ; x = x + 2*c1
||      [A_j]LDDW  .D2T1 *B_y_ptr++[B_c2], A_y3:A_y2      ; load y3:y2

; ------------------------------------------------------------------- 
             MV    .S2X  A_SP,       B_SP                 ; Copy stack pointer
||           LDW   .D1T2 *A_SP[12],  B_RET_ADDR           ; load return address

             LDW   .D1T1 *A_SP[1],   A_y0                 ; restore A_y0
||           LDW   .D2T2 *B_SP[7],   B_x0                 ; restore B_x0
||           MVC   .S2X  A_CSR, CSR                       ; Enable Interrupt
                
             LDW   .D1T1 *A_SP[2],   A_y1                 ; restore A_y1
||           LDW   .D2T2 *B_SP[8],   B_x1                 ; restore B_x1
                
             LDW   .D1T1 *A_SP[3],   A_p00                ; restore A_p00
||           LDW   .D2T2 *B_SP[9],   B_p01                ; restore B_p01
   
             LDW   .D1T1 *A_SP[4],   A_p11                ; restore A_p11
||           LDW   .D2T2 *B_SP[10],  B_p10                ; restore B_p10
                
             LDW   .D1T1 *A_SP[5],   A_s0011              ; restore A_s0011
||           LDW   .D2T2 *B_SP[11],  B_s0110              ; restore B_s0110                  
||           B     .S2   B_RET_ADDR                       ; Return from function
                
             ADDAW .D2   B_SP,       13,        B_SP      ; Restore stack space

             NOP         4
            .end

* ======================================================================= *
*  End of file:  DSPF_sp_mat_mul_cplx.asm                                 *
* ----------------------------------------------------------------------- *
*            Copyright (c) 2011 Texas Instruments, Incorporated.          *
*                           All Rights Reserved.                          *
* ======================================================================= *