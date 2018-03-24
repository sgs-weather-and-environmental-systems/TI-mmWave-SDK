* ======================================================================= *
* DSPF_sp_iir.asm -- IIR Filter                                           *
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

* ================= SYMBOLIC REGISTER ASSIGNMENTS ========================= *

                .asg B2, B_cntr
                .asg A3, A_xptr
                .asg A8, A_h24
                .asg A6, A_xi
                .asg A9, A_p1
                .asg B8, B_h23
                .asg B6, B_xip1
                .asg B9, B_p2
                .asg A12, A_xip5
                .asg B13, B_k4
                .asg A7, A_h22
                .asg B7, B_h21
                .asg A5, A_xip2
                .asg A9, A_p3
                .asg B13, B_xip4
                .asg B9, B_p4
                .asg A15, A_k0
                .asg A9, A_p11
                .asg A15, A_k1
                .asg B9, B_p21
                .asg A11, A_h20
                .asg B10, B_xip4
                .asg A10, A_p5
                .asg A1, A_k2
                .asg A9, A_p31
                .asg B5, B_xip3
                .asg B13, B_xip3t
                .asg B9, B_p51
                .asg A9, A_p61
                .asg B9, B_p41
                .asg A14, A_s2
                .asg A14, A_s1
                .asg A14, A_h14
                .asg A4, A_yi
                .asg A9, A_p9
                .asg B9, B_p8
                .asg B11, B_yip1
                .asg A14, A_k7
                .asg A15, A_k8
                .asg A9, A_p101
                .asg A9, A_p7
                .asg B9, B_p81
                .asg B13, B_p6
                .asg B12, B_k3
                .asg A14, A_s3
                .asg A15, A_s5
                .asg A10, A_s31
                .asg A10, A_k5
                .asg B9, B_p91
                .asg B13, B_s4
                .asg B9, B_p41
                .asg A10, A_s11
                .asg B4, B_yip3
                .asg B13, B_s51
                .asg B4, B_s91
                .asg B10, B_p71
                .asg A2, A_p71
                .asg A2, A_yip4
                .asg B10, B_k6
                .asg B15, B_SP
                .asg A0, A_h12                
                .asg B1, B_h11
                .asg B12, B_s81
                .asg B13, B_s21
                .asg B13, B_s41
                .asg B13, B_s6
                .asg B3, B_h13
                .asg A14, A_xip4
                .asg A2, A_s2temp
                .asg B11, B_k1
                .asg B10, B_s71
                .asg B0, B_r1ptr
                .asg A13, A_r2ptr
                
* =================================================================== *                
                
        .sect ".text:optimized"
        .if __TI_EABI__
        .asg  DSPF_sp_iir, _DSPF_sp_iir
        .endif					
		
        .global _DSPF_sp_iir
_DSPF_sp_iir:

       SUBAW  .D2     B_SP,        22,       B_SP     ; make stk space  
||     MV     .S2     B8,         B_cntr              ; loop counter
||     MV     .S1X    B4,         A_xptr              ; a3 has x_ptr
||     MV     .L2     A4,         B0                  ; b0 has r1_ptr

          
       LDDW   .D2T2   *B6++,      B5:B4               ; h2[1]:h2[0]
||     LDDW   .D1T1   *A8++,      A5:A4               ; h1[1]:(h1[0]->not reqd)
||     B      .S1     no_int
||     MVC    .S2     CSR,        B7
          
       LDDW   .D2T2   *B6++,      B13:B12             ; h2[3]:h2[2]
||     LDDW   .D1T1   *A8++,      A13:A12             ; h1[3]:h1[2]
||     AND    .L2     B7,         -2,       B9
          
       LDW    .D2T2   *B6++,      B11                 ; h2[4]
||     LDW    .D1T1   *A8++,      A11                 ; h1[4]
||     MV     .S1X    B_SP,        A1
||     MVC    .S2     B9,         CSR
          
       STW    .D2T2   B12,        *B_SP[10]           ; push b12
||     STW    .D1T1   A12,        *A1[12]             ; push a12
       
       STW    .D2T2   B13,        *B_SP[11]           ; push b13
||     STW    .D1T1   A13,        *A1[13]             ; push a13

no_int:
            
       MPYSP  .M1X    A5,         B5,       A8        ; h1[1]*h2[1]
||     MPYSP  .M2X    A5,         B4,       B8        ; h1[1]*h2[0]
||     STW    .D2T2   B11,        *B_SP[15]
||     STW    .D1T1   A11,        *A1[17]
          
       MPYSP  .M1X    A5,         B13,      A8        ; h1[1]*h2[3]
||     MPYSP  .M2X    A5,         B12,      B8        ; h1[1]*h2[2]
||     STW    .D2T2   B10,        *B_SP[14]
||     STW    .D1T1   A10,        *A1[16]
          
       MPYSP  .M2X    A5,         B11,      B10       ; h1[1]*h2[4]
||     MPYSP  .M1     A5,         A5,       A10       ; h1[1]*h1[1]
||     STW    .D2T1   A11,        *B_SP[7]             ; save h1[4]
||     STW    .D1T2   B14,        *A1[22]             ; push B14
          
       MPYSP  .M2X    A5,         B11,      B10       ; h1[1]*h2[4]
||     MPYSP  .M1     A5,         A5,       A10       ; h1[1]*h1[1]
||     STW    .D1T1   A14,        *A1[18]
||     STW    .D2T2   B3,         *B_SP[20]
          
       SUBSP  .L1X    B12,        A8,       A14       ; h2[2] - h1[1]*h2[1]
||     SUBSP  .L2     B5,         B8,       B14       ; h2[1] - h1[1]*h2[0]
||     MPYSP  .M1     A5,         A11,      A8        ; h1[1]*h1[4], k8
||     STW    .D1T1   A15,        *A1[19]
||     STW    .D2T2   B7,         *B_SP[21]

          
       SUBSP  .L2     B13,        B8,       B14       ; h2[3] - h1[1]*h2[2], k2
||     SUBSP  .L1X    B11,        A8,       A14       ; h2[4] - h1[1]*h2[3], k1
            
       MPYSP  .M1     A5,         A12,      A10       ; h1[1]*h1[2]
          
       STW    .D2T2   B10,        *B_SP[0]            ; SP(0)=h1[1]*h2[4], k0
||     SUBSP  .L1     A10,        A12,      A14       ; h1[1]*h1[1]-h1[2]
||     MPYSP  .M1     A5,         A13,      A10       ; h1[1]*h1[3]
          
       STW    .D2T1   A14,        *B_SP[3]            ; k3
||     STW    .D1T2   B14,        *A1[4]              ; k4
          
       STW    .D2T1   A8,         *B_SP[9]            ; k8
||     MV     .S1X    B14,        A1                  ; k2
           
       STW    .D2T1   A14,        *B_SP[1]            ; k1            
||     SUBSP  .L1     A10,        A13,      A14       ; k6=h1[1]*h1[2]-h1[3]
          
       SUBSP  .L1     A10,        A11,      A_k7      ; k7
||     STW    .D2T1   A14,        *B_SP[5]            ; k5
            
       MV     .S1X    B11,        A_h24               ; h2[4]
||     MV     .D2     B13,        B_h23               ; h2[3]          
          
       MV     .S1X    B12,        A_h22               ; h2[2]
||     MV     .S2     B5,         B_h21               ; h2[1]
||     MV     .L2X    A13,        B_h13               ; h1[3]
||     LDDW   .D2T2   *B_r1ptr++,      B11:B10        ; r1[1]:r1[0]
||     LDDW   .D1T1   *A_xptr++,      A5:A4           ; x[1]:x[0]
          
       STW    .D2T1   A14,        *B_SP[6]            ; k6
||     MV     .S1X    B4,         A_h20               ; h2[0]
||     MV     .S2X    A5,         B_h11               ; h1[1]          
||     LDDW   .D1T2   *A_xptr++,      B13:B12         ; x[3]:x[2]
          
       LDDW   .D2T1   *B_SP,       A15:A14            ; k1:k0  
||     LDW    .D1T2   *A_xptr++,      B_xip4          ; x[4]
||     MV     .S1     A12,        A_h12               ; h1[2]
||     MV     .L1X    B_SP,        A10                 
           
       LDW    .D2T2   *B_SP[3],    B12                ; k3
||     MV     .S1     A6,         A_r2ptr             ; a13 has r2_ptr
||     STW    .D1T1   A_k7,        *A10[8]            ; k7          
            
       LDDW   .D2T1   *B_r1ptr++,      A15:A14        ; r1[3]:r1[2]
          
* ===================== PIPED LOOP PROLOG ============================= *          
            
       MPYSP  .M1     A_h24,      A4,       A_p1        ; p1=h2[4]*x[i]
||     MPYSP  .M2X    B_h23,      A5,       B_p2        ; p2=h2[3]*x[i+1]
||     LDW    .D1T1   *A_xptr++[2],         A_xip5      ; x[i+5]          
||     LDW    .D2T2   *B_SP[4],   B_k4                  ; k4
||     MV     .S1X    B10,        A_yi                  ; transfer y[i]
||     MV     .L1     A4,         A_xi                  ; transfer x[i]
          
            
       MPYSP  .M1X    A_h22,      B12,      A_p3        ; p3=h2[2]*x[i+2]
||     MPYSP  .M2     B_h21,      B_xip3t,  B_p4        ; p4=h2[1]*x[i+3]
||     MV     .S2X    A5,         B_xip1                ; transfer x[i+1]
||     MV     .D2     B_xip3t,    B_xip3                ; transfer x[i+3]
          
            
       MPYSP  .M1     A14,        A_xi,     A_p11       ; p11=k0*xi
||     MPYSP  .M2X    A15,        B_xip1,   B_p21       ; p21=k1*x[i+1]
||     MV     .S1X    B12,        A_xip2                ; transfer x[i+2]
          
            
       MPYSP  .M1X    A_h20,      B_xip4,   A_p5        ; p5=h2[0]*x[i+4]
||     MV     .D1     A_xip2,     A_xi                  ; x[i]=x[i+2]
            
            
       MPYSP  .M1     A_xip2,     A_k2,     A_p31       ; p31=x[i+2]*k2
||     MPYSP  .M2     B_xip3,     B_k3,     B_p41       ; p41=x[i+3]*k3
||     ADDSP  .L1X    A_p1,       B_p2,     A_s1        ; s1=p1+p2
||     MV     .S1     A14,        A_yip4                ; transfer y[i+2]
||     MV     .S2X    A15,        B4                    ; transfer y[i+3]
||     MV     .D2     B_xip3,     B_xip1                ; x[i+1]=x[i+3]
          
            
       MPYSP  .M2     B_xip4,     B_k4,     B_p51       ; p51=k4*x[i+4]
||     MPYSP  .M1     A_h20,      A_xip5,   A_p61       ; p61=h2[0]*x[i+5]
||     ADDSP  .L1X    A_p3,       B_p4,     A_s2        ; s2=p3+p4
||     LDW    .D2T1   *B_SP[7],   A_h14                 ; load h1[4]
          
            
       SUBSP  .L1X    B_p21,      A_p11,    A_s11       ; s11=-p11+p21
||     LDDW   .D2T1   *B_SP[4],   A_k8:A_k7             ; k8:k7
          
            
       MV     .S1X    B_xip4,     A_xip2                ; x[i+2]=x[i+4]
            
            
       ADDSP  .L2X    A_p31,      B_p41,    B_s21       ; s21=p31+p41
||     ADDSP  .L1     A_s1,       A_p5,     A_s3        ; s3=s1+p5
||     LDW    .D2T2   *B_SP[1],   B_k1                  ; load k1
          
          
       LDW    .D2T1   *B_SP[0],    A_k0                 ; load k0
||     MV     .S1     A_s2,        A12                 
||     MV     .S2X    A_xip5,      B_xip3               ; x[i+3]=x[i+5]
          

       MPYSP  .M1     A_h14,        A_yi,   A_p9        ; p9=h1[4]*y[i]
||     MPYSP  .M2     B_h13,        B_yip1, B_p8        ; p8=h1[3]*y[i+1]
||     ADDSP  .L1X    B_p51,        A_p61,  A_s31       ; s31=p51+p61
||     LDW    .D1T1   *-A_xptr[1],  A_xip4              ; load x[i+4]
          

       MPYSP  .M1     A_yi,         A_k8,   A_p101      ; p101=k8*y[i]
||     MPYSP  .M2     B_yip1,       A_k7,   B_p91       ; p91=k7*y[i+1]
||     LDW    .D2T2   *B_SP[3],     B_k3                ; load k3
          

       MPYSP  .M1     A_h24,        A_xi,   A_p1        ; p1=h2[4]*x[i]
||     MPYSP  .M2     B_h23,        B_xip1, B_p2        ; p2=h2[3]*x[i+1]
||     LDW    .D1T1   *A_xptr++[2], A_xip5              ; x[i+5]          
||     LDW    .D2T2   *B_SP[4],     B_k4                ; load k4
||     ADDSP  .L1     A_s3,         A12,    A_s5        ; s5=s3+s2
||     ADDSP  .L2X    A_s11,        B_s21,  B_s51       ; s51=s11+s21
            
       MPYSP  .M1     A_h22,        A_xip2, A_p3        ; p3=h2[2]*x[i+2]
||     MPYSP  .M2     B_h21,        B_xip3, B_p4        ; p4=h2[1]*x[i+3]
            
       MPYSP  .M1     A_k0,         A_xi,   A_p11       ; p11=k0*xi
||     MPYSP  .M2     B_k1,         B_xip1, B_p21       ; p21=k1*x[i+1]
||     ADDSP  .L2X    A_p9,         B_p8,   B_s4        ; s4=p8+p9
||     LDW    .D2T2   *B_SP[6],     B_k6                ; load k6
            
       MPYSP  .M1     A_h20,        A_xip4, A_p5        ; p5=h2[0]*x[i+4]
||     MV     .D1     A_xip2,       A_xi                ; x[i]=x[i+2]
||     ADDSP  .L2X    A_p101,       B_p91,  B_s41       ; load s41=p91+p101
            
       MPYSP  .M1     A_xip2,       A_k2,   A_p31       ; p31=x[i+2]*k2
||     MPYSP  .M2     B_xip3,       B_k3,   B_p41       ; p41=x[i+3]*k3
||     ADDSP  .L1X    A_p1,         B_p2,   A_s1        ; s1=p1+p2
||     ADDSP  .L2X    B_s51,        A_s31,  B_s71       ; s71=s31+s51
||     LDW    .D2T1   *B_SP[5],     A_k5                ; load k5
||     MV     .S1     A_xip4,       A_xip2                  
||     MV     .S2     B_xip3,       B_xip1              ; x[i+1]=x[i+3]
          
       MPYSP  .M2X    A_xip4,       B_k4,   B_p51       ; p51=k4*x[i+4]
||     MPYSP  .M1     A_h20,        A_xip5, A_p61       ; p61=h2[0]*x[i+5]
||     ADDSP  .L1X    A_p3,         B_p4,   A_s2        ; s2=p3+p4
||     LDW    .D2T1   *B_SP[7],     A_h14               ; load h1[4]
          
       SUBSP  .L1X    B_p21,        A_p11,  A_s11       ; s11=-p11+p21
||     LDDW   .D2T1   *B_SP[4],     A_k8:A_k7           ; k8:k7
||     SUBSP  .L2X    A_s5,         B_s4,   B_s6        ; s6=s5-s4

       MPYSP  .M1     A_yip4,       A_h12,  A_p7        ; p7=y[i+2]*h1[2]
||     MPYSP  .M2X    A_yip4,       B_k6,   B_p81       ; p81=y[i+2]*k6
||     MV     .S1     A_yip4,       A_yi                ; y[i]=y[i+2]
            
       ADDSP  .L2X    A_p31,        B_p41,  B_s21       ; s21=p31+p41
||     ADDSP  .L1     A_s1,         A_p5,   A_s3        ; s3=s1+p5
||     LDW    .D2T2   *B_SP[1],     B_k1                ; load k1
          
       LDW    .D2     *B_SP[0],     A_k0                ; load k0
||     MV     .S1     A_s2,         A_s2temp                  
||     MPYSP  .M2     B_yip3,       B_h11,  B_p6        ; p6=y[i+3]*h1[1]
||     MPYSP  .M1X    B_yip3,       A_k5,   A_p71       ; p71=y[i+3]*k5
||     ADDSP  .L2     B_s71,        B_s41,  B_s81       ; s81=s41+s71
||     MV     .S2     B_yip3,       B_yip1              ; y[i+1]=y[i+3]
          
       MPYSP  .M1     A_h14,        A_yi,   A_p9        ; p9=h1[4]*y[i]
||     MPYSP  .M2     B_h13,        B_yip1, B_p8        ; p8=h1[3]*y[i+1]
||     ADDSP  .L1X    B_p51,        A_p61,  A_s31       ; s31=p51+p61
||     LDW    .D1T1   *-A_xptr[1],  A_xip4              ; load x[i+4]
||     MV     .S2X    A_xip5,       B_xip3              ; x[i+3]=x[i+5]

* ================= PIPED LOOP KERNEL ================================== *          
loop:          
            
       MPYSP  .M1     A_yi,         A_k8,   A_p101      ; p101=k8*y[i]
||     MPYSP  .M2     B_yip1,       A_k7,   B_p91       ; p91=k7*y[i+1]
||     LDW    .D2T2   *B_SP[3],     B12                 ; load k3
||     SUBSP  .L1X    B_s6,         A_p7,   A15         ; s7=s6-p7
          
       MPYSP  .M1     A_h24,        A_xi,   A_p1        ; p1=h2[4]*x[i]
||     MPYSP  .M2     B_h23,        B_xip1, B_p2        ; p2=h2[3]*x[i+1]
||     LDW    .D1T1   *A_xptr++[2], A_xip5              ; x[i+5]          
||     LDW    .D2T2   *B_SP[4],     B_k4                ; k4
||     ADDSP  .L1     A_s3,         A_s2temp,A_s5       ; s5=s3+s2
||     ADDSP  .L2X    A_s11,        B_s21,  B_s51       ; s51=s11+s21

       MPYSP  .M1     A_h22,        A_xip2, A_p3        ; p3=h2[2]*x[i+2]
||     MPYSP  .M2     B_h21,        B_xip3, B_p4        ; p4=h2[1]*x[i+3]
||     ADDSP  .L2     B_s81,        B_p81,  B_s91       ; s91=s81+p81
||     MV     .S2X    A_p71,        B_p71               ; save p71
          
       MPYSP  .M1     A_k0,         A_xi,   A_p11       ; p11=k0*xi
||     MPYSP  .M2     B_k1,         B_xip1, B_p21       ; p21=k1*x[i+1]
||     ADDSP  .L2X    A_p9,         B_p8,   B_s4        ; s4=p8+p9
||     LDW    .D2T2   *B_SP[6],     B_k6                ; load k6
          
       MPYSP  .M1     A_h20,        A_xip4, A_p5        ; p5=h2[0]*x[i+4]
||     MV     .D1     A_xip2,       A_xi                ; x[i]=x[i+2]
||     ADDSP  .L2X    A_p101,       B_p91,  B_s41       ; load s41=p91+p101
||     SUBSP  .L1X    A15,          B_p6,   A_yip4      ; y[i+4]=s7-p6
||     SUB    .S2     B_cntr,       2,      B_cntr      ; decr cntr        
            
       MPYSP  .M1     A_xip2,       A_k2,   A_p31       ; p31=x[i+2]*k2
||     MPYSP  .M2     B_xip3,       B_k3,   B_p41       ; p41=x[i+3]*k3
||     ADDSP  .L1X    A_p1,         B_p2,   A_s1        ; s1=p1+p2
||     ADDSP  .L2X    B_s51,        A_s31,  B_s71       ; s71=s31+s51
||     LDW    .D2T1   *B_SP[5],     A_k5                ; load k5
||     MV     .S1     A_xip4,       A_xip2              ; x[i+2]=x[i+4]                
||     MV     .S2     B_xip3,       B_xip1              ; x[i+1]=x[i+3]          
          
       MPYSP  .M2X    A_xip4,       B_k4,   B_p51       ; p51=k4*x[i+4]
||     MPYSP  .M1     A_h20,        A_xip5, A_p61       ; p61=h2[0]*x[i+5]
||     ADDSP  .L1X    A_p3,         B_p4,   A_s2        ; s2=p3+p4
||     LDW    .D2T1   *B_SP[7],     A_h14               ; load h1[4]
||     ADDSP  .L2     B_s91,        B_p71,  B_yip3      ; y[i+5]=s91+p71
||[B_cntr] B  .S2     loop                            
          
       SUBSP  .L1X    B_p21,        A_p11,  A_s11       ; s11=-p11+p21
||     LDDW   .D2T1   *B_SP[4],     A_k8:A_k7           ; k8:k7
||     SUBSP  .L2X    A_s5,         B_s4,   B_s6        ; s6=s5-s4
          
       MPYSP  .M1     A_yip4,       A_h12,  A_p7        ; p7=y[i+2]*h1[2]
||     MPYSP  .M2X    A_yip4,       B_k6,   B_p81       ; p81=y[i+2]*k6
||     MV     .S1     A_yip4,       A_yi                ; y[i]=y[i+2]
||     STW    .D2T1   A_yip4,       *B_r1ptr++          ; store in r1 array
                        
       ADDSP  .L2X    A_p31,        B_p41,  B_s21       ; s21=p31+p41
||     ADDSP  .L1     A_s1,         A_p5,   A_s3        ; s3=s1+p5
||     LDW    .D2T2   *B_SP[1],     B_k1                ; load k1
||     STW    .D1T1   A_yip4,       *A_r2ptr++          ; store in r2 array
          
       LDW    .D2T1   *B_SP[0],     A_k0                ; load k0
||     MV     .S1     A_s2,         A_s2temp            ; save s2      
||     MPYSP  .M2     B_yip3,       B_h11,  B_p6        ; p6=y[i+3]*h1[1]
||     MPYSP  .M1X    B_yip3,       A_k5,   A_p71       ; p71=y[i+3]*k5
||     STW    .D1T2   B_yip3,       *A_r2ptr++          ; store into r2    
||     ADDSP  .L2     B_s71,        B_s41,  B_s81       ; s81=s41+s71
||     MV     .S2     B_yip3,       B_yip1              ; y[i+1]=y[i+3]
          
       MPYSP  .M1     A_h14,        A_yi,   A_p9        ; p9=h1[4]*y[i]
||     MPYSP  .M2     B_h13,        B_yip1, B_p8        ; p8=h1[3]*y[i+1]
||     ADDSP  .L1X    B_p51,        A_p61,  A_s31       ; s31=p51+p61
||     LDW    .D1T1   *-A_xptr[1],  A_xip4              ; load x[i+4]
||     STW    .D2     B_yip3,       *B_r1ptr++          ; store into r1        
||     MV     .S2X    A_xip5,       B_xip3              ; x[i+3]=x[i+5]
          
* ========== END OF PIPED LOOP KERNEL ================================= *
       
       MV     .S1X    B_SP,        A1
||     LDDW   .D2T2   *B_SP[10],   B3:B2

       LDDW   .D2T2   *B_SP[5],    B13:B12
||     LDDW   .D1T1   *A1[6],     A13:A12       
  
       LDDW   .D2T2   *B_SP[7],    B11:B10
||     LDDW   .D1T1   *A1[8],     A11:A10       
       
       LDDW   .D2T1   *B_SP[9],    A15:A14
||     LDW    .D1T2   *A1[22],    B14

       ADDAW  .D2     B_SP,        22,       B_SP
       
       B      .S2     B2
       
       MVC    .S2     B3,         CSR
       
       NOP            4

                .end

* ======================================================================= *
*  End of file:  DSPF_sp_iir.asm                                          *
* ----------------------------------------------------------------------- *
*            Copyright (c) 2011 Texas Instruments, Incorporated.          *
*                           All Rights Reserved.                          *
* ======================================================================= *