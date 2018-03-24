* ======================================================================= *
* DSPF_sp_fir_r2.asm -- FIR R2 Filter                                     *
*                 Legacy ASM Implementation from C67x DSPLIB              *
*                                                                         *
* Rev 0.0.2                                                               *
*                                                                         *
* ----------------------------------------------------------------------- *
*            Copyright (c) 2009 Texas Instruments, Incorporated.          *
*                           All Rights Reserved.                          *
* ======================================================================= *


* ======================================================================== *
* ======================================================================== *

        .sect ".text:optimized"
        .if __TI_EABI__
        .asg  DSPF_sp_fir_r2, _DSPF_sp_fir_r2
        .endif		
		
        .global _DSPF_sp_fir_r2
_DSPF_sp_fir_r2:

* ======================================================================== *
* ======================================================================== *

               .asg   B15,     B_SP
               .asg   A0,      A_SP
               .asg   A4,      A_x
               .asg   A5,      A_x_ptr
               .asg   B4,      B_h
               .asg   B5,      B_h_ptr 
               .asg   A8,      A_CSR_str
               .asg   B0,      B_CSR_gie
               .asg   A8,      A_nr
               .asg   B2,      B_nr
               .asg   A6,      A_r
               .asg   A6,      A_nh
               .asg   B6,      B_r
               .asg   B6,      B_nh
               .asg   B10,     B_x0
               .asg   B10,     B_x2
               .asg   B10,     B_x20
               .asg   B11,     B_x1
               .asg   B11,     B_x3
               .asg   B11,     B_x31
               .asg   B12,     B_x42
               .asg   B12,     B_x4
               .asg   B12,     B_x_2
               .asg   A10,     A_h0
               .asg   A11,     A_h1
               .asg   A7,      A_prod
               .asg   B7,      B_prod
               .asg   A9,      A_sum
               .asg   B9,      B_sum
               .asg   A2,      A_zero
               .asg   B1,      B_zero
               .asg   A5,      A_zero1
               .asg   B5,      B_zero1
               .asg   B14,     B_prod1
               .asg   A3,      A_prod2
               .asg   A12,     A_prod3
               .asg   A0,      A_prod4
               .asg   A12,     A_x20
               .asg   A12,     A_x0
               .asg   A12,     A_x2
               .asg   A13,     A_x31
               .asg   A13,     A_x1
               .asg   A13,     A_x3
               .asg   A12,     A_sum_4
               .asg   B13,     B_h_1
               .asg   B14,     B_h1
               .asg   A2,      A_ictr
               .asg   A1,      A_RSTflg
               .asg   A1,      A_h_t
               .asg   A1,      A_h_1t
               .asg   B8,      B_MULT4
               .asg   B2,      B_MULflg
               .asg   B0,      B_MULT2
               .asg   B0,      B_STRflg
               .asg   B1,      B_nreq2
               .asg   A5,      A_sum_t
               .asg   B5,      B_sum_t
               .asg   B14,     B_x
               


             LDDW  .D1T2 *A_x,      B_x1:B_x0             ; load x[i+j+1]:x[i+j]
||           SUBAW .D2   B_SP,      11,         B_SP      ; Save stack space
||           AND   .L2X  A_nr,      0x3,        B_MULflg  ; find out multiple of 4
||           MVC   .S2   CSR,       B_CSR_gie             ; Get CSR
||           MV    .L1   A_x,       A_x_ptr               ; Set x_ptr
||           MV    .S1X  B_h,       A_h_t                 ; Set temporary h_ptr

             LDW   .D1T1 *+A_h_t[3],A_h_1t                ; load h[i+3] to remove cross path
||[B_MULflg] SUB   .S1   A_nr,      2,          A_nr      ; make counter multiple of 4
||           MVK   .S2   0,         B_MULT4               ; flag for multiple of 4
||           STW   .D2T2 B_x,       *+B_SP[5]             ; store B14
||           MV    .L2   B_h,       B_h_ptr               ; Set h_ptr
||           MV    .L1X  B_SP,      A_SP                  ; Copy stack pointer
            
             STW   .D2T1 A_h0,      *+B_SP[1]             ; Sore A10
||           STW   .D1T2 B_x20,     *+A_SP[6]             ; Store B10
||[!B_MULflg]MVK   .S2   1,         B_MULT4               ; flag for multiple of 4
||           MV    .L2X  A_nr,      B_nr                  ; copy nr
  
             STW   .D2T1 A_h1,      *+B_SP[2]             ; Store A11
||           STW   .D1T2 B_x31,     *+A_SP[7]             ; Store B11
||           MV    .S1X  B_CSR_gie, A_CSR_str             ; Store CSR  
||           AND   .S2   B_CSR_gie, -2,         B_CSR_gie ; Disable GIE
               
             STW   .D2T1 A_x20,     *+B_SP[3]             ; Store A12
||           STW   .D1T2 B_x42,     *+A_SP[8]             ; Store B12
||           MV    .L1X  B_nh,      A_nh                  ; Change side of nh 
||           MV    .L2X  A_r,       B_r                   ; Change side of r
  
             STW   .D2T1 A_x31,     *+B_SP[4]             ; Store A13
||           STW   .D1T2 B_h_1,     *+A_SP[9]             ; Store B13
||           MVC   .S2   B_CSR_gie, CSR                   ; Disable interrupt
||           ZERO  .L2   B_nreq2                          ; flag for checking if nr=2

; -------------------------------------------------------------
               
             LDDW  .D2T1 *B_h++,    A_h1:A_h0             ; load h[i+1]:h[i]
||[B_nr]     ADDAD .D1   A_x_ptr,   2,          A_x_ptr   ; if nr!=2 update x_ptr
||[!B_nr]    MVK   .S2   1,         B_nreq2               ; Set flag for nr=2
||[!B_nr]    SUB   .L2   1,         B_MULT4,    B_MULT4   ; Invert Mult4 flag if nr=2 

             LDW   .D1T2 *A_x[2],   B_x_2                 ; load x[i+j+2]
||[!B_nr]    MVK   .S2   4,         B_nr                  ; load 4 in counter if NR=2
||           MV    .L2X  A_h_1t,    B_h_1                 ; Get h[i+3]
               
             LDDW  .D1T2 *++A_x,    B_x31:B_x20           ; load x[i+j+3(1)]:x[i+j+2(0)]
||           MV    .L2X  A_x_ptr,   B_x                   ; Set x_ptr for B side         
               
             LDW   .D1T2 *A_x[2],   B_x42                 ; load x[i+j+2(4)]
||           SUB   .S1   A_nh,      2,          A_ictr    ; Set inner loop ctr
||           ZERO  .L1   A_prod                           ; Initialise prod
||           ZERO  .L2   B_prod                           ; Initialise prod
||           B     .S2   ILOOP                            ; Branch to inner loop 
               
             LDDW  .D2T1 *B_h++,    A_h1:A_h0             ; load h[i+1]:h[i]
||           SUB   .S1   A_nh,      2,          A_RSTflg  ; Set reset flag
||           ZERO  .L2   B_sum                            ; Initialise accumulator
||           ZERO  .L1   A_sum                            ; Initialise accumulator 
||           MVK   .S2   0,         B_STRflg              ; Reset store flag

ILOOP:
  [B_STRflg] STW   .D2T1 A_sum_4,   *B_r++                ; Store sum7
||[!A_RSTflg]LDW   .D1T2 *A_x[2],   B_x42                 ; load x[i+j+2(4)]
||           MPYSP .M1X  A_h0,      B_x0,       A_prod    ; h[i] * x[i+j]
||           MPYSP .M2X  A_h1,      B_x1,       B_prod    ; h[i+1] * x[i+j+1] 
||           ADDSP .L1   A_sum,     A_prod,     A_sum     ; sum1 += h[i] * x[i+j]
||           ADDSP .L2   B_sum,     B_prod,     B_sum     ; sum2 += h[i+1] * x[i+j+1]
||[!A_RSTflg]MVK   .S1   6,         A_RSTflg              ; Reset reset flag
||           MVK   .S2   0,         B_STRflg              ; Reset store flag

             LDDW  .D1T2 *++A_x,    B_x31:B_x20           ; load x[i+j+3(1)]:x[i+j+2(0)]
||[!A_ictr]  LDDW  .D2T1 *++B_x,    A_x31:A_x20           ; load x[i+j+3(1)]:x[i+j+2(0)]
||           MPYSP .M1X  A_h0,      B_x1,       A_prod    ; h[i] * x[i+j+1]
||           MPYSP .M2X  A_h1,      B_x_2,      B_prod    ; h[i+1] * x[i+j+2]          
||           ADDSP .L1   A_sum,     A_prod,     A_sum     ; sum3 += h[i] * x[i+j+1]
||           ADDSP .L2   B_sum,     B_prod,     B_sum     ; sum4 += h[i+1] * x[i+j+2]
||[A_RSTflg] SUB   .S1   A_RSTflg,  2,          A_RSTflg  ; Update reset flag

             LDW   .D1T2 *A_x[2],   B_x42                 ; load x[i+j+2(4)] 
||[!A_RSTflg]MV    .D2   B_h_ptr,   B_h                   ; Set h pointer
||           MPYSP .M1X  A_h0,      B_x2,       A_prod    ; h[i] * x[i+j+2]           
||           MPYSP .M2X  A_h1,      B_x3,       B_prod    ; h[i+1] * x[i+j+3]
||           ADDSP .L1   A_sum,     A_prod,     A_sum     ; sum5 += h[i] * x[i+j+2]
||           ADDSP .L2   B_sum,     B_prod,     B_sum     ; sum6 += h[i+1] * x[i+j+3]
||[A_ictr]   B     .S2   ILOOP                            ; Branch to inner loop
||[A_ictr]   SUB   .S1   A_ictr,    2,          A_ictr    ; Update inner loop counter

             LDDW  .D2T1 *B_h++,    A_h1:A_h0             ; load h[i+1]:h[i]
||[!A_RSTflg]LDDW  .D1T2 *A_x_ptr,  B_x1:B_x0             ; load x[i+j+1]:x[i+j+0]               
||           MPYSP .M1X  A_h0,      B_x3,       A_prod    ; h[i] * x[i+j+3]
||           MPYSP .M2X  A_h1,      B_x4,       B_prod    ; h[i+1] * x[i+j+4]
||           ADDSP .L1   A_sum,     A_prod,     A_sum     ; sum7 += h[i] * x[i+j+3]
||           ADDSP .L2   B_sum,     B_prod,     B_sum     ; sum8 += h[i+1] * x[i+j+4]
||[!A_RSTflg]MV    .S1   A_x_ptr,   A_x                   ; Set x pointer

; ------------------------------------------------------------

             LDW   .D2T2 *-B_h[1],  B_h1                  ; load h[i+5]
||           MPYSP .M1   A_h0,      A_x0,       A_prod    ; h[i] * x[i+j]
||           MPYSP .M2   B_h_1,     B_x1,       B_prod    ; h[i+1] * x[i+j+1]  
||           ADDSP .L1   A_zero,    A_prod,     A_sum     ; sum1 = h[i] * x[i+j]
||           ADDSP .L2X  A_sum,     B_sum,      B_sum     ; sum2 = sum1 + sum2
||           MV    .S2   B_prod,    B_prod1               ; sum2 = h[i+1] * x[i+j+1]  
||           ADDAD .D1   A_x_ptr,   2,          A_x_ptr   ; Update x_ptr

             LDDW  .D1T2 *++A_x,    B_x31:B_x20           ; load x[i+j+3(1)]:x[i+j+2(0)]
||[B_nr]     SUB   .D2   B_nr,      4,          B_nr      ; Update outer loop counter               
||           MPYSP .M1   A_h0,      A_x1,       A_prod    ; h[i] * x[i+j+1]
||           MPYSP .M2   B_h_1,     B_x_2,      B_prod    ; h[i+1] * x[i+j+2]               
||           ADDSP .L2X  A_zero,    B_prod,     B_sum     ; sum4 = h[i+1] * x[i+j+2]
||           ADDSP .L1X  A_sum,     B_sum,      A_sum     ; sum3 = sum3 + sum4
||           MV    .S1   A_prod,    A_prod2               ; sum3 = h[i] * x[i+j+1]
||[!B_nreq2] ZERO  .S2   B_zero                           ; Zero for pseudo move

             LDW   .D1T2 *A_x[2],   B_x42                 ; load x[i+j+2(4)]
||           MPYSP .M1   A_h0,      A_x2,       A_prod    ; h[i] * x[i+j+2]                
||           MPYSP .M2   B_h_1,     B_x3,       B_prod    ; h[i+1] * x[i+j+3]
||           ADDSP .L2   B_zero,    B_prod,     B_sum     ; sum6 = h[i+1] * x[i+j+3]
||           ADDSP .L1X  A_sum,     B_sum,      A_sum     ; sum5 = sum5 + sum6
||           MV    .S1   A_prod,    A_prod3               ; sum5 = h[i] * x[i+j+2]
||[B_nr]     B     .S2   ILOOP 
||           ADD   .D2   B_MULT4,   B_nr,       B_MULT2   ; If last it.&not mult4 then 0 else 1 

             LDDW  .D2T1 *B_h++,    A_h1:A_h0             ; load h[i+1]:h[i] 
||           MPYSP .M1   A_h0,      A_x3,       A_prod    ; h[i] * x[i+j+3]
||           MPYSP .M2   B_h_1,     B_x4,       B_prod    ; h[i+1] * x[i+j+4]
||           ADDSP .L2   B_zero,    B_prod,     B_sum     ; sum8 = h[i+1] * x[i+j+4]
||           ADDSP .L1X  A_sum,     B_sum,      A_sum_4   ; sum7 = sum7 + sum8
||           MV    .D1   A_prod,    A_prod4               ; sum7 = h[i] * x[i+j+3]
||[!B_MULT2] B     .S1   MULT2 
               
; ------------------------------------------------------------

             STW   .D2T2 B_sum,     *B_r++                ; Store sum2
||           MPYSP .M1X  A_h0,      B_x0,       A_prod    ; h[i] * x[i+j]
||           MPYSP .M2X  A_h1,      B_x1,       B_prod    ; h[i+1] * x[i+j+1]   
||           ADDSP .L1   A_sum,     A_prod,     A_sum     ; sum1 += h[i] * x[i+j]
||           ADDSP .L2   B_prod1,   B_prod,     B_sum     ; sum2 += h[i+1] * x[i+j+1]
||           SUB   .S1   A_nh,      8,          A_ictr    ; Update inner loop ctr

             STW   .D2T1 A_sum,     *B_r++                ; Store sum3       
||           LDDW  .D1T2 *++A_x,    B_x31:B_x20           ; load x[i+j+3(1)]:x[i+j+2(0)]   
||           MPYSP .M1X  A_h0,      B_x1,       A_prod    ; h[i] * x[i+j+1]
||           MPYSP .M2   B_h1,      B_x_2,      B_prod    ; h[i+1] * x[i+j+2]                  
||           ADDSP .L1   A_prod2,   A_prod,     A_sum     ; sum3 += h[i] * x[i+j+1]
||           ADDSP .L2   B_sum,     B_prod,     B_sum     ; sum4 += h[i+1] * x[i+j+2]
||           SUB   .S1   A_nh,      8,          A_RSTflg  ; Update reset flag
||           MV    .S2X  A_x_ptr,   B_x                   ; Set x pointer for B side

  [!B_nreq2] STW   .D2T1 A_sum,     *B_r++                ; Store sum5
||           LDW   .D1T2 *A_x[2],   B_x42                 ; load x[i+j+2(4)]
||           MPYSP .M1X  A_h0,      B_x2,       A_prod    ; h[i] * x[i+j+2]               
||           MPYSP .M2X  A_h1,      B_x3,       B_prod    ; h[i+1] * x[i+j+3]
||           ADDSP .L1   A_prod3,   A_prod,     A_sum     ; sum5 += h[i] * x[i+j+2]
||           ADDSP .L2   B_sum,     B_prod,     B_sum     ; sum6 += h[i+1] * x[i+j+3]
||[B_nr]     B     .S1   ILOOP                            ; Branch to inner loop
||[!A_RSTflg]MV    .S2   B_h_ptr,   B_h                   ; Set h pointer

             LDDW  .D2T1 *B_h++,    A_h1:A_h0             ; load h[i+1]:h[i]
||[!A_RSTflg]LDDW  .D1T2 *A_x_ptr,  B_x1:B_x0             ; load x[i+j+1]:x[i+j+0]
||           MPYSP .M1X  A_h0,      B_x3,       A_prod    ; h[i] * x[i+j+3]
||           MPYSP .M2X  A_h1,      B_x4,       B_prod    ; h[i+1] * x[i+j+4]
||           ADDSP .L1   A_prod4,   A_prod,     A_sum     ; sum7 += h[i] * x[i+j+3]
||           ADDSP .L2   B_sum,     B_prod,     B_sum     ; sum8 += h[i+1] * x[i+j+4]   
||[!A_RSTflg]MV    .S1   A_x_ptr,   A_x                   ; Set x pointer

; -------------------------------------------------------------
  [!B_nreq2] STW   .D2T1 A_sum_4,   *B_r++                ; Store sum2
||           MPYSP .M1X  A_h0,      B_x0,       A_prod    ; h[i] * x[i+j]
||           MPYSP .M2X  A_h1,      B_x1,       B_prod    ; h[i+1] * x[i+j+1]   
||           ADDSP .L1   A_sum,     A_prod,     A_sum     ; sum1 += h[i] * x[i+j]
||           ADDSP .L2   B_sum,     B_prod,     B_sum     ; sum2 += h[i+1] * x[i+j+1] 
||[!B_MULT2] B     .S2   LOOP                             ; Jump to inner loop of MULT2         
; -------------------------------------------------------------     
          
END:              
             MVC   .S2X  A_CSR_str, CSR                   ; Enable Interrupts
||           MV    .S1X  B_SP,      A_SP                  ; Copy stach pointer
        
             LDW   .D1T1 *+A_SP[1], A_h0                  ; Load A10   
||           LDW   .D2T2 *+B_SP[6], B_x20                 ; Load B10
               
             LDW   .D1T1 *+A_SP[2], A_h1                  ; Load A11
||           LDW   .D2T2 *+B_SP[7], B_x31                 ; Load B11
                
             LDW   .D1T1 *+A_SP[3], A_x20                 ; Load A12
||           LDW   .D2T2 *+B_SP[8], B_x42                 ; Load B12

             LDW   .D1T1 *+A_SP[4], A_x31                 ; Load A13
||           LDW   .D2T2 *+B_SP[9], B_h_1                 ; Load B13
||           B     .S2   B3                               ; Branch out of the function
        
             LDW   .D2T2 *+B_SP[5], B_x                   ; Load B14
        
             ADDAW .D2   B_SP,      11,         B_SP      ; Restore stack space   
        
             NOP         3                                 
           
; -------------------------------------------------------------           
MULT2:         
  [A_ictr]   LDDW  .D1T2 *++A_x,    B_x1:B_x0             ; load x[i+j+1]:x[i+j+0]
||[A_ictr]   LDDW  .D2T1 *B_h++,    A_h1:A_h0             ; load h[i+1]:h[i]
||           MPYSP .M1X  A_h0,      B_x1,       A_prod    ; h[i] * x[i+j+1]
||           MPYSP .M2X  A_h1,      B_x_2,      B_prod    ; h[i+1] * x[i+j+2] 
||           ADDSP .L1   A_sum,     A_prod,     A_sum     ; sum3 += h[i] * x[i+j+1]
||           ADDSP .L2   B_sum,     B_prod,     B_sum     ; sum4 += h[i+1] * x[i+j+2]
||           ZERO  .S1   A_zero1                          ; Zero for pseudo move
||           ZERO  .S2   B_zero1                          ; Zero for pseudo move

  [A_ictr]   LDW   .D1T2 *A_x[2],   B_x_2                 ; load x[i+j+2]                 
||           ADDSP .L1   A_zero1,   A_zero1,    A_sum     ; Zero sum1
||           ADDSP .L2   B_zero1,   B_zero1,    B_sum     ; Zero sum2
||           MPYSP .M1   A_prod,    A_zero1,    A_prod    ; Zero prod1
||           MPYSP .M2   B_prod,    B_zero1,    B_prod    ; Zero prod2
||[A_ictr]   SUB   .S1   A_ictr,    2,          A_ictr    ; Update counter
||[A_ictr]   B     .S2   LOOP                             ; Branch to loop
               
  [A_ictr]   LDDW  .D1T2 *++A_x,    B_x1:B_x0             ; load x[i+j+1]:x[i+j+0]   
||           LDDW  .D2T1 *B_h++,    A_h1:A_h0             ; load h[i+1]:h[i]
||           ADDSP .L1   A_zero1,   A_zero1,    A_sum     ; Zero sum3
||           ADDSP .L2   B_zero1,   B_zero1,    B_sum     ; Zero sum4
||           MPYSP .M1   A_prod,    A_zero1,    A_prod    ; Zero prod3
||           MPYSP .M2   B_prod,    B_zero1,    B_prod    ; Zero prod4
 
; --------------------------------------------------------------


LOOP:
  [A_ictr]   LDW   .D1T2 *A_x[2],   B_x_2                 ; load x[i+j+2]
||           MPYSP .M1X  A_h0,      B_x0,       A_prod    ; h[i] * x[i+j]
||           MPYSP .M2X  A_h1,      B_x1,       B_prod    ; h[i+1] * x[i+j+1]   
||           ADDSP .L1   A_sum,     A_prod,     A_sum     ; sum1 += h[i] * x[i+j]
||           ADDSP .L2   B_sum,     B_prod,     B_sum     ; sum2 += h[i+1] * x[i+j+1] 
||[A_ictr]   SUB   .S1   A_ictr,    2,          A_ictr    ; Update counter
||[A_ictr]   B     .S2   LOOP                             ; Branch to loop

  [A_ictr]   LDDW  .D1T2 *++A_x,    B_x1:B_x0             ; load x[i+j+1]:x[i+j+0]   
||[A_ictr]   LDDW  .D2T1 *B_h++,    A_h1:A_h0             ; load h[i+1]:h[i]
||           MPYSP .M1X  A_h0,      B_x1,       A_prod    ; h[i] * x[i+j+1]
||           MPYSP .M2X  A_h1,      B_x_2,      B_prod    ; h[i+1] * x[i+j+2]  
||           ADDSP .L1   A_sum,     A_prod,     A_sum     ; sum3 += h[i] * x[i+j+1]
||           ADDSP .L2   B_sum,     B_prod,     B_sum     ; sum4 += h[i+1] * x[i+j+2]

             ADDSP .L1X  A_sum,     B_sum,      A_sum     ; sum1 = sum1 + sum3
                
             ADDSP .L2X  A_sum,     B_sum,      B_sum     ; sum3 = sum3 + sum4
                
             ADDSP .L1X  A_sum,     B_sum,      A_sum_t   ; sum1'= sum1 + sum2
               
             ADDSP .L2X  A_sum,     B_sum,      B_sum_t   ; sum3'= sum3 + sum4
               
             NOP         2
               
             ADDSP .L1   A_sum,     A_sum_t,    A_sum     ; sum1 = sum1 + sum1'
||           B     .S2   END                              ; branch to end

             ADDSP .L2   B_sum,     B_sum_t,    B_sum     ; sum3 = sum3 + sum3'
               
             NOP         2
               
             STW   .D2T1 A_sum,     *B_r++                ; Store sum1
                
             STW   .D2T2 B_sum,     *B_r++                ; Store sum3
; -----------------------------------------------------------------------------


                .end

* ======================================================================= *
*  End of file:  DSPF_sp_fir_r2.asm                                       *
* ----------------------------------------------------------------------- *
*            Copyright (c) 2009 Texas Instruments, Incorporated.          *
*                           All Rights Reserved.                          *
* ======================================================================= *