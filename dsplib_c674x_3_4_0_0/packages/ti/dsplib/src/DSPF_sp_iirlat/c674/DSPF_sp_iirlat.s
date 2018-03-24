* ======================================================================= *
* DSPF_sp_iirlat.asm -- Lattice IIR Filter                                *
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

* ================ SYMBOLIC REGISTER ASSIGNMENTS ========================== *
                   
                   .asg B4, B_bptr
                   .asg A7, A_bi
                   .asg A6, A_bim1
                   
                   .asg A7, A_biag
                   .asg A6, A_bim1ag
                   
                   .asg B7, B_kim2
                   .asg A4, A_kptr
                   .asg B6, B_kim3
                   
                   .asg B7, B_bim2ag
                   .asg B6, B_bim3ag
                   
                   .asg B13, B_bim2
                   .asg B12, B_bim3
                   
                   .asg A15, A_ki
                   .asg A14, A_kim1
                   .asg A15, A_kiag
                   .asg A14, A_kim1ag
                   
                   .asg A8, A_temp1
                   .asg B8, B_p2
                   .asg A9, A_p1
                   .asg B12, B_p3
                   .asg B12, B_s1
                   .asg A10, A_temp2
                   .asg A9, A_temp4
                   .asg B10, B_temp3
                   .asg B11, B_kim2ag
                   .asg B10, B_kim3ag
                   .asg B10, B_rtcopy
                   .asg A13, A_temp1copy
                   .asg A6, A_rt1
                   .asg B12, B_pr2
                   .asg B12, B_rt2
                   .asg B9, B_rt3
                   .asg B9, B_pr3
                   .asg A12, A_rt
                   .asg A0, A_bip1s
                   .asg B9, B_bis
                   .asg B13, B_bim1s
                   .asg A2, A_bim2s
                   .asg B14, B_b_ptr
                   .asg A3, A_k_ptr
                   .asg B1, B_icntr
                   .asg A7,A_pr4
                   .asg A9, A_pr1
                   .asg A9, A_temp2copy
                   .asg B2, B_nolastadd
                   .asg A9, A_bptrcopy
                   .asg A1, A_ocntr
                   .asg A5, A_xptr
                   
* ========================================================================== *                   

        .sect ".text:optimized"
        .if __TI_EABI__
        .asg  DSPF_sp_iirlat, _DSPF_sp_iirlat
        .endif
		
        .global _DSPF_sp_iirlat
_DSPF_sp_iirlat:

       ; push necessary registers into stack
       STW    .D2     B3,         *-B15[2]         ; save ret address   
||     B      .S1     NO_INT                       ; no interrupts   
||     MV     .D1     A4,         A_xptr               ; store x pointer
||     MVC    .S2     CSR,        B1               ; disable interrupts             
||     MV     .L1X    B15,        A4               ; copy stk ptr   

       STW    .D2T1   A15,        *B15--[12]       ; store a15   
||     MV     .S1X    B15,        A2               ; copy stk ptr   
||     SUB            A6,         8,        A_kptr ; store k pointer                                
||     AND    .L2     B1,         -2,       B1     ; disable ints   
||     STW    .D1T2   B1,         *-A4[1]          ; save CSR   

       STW    .D2T1   A10,        *B15[0]          ; store a10   
||     STW    .D1T2   B10,        *-A2[11]         ; store b10   
||     SUB    .L2X    A8,         8,        B_bptr ; save b pointer
||     MVC    .S2     B1,         CSR              ; disable ints   
||     MV     .L1X    B4,         A_ocntr          ; outer loop count

       STW    .D2T1   A11,        *B15[2]          ; store a11   
||     STW    .D1T2   B11,        *-A2[9]          ; store b11   
||     SUB    .L2X    A6,         12,       B5     ; copy of b-ptr       

       STW    .D2T1   A12,        *B15[4]          ; store a12   
||     STW    .D1T2   B12,        *-A2[7]          ; store b12   
||     SUB    .L2     B5,         12,       B5     ; adjust bptr       
     
       STW    .D2T1   A13,        *B15[6]          ; push a13   
||     STW    .D1T2   B13,        *-A2[5]          ; push b13   
||     SHR    .S2     B6,         1,     B_icntr   ; inner loop count              

NO_INT:     

       STW    .D2T1   A14,        *B15[8]          ; push a14
||     STW    .D1T2   B14,        *-A2[3]          ; push b14
||     SHL    .S1X    B_icntr,    3,        A15    ; for b,k ptr init
             
       ADDAW  .D1     A_xptr,     A_ocntr,  A_xptr ; store ptr   
||     ADDAD  .D2     B_bptr,     B_icntr,  B_bptr ; point bptr to last   
||     ADD    .S1     A_kptr,     A15,      A_kptr ; point kptr to last   
             
************ PROLOG BEGINS ******************************

       LDDW   .D2T1   *B_bptr--,  A_bi:A_bim1      ; b[i],b[i-1]   
||     LDDW   .D1T2   *-A_kptr[1],B_kim2:B_kim3    ; k[i-2],k[i-3]   
             
               
       LDDW   .D2T2   *B_bptr--,  B_bim2:B_bim3    ; b[i-2],b[i-3]   
||     LDDW   .D1T1   *A_kptr--[2],A_ki:A_kim1     ; k[i], k[i-1]    
             
               
       ZERO   .S2     B_nolastadd                  ; init cond   
||     MV     .S1X    B_icntr,    A11              ; save inner loop cntr             
               
       LDW    .D1T1   *-A_xptr[A_ocntr],   A_rt    ; load x[j]   

               
       MV     .S2     B8,         B3               ; r pointer preserve
||     ADD    .D1     A_kptr,     16,       A_k_ptr; k pointer preserve
               
       ADD    .D2     B_bptr,     16,       B_b_ptr; b pointer preserve
               
oloop:                              
               
       LDDW   .D2T1   *B_bptr--,  A_bi:A_bim1      ; b[i],b[i-1]   
||     LDDW   .D1T2   *-A_kptr[1],B_kim2:B_kim3    ; k[i-2],k[i-3]   
||     MPYSP  .M1     A_bi,       A_ki,     A_temp1; b[i]*k[i]   
||     MPYSP  .M2     B_kim2,     B_bim2,   B_p2   ; p2=b[i-2]*k[i-2]   
||     SUB    .S1     A_ocntr,    1,        A_ocntr; decr oloop cntr   
               
       LDDW   .D2T2   *B_bptr--,  B_bim2:B_bim3    ; b[i-2],b[i-3]   
||     LDDW   .D1T1   *A_kptr--[2],A_ki:A_kim1     ; k[i],k[i-1]    
||     MPYSP  .M1     A_bim1,     A_kim1,   A_p1   ; p1=b[i-1]*k[i-1]   
||     MPYSP  .M2     B_kim3,     B_bim3,   B_p3   ; p3=k[i-3]*b[i-3]   
               
       NOP            3                               
               
       ADDSP  .L2     B_p2,       B_p3,     B_s1   ; s1=p2+p3   
||     ADDSP  .L1     A_temp1,    A_p1,     A_temp2; temp2=p1+temp1   
             
               
       LDDW   .D2T1   *B_bptr--,  A_bi:A_bim1      ; b[i],b[i-1]   
||     LDDW   .D1T2   *-A_kptr[1],B_kim2:B_kim3    ; k[i-2],k[i-3]   
||     MPYSP  .M1     A_bi,       A_ki,     A_temp1; temp1=b[i]*k[i]   
||     MPYSP  .M2     B_kim2,     B_bim2,   B_p2   ; p2=k[i-2]*b[i-2]   
             
               
       LDDW   .D2T2   *B_bptr--,  B_bim2:B_bim3    ; b[i-2],b[i-3]   
||     LDDW   .D1T1   *A_kptr--[2],A_ki:A_kim1     ; k[i],k[i-1]    
||     MPYSP  .M1     A_bim1,     A_kim1,   A_p1   ; p1=b[i-1]*k[i-1]   
||     MPYSP  .M2     B_kim3,     B_bim3,   B_p3   ; p3=k[i-3]*b[i-3]   
             
       NOP                                                        
             
       ADDSP  .L1X    B_s1,       A_temp2,  A_temp4; temp4=s1+temp2   
||     MV     .S1     A_temp1,    A_temp1copy      ; copy temp1   
||     ADDSP  .L2X    A_temp2,    B_p2,     B_temp3; temp3=p2+temp2   
           
             
       SUB    .S1X    B_icntr,    3,        A2        
||     ADDAD  .D2     B5,         1,        B11       
             
       ADDSP  .L2     B_p2,       B_p3,     B_s1   ; s1=p2+p3   
||     ADDSP  .L1     A_temp1,    A_p1,     A_temp2; temp2=temp1+p1   
||     LDDW   .D1T1   *A_kptr[6], A_ki:A_kim1      ; k[i],k[i-1]   
||     MV     .S2X    A_rt,       B_rtcopy         ; copy rt   
||     LDDW   .D2T2   *B11[B_icntr],B_kim2ag:B_kim3ag; load again   
           
       LDDW   .D2T1   *B_bptr--,  A_bi:A_bim1      ; b[i],b[i-1]   
||     LDDW   .D1T2   *-A_kptr[1],B_kim2:B_kim3    ; k[i-2],k[i-3]   
||     MPYSP  .M1     A_bi,       A_ki,     A_temp1; temp1=b[i]*k[i]   
||     MPYSP  .M2     B_kim2,     B_bim2,   B_p2   ; p2=k[i-2]*b[i-2]   
||     SUBSP  .L1     A_rt,       A_temp1copy,A_rt1; rt1=rt-temp1     
||     SUBSP  .L2X    B_rtcopy,   A_temp2,  B_rt2  ; rt2=rt-temp2   
           
       LDDW   .D2T2   *B_bptr--,  B_bim2:B_bim3    ; load b[i-2],b[i-3]   
||     LDDW   .D1T1   *A_kptr--[2],A_ki:A_kim1     ; k[i],k[i-1]    
||     MPYSP  .M1     A_bim1,     A_kim1,   A_p1   ; p1=b[i-1]*k[i-1]
||     MPYSP  .M2     B_kim3,     B_bim3,   B_p3   ; p3=k[i-3]*k[i-3]   
||     SUBSP  .L1     A_rt,       A_temp4,  A_rt   ; rt=rt-temp4   
||     SUBSP  .L2X    A_rt,       B_temp3,  B_rt3  ; rt3=rt-temp3   
           
       MV     .S1X    B_bptr,     A_bptrcopy       ; copy bptr   
||[!A2]ZERO   .D2     B_nolastadd                     
||[A2] ADD    .S2     B_nolastadd,1,   B_nolastadd ; check for last iter
             
  [B_nolastadd]ADDSP.L1X  B_s1,   A_temp2,  A_temp4; temp4=s1+temp2   
||     MV     .S1     A_temp1,    A_temp1copy      ; copy temp1   
||     ADDSP  .L2X    A_temp2,    B_p2,     B_temp3; temp3=temp2+p2   
||     LDDW   .D2T1   *B_bptr[8], A_biag:A_bim1ag  ; load again   
||     LDDW   .D1T2   *A_bptrcopy[7],B_bim2ag:B_bim3ag; load again   
||[B_icntr]SUB.S2     B_icntr,    1,        B_icntr   ; decr cntr
           
       MPYSP  .M1     A_rt1,      A_ki,     A_pr1  ; pr1=rt1*k[i]   
||     MPYSP  .M2X    A_kim1,     B_rt2,    B_pr2  ; pr2=rt2*k[i-1]   
           
       ADDSP  .L2     B_p2,       B_p3,     B_s1   ; s1=p2+p3   
||     ADDSP  .L1     A_temp1,    A_p1,     A_temp2; temp2=temp1+p1   
||     LDDW   .D1T1   *A_kptr[6], A_kiag:A_kim1ag  ; load again   
||     MV     .S2X    A_rt,       B_rtcopy         ; copy rt   
||     LDDW   .D2T2   *B5[B_icntr],B_kim2ag:B_kim3ag; load again   
||     MPYSP  .M2     B_rt3,      B_kim2ag, B_pr3  ; pr3=rt3*k[i-2]   
||     MPYSP  .M1X    A_rt,       B_kim3ag, A_pr4  ; pr4=rt*k[i-3]   
           
       LDDW   .D2T1   *B_bptr--,  A_bi:A_bim1      ; b[i], b[i-1]   
||     LDDW   .D1T2   *-A_kptr[1],B_kim2:B_kim3    ; k[i-2],k[i-3]   
||     MPYSP  .M1     A_bi,       A_ki,     A_temp1; temp1=b[i]*k[i]   
||     MPYSP  .M2     B_kim2,     B_bim2,   B_p2   ; p2=k[i-2]*b[i-2]   
||     SUBSP  .L1     A_rt,       A_temp1copy,A_rt1; rt1=rt-temp1     
||     SUBSP  .L2X    B_rtcopy,   A_temp2,  B_rt2  ; rt2=rt-temp2   
||     SHR    .S2     B_icntr,    1,    B_nolastadd; check for last iter
||[!B_nolastadd]MV .S1 A_temp2,   A_temp2copy      ; copy temp2   
             
       LDDW   .D2T2   *B_bptr--,  B_bim2:B_bim3    ; b[i-2],b[i-3]   
||     LDDW   .D1T1   *A_kptr--[2],A_ki:A_kim1     ; k[i],k[i-1]    
||     MPYSP  .M1     A_bim1,     A_kim1,   A_p1   ; p1=k[i-1]*b[i-1]   
||     MPYSP  .M2     B_kim3,     B_bim3,   B_p3   ; p3=k[i-3]*b[i-3]   
||[B_nolastadd]SUBSP.L1  A_rt,    A_temp4,  A_rt   ; rt=rt-temp4   
||     SUBSP  .L2X    A_rt,       B_temp3,  B_rt3  ; rt3=rt-temp3   
           
       MV     .S1X    B_bptr,     A_bptrcopy       ; copy bptr   
||     ADDSP  .L1     A_pr1,      A_biag,   A_bip1s; b[i+1]=pr1+b[i]   
||     ADDSP  .L2X    A_bim1,     B_pr2,    B_bis  ; b[i]=b[i-1]+pr2   
||[B_icntr]SUB.S2     B_icntr,    4,    B_nolastadd; last iter check
           
  [B_nolastadd]ADDSP.L1X  B_s1,   A_temp2,  A_temp4; temp4=s1+temp2
||     MV     .S1     A_temp1,    A_temp1copy      ; copy temp1   
||     ADDSP  .L2X    A_temp2,    B_p2,     B_temp3; temp3=p2+temp2   
||     LDDW   .D2T1   *B_bptr[8], A_biag:A_bim1ag  ; load again   
||     LDDW   .D1T2   *A_bptrcopy[7],B_bim2ag:B_bim3ag; load again   
||[B_icntr]SUB.S2     B_icntr,    1,        B_icntr; decr cntr   
           
       MPYSP  .M1     A_rt1,      A_ki,     A_pr1  ; pr1=rt1*k[i]   
||     MPYSP  .M2X    A_kim1,     B_rt2,   B_pr2  ; pr2=k[i-1]*rt2   
||     ADDSP  .L2     B_pr3,      B_bim2ag, B_bim1s; b[i-1]=pr3+b[i-2]   
||     ADDSP  .L1X    B_bim3ag,   A_pr4,    A_bim2s; b[i-2]=pr4+b[i-3]
||[B_icntr]SUB.S2     B_icntr,    1,        B_icntr ; decr cntr  

************** PIPED LOOP KERNEL ***********************           
iloop:

       ADDSP  .L2     B_p2,       B_p3,     B_s1    ; s1=p2+p3  
||     ADDSP  .L1     A_temp1,    A_p1,     A_temp2 ; temp2=p1+temp1  
||     LDDW   .D1T1   *A_kptr[6], A_kiag:A_kim1ag   ; load again  
||     MV     .S2X    A_rt,       B_rtcopy          ; copy rt  
||     LDDW   .D2T2   *B5[B_icntr],B_kim2ag:B_kim3ag; load again   
||     MPYSP  .M2     B_rt3,      B_kim2ag, B_pr3   ; pr3=rt3*k[i-2]  
||     MPYSP  .M1X    A_rt,       B_kim3ag, A_pr4   ; pr4=rt*k[i-3]  
||[B_icntr]B      .S1     iloop                     ; branch      
           
       LDDW   .D2T1   *B_bptr--,  A_bi:A_bim1       ; b[i],b[i-1]  
||     LDDW   .D1T2   *-A_kptr[1],B_kim2:B_kim3     ; k[i-2],k[i-3]  
||     MPYSP  .M1     A_bi,       A_ki,     A_temp1 ; temp1=b[i]*k[i]  
||     MPYSP  .M2     B_kim2,     B_bim2,   B_p2    ; p2=k[i-2]*b[i-2]  
||     SUBSP  .L1     A_rt,       A_temp1copy,A_rt1 ; rt1=rt-temp1
||     SUBSP  .L2X    B_rtcopy,   A_temp2,  B_rt2   ; rt2=rt-temp2  
||[!B_nolastadd]MV.S1 A_temp2,    A_temp2copy       ; copy temp2
||     SHR .S2 B_icntr,    1,     B_nolastadd       ; last iter check
           
       LDDW   .D2T2   *B_bptr--,  B_bim2:B_bim3     ; b[i-2],b[i-3]  
||     LDDW   .D1T1   *A_kptr--[2],A_ki:A_kim1      ; k[i],k[i-1]   
||     MPYSP  .M1     A_bim1,     A_kim1,   A_p1    ; p1=b[i-1]*k[i-1]  
||     MPYSP  .M2     B_kim3,     B_bim3,   B_p3    ; p3=k[i-3]*b[i-3]  
||[B_nolastadd]SUBSP.L1  A_rt,    A_temp4,  A_rt    ; rt=rt-temp4  
||     SUBSP  .L2X    A_rt,       B_temp3,  B_rt3   ; rt3=rt-temp3  
||     MV     .S1X    B_bptr,     A14               ; copy bptr  
           
       MV     .S1X    B_bptr,     A_bptrcopy        ; copy modofied bptr  
||     ADDSP  .L1     A_pr1,      A_biag,   A_bip1s ; b[i+1]=b[i]+pr1  
||     ADDSP  .L2X    A_bim1,     B_pr2,    B_bis   ; b[i]=pr2+b[i-1]  
||     STW    .D2T1   A_bip1s,    *B_bptr[26]       ; store b[i+1]  
||     STW    .D1T2   B_bis,      *A14[23]          ; store b[i]  
||[B_icntr]SUB.S2     B_icntr,    4,    B_nolastadd ; check last add

  [B_nolastadd]ADDSP.L1X  B_s1,   A_temp2,  A_temp4 ; if(cond)temp4=s1+temp2
||     MV     .S1     A_temp1,    A_temp1copy       ; copy temp1  
||     ADDSP  .L2X    A_temp2,    B_p2,     B_temp3 ; temp3=p2+temp2  
||     LDDW   .D2T1   *B_bptr[8], A_biag:A_bim1ag   ; load again   
||   LDDW   .D1T2  *A_bptrcopy[7],B_bim2ag:B_bim3ag ; load again  
||[B_icntr]SUB .S2    B_icntr,    1,        B_icntr ; decr cntr
           
       MPYSP  .M1     A_rt1,     A_ki,     A_pr1    ; pr1=rt1*ki
||     MPYSP  .M2X    A_kim1,     B_rt2,    B_pr2   ; pr2=rt2*k[i-1]  
||     ADDSP  .L2     B_pr3,      B_bim2ag, B_bim1s ; b[i-1]=pr3+b[i-2]  
||     ADDSP  .L1X    B_bim3ag,   A_pr4,    A_bim2s ; b[i-2]=pr4+b[i-3]  
||[B_icntr]SUB.S2     B_icntr,    1,        B_icntr ; decr cntr  
||     STW    .D2T2   B_bim1s,    *B_bptr[24]       ; store b[i-1]  
||     STW    .D1T1   A_bim2s,    *A_bptrcopy[23]   ; store b[i-2]  

*================ PIPED LOOP EPILOG + OUTER LOOP + PROLOG ===================== *
           
       LDDW   .D2T1   *B_b_ptr,   A_bi:A_bim1       ; next iter prolog  
||     LDDW   .D1T2   *-A_k_ptr[1],B_kim2:B_kim3    ; loads for next iter   
||[A_ocntr] B      .S2     oloop                    ; branch next outer loop
             
       LDDW   .D2T2   *-B_b_ptr[1],B_bim2:B_bim3    ; b[i-2],b[i-3]   
||     LDDW   .D1T1   *A_k_ptr,   A_ki:A_kim1       ; k[i],k[i-1]  
||     AND    .S2X    A11,        1,        B_icntr ; if more store then set  

       STW    .D2T1   A_rt,       *B3++             ; r[j]=rt  
||     MV     .S2X    A_rt,       B8                ; copy  
           
       LDW    .D1T1   *-A_xptr[A_ocntr],   A_rt     ; load rt=x[j]           
||     MV     .S1X    B_bptr,     A15               ; copy  
||[B_icntr]STW.D2T2   B8,         *B_bptr[20]       ; if(cond) store b[0]
           
  [B_icntr]STW    .D2T2   B_bis,      *B_bptr[21]   ; if(cond) store b[i]      
||[!B_icntr]STW    .D1T1   A_rt,       *A15[22]     ; if(cond) store b[0]       
||     ZERO.S2     B_nolastadd                      ; zero off cond

       MV     .S2X    A11,        B_icntr           ; init counter  
||     SUB    .S1     A_k_ptr,    16,       A_kptr  ; init pointers  
||     SUB    .L2     B_b_ptr,    16,       B_bptr    
||[B_icntr]STW    .D2T1   A_bip1s,    *B_bptr[22]   ; if(cond)store b[i+1]      
  
* =============== OUTER LOOP BRANCH ============================================ *
           
       ; pop off registers    
       MV     .S1X    B15,        A1                  
||     LDDW   .D2T2   *B15[5],    B3:B2               
      
       LDW    .D2T1   *B15[0],    A10                 
||     LDW    .D1T2   *A1[1],     B10                 
       
       LDW    .D2T1   *B15[2],    A11                 
||     LDW    .D1T2   *A1[3],     B11                 
     
       LDW    .D2T1   *B15[4],    A12                 
||     LDW    .D1T2   *A1[5],     B12                 
     
       LDW    .D2T1   *B15[6],    A13                 
||     LDW    .D1T2   *A1[7],     B13                 
     
       LDW    .D2T1   *B15[8],    A14                 
||     LDW    .D1T2   *A1[9],     B14                 
||     B      .S2     B2                              
      
       LDW    .D2     *B15[12],   A15                 
        
       MVC    .S2     B3,         CSR                 
    
       ADDAW  .D2     B15,        12,       B15       
       
       NOP            2                               

                .end

* ======================================================================= *
*  End of file:  DSPF_sp_iirlat.asm                                       *
* ----------------------------------------------------------------------- *
*            Copyright (c) 2011 Texas Instruments, Incorporated.          *
*                           All Rights Reserved.                          *
* ======================================================================= *