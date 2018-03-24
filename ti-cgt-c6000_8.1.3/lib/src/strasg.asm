;******************************************************************************
;* strasg  v8.1.3                                                             *
;*                                                                            *
;* Copyright (c) 1998-2017 Texas Instruments Incorporated                     *
;* http://www.ti.com/                                                         *
;*                                                                            *
;*  Redistribution and  use in source  and binary forms, with  or without     *
;*  modification,  are permitted provided  that the  following conditions     *
;*  are met:                                                                  *
;*                                                                            *
;*     Redistributions  of source  code must  retain the  above copyright     *
;*     notice, this list of conditions and the following disclaimer.          *
;*                                                                            *
;*     Redistributions in binary form  must reproduce the above copyright     *
;*     notice, this  list of conditions  and the following  disclaimer in     *
;*     the  documentation  and/or   other  materials  provided  with  the     *
;*     distribution.                                                          *
;*                                                                            *
;*     Neither the  name of Texas Instruments Incorporated  nor the names     *
;*     of its  contributors may  be used to  endorse or  promote products     *
;*     derived  from   this  software  without   specific  prior  written     *
;*     permission.                                                            *
;*                                                                            *
;*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS     *
;*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT     *
;*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR     *
;*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT     *
;*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,     *
;*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT     *
;*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,     *
;*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY     *
;*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT     *
;*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE     *
;*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.      *
;*                                                                            *
;******************************************************************************
        .include c60asm.i

;******************************************************************************
;* TMS320C6x ANSI C Codegen                              Version 2.00         *
;* Date/Time created: Fri Feb 13 11:12:13 1998                                *
;******************************************************************************

; void _strasg(int *dst, const int *src, unsigned cnt)
; {
;     int i;
; 
;     cnt /= 4;
; 
;     _nassert(cnt >= 7);
; 
;     for (i=0;i<cnt;i++)
; 	*dst++ = *src++;
; }

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture        : TMS320C6200                                        *
;*   Endian              : Little                                             *
;*   Interrupt Threshold : Disabled                                           *
;*   Memory Model        : Small                                              *
;*   Speculative Load    : Threshold = 0                                      *
;*   Redundant Loops     : Enabled                                            *
;*   Pipelining          : Enabled                                            *
;*   Debug Info          : No Debug Info                                      *
;*                                                                            *
;******************************************************************************

FP	.set	A15
DP	.set	B14
SP	.set	B15

;******************************************************************************
;
; ACTIVE VERSION OF "strasg" . This version is interruptible
; GOING FORWARD IT REPLACES "strasg"
; "strasgi_64plus" is the more efficient but 64 plus specific version of strasg
;
;******************************************************************************

           .if .TMS320C64_PLUS | .TMS320C6740 | .TMS320C6600
           
	.sect	".text:__strasgi_64plus"
	.clink
	.global	__strasgi_64plus, __c6xabi_strasgi_64plus
        
__c6xabi_strasgi_64plus
__strasgi_64plus:  .asmfunc

           MV      .L1     A4, A30      ; Save dst
||         SHR     .S2X    A6,2,B31     ; Count / 4 

           MV      .L2     B4, B30      ; Save src
||         SUB     .S2     B31,4,B31    ; Adjust ILC due to SPLOOPD
           
           SPLOOPD   1                  ; Dynamic Length of 7
||         MVC     .S2     B31,ILC

;** -------KERNEL-------------------------------------------------------------*

           LDW   .D2T2    *B30++,B31    ; Grab from source
           
           NOP             4            ; Load Delay
           
           MV      .L1X    B31,A31      ; Move to the other side
           
           SPKERNEL 0,0                 ; 6 Cycles of Epilog Overlapped
||         STW   .D1T1     A31,*A30++   ; Dump to dest

;** -------EPILOG-------------------------------------------------------------*

           RETNOP  .S2     B3, 5
           ; RETURN  OCCURS                  
           
           .endasmfunc

           .endif

	.sect	".text:__strasgi"
	.clink
	.global	__strasgi, __c6xabi_strasgi
        
__c6xabi_strasgi
__strasgi:  .asmfunc

;** -----------PROLOG---------------------------------------------------------*

           LDW     .D2T2   *B4++,B2     ;            
||         SHR     .S2X    A6,2,B0      ;     
||         SHR     .S1     A6,2,A1      ;      
      
           LDW     .D2T2   *B4++,B5     ;            
||         MV      .L1     A4, A0       ; Save dst

           LDW     .D2T2   *B4++,B6     ;            

           LDW     .D2T2   *B4++,B7     ;             

           LDW     .D2T2   *B4++,B8     ;            
||         SUB     .S2     B0,6,B0      ;

           LDW     .D2T2   *B4++,B9     ;             
||         MV      .L1X    B2,A3        ;           
||         CMPGT   .L2     B0,6,B1      ; Do we need to Loop anymore?

;** -----------KERNEL---------------------------------------------------------*
LOOP:

   [ B1]   B       .S2     LOOP 
|| [ B0]   LDW     .D2T2   *B4++,B2     ;            
|| [ B0]   SUB     .L2     B0,1,B0      ;      
|| [ A1]   STW     .D1T1   A3,*A4++     ;      
|| [ A1]   SUB     .S1     A1,1,A1      ;    
||         MV      .L1X    B5,A5        ;           
      
   [ B0]   LDW     .D2T2   *B4++,B5     ;            
|| [ B0]   SUB     .S2     B0,1,B0      ;   
|| [ A1]   STW     .D1T1   A5,*A4++     ;      
|| [ A1]   SUB     .S1     A1,1,A1      ;   
||         MV      .L1X    B6,A6        ;           

   [ B0]   LDW     .D2T2   *B4++,B6     ;            
|| [ B0]   SUB     .S2     B0,1,B0      ;   
|| [ A1]   STW     .D1T1   A6,*A4++     ;      
|| [ A1]   SUB     .S1     A1,1,A1      ;
||         MV      .L1X    B7,A7        ;           

   [ B0]   LDW     .D2T2   *B4++,B7     ;            
|| [ B0]   SUB     .S2     B0,1,B0      ;   
|| [ A1]   STW     .D1T1   A7,*A4++     ;      
|| [ A1]   SUB     .S1     A1,1,A1      ;   
||         MV      .L1X    B8,A8        ;           

   [ B0]   LDW     .D2T2   *B4++,B8     ;            
|| [ B0]   SUB     .S2     B0,1,B0      ;   
|| [ A1]   STW     .D1T1   A8,*A4++     ;      
|| [ A1]   SUB     .S1     A1,1,A1      ;   
||         MV      .L1X    B9,A9        ;           

   [ B0]   LDW     .D2T2   *B4++,B9     ;            
|| [ B0]   SUB     .S2     B0,1,B0      ;   
|| [ A1]   STW     .D1T1   A9,*A4++     ;      
|| [ A1]   SUB     .S1     A1,1,A1      ;   
||         MV      .L1X    B2,A3        ;           
||         CMPGT   .L2     B0,6,B1      ; Do we need to Loop anymore?

;** -----------EPILOG---------------------------------------------------------*

           RET     .S2     B3
|| [ A1]   STW     .D1T2   B2,*A4++     ;      
|| [ A1]   SUB     .S1     A1,1,A1      ;   
      
   [ A1]   STW     .D1T2   B5,*A4++     ;      
|| [ A1]   SUB     .S1     A1,1,A1      ;   

   [ A1]   STW     .D1T2   B6,*A4++     ;      
|| [ A1]   SUB     .S1     A1,1,A1      ;   

   [ A1]   STW     .D1T2   B7,*A4++     ;      
|| [ A1]   SUB     .S1     A1,1,A1      ;   

   [ A1]   STW     .D1T2   B8,*A4++     ;      
|| [ A1]   SUB     .S1     A1,1,A1      ;   

   [ A1]   STW     .D1T2   B9,*A4       ;      
||         MV      .L1     A0, A4       ; Restore dst

        .endasmfunc

;******************************************************************************
; strasg IS BEING DEPRECATED. IT IS NOT INTERRUPTIBLE. REPLACED  WITH strasgi
;******************************************************************************
	.sect	".text:__strasg"
	.clink
	.global	__strasg

;******************************************************************************
;* FUNCTION NAME: __strasg                                                    *
;*                                                                            *
;*   Regs Modified     : A0,A3,B0,B4,B5,B6                                    *
;*   Regs Used         : A0,A3,A4,A6,B0,B3,B4,B5,B6                           *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
__strasg:  .asmfunc
;** --------------------------------------------------------------------------*
           MVC     .S2     CSR,B6       ; |9| 
||         MV      .L2X    A4,B4        ; |2| 
||         MV      .L1X    B4,A0        ; |2| 

           AND     .L2     -2,B6,B5     ; |9| 
||         SHR     .S2X    A6,2,B0      ; |9| 

           MVC     .S2     B5,CSR       ; |9| 
||         SUB     .L2     B0,6,B0      ; |9| 

;** --------------------------------------------------------------------------*
L2:        ; PIPED LOOP PROLOG

   [ B0]   SUB     .S2     B0,1,B0      ; |9| 
||         LDW     .D1T1   *A0++,A3     ; |10| 

   [ B0]   B       .S1     L3           ; |9| 
|| [ B0]   SUB     .S2     B0,1,B0      ;@ |9| 
||         LDW     .D1T1   *A0++,A3     ;@ |10| 

   [ B0]   B       .S1     L3           ;@ |9| 
|| [ B0]   SUB     .S2     B0,1,B0      ;@@ |9| 
||         LDW     .D1T1   *A0++,A3     ;@@ |10| 

   [ B0]   B       .S1     L3           ;@@ |9| 
|| [ B0]   SUB     .S2     B0,1,B0      ;@@@ |9| 
||         LDW     .D1T1   *A0++,A3     ;@@@ |10| 

   [ B0]   B       .S1     L3           ;@@@ |9| 
|| [ B0]   SUB     .S2     B0,1,B0      ;@@@@ |9| 
||         LDW     .D1T1   *A0++,A3     ;@@@@ |10| 

           MV      .L2X    A3,B5        ; |2| 
|| [ B0]   B       .S1     L3           ;@@@@ |9| 
|| [ B0]   SUB     .S2     B0,1,B0      ;@@@@@ |9| 
||         LDW     .D1T1   *A0++,A3     ;@@@@@ |10| 

;** --------------------------------------------------------------------------*
L3:        ; PIPED LOOP KERNEL

           STW     .D2T2   B5,*B4++     ; |10| 
||         MV      .L2X    A3,B5        ;@ |2| 
|| [ B0]   B       .S1     L3           ;@@@@@ |9| 
|| [ B0]   SUB     .S2     B0,1,B0      ;@@@@@@ |9| 
||         LDW     .D1T1   *A0++,A3     ;@@@@@@ |10| 

;** --------------------------------------------------------------------------*
L4:        ; PIPED LOOP EPILOG

           STW     .D2T2   B5,*B4++     ;@ |10| 
||         MV      .L2X    A3,B5        ;@@ |2| 
||         RET     .S2     B3           

           STW     .D2T2   B5,*B4++     ;@@ |10| 
||         MV      .L2X    A3,B5        ;@@@ |2| 

           STW     .D2T2   B5,*B4++     ;@@@ |10| 
||         MV      .L2X    A3,B5        ;@@@@ |2| 

           STW     .D2T2   B5,*B4++     ;@@@@ |10| 
||         MV      .L2X    A3,B5        ;@@@@@ |2| 

           STW     .D2T2   B5,*B4++     ;@@@@@ |10| 
||         MV      .L2X    A3,B5        ;@@@@@@ |2| 

           STW     .D2T2   B5,*B4++     ;@@@@@@ |10| 
||         MVC     .S2     B6,CSR       
        .endasmfunc

