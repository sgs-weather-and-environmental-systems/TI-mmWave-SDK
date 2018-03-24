* ======================================================================= *
* DSPF_sp_fir_cplx.asm -- Complex FIR Filter                              *
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


* ======================================================================== *
* ======================================================================== *

        .sect ".text:optimized"
        .if __TI_EABI__
        .asg  DSPF_sp_fir_cplx, _DSPF_sp_fir_cplx
        .endif		
		
        .global _DSPF_sp_fir_cplx
_DSPF_sp_fir_cplx:

* ======================================================================== *
* ======================================================================== *

        .asg    B15,       B_SP
        .asg    A0,        A_SP
        .asg    A4,        A_x
        .asg    B4,        B_h
        .asg    A8,        A_h_ptr
        .asg    A5,        A_x_ptr
        .asg    B5,        B_h_ptr
        .asg    A6,        A_r
        .asg    B8,        B_r
        .asg    A8,        A_nr
        .asg    A1,        A_nr1
        .asg    B6,        B_nh
        .asg    B0,        B_ictr
        .asg    A11,       A_x1
        .asg    A10,       A_x0
        .asg    B11,       B_h1
        .asg    B10,       B_h0
        .asg    A13,       A_x3
        .asg    A12,       A_x2
        .asg    A14,       A_h1
        .asg    B13,       B_x3
        .asg    B12,       B_x2
        .asg    A9,        A_prod2
        .asg    B9,        B_prod1
        .asg    B7,        B_real
        .asg    A7,        A_real1
        .asg    B7,        B_imag
        .asg    A7,        A_imag1
        .asg    B7,        B_real2
        .asg    A7,        A_real3
        .asg    B7,        B_imag2
        .asg    A7,        A_imag3
        .asg    A3,        A_zero
        .asg    B12,       B_zero
        .asg    B0,        B_real_t
        .asg    B1,        B_imag_t
        .asg    A0,        A_real3_t
        .asg    A3,        A_imag3_t
        .asg    B1,        B_rstflg
        .asg    A2,        A_ldflg
        .asg    B3,        B_RET
        .asg    B2,        B_CSR_store
        .asg    B1,        B_CSR_tmp
        
        
              SUBAW .D2   B_SP,          20, B_SP           ; Save stack space  
||            MVC   .S2   CSR,           B_CSR_store        ; Get CSR

              MV    .L1X  B_SP,          A_SP               ; Copy stack pointer
||            STW   .D2T1 A_x0,          *+B_SP[1]          ; Save a10
||            MV    .S1   A_x,           A_x_ptr            ; Copy x pointer
||            MV    .S2   B_h,           B_h_ptr            ; Copy h pointer
||            MV    .L2X  A_r,           B_r                ; Copy r pointer

              STW   .D2T1 A_x1,          *+B_SP[2]          ; Save a11
||            STW   .D1T2 B_h0,          *+A_SP[6]          ; Save b10
||            ADD   .S1   A_r,           8,        A_r            ; r = r+8
||            MV    .L1   A_nr,          A_nr1              ; Copy nr
||            AND   .S2   B_CSR_store,   -2,       B_CSR_tmp; Disable GIE bit

              STW   .D2T1 A_x2,          *+B_SP[3]          ; Save a12
||            STW   .D1T2 B_h1,          *+A_SP[7]          ; Save b11
||            MV    .S1X  B_h,           A_h_ptr            ; Copy h pointer

              STW   .D2T1 A_x3,          *+B_SP[4]          ; Save a13
||            STW   .D1T2 B_x2,          *+A_SP[8]          ; Save b12 

              STW   .D2T1 A_h1,          *+B_SP[5]          ; Save a14
||            STW   .D1T2 B_x3,          *+A_SP[9]          ; Save b13
||            MVC   .S2   B_CSR_tmp,     CSR                ; Disable Interrupt

; -----------------------------------------------------------
; ********************** LOOP PROLOG ************************
; -----------------------------------------------------------
              LDDW  .D1T1 *A_x_ptr++,    A_x1:A_x0          ; load x[i-j+1]:x[i-j]
        
              LDDW  .D2T2 *B_h_ptr++,    B_h1:B_h0          ; load h[j+1]:h[j]

              LDDW  .D1T1 *A_x_ptr--[2], A_x3:A_x2          ; load x[i-j+3]:x[i-j+2]
        
              NOP

              LDDW  .D1T1 *A_x_ptr++,    A_x1:A_x0          ; load x[i-j+1]:x[i-j]

              LDDW  .D2T2 *B_h_ptr++,    B_h1:B_h0          ; load h[j+1]:h[j]

              LDDW  .D1T1 *A_x_ptr--[2], A_x3:A_x2          ; load x[i-j+3]:x[i-j+2]
||            MPYSP .M2X  B_h0,          A_x0,     B_prod1  ; h[j] * x[i-j]
||            MPYSP .M1X  B_h1,          A_x1,     A_prod2  ; h[j+1] * x[i+1-j]
        
              MPYSP .M2X  B_h0,          A_x1,     B_prod1  ; h[j] * x[i+1-j]
||            MPYSP .M1X  B_h1,          A_x0,     A_prod2  ; h[j+1] * x[i-j]


              LDDW  .D1T1 *A_x_ptr++,    A_x1:A_x0          ; load x[i-j+1]:x[i-j]
||            MPYSP .M2X  B_h0,          A_x2,     B_prod1  ; h[j] * x[i-j+2]
||            MPYSP .M1X  B_h1,          A_x3,     A_prod2  ; h[j+1] * x[i+1-j+2] 
||            B     .S1   LOOP                              ; Branch to loop 
||            ZERO  .S2   B_real                            ; Initialise Accumulator
||[A_nr1]     SUB   .L1   A_nr1,         2,        A_nr1    ; Update Outer loop ctr

              LDDW  .D2T2 *B_h_ptr++,    B_h1:B_h0          ; load h[j+1]:h[j]
||            MPYSP .M2X  B_h0,          A_x3,     B_prod1  ; h[j] * x[i+1-j+2]
||            MPYSP .M1X  B_h1,          A_x2,     A_prod2  ; h[j+1] * x[i-j+2]
||            SUB   .S2   B_nh,          2,        B_ictr   ; Inner loop counter
||            SUB   .L2   B_nh,          2,        B_rstflg ; Flag for reseting ptrs
||            ZERO  .S1   A_real1                           ; Initialise Accumulator
||[A_nr1]     ADDAD .D1   A_x,           2, A_x             ; x += 2

; ----------------------------------------------------------
; ****************** LOOP KERNEL ***************************
; ----------------------------------------------------------

LOOP:
              LDDW  .D1T1 *A_x_ptr--[2], A_x3:A_x2          ; load x[i-j+3]:x[i-j+2]
||            MPYSP .M2X  B_h0,          A_x0,     B_prod1  ; h[j] * x[i-j]
||            MPYSP .M1X  B_h1,          A_x1,     A_prod2  ; h[j+1] * x[i+1-j]
||            ADDSP .L2   B_real,        B_prod1,  B_real   ; real += (h[j] * x[i-j])
||            ADDSP .L1   A_real1,       A_prod2,  A_real1  ; real1+= (h[j+1] * x[i+1-j])
||[B_rstflg]  SUB   .S2   B_rstflg,      1,        B_rstflg ; Update flag

  [!B_rstflg] LDDW  .D1T2 *-A_x[1],      B_x3:B_x2          ; load x[i-j+1]:x[i-j](duplicate)
||            MPYSP .M2X  B_h0, A_x1,    B_prod1            ; h[j] * x[i+1-j]
||            MPYSP .M1X  B_h1, A_x0,    A_prod2            ; h[j+1] * x[i-j]
||            ADDSP .L2   B_imag,        B_prod1,  B_imag   ; imag += (h[j] * x[i+1-j])
||            ADDSP .L1   A_imag1,       A_prod2,  A_imag1  ; imag1+= (h[j+1] * x[i-j])
||[!B_rstflg] MV    .S2   B_h,           B_h_ptr            ; reset h_ptr
||[!B_rstflg] MV    .S1   A_x,           A_x_ptr            ; reset x_ptr

              LDDW  .D1T1 *A_x_ptr++,    A_x1:A_x0          ; load x[i-j+1]:x[i-j]
||            MPYSP .M2X  B_h0, A_x2,    B_prod1            ; h[j] * x[i-j+2]
||            MPYSP .M1X  B_h1, A_x3,    A_prod2            ; h[j+1] * x[i+1-j+2]
||            ADDSP .L2   B_real2,       B_prod1,  B_real2  ; real2 += (h[j] * x[i-j+2])
||            ADDSP .L1   A_real3,       A_prod2,  A_real3  ; real3 += (h[j+1] * x[i+1-j+2])
||[B_ictr]    SUB   .S2   B_ictr,        1,        B_ictr   ; Update inner loop ctr
||[B_ictr]    B     .S1   LOOP                              ; Branch to inner loop

              LDDW  .D2T2 *B_h_ptr++,    B_h1:B_h0          ; load h[j+1]:h[j]
||[!B_rstflg] LDW   .D1T1 *+A_h_ptr[3],  A_h1               ; h[j+1] forremoving cross path        
||            MPYSP .M2X  B_h0, A_x3,    B_prod1            ; h[j] * x[i+1-j+2]
||            MPYSP .M1X  B_h1, A_x2,    A_prod2            ; h[j+1] * x[i-j+2]
||            ADDSP .L2   B_imag2,       B_prod1,  B_imag2  ; imag2 += (h[j] * x[i+1-j+2])
||            ADDSP .L1   A_imag3,       A_prod2,  A_imag3  ; imag3 += (h[j+1] * x[i-j+2])
||[!B_rstflg] MVK   .S2   3,             B_rstflg           ; For not resetting more than once
||            ZERO  .S1   A_zero                            ; for init. acc. for next iteration

; LOOP ENDS HERE 
; -----------------------------------------------------------
;************** PIPED LOOP EPILOG ****************
; -----------------------------------------------------------

              LDDW  .D1T1 *A_x_ptr--[2], A_x3:A_x2          ; load x[i-j+3]:x[i-j+2]     
||            MPYSP .M2   B_h0,          B_x2,     B_prod1  ; h[j] * x[i-j]
||            MPYSP .M1X  A_h1,          B_x3,     A_prod2  ; h[j+1] * x[i+1-j]
||            SUBSP .L2X  B_real,        A_real1,  B_real   ; real = real - real1        
||            ADDSP .L1   A_prod2,       A_zero,   A_real1  ; real1 = (h[j+1] * x[i+1-j])
||            MV    .D2   B_prod1,       B_real_t           ; real  = (h[j] * x[i-j])

              MPYSP .M2   B_h0,          B_x3,     B_prod1  ; h[j] * x[i+1-j]       
||            MPYSP .M1X  A_h1,          B_x2,     A_prod2  ; h[j+1] * x[i-j]
||            ADDSP .L2X  B_imag,        A_imag1,  B_imag   ; imag = imag + imag1
||            ADDSP .L1   A_prod2,       A_zero,   A_imag1  ; imag1 = (h[j+1] * x[i-j])
||            MV    .D2   B_prod1,       B_imag_t           ; imag  = (h[j] * x[i+1-j])
||            ZERO  .S2   B_zero                            ; for init. acc. for next iteration

              LDDW  .D1T1 *A_x_ptr++,    A_x1:A_x0          ; load x[i-j+1]:x[i-j]
||            MPYSP .M2X  B_h0, A_x2,    B_prod1            ; h[j] * x[i-j+2]
||            MPYSP .M1   A_h1, A_x3,    A_prod2            ; h[j+1] * x[i+1-j+2]
||            SUBSP .L1X  B_real2,       A_real3,  A_real3  ; real2 = real2 - real3
||            ADDSP .L2   B_prod1,       B_zero,   B_real2  ; real2 = (h[j] * x[i-j+2])
||            MV    .S1   A_prod2,       A_real3_t          ; real3 = (h[j+1] * x[i+1-j+2])
||[A_nr1]     B     .S2   LOOP                              ; Branch to inner loop

              LDDW  .D2T2 *B_h_ptr++,    B_h1:B_h0          ; load h[j+1]:h[j]
||            MPYSP .M2X  B_h0, A_x3,    B_prod1            ; h[j] * x[i+1-j+2]
||            MPYSP .M1   A_h1, A_x2,    A_prod2            ; h[j+1] * x[i-j+2]
||            ADDSP .L1X  A_imag3,       B_imag2,  A_imag3  ; imag2 = imag2 + imag3
||            ADDSP .L2   B_prod1,       B_zero,   B_imag2  ; imag2 = (h[j] * x[i+1-j+2])
||            MV    .D1   A_prod2,       A_imag3_t          ; imag3 = (h[j+1] * x[i-j+2])
        
; ------------------------------------------- 

              LDDW  .D1T1 *A_x_ptr--[2], A_x3:A_x2          ; load x[i-j+3]:x[i-j+2] 
||            STW   .D2T2 B_real,        *B_r++             ; Store real
||            MPYSP .M2X  B_h0, A_x0,    B_prod1            ; h[j] * x[i-j]
||            MPYSP .M1X  B_h1, A_x1,    A_prod2            ; h[j+1] * x[i+1-j]
||            ADDSP .L2   B_real_t,      B_prod1,  B_real   ; real += (h[j] * x[i-j])
||            ADDSP .L1   A_real1,       A_prod2,  A_real1  ; real1+= (h[j+1] * x[i+1-j])
||[A_nr1]     SUB   .S1   A_nr1,         2,        A_ldflg  ; Flag for speculative loads

        
              LDDW  .D1T1 *A_x_ptr++,    A_x1:A_x0          ;load x[i-j+1]:x[i-j]
||            STW   .D2T2 B_imag,        *B_r++[3]          ; Store real2
||            MPYSP .M2X  B_h0,          A_x1,     B_prod1  ; h[j] * x[i+1-j]   
||            MPYSP .M1X  B_h1,          A_x0,     A_prod2  ; h[j+1] * x[i-j]
||            ADDSP .L2   B_imag_t,      B_prod1,  B_imag   ; imag += (h[j] * x[i+1-j])
||            ADDSP .L1   A_imag1,       A_prod2,  A_imag1  ; imag1+= (h[j+1] * x[i-j])
||            SUB   .S2   B_nh,          4,        B_rstflg ; Flag for reseting pointers
||[A_ldflg]   ADD   .S1   A_x,           8,        A_x      ; x += 1

              STW   .D1T1 A_real3,       *A_r++             ; Store imag
||            MPYSP .M2X  B_h0,          A_x2,     B_prod1  ; h[j] * x[i-j+2]
||            MPYSP .M1X  B_h1,          A_x3,     A_prod2  ; h[j+1] * x[i+1-j+2]
||            ADDSP .L2   B_real2,       B_prod1,  B_real2  ; real2 += (h[j] * x[i-j+2])
||            ADDSP .L1   A_real3_t,     A_prod2,  A_real3  ; real3 += (h[j+1] * x[i+1-j+2])        
||[A_ldflg]   ADD   .S1   A_x,           8, A_x             ; x += 1
||[A_nr1]     B     .S2   LOOP                              ; Branch to inner loop
        
              LDDW  .D2   *B_h_ptr++,    B_h1:B_h0          ; load h[j+1]:h[j]
||            STW   .D1T1 A_imag3,       *A_r++[3]          ; Store imag2
||            MPYSP .M2X  B_h0,          A_x3,     B_prod1  ; h[j] * x[i+1-j+2]
||            MPYSP .M1X  B_h1,          A_x2,     A_prod2  ; h[j+1] * x[i-j+2]
||            ADDSP .L2   B_imag2,       B_prod1,  B_imag2  ; imag2 += (h[j] * x[i+1-j+2])
||            ADDSP .L1   A_imag3_t,     A_prod2,  A_imag3  ; imag3 += (h[j+1] * x[i-j+2])
||            SUB   .S2   B_nh,          4,        B_ictr   ; Inner loop ctr
||[A_nr1]     SUB   .S1   A_nr1,         2,        A_nr1    ; Update Outer loop ctr

;--------------------------------------------------------    

              LDW   .D2T1 *+B_SP[1],     A_x0               ; Restore a10
||            MV    .S1X  B_SP,          A_SP               ; Copy stack pointer
||            MVC   .S2   B_CSR_store,   CSR                ; Enable Interrupts

              LDW   .D2T1 *+B_SP[2],     A_x1               ; Restore a11    
||            LDW   .D1T2 *+A_SP[6],     B_h0               ; Restore b10   

              LDW   .D2T1 *+B_SP[3],     A_x2               ; Restore a12    
||            LDW   .D1T2 *+A_SP[7],     B_h1               ; Restore b11            

              LDW   .D2T1 *+B_SP[4],     A_x3               ; Restore a13
||            LDW   .D1T2 *+A_SP[8],     B_x2               ; Restore b12            
||            B     .S2   B_RET                             ; Branch to the caller

              LDW   .D2T1 *+B_SP[5],     A_h1               ; Restore a14   
||            LDW   .D1T2 *+A_SP[9],     B_x3               ; Restore b13        


              ADDAW .D2  B_SP,           20,       B_SP     ; Restore stack
        
              NOP   3                

                .end

* ======================================================================= *
*  End of file:  DSPF_sp_fir_cplx.asm                                     *
* ----------------------------------------------------------------------- *
*            Copyright (c) 2011 Texas Instruments, Incorporated.          *
*                           All Rights Reserved.                          *
* ======================================================================= *