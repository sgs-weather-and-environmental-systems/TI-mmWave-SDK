* ======================================================================= *
* DSPF_sp_cfftr4_dif.asm -- Forward FFT with Radix 2 and DIF              *
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

        .sect ".text:optimized"
        .if __TI_EABI__
        .asg  DSPF_sp_cfftr4_dif, _DSPF_sp_cfftr4_dif
        .endif

        .global _DSPF_sp_cfftr4_dif
_DSPF_sp_cfftr4_dif:
       MVC    .S2     IRP,        B0
||     SUBAW  .D2     B15,        20,       B15
||     B      .S1     no_int                          ; disable interrupts       

       STW    .D2     B0,         *B15[0]
||     MVC    .S2     CSR,        B0

       ZERO   .D1     A3                              ; i1 = 0
||     SHR    .S2X    A6,         1,        B0        ; n2b = n >> 1
||     STW    .D2     B0,         *B15[1]
||     AND    .L2     B0,         -1,       B1        ; disable interrupts
||     MV     .S1X    B15,        A9    
       
       MV     .D1     A4,         A5                  ; ptr_y0 = ptr_x0
||     MV     .L1X    B0,         A0                  ; n2 = n2b
||     MV     .L2X    A6,         B2                  ; icntr = n
||     MVC    .S2     B1,         CSR
||     ADD    .D2     B4,         4,        B6        ; ptr_w1 = w + 4

       MV     .L2X    A9,         B9                  ; B9 = A9
||     MVK    .S1     2,          A7                  ; ie = 2
||     SHL    .S2     B2,         3,        B1        ; B1 = B2 << 3
||     STW    .D1     B3,         *A9[2]              ; f push B3

       MV     .L1     A7,         A1                  ; wcntr = ie
||     ADD    .L2X    A4,         4,        B4        ; ptr_x1 = ptr_x0 + 4
||     SUB    .S2     B1,         8,        B7        ; reset = B1 - 8
||     STW    .D1     A10,        *+A9[3]             ; f push A10
||     STW    .D2     B10,        *+B15[4]            ; f push B10

no_int:

       SUB    .L1X    B6,         4,        A6        ; ptr_w0 = ptr_w1 - 4
||     MV     .L2X    A7,         B1                  ; scntr = ie
||     MV     .D2     B4,         B5                  ; ptr_y1 = ptr_x1
||     STW    .D1     A15,        *+A9[5]             ; f push A15
||     MVC    .S2     B15,        IRP                 ; save SP

***************************** Prolog Begins **********************************

       LDW    .D1     *A4++[A0],  A8                  ; load rx0
||     LDW    .D2     *B4++[B0],  B8                  ; load ix0
||     MV     .S1     A9,         A10                 ; f A10 = A9
||     MV     .L2     B15,        B10                 ; f B10 = B9

       LDW    .D1     *A4++[A0],  A15                 ; load rx1
||     LDW    .D2     *B4++[B0],  B15                 ; load ix1

       LDW    .D1     *A4++[A0],  A9                  ; load rx2
||     LDW    .D2     *B4++[B0],  B9                  ; load ix2
||     MV     .L2X    A3,         B3                  ; i1b = i1

       LDW    .D1     *A4++[A0],  B10                 ; load rx3
||     LDW    .D2     *B4++[B0],  A10                 ; load ix3
||     SUB    .S1     A1,         2,        A1        ; if(wcntr) wcntr -= 2

  [!A1]SUB    .S1X    A4,         B7,       A4        ; if(!wcntr) ptr_x0 -= reset
||[!A1]SUB    .S2     B4,         B7,       B4        ; if(!wcntr) ptr_x1 -= reset
||     STW    .D1     A14,        *+A10[6]            ; f push A14
||     STW    .D2     B14,        *+B10[7]            ; f push B14

       STW    .D1     A13,        *+A10[8]            ; f push A13
||     STW    .D2     B13,        *+B10[9]            ; f push B13

       STW    .D1     A12,        *+A10[10]           ; f push A12
||     STW    .D2     B12,        *+B10[11]           ; f push B12

       SUBSP  .L1     A8,         A9,       A9        ; r3 = rx0 - rx2
||     SUBSP  .L2     B8,         B9,       B9        ; s3 = ix0 - ix2
||     STW    .D1     A11,        *+A10[12]           ; f push A11
||     STW    .D2     B11,        *+B10[13]           ; f push B11

oloop:
       SUBSP  .L1X    B15,        A10,      A8        ; s4 = ix1 - ix3
||     SUBSP  .L2X    A15,        B10,      B8        ; r4 = rx1 - rx3

       SUB    .S1X    B2,         4,        A2        ; lcntr = icntr - 4

       ADDSP  .L1     A8,         A9,       A11       ; r1 = rx0 + rx2
||     ADDSP  .L2     B8,         B9,       B11       ; s1 = ix0 + ix2

       LDW    .D1     *++A6[A3],  A10                 ; load co1
||     LDW    .D2     *++B6[B3],  B10                 ; load si1

       LDW    .D1     *++A6[A3],  A13                 ; load co2
||     LDW    .D2     *++B6[B3],  B13                 ; load si2
||     ADDSP  .L1X    A15,        B10,      A12       ; r2 = rx1 + rx3
||     ADDSP  .L2X    B15,        A10,      B12       ; s2 = ix1 + ix3

       LDW    .D1     *+A6[A3],   A12                 ; load co3
||     LDW    .D2     *+B6[B3],   B12                 ; load si3
||     SHL    .S1     A3,         3,        A13       ; tmp = i1 << 3

  [A2] LDW    .D1     *A4++[A0],  A8                  ; @ if(lcntr) load rx0
||[A2] LDW    .D2     *B4++[B0],  B8                  ; @ if(lcntr) load ix0
||     ADDSP  .L1     A9,         A8,       A11       ; r1a = r3 + s4
||     SUBSP  .L2     B9,         B8,       B11       ; s1a = s3 - r4
||     SUB    .S1     A6,         A13,      A6        ; ptr_w0 -= tmp
||     SUB    .S2X    B6,         A13,      B6        ; ptr_w1 -= tmp

  [A2] LDW    .D1     *A4++[A0],  A15                 ; @ if(lcntr) load rx1
||[A2] LDW    .D2     *B4++[B0],  B15                 ; @ if(lcntr) load ix1
||[!A1]ADD    .S1     A3,         A7,       A3        ; if(!wcntr) i1 += ie

  [A2] LDW    .D1     *A4++[A0],  A9                  ; @ if(lcntr) load rx2
||[A2] LDW    .D2     *B4++[B0],  B9                  ; @ if(lcntr) load ix2
||     SUBSP  .L1     A11,        A12,      A11       ; r2a = r1 - r2
||     SUBSP  .L2     B11,        B12,      B11       ; s2a = s1 - s2
||[!A1]MV     .S1     A7,         A1                  ; if(!wcntr) wcntr = ie
||     MV     .S2X    A3,         B3                  ; @ i1b = i1

  [A2] LDW    .D1     *A4++[A0],  B10                 ; @ if(lcntr) load rx3
||[A2] LDW    .D2     *B4++[B0],  A10                 ; @ if(lcntr) load ix3
||     ADDSP  .L1     A11,        A12,      A14       ; ry0 = r1 + r2
||     ADDSP  .L2     B11,        B12,      B14       ; iy0 = s1 + s2
||[A1] SUB    .S1     A1,         2,        A1        ; @ if(wcntr) wcntr -= 2

       SUBSP  .L1     A9,         A8,       A13       ; r3a = r3 - s4
||     ADDSP  .L2     B9,         B8,       B13       ; s3a = s3 + r4
||     MPYSP  .M1     A11,        A10,      A11       ; p0_1 = r1a * co1
||     MPYSP  .M2     B11,        B10,      B11       ; p1_1 = s1a * si1
||[!A1]SUB    .S1X    A4,         B7,       A4        ; @ if(!wcntr) ptr_x0 -= reset
||[!A1]SUB    .S2     B4,         B7,       B4        ; @ if(!wcntr) ptr_x1 -= reset

       MPYSP  .M1X    A11,        B10,      A14       ; p3_1 = r1a * si1
||     MPYSP  .M2X    B11,        A10,      B14       ; p2_1 = s1a * co1

       MPYSP  .M1     A11,        A13,      A11       ; p0_2 = r2a * co2
||     MPYSP  .M2     B11,        B13,      B11       ; p1_2 = s2a * si2

**** Loop Begins ***************************************************************

loop:
       SUBSP  .L1     A8,         A9,       A9        ; @ r3 = rx0 - rx2
||     SUBSP  .L2     B8,         B9,       B9        ; @ s3 = ix0 - ix2
||     MPYSP  .M1X    A11,        B13,      A8        ; p3_2 = r2a * si2
||     MPYSP  .M2X    B11,        A13,      B8        ; p2_2 = s2a * co2
||[!B1]SUB    .S1     A5,         A10,      A5        ; if(!scntr) ptr_y0 -= reset_a
||[!B1]SUB    .S2     B5,         B7,       B5        ; if(!scntr) ptr_y1 -= reset

       SUBSP  .L1X    B15,        A10,      A8        ; @ s4 = ix1 - ix3
||     SUBSP  .L2X    A15,        B10,      B8        ; @ r4 = rx1 - rx3
||     MPYSP  .M1     A13,        A12,      A12       ; p0_3 = r3a * co3
||     MPYSP  .M2     B13,        B12,      B12       ; p1_3 = s3a * si3
||     STW    .D1     A14,        *A5++[A0]           ; store ry0
||     STW    .D2     B14,        *B5++[B0]           ; store iy0

       ADDSP  .L1X    A11,        B11,      A15       ; ry1 = p0_1 + p1_1
||     SUBSP  .L2X    B14,        A14,      B15       ; iy1 = p2_1 - p3_1
||[A2] SUB    .S1     A2,         4,        A2        ; if(lcntr) lcntr -= 4

       ADDSP  .L1     A8,         A9,       A11       ; @ r1 = rx0 + rx2
||     ADDSP  .L2     B8,         B9,       B11       ; @ s1 = ix0 + ix2
||     MPYSP  .M1X    A13,        B12,      A10       ; p3_3 = r3a * si3
||     MPYSP  .M2X    B13,        A12,      B10       ; p2_3 = s3a * co3

       LDW    .D1     *++A6[A3],  A10                 ; @ load co1
||     LDW    .D2     *++B6[B3],  B10                 ; @ load si1
||     ADDSP  .L1X    A11,        B11,      A14       ; ry2 = p0_2 + p1_2
||     SUBSP  .L2X    B8,         A8,       B14       ; iy2 = p2_2 - p3_2

       LDW    .D1     *++A6[A3],  A13                 ; @ load co2
||     LDW    .D2     *++B6[B3],  B13                 ; @ load si2
||     ADDSP  .L1X    A15,        B10,      A12       ; @ r2 = rx1 + rx3
||     ADDSP  .L2X    B15,        A10,      B12       ; @ s2 = ix1 + ix3
||[B2] SUB    .S2     B2,         4,        B2        ; if(icntr) icntr -= 4

       LDW    .D1     *+A6[A3],   A12                 ; @ load co3
||     LDW    .D2     *+B6[B3],   B12                 ; @ load si3
||[!B1]MV     .S2X    A7,         B1                  ; if(!scntr) scntr = ie
||     SHL    .S1     A3,         3,        A13       ; @ tmp = i1 << 3

  [A2] LDW    .D1     *A4++[A0],  A8                  ; @@ if(lcntr) load rx0
||[A2] LDW    .D2     *B4++[B0],  B8                  ; @@ if(lcntr) load ix0
||     ADDSP  .L1     A9,         A8,       A11       ; @ r1a = r3 + s4
||     SUBSP  .L2     B9,         B8,       B11       ; @ s1a = s3 - r4
||     SUB    .S1     A6,         A13,      A6        ; @ ptr_w0 -= tmp
||     SUB    .S2X    B6,         A13,      B6        ; @ ptr_w1 -= tmp

  [A2] LDW    .D1     *A4++[A0],  A15                 ; @@ if(lcntr) load rx1
||[A2] LDW    .D2     *B4++[B0],  B15                 ; @@ if(lcntr) load ix1
||     ADDSP  .L1X    A12,        B12,      A9        ; ry3 = p0_3 + p1_3
||     SUBSP  .L2X    B10,        A10,      B9        ; iy3 = p2_3 - p3_3
||[!A1]ADD    .S1     A3,         A7,       A3        ; @ if(!wcntr) i1 += ie
||[B2] B      .S2     loop                            ; if(icntr) branch to LOOP

  [A2] LDW    .D1     *A4++[A0],  A9                  ; @@ if(lcntr) load rx2
||[A2] LDW    .D2     *B4++[B0],  B9                  ; @@ if(lcntr) load ix2
||     SUBSP  .L1     A11,        A12,      A11       ; @ r2a = r1 - r2
||     SUBSP  .L2     B11,        B12,      B11       ; @ s2a = s1 - s2
||[!A1]MV     .S1     A7,         A1                  ; @ if(!wcntr) wcntr = ie
||     MV     .S2X    A3,         B3                  ; @@ i1b = i1

  [A2] LDW    .D1     *A4++[A0],  B10                 ; @@ if(lcntr) load rx3
||[A2] LDW    .D2     *B4++[B0],  A10                 ; @@ if(lcntr) load ix3
||     ADDSP  .L1     A11,        A12,      A14       ; @ ry0 = r1 + r2
||     ADDSP  .L2     B11,        B12,      B14       ; @ iy0 = s1 + s2
||[A1] SUB    .S1     A1,         2,        A1        ; @@ if(wcntr) wcntr -= 2

       SUBSP  .L1     A9,         A8,       A13       ; @ r3a = r3 - s4
||     ADDSP  .L2     B9,         B8,       B13       ; @ s3a = s3 + r4
||     MPYSP  .M1     A11,        A10,      A11       ; @ p0_1 = r1a * co1
||     MPYSP  .M2     B11,        B10,      B11       ; @ p1_1 = s1a * si1
||     STW    .D1     A15,        *A5++[A0]           ; store ry1
||     STW    .D2     B15,        *B5++[B0]           ; store iy1
||[!A1]SUB    .S1X    A4,         B7,       A4        ; @@ if(!wcntr) ptr_x0 -= reset
||[!A1]SUB    .S2     B4,         B7,       B4        ; @@ if(!wcntr) ptr_x1 -= reset

       MPYSP  .M1X    A11,        B10,      A14       ; @ p3_1 = r1a * si1
||     MPYSP  .M2X    B11,        A10,      B14       ; @ p2_1 = s1a * co1
||     STW    .D1     A14,        *A5++[A0]           ; store ry2
||     STW    .D2     B14,        *B5++[B0]           ; store iy2

       MPYSP  .M1     A11,        A13,      A11       ; @ p0_2 = r2a * co2
||     MPYSP  .M2     B11,        B13,      B11       ; @ p1_2 = s2a * si2
||     STW    .D1     A9,         *A5++[A0]           ; store ry3
||     STW    .D2     B9,         *B5++[B0]           ; store iy3
||[B1] SUB    .S2     B1,         2,        B1        ; if(scntr) scntr -= 2
||     MV     .S1X    B7,         A10                 ; reset_a = reset
**** Loop Ends *****************************************************************
       SHL    .S1     A0,         2,        A3        ; o A3 = n2 << 2
||     SHR    .S2     B0,         2,        B0        ; o n2b >> 2
||     SUB    .D1     A5,         A10,      A5        ; o ptr_y0 -= reset_a
||     SUB    .D2     B5,         B7,       B5        ; o ptr_y1 -= reset

  [B0] SUB    .D1     A5,         A3,       A4        ; o if(n2b)    ptr_x0 = ptr_y0 - A3
||[B0] SUB    .S2X    B5,         A3,       B4        ; o if(n2b)    ptr_x1 = ptr_y1 - A3
||[B0] MV     .S1X    B0,         A0                  ; o if(n2b)    n2 = n2b
||[B0] ZERO   .D2     B3                              ; o if(n2b)    i1b = 0

  [B0] MV     .L1     A4,         A5                  ; o if(n2b)    ptr_y0 = ptr_x0
||[B0] MV     .L2     B4,         B5                  ; o if(n2b)    ptr_y1 = ptr_x1
||[B0] SHL    .S1     A7,         2,        A7        ; o if(n2b)    ie << 2
||[B0] LDW    .D1     *A4++[A0],  A8                  ; p if(n2b)    load rx0
||[B0] LDW    .D2     *B4++[B0],  B8                  ; p if(n2b)    load ix0

  [B0] MV     .S2X    A7,         B1                  ; o if(n2b)    scntr = ie
||[B0] ZERO   .S1     A3                              ; o if(n2b)    i1 = 0
||[B0] MV     .L1     A7,         A1                  ; o if(n2b)    wcntr = ie
||[B0] LDW    .D1     *A4++[A0],  A15                 ; p if(n2b)    load rx1
||[B0] LDW    .D2     *B4++[B0],  B15                 ; p if(n2b)    load ix1

  [B0] MPY    .M2X    A7,         B0,       B2        ; o if(n2b)    icntr = ie * n2b = n
||[B0] B      .S1     oloop                           ; o if(n2b)    branch to OLOOP
||[B0] LDW    .D1     *A4++[A0],  A9                  ; p if(n2b)    load rx2
||[B0] LDW    .D2     *B4++[B0],  B9                  ; p if(n2b)    load ix2
||[!B0]MVC    .S2     IRP,        B15                 ; f if(!n2b)   B6 = ptr_stack

  [B0] LDW    .D1     *A4++[A0],  B10                 ; p if(n2b)    load rx3
||[B0] LDW    .D2     *B4++[B0],  A10                 ; p if(n2b)    load ix3
||[B0] SUB    .S1     A1,         2,        A1        ; p if(wcntr)  wcntr -= 2

  [!B0]LDW    .D2     *B15[2],    B3                  ; f if(!n2b)   pop B3
||[!B0]MV     .L1     B15,        A6                  ; f if(!n2b)   A6 = B6

  [!B0]LDW    .D1     *+A6[5],    A15                 ; f if(!n2b)   pop A15
||[!B0]LDW    .D2     *+B15[1],   B1                  ; f if(!n2b)   pop CSR
||[!A1]SUB    .S1X    A4,         B7,       A4        ; p if(!wcntr) ptr_x0 -= reset
||[!A1]SUB    .S2     B4,         B7,       B4        ; p if(!wcntr) ptr_x1 -= reset

  [!B0]LDW    .D1     *+A6[6],    A14                 ; f if(!n2b)   pop A14
||[!B0]LDW    .D2     *+B15[7],    B14                 ; f if(!n2b)   pop B14

  [B0] SUBSP  .L1     A8,         A9,       A9        ; p if(n2b)    r3 = rx0 - rx2
||[B0] SUBSP  .L2     B8,         B9,       B9        ; p if(n2b)    s3 = ix0 - ix2
||[!B0]LDW    .D1     *+A6[8],    A13                 ; f if(!n2b)   pop A13
||[!B0]LDW    .D2     *+B15[9],    B13                 ; f if(!n2b)   pop B13

* Outer Loop Ends **************************************************************

       LDW    .D1     *+A6[10],    A12                 ; f pop A12
||     LDW    .D2     *+B15[11],   B12                 ; f pop B12

       LDW    .D1     *+A6[12],    A11                 ; f pop A11
||     LDW    .D2     *+B15[13],   B11                 ; f pop B11


       LDW    .D1     *+A6[3],     A10                 ; f pop A10
||     LDW    .D2     *+B15[4],    B10                 ; f pop B10
||     MVC    .S2     B1,          CSR                 ; restore CSR

       LDW    .D2     *B15[0],     B1
||     B      .S2     B3                              ; f return

       NOP            3                                ; f wait for return and LDWs
       
       ADDAW          B15,         20,        B15
       
       MVC    .S2     B1,          IRP

                .end

* ======================================================================= *
*  End of file:  DSPF_sp_cfftr4_dif.asm                                   *
* ----------------------------------------------------------------------- *
*            Copyright (c) 2011 Texas Instruments, Incorporated.          *
*                           All Rights Reserved.                          *
* ======================================================================= *
                                 
