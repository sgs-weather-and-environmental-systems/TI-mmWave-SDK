* ======================================================================== *
* MATHLIB -- TI Floating-Point Math Function Library                       *
*                                                                          *
*                                                                          *
* Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/   *
*                                                                          *
*                                                                          *
*  Redistribution and use in source and binary forms, with or without      *
*  modification, are permitted provided that the following conditions      *
*  are met:                                                                *
*                                                                          *
*    Redistributions of source code must retain the above copyright        *
*    notice, this list of conditions and the following disclaimer.         *
*                                                                          *
*    Redistributions in binary form must reproduce the above copyright     *
*    notice, this list of conditions and the following disclaimer in the   *
*    documentation and/or other materials provided with the                *
*    distribution.                                                         *
*                                                                          *
*    Neither the name of Texas Instruments Incorporated nor the names of   *
*    its contributors may be used to endorse or promote products derived   *
*    from this software without specific prior written permission.         *
*                                                                          *
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     *
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       *
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   *
*  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT    *
*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   *
*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        *
*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   *
*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   *
*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT     *
*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   *
*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    *
* ======================================================================== *

* ======================================================================= *
* log2sp.asm - single precision floating point log base 2                 *
*              optimized hand ASM single sample                           *
* ======================================================================= *


        .if     __TI_EABI__
           .asg    errno, _errno
           .asg    log2sp, _log2sp
        .endif

        .global _errno
	    .if (OVERRIDE_RTS = 1)
           .global _log2f
_log2f .set _log2sp
        .else
   	       .global _log2sp
	    .endif
;        .global log_table_asm      

     .data
log_table_asm:   .double  -0.1177830356 
                .double  -0.2231435513 
                .double  -0.3184537311 
                .double  -0.4054651081 
                .double  -0.4855078157 
                .double  -0.5596157879 
                .double  -0.6286086594      

    .sect	".text:optasm"

_log2sp_asm:

_log2sp
           SPDP    .S1     A4, A1:A0              ; (double) x
||         B       .S2     log_gen                ; B to common kernel
           MVKL    .S2     0x3FF71547, B1         ; 1/ln(2)
           MVKH    .S2     0x3FF71547, B1         ; 1/ln(2)
||         RCPDP   .S1     A1:A0,A7:A6            ; rcp = rcpdp((double) x)
           MVKL    .S2     0x652B82FE, B0         ; 1/ln(2)
           CLR     .S1     A7, 0x0, 0x10, A7      ; frcpax = _itod(_clr(_hi(rcp),0,16), 0)
           MVKH    .S2     0x652B82FE, B0         ; 1/ln(2)

_log10sp
;_log10f

           SPDP    .S1     A4,A1:A0               ; (double) x 
||         B       .S2     log_gen                ; B to common kernel
           MVKL    .S2     0x3FDBCB7B, B1         ; 1/ln(10)
           MVKH    .S2     0x3FDBCB7B, B1         ; 1/ln(10)
||         RCPDP   .S1     A1:A0,A7:A6            ; rcp = rcpdp((double) x)
           MVKL    .S2     0x1526E50E, B0         ; 1/ln(10)
           CLR     .S1     A7,0x0,0x10,A7         ; frcpax = _itod(_clr(_hi(rcp),0,16), 0) 
           MVKH    .S2     0x1526E50E, B0         ; 1/ln(10)

_logsp
;_logf
           SPDP    .S1     A4, A1:A0              ; (double) x           
           ZERO    .L2     B1:B0                  ; 1.0
           RCPDP   .S1     A1:A0, A7:A6           ; rcp = rcpdp((double) x)
           MVKH    .S2     0x3FF00000, B1         ; 1.0
           CLR     .S1     A7, 0x0, 0x10, A7      ; frcpax = _itod(_clr(_hi(rcp),0,16), 0)


log_gen:
           MPYDP   .M1     A1:A0, A7:A6, A1:A0    ; (double) x * frcpax
           ZERO    .L2     B7:B6                  ; 1.0
           MVKL    .S2     0x3fe62e42, B5         ; ln(2)
           MVKL    .S2     0xfefa39ec, B4         ; ln(2)
           EXTU    .S1     A7, 0x1, 0x15, A3      ; N = _extu(_hi(frcpax), 1, 21)
           ADDK    .S1     0xfffffc01, A3         ; N -= 1023
           INTDP   .L1     A3, A9:A8              ; (double) N
||         MVKH    .S2     0xfefa39ec, B4         ; ln(2)
           MVKH    .S2     0x3fe62e42, B5         ; ln(2)
           MVKH    .S2     0x3ff00000, B7         ; 1.0 
           SUBDP   .L2X    A1:A0, B7:B6, B7:B6    ; frcpax * x - 1.0 
||         MPYDP   .M1X    B5:B4, A9:A8, A9:A8    ; ln2 * double N
           MVKL    .S1     log_table_asm, A0       ; address of table
           EXTU    .S1     A7, 0xc, 0x1d, A1      ; get T_index
   [ A1]   ADD     .D1     0xffffffff, A1, A3     ; if(T_index) T_index--
           MVKH    .S1     log_table_asm, A0       ; address of table
   [ A1]   LDDW    .D1T1   *+A0[A3], A7:A6        ; get table entry
           MVKL    .S1     0x3e436580, A0         ; c2 = 0.1908169f
           DPSP    .L2     B7:B6, B5              ; r = (float) dr
   [!A1]   ZERO    .L1     A7:A6                  ; table entry would have been 0.0
           MVKL    .S2     0xbe6bd0fb, B2         ; c1 = -0.2302894f  
           MVKH    .S1     0x3e436580, A0         ; c2 = 0.1908169f    
           MPYSP   .M1X    A0, B5, A0             ; c2 * r
||         MPYSP   .M2     B5, B5, B4             ; r2 = r*r
           SUBDP   .L1     A7:A6, A9:A8, A7:A6    ; T[index] - ln2 * double N
           MVKL    .S2     0xbe804d67, B8         ; c3 = -0.2505905f     
           MVKH    .S2     0xbe6bd0fb, B2         ; c1 = -0.2302894f
           MVKH    .S2     0xbe804d67, B8         ; c3 = -0.2505905f    
           ADDSP   .L2X    A0, B8, B2             ; (c2 * r) + c3        
||         MPYSP   .M2     B2, B4, B8             ; c1 * r2      
           MPYSP   .M2     B5, B4, B9             ; r3 = r*r2 
           MVKL    .S2     0x3eaaa874, B5         ; c4 = 0.3333164f    
||         MPYDP   .M1X    A7:A6, B1:B0, A7:A6    ; (T[index] - ln2 * double N)*base
           MVKH    .S2     0x3eaaa874, B5         ; c4 = 0.3333164f  
           MPYSP   .M2     B4, B4, B2             ; r4 = r2*r2
||         ADDSP   .L2     B2, B8, B8             ; ((c2 * r) + c3)+(c1 * r2)
           EXTU    .S1     A4, 0x1, 0x18, A0      ; x's exponent  
           MVK     .S1     0xfe, A3               ; 29           
           MPYSP   .M2     B5, B9, B5             ; c4 * r3 
           MPYSP   .M2     B8, B2, B8             ; tmp = (((c2 * r) + c3)+(c1 * r2))*r4
           MPYDP   .M2     B7:B6, B1:B0, B7:B6    ; dr * base
           MVKL    .S1     0xbf000003, A5         ; c5 =-0.5000002f   
           MVKH    .S1     0xbf000003, A5         ; c5 =-0.5000002f
           ADDSP   .L2     B5, B8, B4             ; tmp = (c4*r3) + tmp
||         MPYSP   .M1X    A5, B4, A5             ; c5 * r2
           DPSP    .L2     B1:B0, B9              ; (float) base
||         CMPEQ   .L1     0x0,A0, A2             ; x's expo == 0 ?
           MVKL    .S1     _errno, A8             ; for error code
           MVKH    .S1     _errno, A8             ; for error code
           CMPGT   .L1     A0, A3, A1             ; x's exponent > 29 ? 
||         ADDSP   .L2X    A5, B4, B4             ; p = (c5 * r2)+ tmp
|| [ A1]   MVKL    .S2     0x42b17218, B8         ; 88.72284f  
           MVK     .S1     1, A9                  ; error code
   [ A1]   MVKH    .S2     0x42b17218, B8         ; 88.72284f 
           ADDDP   .L1X    A7:A6, B7:B6, A7:A6    ; tmpdp = (T[index]-ln2*(double) N)*base+dr*base
           MPYSP   .M2     B4, B9, B4             ; p * (float) base      
   [ A1]   MPYSP   .M2     B9, B8, B8             ; max = (float) base * 88.72284f    
|| [ A2]   MVKL    .S2     0xc2aeac50,B1          ; -87.33655f   
   [ A2]   MVKH    .S2     0xc2aeac50,B1          ; -87.33655f  
   [ A2]   MPYSP   .M2     B9, B1, B8             ; min = (float) base * -87.33655f
           SPDP    .S2     B4, B5:B4              ; (double)(p * (float) base)
           ADDDP   .L1     A7:A6, B5:B4, A7:A6    ; resdp = (double)(p * (float) base) + tmpdp
           SHRU    .S2X    A4, 0x1f, B2           ; (x < 0) ?
   [ B2]   STW     .D1     A9, *A8                ; for error code
||         MVKL    .S1     0xff7fffff, A9         ; 0xff7fffff
   [!B2]   CMPEQ   .L2X    0x0,A4, B2             ; (x == 0) ?
||         MVKH    .S1     0xff7fffff, A9         ; 0xff7fffff  
   [ B2]   MV      .S2X    A9, B8                 ; if(x<=0) return 0xff7fffff 
||         OR      .S1X    A1, B2, A0             ; max OR neg
           B       .S2     B3                     ; B to return
           OR      .S1     A0, A2, A1             ; (max OR neg) OR min
   [!A1]   DPSP    .L1     A7:A6, A4              ; result for normal case: res = (float) resdp
           MV      .S1X    B8, A5                 ; result for special case
           NOP                                    ; wait for DPSP
   [ A1]   MV      .D1     A5, A4                 ; result for special case



        .end

* ======================================================================== *
*  End of file: log2sp.asm                                                 *
* ======================================================================== *
