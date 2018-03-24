* ======================================================================= *
* DSPF_sp_mat_mul.asm -- Matrix Multiply                                  *
*                 Legacy ASM Implementation from C67x DSPLIB              *
*                                                                         *
* Rev 0.0.1                                                               *
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

* ===================== SYMBOLIC REGISTER ASSIGNMENTS ===================== *
        .asg            A3,         A_ptr_x
        .asg            A9,         A_x0
        .asg            A8,         A_x1
        .asg            B10,        B_ptr_y
        .asg            B14,         B_c2
        .asg            B1,         B_y0
        .asg            B2,         B_ptr_w
        .asg            B8,         B_y1
        .asg            B3,         B_yc20
        .asg            B11,         B_yc21
        .asg            A14,         A_prod1
        .asg            A7,         A_prod2
        .asg            A0,         A_mac
        .asg            A10,         A_sum
        .asg            B7,         B_prod1
        .asg            B12,         B_prod2
        .asg            B9,         B_mac1
        .asg            B5,         B_sum1
        .asg            A5,         A_ptr_z
        .asg            A13,         A_xc10
        .asg            A9,         A_xc11
        .asg            A0,         A_mac2
        .asg            A10,         A_sum2
        .asg            B11,         B_mac3
        .asg            B5,         B_sum3
        .asg            A1,         A_kCnt

        .asg            A4,         A_x
        .asg            B4,         B_r1
        .asg            A6,         A_c1
        .asg            B6,         B_y
        .asg            A8,         A_c2
        .asg            B8,         B_r
        
        .asg            A11,        i
        .asg            B13,        j
        .asg            A12,        A_c1_odd
        .asg            A12,        A_kLoopCnt
        .asg            A9,         A_index
        .asg            A13,        ptr_r
        
        .asg            B8,         c2_p1
        .asg            B0,         jCnt
        .asg            A2,         iCnt
        .asg            A0,         A_c2_copy
        .asg            A2,         A_pred
        .asg            B0,         B_flag
        .asg            A4,         A_0x80KK
        .asg            A5,         A_0x1
        .asg            B1,         flag_b1
        .asg            B12,        ptr_r_copy
        
; ================= SYMBOLIC REGISTER ASSIGNMENTS: SETUP ================== ;
        .asg            B15,        B_SP        ; Stack pointer, B datapath
        .asg            A3,         A_SP        ; Stack pointer, A datapath
        .asg            B2,         B_csr       ; CSR's value
        .asg            B7,         B_no_gie    ; CSR w/ GIE bit cleared
        .asg            B3,         B_ret       ; Return address
; ========================================================================= ;
        ; Stack frame.  16 words:  A10..A15, B10..B14, B3, CSR, B_r, A_x, pad
        
        .sect ".text:optimized"
        .if __TI_EABI__
        .asg  DSPF_sp_mat_mul, _DSPF_sp_mat_mul
        .endif		
        .global _DSPF_sp_mat_mul
_DSPF_sp_mat_mul:

        STW     .D2T2   B14,        *--B_SP[16]            ; Get stk, Save B14
||      B       .S1     NO_INTS                            ;Disable Interrupts during branch

        ADD     .S1X    B_SP,       4,          A_SP       ; Twin Stack Ptr
||      STW     .D2T2   B13,        *+B_SP[2]              ; Save B13

        STW     .D1T1   A15,        *A_SP                  ; Save A15
||      STW     .D2T2   B12,        *+B_SP[4]              ; Save B12

        STW     .D1T1   A14,        *+A_SP[2]              ; Save A14
||      STW     .D2T2   B11,        *+B_SP[6]              ; Save B11
||      MVC     .S2     CSR,        B_csr                  ; Get CSR's state

        STW     .D1T1   A12,        *+A_SP[4]              ; Save A12
||      STW     .D2T2   B10,        *+B_SP[8]              ; Save B10
||      MV      .L2     B_y,        B_ptr_y                ;Initialization of ptr_y
||      AND     .S1     A_c1,       1,          A_c1_odd   ; (c1&1)     
||      AND     .S2     B_csr,      -2,         B_no_gie   ; Clear GIE

        STW     .D1T1   A13,        *+A_SP[6]              ; Save A13
||      STW     .D2T2   B_csr,      *+B_SP[10]             ; Save CSR
||      ADD     .L2     B_ptr_y,    4,          B_ptr_w    ;ptr to 2nd col of Y matrix 
||      MV      .L1     A_c1,       A_index                ;Initialization of index
||      SUB     .S1     A_c1,       A_c1_odd,   A_kLoopCnt ;round c1 to nearest lesser even no.
||      MVC     .S2     B_no_gie,   CSR                    ;Disable Interrrupts

NO_INTS:
        STW     .D1T1   A10,        *+A_SP[8]              ; Save A10
||      STW     .D2T2   B_ret,      *+B_SP[12]             ; Save RET ADDR
||      ZERO    .S1     A_sum                              ;reset A_sum,A_sum2->mapped to same reg
||      SUB     .L1     A_kLoopCnt, 2,          A_kCnt     ;kLoop counter
||      ZERO    .L2     B_sum1                             ;reset B_sum1,B_sum3->mapped to same reg

        STW     .D1T1   A11,        *+A_SP[10]             ; Save A11
||      STW     .D2T2   B_r,        *+B_SP[13]             ; Save B_r
||      MVK     .S1     4,          A_pred                 ;Prolog Collapse Predicate
||      CMPGT   .L2X    A_kLoopCnt, 6,          B_flag     ;if kernel ran > 3 times
||[A_kCnt]B     .S2     ijkLoop

        ZERO    .S1     i                                  ;reset iLoop counter
||      MV      .S2X    A_c2,       B_c2                   ;make a copy of c2 on B-side
||      ZERO    .L2     j                                  ;reset jLoop counter
||      STW     .D2T1   A_x,       *+B_SP[14]              ; Save A_x
||      MV      .L1     A_x,        A_ptr_x                ;Initialization of ptr_x 
||      ADDAW   .D1     A_x,        A_index,    A_ptr_z    ;ptr to 2nd row of X matrix  

        
* =========================== PIPE LOOP KERNEL ============================ *
ijkLoop:
  [!A_pred]ADDSP .L1    A_sum,      A_mac,      A_sum           ;[17,2] 
||      ADDSP   .L2     B_prod1,    B_prod2,    B_mac1          ;[13,3] 
||      MPYSP   .M1X    A_xc10,     B_y0,       A_prod1         ;[ 9,4] 
||      MPYSP   .M2X    A_x1,       B_yc21,     B_prod2         ;[ 9,4] 
||      LDW     .D1T1   *-A_ptr_z[1],           A_xc11          ;[ 5,5] 
||      LDW     .D2T2   *B_ptr_y++[B_c2],       B_y0            ;[ 1,6] 

   [ A_kCnt]SUB   .S1   A_kCnt,     2,          A_kCnt          ;[18,2] 
|| [!A_pred]ADDSP .L2   B_sum1,     B_mac1,     B_sum1          ;[18,2] 
||      ADDSP   .L1     A_prod1,    A_prod2,    A_mac2          ;[14,3] 
||      MPYSP   .M1X    A_xc11,     B_yc20,     A_prod2         ;[10,4] 
||      MPYSP   .M2X    A_xc11,     B_yc21,     B_prod2         ;[10,4] 
||      LDW     .D2T2   *B_ptr_y++[B_c2],       B_yc20          ;[ 2,6] 
||      LDW     .D1T1   *A_ptr_x++, A_x0                        ;[ 2,6] 

   [ A_kCnt]B     .S2   ijkLoop                                   ;[19,2] 
|| [!A_pred]ADDSP .L1   A_sum2,     A_mac2,     A_sum2          ;[19,2] 
||      ADDSP   .L2     B_prod1,    B_prod2,    B_mac3          ;[15,3] 
||      MPYSP   .M2X    A_xc10,     B_y1,       B_prod1         ;[11,4] 
||      MPYSP   .M1X    A_x0,       B_y0,       A_prod1         ;[ 7,5] 
||      LDW     .D2T2   *B_ptr_w++[B_c2],       B_y1            ;[ 3,6] 
||      LDW     .D1T1   *A_ptr_x++, A_x1                        ;[ 3,6] 

   [!A_pred]ADDSP .L2   B_sum3,     B_mac3,     B_sum3          ;[20,2] 
||      ADDSP   .L1     A_prod1,    A_prod2,    A_mac           ;[12,4] 
||      MPYSP   .M2X    A_x0,       B_y1,       B_prod1         ;[ 8,5] 
||      MPYSP   .M1X    A_x1,       B_yc20,     A_prod2         ;[ 8,5] 
||      LDW     .D1T1   *A_ptr_z++[2],          A_xc10          ;[ 4,6] 
||      LDW     .D2T2   *B_ptr_w++[B_c2],       B_yc21          ;[ 4,6] 
|| [A_pred]SUB  .S1     A_pred,     1,          A_pred          ;Prolog Collapse Predicate

* =========================== PIPE LOOP EPILOG ============================ *
   [B_flag]ADDSP .L1    A_sum,      A_mac,      A_sum           ;[17,3] 
||      ADDSP   .L2     B_prod1,    B_prod2,    B_mac1          ;[13,4] 
||      MPYSP   .M1X    A_xc10,     B_y0,       A_prod1         ;[ 9,5] 
||      MPYSP   .M2X    A_x1,       B_yc21,     B_prod2         ;[ 9,5] 
||      LDW     .D1T1   *-A_ptr_z[1],           A_xc11          ;[ 5,6] 
||      SUB     .S1     A_kLoopCnt, 6,          A_kLoopCnt      ;to check if kLoop ran > 2 times
||      LDW     .D2T2   *B_ptr_y,   B_y0                        ;if c1 odd

   [B_flag]ADDSP .L2    B_sum1,     B_mac1,     B_sum1          ;[18,3] 
||      ADDSP   .L1     A_prod1,    A_prod2,    A_mac2          ;[14,4] 
||      MPYSP   .M1X    A_xc11,     B_yc20,     A_prod2         ;[10,5] 
||      MPYSP   .M2X    A_xc11,     B_yc21,     B_prod2         ;[10,5] 
||      MVKL    .S1     0x80000000, A_0x80KK                    ;mask to find sign bit
||      LDW     .D1T1   *A_ptr_x,   A_x0                        ;if c1 odd 

   [B_flag]ADDSP .L1    A_sum2,     A_mac2,     A_sum2          ;[19,3] 
||      ADDSP   .L2     B_prod1,    B_prod2,    B_mac3          ;[15,4] 
||      MPYSP   .M2X    A_xc10,     B_y1,       B_prod1         ;[11,5] 
||      MPYSP   .M1X    A_x0,       B_y0,       A_prod1         ;[ 7,6] 
||      MVKH    .S1     0x80000000, A_0x80KK                    ;mask to find sign bit
||      LDW     .D1T1   *A_ptr_z,   A_xc10                      ;if c1 odd 
||      LDW     .D2T2   *B_ptr_y[1],            B_y1            ;if c1 odd

   [B_flag]ADDSP .L2    B_sum3,     B_mac3,     B_sum3          ;[20,3] 
||      ADDSP   .L1     A_prod1,    A_prod2,    A_mac           ;[12,5] 
||      MPYSP   .M2X    A_x0,       B_y1,       B_prod1         ;[ 8,6] 
||      MPYSP   .M1X    A_x1,       B_yc20,     A_prod2         ;[ 8,6] 
||      AND     .S1     A_0x80KK,   A_kLoopCnt, A_pred          ;if kernel ran > 2 times

   [!A_pred]ADDSP .L1   A_sum,      A_mac,      A_sum           ;[17,4] 
||      ADDSP   .L2     B_prod1,    B_prod2,    B_mac1          ;[13,5] 
||      MPYSP   .M1X    A_xc10,     B_y0,       A_prod1         ;[ 9,6] 
||      MPYSP   .M2X    A_x1,       B_yc21,     B_prod2         ;[ 9,6] 

   [!A_pred]ADDSP .L2   B_sum1,     B_mac1,     B_sum1          ;[18,4] 
||      ADDSP   .L1     A_prod1,    A_prod2,    A_mac2          ;[14,5] 
||      MPYSP   .M1X    A_xc11,     B_yc20,     A_prod2         ;[10,6] 
||      MPYSP   .M2X    A_xc11,     B_yc21,     B_prod2         ;[10,6] 
||      MVK     .S1     0x4,        A_kCnt                      ;(4-c1)

   [!A_pred]ADDSP .L1   A_sum2,     A_mac2,     A_sum2          ;[19,4] 
||      ADDSP   .L2     B_prod1,    B_prod2,    B_mac3          ;[15,5] 
||      MPYSP   .M2X    A_xc10,     B_y1,       B_prod1         ;[11,6] 
||      LDW     .D2T1   *+B_SP[13], ptr_r                       ; Restore B_r
||      MPYSP   .M1X    B_y0,       A_x0,       A_prod1         ;if c1 odd
||      SUB     .S1     A_c1,       A_kCnt,     A_kCnt          ;if c1 == 3 or 2

   [!A_pred]ADDSP .L2   B_sum3,     B_mac3,     B_sum3          ;[20,4] 
||      ADDSP   .L1     A_prod1,    A_prod2,    A_mac           ;[12,6] 
||      MPYSP   .M2X    A_x0,       B_y1,       B_prod1         ;if c1 odd
||      AND     .S1     A_0x80KK,   A_kCnt,     A_kCnt          ;if sign bit set

   [!A_kCnt]ADDSP .L1   A_sum,      A_mac,      A_sum           ;[17,5] 
||      ADDSP   .L2     B_prod1,    B_prod2,    B_mac1          ;[13,6] 
||      MPYSP   .M2X    A_xc10,     B_y1,       B_prod2         ;if c1 odd
||      MPYSP   .M1X    B_y0,       A_xc10,     A_prod2         ;if c1 odd

   [!A_kCnt]ADDSP .L2   B_sum1,     B_mac1,     B_sum1          ;[18,5] 
||      ADDSP   .L1     A_prod1,    A_prod2,    A_mac2          ;[14,6] 
||      MPY     .M1X    i,          B_c2,       A_index         ;i-th row (having c2 elements each)
||      MVKL    .S1     0x3F800000, A_0x1                       ;Constant 1.0

   [!A_kCnt]ADDSP .L1   A_sum2,     A_mac2,     A_sum2          ;[19,5] 
||      ADDSP   .L2     B_prod1,    B_prod2,    B_mac3          ;[15,6] 
||      MVKH    .S1     0x3F800000, A_0x1                       ;Constant 1.0

   [!A_kCnt]ADDSP .L2   B_sum3,     B_mac3,     B_sum3          ;[20,5] 
||      ADD     .S1X    A_index,    j,          A_index         ;i-th row, jth col
||      ADD     .S2     j,          2,          j               ;increment j for next jLoop
||      ADD     .D1     i,          1,          A_pred          ;find (i+1)

        ADDSP   .L1     A_sum,      A_mac,      A_sum           ;[17,6] 
||      SUB     .S2     j,          B_c2,       jCnt            ;if jLoop finished
||      SUB     .S1X    A_pred,     B_r1,       A_pred          ;(i+1)-(r1)

        ADDSP   .L2     B_sum1,     B_mac1,     B_sum1          ;[18,6]
||      AND     .S2X    A_0x80KK,   jCnt,       jCnt            ;if jLoop finished
||      AND     .S1     A_c1,       1,          A_kCnt          ;A_kCnt = is c1 odd

        ADDSP   .L1     A_sum2,     A_mac2,     A_sum2          ;[19,6] 
||      ADDAW   .D1     ptr_r,      A_index,    ptr_r           ;reach [i,j] element of output
||      MV      .S1X    B_c2,       A_c2_copy                   ;make a copy of c2 on A side
||      LDW     .D2T1   *+B_SP[14], A_x                         ; Restore A_x to use in jLoop

        ADDSP   .L2     B_sum3,     B_mac3,     B_sum3          ;[20,6] 
||      AND     .S1     A_0x80KK,   A_pred,     A_pred          ; if (i+1) < r1
  
* ========================================================================= *
* =========================== CODE IN jLoop =============================== *
  [A_kCnt] ADDSP .L1    A_sum,      A_prod1,    A_sum           ;if c1 odd
||[!A_kCnt]MPYSP .M1    A_sum,      A_0x1,      A_sum           ;if c1 not odd
||         ADD   .S2    B_c2,       1,          c2_p1           ;for (i+1)-th row in output
||         MV    .D1    A_0x80KK,   A_prod1                     ;Temporary Move
||[jCnt]   AND   .S1    A_c1,       1,          A_c1_odd
  
  [A_kCnt] ADDSP .L2    B_sum1,     B_prod1,    B_sum1          ;if c1 odd
||[!A_kCnt]MPYSP .M2X   B_sum1,     A_0x1,      B_sum1          ;if c1 not odd
||[jCnt]   MPY   .M1    i,          A_c1,       A_index
||[jCnt]   SUB   .S1    A_c1,       A_c1_odd,   A_kLoopCnt      ;round c1 to nearest lesser even no.
  
  [A_kCnt] ADDSP .L1    A_sum2,     A_prod2,    A_sum2          ;if c1 odd
||[!A_kCnt]MPYSP .M1    A_sum2,     A_0x1,      A_sum2          ;if c1 not odd
||         SUB   .S2    j,          c2_p1,      flag_b1         ;(j+2)-(c2+1)
||[jCnt]   B     .S1    ijkLoop                                   
  
  [A_kCnt] ADDSP .L2    B_sum3,     B_prod2,    B_sum3          ;if c1 odd
||[!A_kCnt]MPYSP .M2X   B_sum3,     A_0x1,      B_sum3          ;if c1 not odd
||[jCnt]   ADDAW .D1    A_x,        A_index,    A_ptr_x         ;ptr to i-th row of X matrix
||[jCnt]   SUB   .S1    A_kLoopCnt, 2,          A_kCnt          ;kLoop counter

           STW   .D1T1  A_sum,      *ptr_r                      ;store at r[i*c2+j]
||         AND   .S2X   A_prod1,    flag_b1,    flag_b1         ;A_prod1=0x80000000, if (j+1) < c2
||[jCnt]   ADD   .L1    A_c1,       A_index,    A_index
||[!jCnt]  ZERO  .S1    A_kCnt 
        
  [flag_b1]STW   .D1T2  B_sum1,     *ptr_r[1]                   ;store at r[i*c2+j+1], when c2 odd
||[jCnt]   ADDAW .D2    B_y,        j,          B_ptr_y         ;ptr to j-th col of Y matrix
||         MV    .S2X   ptr_r,      ptr_r_copy                  ;Temporary Move

  [A_pred] STW   .D1T1  A_sum2,     *ptr_r[A_c2_copy]           ;store at r[(i+1)*c2+j], when r1 odd
||         AND   .S1X   A_pred,     flag_b1,    A_pred          ;
||[jCnt]   ZERO  .L1    A_sum                                   ;reset A_sum,A_sum2->mapped to same reg
||[jCnt]   ADD   .D2    B_ptr_y,    4,          B_ptr_w         ;ptr to (j+1)-th col of Y matrix 
||[A_kCnt] B     .S2    ijkLoop         
  
  [A_pred] STW   .D2T2  B_sum3,     *ptr_r_copy[c2_p1]          ;store at r[(i+1)*c2+j+1], when both c2,r1 odd
||[jCnt]   ZERO  .S2    B_sum1                                  ;reset B_sum1,B_sum3->mapped to same reg
||[jCnt]   CMPGT .L2X   A_kLoopCnt, 6,          B_flag          ;if kernel ran > 3 times
||[jCnt]   ADDAW .D1    A_x,        A_index,    A_ptr_z         ;ptr to (i+1)-th row of X matrix
||[jCnt]   MVK   .S1    4,          A_pred                      ;Prolog Collapse Predicate
||[jCnt]   SUB   .L1    A_kLoopCnt, 2,          A_kCnt          ;kLoop counter

* ========================================================================= *
* =========================== CODE IN iLoop =============================== *
         ADD    .S1     i,          2,          i               ;for next iLoop
        
         CMPLT  .L1     i,          B_r1,       iCnt            ;is iLoop finished
        
   [iCnt]B      .S1     ijkLoop
|| [iCnt]AND    .L1     A_c1,       1,          A_c1_odd
|| [iCnt]MPY    .M1     i,          A_c1,       A_index
   
         ZERO   .S2     j                                       ;reset j for next iLoop start
|| [iCnt]SUB    .S1     A_c1,       A_c1_odd,   A_kLoopCnt      ;round c1 to nearest lesser even no.
||       MV     .L2     B_y,        B_ptr_y
||       ADD    .D2     B_y,        4,          B_ptr_w         ;ptr to 2nd col of Y matrix 
        
   [iCnt]ZERO   .L1     A_sum                                   ;reset A_sum,A_sum2->mapped to same reg
|| [iCnt]ZERO   .D2     B_sum1                                  ;reset B_sum1,B_sum3->mapped to same reg        
|| [iCnt]SUB    .S1     A_kLoopCnt, 2,          A_kCnt          ;kLoop counter
|| [iCnt]CMPGT  .L2X    A_kLoopCnt, 6,          B_flag          ;if kernel ran > 3 times
|| [iCnt]ADDAW  .D1     A_x,        A_index,    A_ptr_x         ;ptr to i-th row of X matrix

   [iCnt]ADD    .D1     A_c1,       A_index,    A_index
||[!iCnt]ZERO    .S1    A_kCnt
   
   [iCnt]ADDAW  .D1     A_x,        A_index,    A_ptr_z         ;ptr to (i+1)-th row of X matrix
||[A_kCnt]B     .S1     ijkLoop

   [iCnt]MVK    .S1     4,          A_pred                      ;Prolog Collapse Predicate
|| [iCnt]SUB    .D1     A_kLoopCnt, 2,          A_kCnt          ;kLoop counter
        
* ========================================================================= *
        LDW     .D2T2   *+B_SP[12], B_ret                   ; Get rtn
||      ADD     .S1X    B_SP,       4,           A_SP       ; Twin Stack Ptr

        LDW     .D2T2   *+B_SP[10], B_csr                   ; Restore CSR
||      LDW     .D1T1   *+A_SP[10], A11                     ; Restore A11

        LDW     .D2T2   *+B_SP[8],  B10                     ; Restore B10
||      LDW     .D1T1   *+A_SP[8],  A10                     ; Restore A10

        LDW     .D2T2   *+B_SP[6],  B11                     ; Restore B11
||      LDW     .D1T1   *+A_SP[6],  A13                     ; Restore A13

        LDW     .D2T2   *+B_SP[4],  B12                     ; Restore B12
||      LDW     .D1T1   *+A_SP[4],  A12                     ; Restore A12

        LDW     .D2T2   *+B_SP[2],  B13                     ; Restore B13
||      LDW     .D1T1   *+A_SP[2],  A14                     ; Restore A14
        
        LDW     .D2T2   *B_SP++[16], B14                    ; Restore B14
||      LDW     .D1T1   *A_SP,      A15                     ; Restore A15
||      MVC     .S2     B_csr,      CSR
        
        B       .S2     B_ret                               ; Return to caller
        NOP             5

* ======================================================================= *
*  End of file:  DSPF_sp_mat_mul.asm                                      *
* ----------------------------------------------------------------------- *
*            Copyright (c) 2011 Texas Instruments, Incorporated.          *
*                           All Rights Reserved.                          *
* ======================================================================= *