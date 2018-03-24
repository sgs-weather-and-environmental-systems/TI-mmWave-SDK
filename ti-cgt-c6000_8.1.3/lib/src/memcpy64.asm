;*****************************************************************************/
;* memcpy64  v8.1.3 - Memcpy for C6400                                       */
;* 
;* Copyright (c) 1993-2017 Texas Instruments Incorporated
;* http://www.ti.com/ 
;* 
;*  Redistribution and  use in source  and binary forms, with  or without
;*  modification,  are permitted provided  that the  following conditions
;*  are met:
;* 
;*     Redistributions  of source  code must  retain the  above copyright
;*     notice, this list of conditions and the following disclaimer.
;* 
;*     Redistributions in binary form  must reproduce the above copyright
;*     notice, this  list of conditions  and the following  disclaimer in
;*     the  documentation  and/or   other  materials  provided  with  the
;*     distribution.
;* 
;*     Neither the  name of Texas Instruments Incorporated  nor the names
;*     of its  contributors may  be used to  endorse or  promote products
;*     derived  from   this  software  without   specific  prior  written
;*     permission.
;* 
;*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS
;*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT
;*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
;*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT
;*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT
;*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;* 
;*****************************************************************************/
;*
;* void *memcpy(void *restrict dst, const void *restrict src, unsigned int len)
;* {
;*   char *restrict s_p  = (char *)src;
;*   char *restrict d_p  = (char *)dst;
;*   int   loop          = len >> 3;
;*   int   i;
;*
;*   if (len & 1)      *d_p++ = *s_p++;
;*   if (len & 2)    { *d_p++ = *s_p++; *d_p++ = *s_p++; }
;*   if (len & 4)    { _mem4(d_p)  = _mem4(s_p);  d_p += 4; s_p += 4; }  
;*   if (loop == 1)   _memd8(d_p) = _memd8(s_p);   
;*
;*   if (loop >= 2)
;*       for (i = 0; i < loop; i++, d_p += 8, s_p += 8)
;*          _memd8(d_p) = _memd8(s_p);
;*
;*   return dst;
;* }
;*
;*****************************************************************************

           .if      .TMS320C6400 | .TMS320C6740 | .TMS320C6600
           .include "c60asm.i"
	   .if	    __TI_EABI__
	   .global  memcpy
	   .sect    ".text:memcpy"
	   .else
	   .global  _memcpy
	   .sect    ".text:_memcpy"
	   .endif
	   .clink

           .if .TMS320C64_PLUS | .TMS320C6740 | .TMS320C6600
	   .if	    __TI_EABI__
memcpy:    .asmfunc
	   .else
_memcpy:   .asmfunc
	   .endif


           AND     .D1     0x1,A6,A0         ; Byte 1 Predicate 
||         AND     .S1     0x2,A6,A1         ; Byte 2 Predicate 
||         MVK     .L1     1,A8              ; Parallel Load Offset

           ; begin Parallel loads

   [ A0]   LDB     .D2T1   *B4++,A3          ; Load Byte 1 
|| [ A0]   MVK     .S1     2,A8              ; Parallel Load Offset Update
||         MV      .L1X    B4,A9             ; Load Base Pointer Copy 

   [ A1]   LDB     .D2T2   *B4++(2),B5       ; Load Byte 2   
|| [ A1]   LDB     .D1T1   *+A9[A8],A9       ; Load Byte 3   
||         SHRU    .S2X    A6,0x3,B0         ; Load Counter Set Up 
||         AND     .S1     0x4,A6,A2         ; Word 1 Predicate

           ; end Parallel loads

   [ A2]   LDNW    .D2T1   *B4++(4),A16      ; Load Word 1 
||         MV      .D1     A4,A5             ; Set up Store Base Pointer
||         MV      .S1X    B0,A8             ; Save off Store Counter
||         MVK     .L2     1,B1              ; Parallel Store Offset

   [ B0]   LDNDW   .D2T1   *B4++(8),A7:A6    ; Load from Iteration 1 Peeled  
|| [ B0]   SUB     .S2     B0,1,B0           ; Load Counter Update
||         CMPLT   .L2     B0,0x3,B2         ; Are we done copying??

   [ B2]   RET     .S2     B3                ; Early Return From Function
|| [ B0]   LDNDW   .D2T2   *B4++(8),B17:B16  ; Load from Iteration 2 Peeled  
|| [ B0]   SUB     .L2     B0,1,B0           ; Load Counter Update

   [ A0]   STB     .D1T1   A3,*A5++          ; Store Byte 1
|| [ A0]   MVK     .D2     2,B1              ; Parallel Store Offset Update
||         MV      .L2X    A5,B2             ; Store Base Pointer Copy
||         MVC     .S2     B0,ILC            ; SPLOOP COUNTER Set Up

   [ A1]   STB     .D1T2   B5,*A5++(2)       ; Store Byte 2  
|| [ A1]   STB     .D2T1   A9,*+B2[B1]       ; Store Byte 3 
   
   [ A2]   STNW    .D1T1   A16,*A5++(4)      ; Store Word 1 
||         MV      .L1     A8,A0             ; Set up Store Counter

   [ A0]   STNDW   .D1T1   A7:A6,*A5++(8)    ; Store from Iteration 1 Peeled
|| [ A0]   SUB     .S1     A0,1,A0           ; Store Counter Update
   
           SPLOOP   2
|| [ A0]   STNDW   .D1T2   B17:B16,*A5++(8)  ; Store from Iteration 2 Peeled  

           ; RETURN OCCURS                   

;** -------KERNEL-------------------------------------------------------------*
LOOP:
           LDNDW   .D2T1   *B4++(8),A7:A6
           NOP             3
           NOP

           SPKERNEL 0,0
||         STNDW   .D1T1   A7:A6,*A5++(8)

;** -------EPILOG-------------------------------------------------------------*

           RETNOP  .S2     B3, 5
           ; RETURN  OCCURS                   
           .endasmfunc

           .else  ; !(.TMS32064_PLUS | .TMS320C6740 | .TMS320C6600) 

	   .if	    __TI_EABI__
memcpy:    .asmfunc
	   .else
_memcpy:   .asmfunc
	   .endif
        
           AND     .D1     0x1,A6,A0         ; Byte 1 Predicate 
||         AND     .S1     0x2,A6,A1         ; Byte 2 Predicate 
||         MVK     .L1     1,A8              ; Parallel Load Offset

   [ A0]   LDB     .D2T1   *B4++,A3          ; Load Byte 1 
|| [ A0]   MVK     .S1     2,A8              ; Parallel Load Offset Update
||         MV      .L1X    B4,A9             ; Load Base Pointer Copy 

   [ A1]   LDB     .D2T2   *B4++(2),B5       ; Load Byte 2   
|| [ A1]   LDB     .D1T1   *+A9[A8],A9       ; Load Byte 3   
||         SHRU    .S2X    A6,0x3,B0         ; Load Counter Set Up 
||         AND     .S1     0x4,A6,A2         ; Word 1 Predicate

   [ A2]   LDNW    .D2T1   *B4++(4),A16      ; Load Word 1 
||         MV      .D1     A4,A5             ; Set up Store Base Pointer
||         MV      .S1X    B0,A8             ; Save off Store Counter
||         MVK     .L2     1,B1              ; Parallel Store Offset

   [ B0]   LDNDW   .D2T1   *B4++(8),A7:A6    ; Load from Iteration 1 Peeled  
|| [ B0]   SUB     .S2     B0,1,B0           ; Load Counter Update
||         CMPLT   .L2     B0,0x3,B2         ; Are we done copying??

   [ B2]   RET     .S2     B3                ; Early Return From Function
|| [ B0]   LDNDW   .D2T2   *B4++(8),B17:B16  ; Load from Iteration 2 Peeled  
|| [ B0]   SUB     .L2     B0,1,B0           ; Load Counter Update

   [ A0]   STB     .D1T1   A3,*A5++          ; Store Byte 1
|| [ A0]   MVK     .S2     2,B1              ; Parallel Store Offset Update
||         MV      .L2X    A5,B2             ; Store Base Pointer Copy

   [ A1]   STB     .D1T2   B5,*A5++(2)       ; Store Byte 2  
|| [ A1]   STB     .D2T1   A9,*+B2[B1]       ; Store Byte 3 
   
   [ A2]   STNW    .D1T1   A16,*A5++(4)      ; Store Word 1 
||         MV      .L1     A8,A0             ; Set up Store Counter

   [ A0]   STNDW   .D1T1   A7:A6,*A5++(8)    ; Store from Iteration 1 Peeled
|| [ A0]   SUB     .S1     A0,1,A0           ; Store Counter Update
||         CMPGT   .L2     B0,3,B1           ; Loop Check
||         ZERO    .L1     A1                ; Collapsing Predicate
   
   [ A0]   STNDW   .D1T2   B17:B16,*A5++(8)  ; Store from Iteration 2 Peeled  
|| [ A0]   SUB     .S1     A0,1,A16          ; Store Counter Update
||         ZERO    .L1     A0                ; Collapsing Predicate
           ; RETURN OCCURS    
        
;** -------PROLOG-------------------------------------------------------------*
;** -------KERNEL-------------------------------------------------------------*
LOOP:

   [ B1]   B       .S2     LOOP              
|| [ B0]   SUB     .L2     B0,1,B0          ; Load Counter Update 
|| [ B0]   LDNDW   .D2T1   *B4++(8),A9:A8   ; Load  X1 

   [ A0]   SUB     .S1     A0,1,A0          ; Store Counter Update 
|| [ A0]   STNDW   .D1T1   A3:A2,*A5++(8)   ; Store X2

   [ B0]   SUB     .S2     B0,1,B0          ; Load Counter Update
|| [ B0]   LDNDW   .D2T1   *B4++(8),A3:A2   ; Load  X2

   [ A0]   SUB     .S1     A0,1,A0          ; Store Counter Update 
|| [ A0]   STNDW   .D1T1   A7:A6,*A5++(8)   ; Store X3 

   [ B0]   SUB     .S2     B0,1,B0          ; Load Counter Update 
|| [ B0]   LDNDW   .D2T1   *B4++(8),A7:A6   ; Load  X3
|| [!A1]   MV      .L1     A16,A0           ; Set up Store Counter

   [ A0]   SUB     .S1     A0,1,A0          ; Store Counter Update 
|| [ A0]   STNDW   .D1T1   A9:A8,*A5++(8)   ; Store X1 
||         CMPGT   .L2     B0,3,B1          ; Do we need to Loop anymore?
|| [!A1]   MVK     .L1     1,A1             ; Flip the collapsing predicate
;** -------EPILOG-------------------------------------------------------------*
           RETNOP  .S2     B3, 2   
   [ A0]   STNDW   .D1T1   A3:A2,*A5++(8)   ; Pipelining Epilog Store 
   [ A0]   SUB     .S1     A0,1,A0          ; Store Counter Update 
   [ A0]   STNDW   .D1T1   A7:A6,*A5++(8)   ; Pipelining Epilog Store
	   .endasmfunc
           
           .endif

           .endif
