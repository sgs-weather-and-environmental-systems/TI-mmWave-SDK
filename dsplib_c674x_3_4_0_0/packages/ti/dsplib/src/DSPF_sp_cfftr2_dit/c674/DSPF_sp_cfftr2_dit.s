* ======================================================================= *
* DSPF_sp_cfftr2_dit.asm -- Forward FFT with Radix 2 and DIT              *
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

                .asg B8, B_x
                .asg A5, A_w
                .asg B7, B_x2mp1
                .asg B6, B_x2m
                .asg A7, A_si
                .asg A6, A_co
                .asg B0, B_lx2mc
                .asg B4, B_8n2
                .asg B13, B_n2
                .asg A13, A_p1
                .asg B11, B_p2
                .asg B3, B_p4
                .asg A15, A_p3
                .asg B2, B_lx2iac
                .asg A3, A_x
                .asg A10, A_8n2
                .asg A12, A_rtemp
                .asg B10, B_itemp
                .asg A1, A_stcnt
                .asg A15, A_x2ias
                .asg B3, B_x2mp1s
                .asg A15, A_x2ms
                .asg B3, B_x2iap1s
                .asg A9, A_x2iap1
                .asg A8, A_x2ia
                .asg B1, B_hafn2
                .asg A2, A_nby2
                .asg A4, A_wbase


        .sect ".text:optimized"
        .if __TI_EABI__
        .asg  DSPF_sp_cfftr2_dit, _DSPF_sp_cfftr2_dit
        .endif
		
        .global _DSPF_sp_cfftr2_dit
_DSPF_sp_cfftr2_dit:

       ; push all the registers (also CSR, IRP )
       SUBAW  .D2     B15,        16,       B15
||     B      .S1     no_int
||     MVC    .S2     CSR,        B1

       MV     .S1X    B15,        A1
||     STW    .D2T1   A10,        *B15[0]

       STW    .D2T2   B1,         *B15[2]
||     STW    .D1T1   A11,        *A1[1]

       STW    .D2T2   B11,        *B15[4]
||     STW    .D1T1   A12,        *A1[3]
||     AND    .L2     B1,         -2,       B1  ; disable interrupts
||     MVC    .S2     IRP,        B2

       STW    .D2T2   B2,         *B15[6]
||     STW    .D1T1   A13,        *A1[5]
||     MVC    .S2     B1,         CSR

       STW    .D2T2   B13,        *B15[8]
||     STW    .D1T1   A14,        *A1[7]

no_int:

       STW    .D2T2   B14,        *B15[10]
||     STW    .D1T1   A15,        *A1[9]

       STW    .D2T2   B3,         *B15[12]
||     MVC    .S2     B15,        IRP

       ADDAW  .D1     A4,         A6,       A3        ; init x[2m] ptr
||     SHR    .S2X    A6,         1,        B_n2      ; init n2
||     MV     .L1X    B4,         A_w                 ; init w ptr
||     STW    .D2T2   B10,        *B15[13]            ; push b10

       MV     .S2X    A3,         B_x                 ; transfer x[2m] ptr
||     SHL    .S1     A6,         2,        A_8n2     ; keep 8n2 for addr incr
||     SUB    .L2     B_n2,       6,        B15       ; for inner loop cntr
||     STW    .D2T2   B12,        *B15[11]            ; push b12

* ====================== PIPED LOOP PROLOG ======================================= *

       LDDW   .D2     *B_x++,     B_x2mp1:B_x2m       ; load x[2m+1]:x[2m]
||     LDDW   .D1     *A_w++,     A_si:A_co           ; load si:co
||     MV     .S2     B_x,        B5                  ; init x[2m] store ptr

       MV     .L1     A4,         A11                 ; init x[2ia] store ptr
||     SHL    .S2X    A6,         2,        B_8n2     ; copy of 8n2 on b-side
||     MV             B_n2,       B_lx2mc             ; load cntr for x[2m] loads

 [B_lx2mc]SUB .L2     B_lx2mc,    1,        B_lx2mc   ; decr x[2m] load cntr
||     MV     .S1     A4,         A_x                 ; f xx2 = x
||     MV     .S2X    A4,         B14                 ; save base x ptr
||     MV     .D1     A4,         A0                  ; save base x ptr
||     SUB    .L1     A_w,        8,        A_wbase   ; save w base ptr

       MV     .D2     B_n2,       B_lx2iac            ; init x[2ia] load cntr
||     MV     .L1X    B_n2,       A_stcnt             ; init store cntr
||     SHR    .S2     B_n2,       1,        B_hafn2   ; init half of n2

       LDDW   .D2     *B_x++,     B_x2mp1:B_x2m       ; load x[2m+1]:x[2m]

       MPYSP  .M1X    A_co,       B_x2m,    A_p1      ; p1=co*x[2m]
||     MPYSP  .M2X    A_co,       B_x2mp1,  B_p2      ; p2=co*x[2m+1]

 [B_lx2mc]SUB .S2     B_lx2mc,    1,        B_lx2mc   ; decr load cntr
||     MV     .L1X    B15,        A_nby2              ; init loop cntr

       MPYSP  .M1X    A_si,       B_x2mp1,  A_p3      ; p3=si*x[2m+1]
||     MPYSP  .M2X    A_si,       B_x2m,    B_p4      ; p4=si*x[2m]

       LDDW   .D2     *B_x++,     B_x2mp1:B_x2m       ; load x[2m+1]:x[2m]

       MPYSP  .M1X    A_co,       B_x2m,    A_p1      ; p1=co*x[2m]
||     MPYSP  .M2X    A_co,       B_x2mp1,  B_p2      ; p2=co*x[2m+1]

  [B_lx2mc]SUB.S2     B_lx2mc,    1,        B_lx2mc   ; decr load cntr

       LDDW   .D1     *A_x++,     A_x2iap1:A_x2ia     ; load x[2ia+1]:x[2ia]
||     MPYSP  .M1X    A_si,       B_x2mp1,  A_p3      ; p3=si*x[2m+1]
||     MPYSP  .M2X    A_si,       B_x2m,    B_p4      ; p4=si*x[2m]
||     ADDSP  .L1     A_p1,       A_p3,     A_rtemp   ; rtemp=p1+p3
||     SUBSP  .L2     B_p2,       B_p4,     B_itemp   ; itemp=p2-p4

       LDDW   .D2     *B_x++,     B_x2mp1:B_x2m       ; load x[2m+1]:x[2m]
||[B_lx2iac]SUB.S2     B_lx2iac,  1,        B_lx2iac  ; decr load cntr

       MPYSP  .M1X    A_co,       B_x2m,    A_p1      ; p1=co*x[2m]
||     MPYSP  .M2X    A_co,       B_x2mp1,  B_p2      ; p2=co*x[2m+1]

  [B_lx2mc]SUB.S2     B_lx2mc,    1,        B_lx2mc   ; decr load cntr

       LDDW   .D1     *A_x++,     A_x2iap1:A_x2ia     ; load x[2ia+1]:x[2ia]
||     MPYSP  .M1X    A_si,       B_x2mp1,  A_p3      ; p3=si*x[2m+1]
||     MPYSP  .M2X    A_si,       B_x2m,    B_p4      ; p4=si*x[2m]
||     ADDSP  .L1     A_p1,       A_p3,     A_rtemp   ; rtemp=p1+p3
||     SUBSP  .L2     B_p2,       B_p4,     B_itemp   ; itemp=p2-p4

       LDDW   .D2     *B_x++,     B_x2mp1:B_x2m       ; load x[2m+1]:x[2m]
||[B_lx2iac]SUB.S2    B_lx2iac,   1,        B_lx2iac  ; decr load cntr
||     ADDSP  .L1     A_x2ia,     A_rtemp,  A_x2ias   ; x[2ia]=x[2ia]+rtemp
||     SUBSP  .L2X    A_x2iap1,   B_itemp,  B_x2mp1s  ; x[2m+1]=x[2ia+1]-itemp

       MPYSP  .M1X    A_co,       B_x2m,    A_p1      ; p1=co*x[2m]
||     MPYSP  .M2X    A_co,       B_x2mp1,  B_p2      ; p2=co*x[2m+1]
||     B      .S2     loop

  [B_lx2mc]SUB.S2     B_lx2mc,    1,        B_lx2mc   ; decr load cntr
||     SUBSP  .L1     A_x2ia,     A_rtemp,  A_x2ms    ; x[2m]=x[2ia]-rtemp
||     ADDSP  .L2X    A_x2iap1,   B_itemp,  B_x2iap1s ; x[2ia+1]=x[2ia+1]+itemp

* ================== PIPED LOOP KERNEL ======================================== *
loop:

       LDDW   .D1     *A_x++,     A_x2iap1:A_x2ia     ; load x[2ia+1]:x[2ia]
||     MPYSP  .M1X    A_si,       B_x2mp1,  A_p3      ; p3=si*x[2m+1]
||     MPYSP  .M2X    A_si,       B_x2m,    B_p4      ; p4=si*x[2m]
||[!B_lx2mc]ADD.D2    B_x,        B_8n2,    B_x       ; incr load ptr if required
||     ADDSP  .L1     A_p1,       A_p3,     A_rtemp   ; rtemp=p1+p3
||     SUBSP  .L2     B_p2,       B_p4,     B_itemp   ; itemp=p2-p4
||[!A_stcnt]ADD.S2    B5,         B_8n2,    B5        ; incr store ptr if required
||[!A_stcnt]ADD.S1    A11,        A_8n2,    A11       ; incr store ptr if required

       LDDW   .D2     *B_x++,     B_x2mp1:B_x2m       ; load x[2m+1]:x[2m]
||[!B_lx2mc]LDDW.D1   *A_w++,     A_si:A_co           ; load si:co
||[!B_lx2mc]MPY .M2   1,          B_n2,     B_lx2mc   ; reset load cntr
||[B_lx2iac]SUB .S2   B_lx2iac,   1,        B_lx2iac  ; decr load cntr
||     ADDSP  .L1     A_x2ia,     A_rtemp,  A_x2ias   ; x[2ia]=x[2ia]+rtemp
||     SUBSP  .L2X    A_x2iap1,   B_itemp,  B_x2mp1s  ; x[2m+1]=x[2ia+1]-itemp
||[A_nby2]SUB .S1     A_nby2,     1,        A_nby2    ; decr loop cntr
||[!A_stcnt]MPY.M1X   1,          B_n2,     A_stcnt   ; reset store cntr

       MPYSP  .M1X    A_co,       B_x2m,    A_p1      ; p1=co*x[2m]
||     MPYSP  .M2X    A_co,       B_x2mp1,  B_p2      ; p2=co*x[2m+1]
||[!B_lx2iac]ADD.S1   A_x,        A_8n2,    A_x       ; incr load ptr if required
||[A_nby2]B   .S2     loop                            ; Branch loop
||     STW    .D1T1   A_x2ias,    *A11++              ; store x[2ia]
||     STW    .D2T2   B_x2mp1s,   *B5[1]              ; store x[2m+1]

  [B_lx2mc]SUB.S2     B_lx2mc,    1,        B_lx2mc   ; decr load cntr
||[!B_lx2iac]MPY.M2   1,          B_n2,     B_lx2iac  ; decr load cntr
||     SUBSP  .L1     A_x2ia,     A_rtemp,  A_x2ms    ; x[2m]=x[2ia]-rtemp
||     ADDSP  .L2X    A_x2iap1,   B_itemp,  B_x2iap1s ; x[2ia+1]=x[2ia+1]+itemp
||     STW    .D1     B_x2iap1s,  *A11++              ; store x[2ia+1]
||     STW    .D2     A_x2ms,     *B5++[2]            ; store x[2m]
||[A_stcnt]SUB.S1     A_stcnt,    1,        A_stcnt   ; decr store cntr

* ======================= END OF PIPED LOOP KERNEL ========================== *

       LDDW   .D1     *A_x++,     A_x2iap1:A_x2ia     ; (e) load x[2ia+1]:x[2ia]
||     MPYSP  .M1X    A_si,       B_x2mp1,  A_p3      ; (e) p3=si*x[2m+1]
||     MPYSP  .M2X    A_si,       B_x2m,    B_p4      ; (e) p4=si*x[2m]
||[!B_lx2mc]ADDAW.D2  B14,        B_n2,     B_x       ; (p) init B_x for outer loop
||     ADDSP  .L1     A_p1,       A_p3,     A_rtemp   ; (e) rtemp=p1+p3
||     SUBSP  .L2     B_p2,       B_p4,     B_itemp   ; (e) itemp=p2-p4
||[!A_stcnt]ADD.S2    B5,         B_8n2,    B5        ; (e) incr store ptr if required
||[!A_stcnt]ADD.S1    A11,        A_8n2,    A11       ; (e) incr store ptr if required

  ; loads are predicated with B_hafn2 so that the last prolog does not
  ; perform invalid loads

  [B_hafn2] LDDW.D2   *B_x++,     B_x2mp1:B_x2m       ; (p) load x[2m+1]:x[2m]
||[!B_lx2mc]LDDW.D1   *A4,        A_si:A_co           ; (p) load si:co
||[!B_lx2mc]MPY .M2   1,          B_hafn2,  B_lx2mc   ; (p) reset load cntr
||[B_lx2iac]SUB .S2   B_lx2iac,   1,        B_lx2iac  ; (p) decr load cntr
||     ADDSP  .L1     A_x2ia,     A_rtemp,  A_x2ias   ; (e) x[2ia]=x[2ia]+rtemp
||     SUBSP  .L2X    A_x2iap1,   B_itemp,  B_x2mp1s  ; (e) x[2m+1]=x[2ia+1]-itemp
||     ADD    .S1     A4,         8,        A_w       ; (p) set w ptr
||[!A_stcnt]MPY.M1X   1,          B_n2,     A_stcnt   ; (p) reset store cntr

       MPYSP  .M1X    A_co,       B_x2m,    A_p1      ; (e) p1=co*x[2m]
||     MPYSP  .M2X    A_co,       B_x2mp1,  B_p2      ; (e) p2=co*x[2m+1]
||[!B_lx2iac]ADD.S1   A_x,        A_8n2,    A_x       ; (e) incr load ptr if required
||     MV     .S2     B5,         B12                 ; preserve store ptr
||     STW    .D1T1   A_x2ias,    *A11++              ; (e) store x[2ia]
||     STW    .D2T2   B_x2mp1s,   *B5[1]              ; (e) store x[2m+1]

  [B_lx2mc]SUB.S2     B_lx2mc,    1,        B_lx2mc   ; decr load cntr
||[!B_lx2iac]MPY.M2   1,          B_n2,     B_lx2iac  ; reset load cntr
||     SUBSP  .L1     A_x2ia,     A_rtemp,  A_x2ms    ; (e) x[2m]=x[2ia]-rtemp
||     ADDSP  .L2X    A_x2iap1,   B_itemp,  B_x2iap1s ; (e) x[2ia+1]=x[2ia+1]+itemp
||     STW    .D1     B_x2iap1s,  *A11++              ; (e) store x[2ia+1]
||     STW    .D2     A_x2ms,     *B12++[2]           ; (e) store x[2m]
||[A_stcnt] SUB.S1    A_stcnt,    1,        A_stcnt   ; (e) decr store cntr
||     MPY    .M1X    B13,       1,        A_nby2     ; is it last outer loop?

       LDDW   .D1     *A_x++,     A_x2iap1:A_x2ia     ; (e) load x[2ia+1]:x[2ia]
||     MPYSP  .M1X    A_si,       B_x2mp1,  A_p3      ; (e) p3=si*x[2m+1]
||     MPYSP  .M2X    A_si,       B_x2m,    B_p4      ; (e) p4=si*x[2m]
||[!B_lx2mc]ADDAW.D2  B_x,        B_n2,     B_x       ; (p) incr ptr if required
||     ADDSP  .L1     A_p1,       A_p3,     A_rtemp   ; (e) rtemp=p1+p3
||     SUBSP  .L2     B_p2,       B_p4,     B_itemp   ; (e) itemp=p2-p4
||[!A_stcnt]ADD.S2    B12,        B_8n2,    B12       ; (e) incr store ptr if required
||[!A_stcnt]ADD.S1    A11,        A_8n2,    A11       ; (e) incr store ptr if required

  [B_hafn2] LDDW.D2   *B_x++,     B_x2mp1:B_x2m       ; (p) load x[2m+1]:x[2m]
||[!B_lx2mc]LDDW.D1   *A_w++,     A_si:A_co           ; (p) load si:co
||[!B_lx2mc]MPY .M2   1,          B_hafn2,  B_lx2mc   ; (p) reset load cntr
||[B_lx2iac]SUB .S2   B_lx2iac,   1,        B_lx2iac  ; (p) decr load cntr
||     ADDSP  .L1     A_x2ia,     A_rtemp,  A_x2ias   ; (e) x[2ia]=x[2ia]+rtemp
||     SUBSP  .L2X    A_x2iap1,   B_itemp,  B_x2mp1s  ; (e) x[2m+1]=x[2ia+1]-itemp
||[!A_stcnt]MPY.M1X   1,          B_n2,     A_stcnt   ; (e) reset store cntr
||[A_nby2]SUB  .S1    A_nby2,     1,        A_nby2    ; is it last outer loop?

       MPYSP  .M1X    A_co,       B_x2m,    A_p1      ; (p) p1=co*x[2m]
||     MPYSP  .M2X    A_co,       B_x2mp1,  B_p2      ; (p) p2=co*x[2m+1]
||[!B_lx2iac]ADD.S1   A_x,        A_8n2,    A_x       ; (e) incr load ptr if required
||     MV     .S2     B_8n2,      B9                  ; preserve store ptr
||     STW    .D1T1   A_x2ias,    *A11++              ; (e) store x[2ia]
||     STW    .D2T2   B_x2mp1s,   *B12[1]             ; (e) store x[2m+1]

  [B_lx2mc]SUB.S2     B_lx2mc,    1,        B_lx2mc   ; decr load cntr
||[!B_lx2iac]MPY.M2   1,          B_n2,     B_lx2iac  ; reset load cntr
||     SUBSP  .L1     A_x2ia,     A_rtemp,  A_x2ms    ; (e) x[2m]=x[2ia]-rtemp
||     ADDSP  .L2X    A_x2iap1,   B_itemp,  B_x2iap1s ; (e) x[2ia+1]=x[2ia+1]+itemp
||     STW    .D1     B_x2iap1s,  *A11++              ; (e) store x[2ia+1]
||     STW    .D2     A_x2ms,     *B12++[2]           ; (e) store x[2m]
||[A_stcnt] SUB.S1    A_stcnt,    1,        A_stcnt   ; decr store cntr

       LDDW   .D1     *A_x++,     A_x2iap1:A_x2ia     ; (e) load x[2ia+1]:x[2ia]
||     MPYSP  .M1X    A_si,       B_x2mp1,  A_p3      ; (e) p3=si*x[2m+1]
||     MPYSP  .M2X    A_si,       B_x2m,    B_p4      ; (e) p4=si*x[2m]
||[!B_lx2mc]ADDAW.D2  B_x,        B_n2,     B_x       ; (p) incr ptr if required
||     ADDSP  .L1     A_p1,       A_p3,     A_rtemp   ; (e) rtemp=p1+p3
||     SUBSP  .L2     B_p2,       B_p4,     B_itemp   ; (e) itemp=p2-p4
||[!A_stcnt]ADD.S2    B12,        B9,       B12       ; (e) incr store ptr if required
||[!A_stcnt]ADD.S1    A11,        A_8n2,    A11       ; (e) incr store ptr if required

  [B_hafn2] LDDW.D2   *B_x++,     B_x2mp1:B_x2m       ; (p) load x[2m+1]:x[2m]
||[!B_lx2mc]LDDW.D1   *A_w++,     A_si:A_co           ; (p) load si:co
||[!B_lx2mc]MPY .M2   1,          B_hafn2,  B_lx2mc   ; (p) reset load cntr
||[B_lx2iac]SUB .S2   B_lx2iac,   1,        B_lx2iac  ; (p) decr load cntr
||     ADDSP  .L1     A_x2ia,     A_rtemp,  A_x2ias   ; (e) x[2ia]=x[2ia]+rtemp
||     SUBSP  .L2X    A_x2iap1,   B_itemp,  B_x2mp1s  ; (e) x[2m+1]=x[2ia+1]-itemp
||[!A_stcnt]MPY .M1X  1,          B_n2,     A_stcnt   ; (e) reset store cntr
||     MV             A11,        A14                 ; preserve store ptr

       MPYSP  .M2X    A_co,       B_x2mp1,  B_p2      ; (p) p2=co*x[2m+1]
||     MV     .S1     A0,         A_x                 ; set the x[2ia] ptr
||     SHR    .S2     B_8n2,      1,        B_8n2     ; set B_8n2 for next
||     STW    .D1T1   A_x2ias,    *A14++              ; (e) store x[2ia]
||     STW    .D2T2   B_x2mp1s,   *B12[1]             ; (e) store x[2m+1]
||     INTSP  .L2     B_hafn2,         B5             ; use L unit in a strange way
||     SUBSP  .L1     A_x2ia,     A_rtemp,  A11       ; (e) x[2m]=x[2ia]-rtemp
||     MPYSP  .M1X    A_co,       B_x2m,    A_p1      ; (p) co*x[2m]

  [B_lx2mc]SUB.S2     B_lx2mc,    1,        B_lx2mc   ; decr load cntr
||[!B_lx2iac]MPY.M2   1,          B_hafn2,  B_lx2iac  ; reset load cntr
||     ADDSP  .L2X    A_x2iap1,   B_itemp,  B_x2iap1s ; x[2ia+1]=x[2ia+1]+itemp
||     STW    .D1     B_x2iap1s,  *A14++              ; store x[2ia+1]
||     STW    .D2     A_x2ms,     *B12++[2]           ; store x[2m]
||[A_stcnt]SUB.S1     A_stcnt,    1,        A_stcnt   ; decr store cntr

  [B_hafn2]LDDW.D1    *A_x++,     A_x2iap1:A_x2ia     ; (e) load x[2ia+1]:x[2ia]
||     MPYSP  .M1X    A_si,       B_x2mp1,  A_p3      ; (p) p3=si*x[2m+1]
||     MPYSP  .M2X    A_si,       B_x2m,    B_p4      ; (p) p4=si*x[2m]
||[!B_lx2mc]ADDAW.D2  B_x,        B_n2,     B_x       ; (p) incr ptr if required
||     ADDSP  .L1     A_p1,       A_p3,     A_rtemp   ; (p) rtemp=p1+p3
||     SUBSP  .L2     B_p2,       B_p4,     B_itemp   ; (p) itemp=p2-p4
||[!A_stcnt]ADD.S2    B12,        B9,       B12       ; (e) incr store ptr if required
||[!A_stcnt]ADD.S1    A14,        A_8n2,    A14       ; (e) incr store ptr if required

  [B_hafn2] LDDW.D2   *B_x++,     B_x2mp1:B_x2m       ; (p) load x[2m+1]:x[2m]
||[!B_lx2mc]LDDW.D1   *A_w++,     A_si:A_co           ; (p) load si:co
||[!B_lx2mc]MPY .M2   1,          B_hafn2,  B_lx2mc   ; (p) reset load cntr
||     ADDSP  .L1     A_x2ia,     A_rtemp,  A_x2ias   ; (p) x[2ia]=x[2ia]-rtemp
||     SUBSP  .L2X    A_x2iap1,   B_itemp,  B_x2mp1s  ; (p) x[2m+1]=x[2ia+1]-itemp
||[B_lx2iac]SUB.S2    B_lx2iac,   1,        B_lx2iac  ; decr load cntr
||[!A_stcnt]SHR.S1    A_8n2,      3,        A_stcnt   ; (e) reset store cntr
||     MPY    .M1X    B_n2,       4,        A15       ; generate incrment

       MPYSP  .M1X    A_co,       B_x2m,    A_p1      ; p1=co*x[2m]
||     MPYSP  .M2X    A_co,       B_x2mp1,  B_p2      ; p2=co*x[2m+1]
||[A_nby2]B      .S1     loop                         ; Branch next outer loop
||     STW    .D1T1   A_x2ias,    *A14++              ; store x[2ia]
||     STW    .D2T2   B_x2mp1s,   *B12[1]             ; store x[2m+1]
||     SPINT  .L2     B5,         B_n2                ; get B_n2 for next iteration
||     ADD    .S2     B14,        B_8n2,    B5        ; get store ptr
||[A_stcnt]SUB.L1     A_stcnt,    1,        A_stcnt   ; decr store cntr

  [B_lx2mc]SUB.S2     B_lx2mc,    1,        B_lx2mc   ; decr load cntr
||[!B_lx2iac]MPY.M2   1,          B_hafn2,  B_lx2iac  ; reset load cntr
||     SUBSP  .L1     A_x2ia,     A_rtemp,  A_x2ms    ; x[2m]=x[2ia]-rtemp
||     ADDSP  .L2X    A_x2iap1,   B_itemp,  B_x2iap1s ; p itemp3 = t3_1 - itemp1
||     STW    .D1     B_x2iap1s,  *A14++              ; store x[2ia+1]
||     STW    .D2     A11,        *B12++[2]           ; store x[2m]
||[A_nby2]MPY .M1X    B15,        1,        A_nby2    ; set loop counter
||[!B_lx2iac]ADD.S1   A_x,        A15,      A_x       ; incr load ptr

  [B_hafn2] LDDW.D1   *A_x++,     A_x2iap1:A_x2ia     ; (p) load x[2ia+1]:x[2ia]
||     MPYSP  .M1X    A_si,       B_x2mp1,  A_p3      ; (p) p3=si*x[2m+1]
||     MPYSP  .M2X    A_si,       B_x2m,    B_p4      ; (p) p4=si*x[2m]
||[!B_lx2mc]ADDAW.D2  B_x,        B_n2,     B_x       ; (p) incr ptr if required
||     ADDSP  .L1     A_p1,       A_p3,     A_rtemp   ; (p) rtemp=p1+p3
||     SUBSP  .L2     B_p2,       B_p4,     B_itemp   ; (p) itemp=p2-p4
||[!A_stcnt]ADD.S2    B12,        B9,       B12       ; (e) incr store ptr if required
||[!A_stcnt]ADD.S1    A14,        A_8n2,    A14       ; (e) incr store ptr if required

  [B_hafn2] LDDW.D2   *B_x++,     B_x2mp1:B_x2m       ; (p) load x[2m+1]:x[2m]
||[!B_lx2mc]LDDW.D1   *A_w++,     A_si:A_co           ; (p) load si:co
||[!B_lx2mc]MPY .M2   1,          B_hafn2,  B_lx2mc   ; (p) reset load cntr
||[B_lx2iac]SUB .S2   B_lx2iac,   1,        B_lx2iac  ; (p) x[2ia]=x[2ia]-rtemp
||     ADDSP  .L1     A_x2ia,     A_rtemp,  A_x2ias   ; (p) x[2m+1]=x[2ia+1]-itemp
||     SUBSP  .L2X    A_x2iap1,   B_itemp,  B_x2mp1s  ; x[2m+1]=x[2ia+1]-itemp
||     MPY    .M1X    4,          B_n2,     A_8n2     ; set A_8n2
||     MV     .S1     A0,         A11                 ; set load ptr

       MPYSP  .M1X    A_co,       B_x2m,    A_p1      ; p1=co*x[2m]
||     MPYSP  .M2X    A_co,       B_x2mp1,  B_p2      ; p2=co*x[2m+1]
||     SHR    .S2     B_hafn2,    1,        B_hafn2   ; for next outer loop
||     STW    .D1T1   A_x2ias,    *A14++              ; store x[2ia]
||     STW    .D2T2   B_x2mp1s,   *B12[1]             ; store x[2m+1]
||[A_nby2]B      .S1     loop                         ; branch

  [B_lx2mc]SUB .S2    B_lx2mc,    1,        B_lx2mc   ; decr load cntr
||[!B_lx2iac]MPY.M2   1,          B_n2,     B_lx2iac  ; reset load cntr
||     SUBSP  .L1     A_x2ia,     A_rtemp,  A_x2ms    ; x[2m]=x[2ia]-rtemp
||     ADDSP  .L2X    A_x2iap1,   B_itemp,  B_x2iap1s ; x[2ia+1]=x[2ia+1]-itemp
||     STW    .D1     B_x2iap1s,  *A14                ; store x[2ia+1]
||     STW    .D2     A_x2ms,     *B12                ; store x[2m]
||     MPY    .M1     A_stcnt,    0,        A_stcnt   ; reset store count
||[!B_lx2iac]ADD.S1   A_x,        A_8n2,    A_x       ; incr load ptr
****************************************************************************

       MVC    .S2     IRP,        B15

       MV     .S1X    B15,        A1
||     LDW    .D2T2   *B15[12],   B3

       LDW    .D2T1   *B15[0],    A10
||     LDW    .D1T2   *A1[13],    B10

       LDW    .D2T1   *B15[1],    A11
||     LDW    .D1T2   *A1[6],     B2

       LDW    .D2T1   *B15[3],    A12
||     LDW    .D1T2   *A1[2],     B1

       LDW    .D2T1   *B15[5],    A13
||     LDW    .D1T2   *A1[8],     B13

       LDW    .D2T1   *B15[7],    A14
||     LDW    .D1T2   *A1[10],    B14

       LDW    .D2T1   *B15[9],    A15
||     LDW    .D1T2   *A1[4],     B11
||     B      .S2     B3

       MVC    .S2     B2,         IRP
||     LDW    .D1T2   *A1[11],    B12

       NOP            2

       ADDAW          B15,        16,       B15

       MVC    .S2     B1,         CSR

                .end

* ======================================================================= *
*  End of file:  DSPF_sp_cfftr2_dit.asm                                   *
* ----------------------------------------------------------------------- *
*            Copyright (c) 2011 Texas Instruments, Incorporated.          *
*                           All Rights Reserved.                          *
* ======================================================================= *
                                 
