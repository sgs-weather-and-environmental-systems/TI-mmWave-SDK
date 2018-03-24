;******************************************************************************
;* LL_DIV16.ASM  - 16 BIT STATE -  v16.9.6                                    *
;*                                                                            *
;* Copyright (c) 1995-2017 Texas Instruments Incorporated                     *
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

;****************************************************************************
;* LL$DIV/LL$MOD - DIVIDE TWO SIGNED 64 BIT NUMBERS.
;*
;****************************************************************************
;*
;*   o DIVIDEND IS IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*   o DIVISOR IS IN r2:r3  (r3:r2 IF LITTLE ENDIAN)
;*
;*   o QUOTIENT IS PLACED IN r2:r3  (r3:r2 IF LITTLE ENDIAN)
;*   o REMAINDER IS PLACED IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*
;*   o DIVIDE BY ZERO RETURNS ZERO
;*   o SIGN OF REMAINDER IS THE SIGN OF THE DIVIDEND
;*
;****************************************************************************

	.if !__TI_ARM_V6M0__

	.thumb
	.clink
	
        .global LL_MOD

	.if __TI_ARM9ABI_ASSEMBLER
	.thumbfunc LL$DIV, LL$MOD
	.endif

	.global LL$DIV
	.global LL$MOD 
LL$DIV:	
LL$MOD: .asmfunc stack_usage(4)
        PUSH {lr}
	NOP
	BX  pc		        ; Change to 32-bit state
	NOP
	.align
	.arm
	BL  LL_MOD              ; and call 32-bit DIV/MOD routine.
	ADD lr, pc, #0x1        
	BX  lr
	.thumb
	POP {pc}

	.endasmfunc
	.endif                          ; !__TI_ARM_V6M0__

;****************************************************************************
;*
;*   This is an actually-16-bit version derived from the t2 version for v6m0
;*  
;*   o DIVIDEND IS IN r0:r1  (r1:r0 IN LITTLE ENDIAN MODE)
;*   o DIVISOR IS IN r2:r3   (r3:r2 IN LITTLE ENDIAN MODE)
;*
;*   o QUOTIENT IS PLACED IN r2:r3   (r3:r2 IN LITTLE ENDIAN MODE)
;*   o REMAINDER IS PLACED IN r0:r1  (r1:r0 IN LITTLE ENDIAN MODE)
;*
;*   o DIVIDE BY ZERO RETURNS ZERO
;*   o SIGN OF REMAINDER IS THE SIGN OF THE DIVIDEND
;*
;*   o EABI MODE, QUOTIENT, REMAINDER REGISTERS SWAPPED
;*   o EABI MODE, DIVIDE BY ZERO RETURNS
;*   	- 0 IF DIVIDEND == 0
;*   	- LLONG_MAX IF DIVIDEND > 0
;*   	- LLONG_MIN IF DIVIDEND < 0
;*
;****************************************************************************
	
        .if __TI_ARM_V6M0__

	.thumb

        .if __TI_EABI_ASSEMBLER                     ; ASSIGN EXTERNAL NAMES 
	.ref __aeabi_ldiv0
        .asg __aeabi_ldivmod, __TI_LL$DIV           ; BASED ON RTS BEING BUILT
        .else
	.clink
        .asg LL$DIV, __TI_LL$DIV
        .endif

	.if .TMS470_LITTLE

dvnd_hi .set    r1                                  ; HIGH WORD OF DIVIDEND
dvnd_lo .set    r0                                  ; LOW WORD OF DIVIDEND
idvs_hi .set    r3				    ; HIGH WORD OF DIVISOR
idvs_lo .set    r2				    ; LOW WORD OF DIVISOR

rq_hi   .set    r3			  	    ; HIGH WORD OF RESULT QUO
rq_lo   .set    r2			  	    ; LOW WORD OF RESULT QUO
rr_hi   .set    r1				    ; HIGH WORD OF RESULT REM
rr_lo   .set    r0				    ; LOW WORD OF RESULT REM

	.else

dvnd_hi .set    r0                                  ; HIGH WORD OF DIVIDEND
dvnd_lo .set    r1                                  ; LOW WORD OF DIVIDEND
idvs_hi .set    r2				    ; HIGH WORD OF DIVISOR
idvs_lo .set    r3				    ; LOW WORD OF DIVISOR

rq_hi   .set    r2			  	    ; HIGH WORD OF RESULT QUO
rq_lo   .set    r3			  	    ; LOW WORD OF RESULT QUO
rr_hi   .set    r0				    ; HIGH WORD OF RESULT REM
rr_lo   .set    r1				    ; LOW WORD OF RESULT REM

	.endif


q_hi    .set    LR                                  ; HIGH WORD OF QUOTIENT
q_lo    .set    r9                                  ; LOW WORD OF QUOTIENT
dvsr_hi .set    r4                                  ; HIGH WORD OF DIVISOR COPY
dvsr_lo .set    r5                                  ; LOW WORD OF DIVISOR COPY
tmp_hi  .set    r6                                  ; HIGH WORD OF TEMP
tmp_lo  .set    r7                                  ; LOW WORD OF TEMP
sign    .set    r8                                  ; SAVED COPY OF SIGNS

        .if !__TI_EABI_ASSEMBLER                    ; RT-ABI DOES NOT USE MOD
	.thumbfunc LL$MOD
	.global LL$MOD
LL$MOD:	
        .endif

	.thumbfunc __TI_LL$DIV
	.global __TI_LL$DIV
__TI_LL$DIV:	 .asmfunc stack_usage(28)
        PUSH	  {r4-r7, lr} 
        MOV       r4, r8
        MOV       r5, r9
        PUSH      {r4, r5}

        CMP       idvs_hi, #0                       ; CHECK IF DVSR IS 0
	BNE       $nonzero_dvsr
        CMP       idvs_lo, #0
        BNE       $nonzero_dvsr

	.if __TI_EABI_ASSEMBLER

	; ARM EABI Run-time ABI says when dividing by zero, this
	; function must call __aeabi_ldiv0 with an argument depending
	; on the value of the dividend: LLONG_MIN for negative,
	; LLONG_MAX for positive, and 0 for 0 dividend.

	; For EABI, the quotient and remainder are swapped, so while
	; we're apparently  writing to R, we're treating it as Q.
	; Q [rr_hi:rr_lo], R [rq_hi:rq_lo]

	CMP	  dvnd_hi, #0			    ; IF DVND < 0
	BGE	  $dvnd_nonneg
	MOVS	  rr_lo, #0			    ; THEN Q=LLONG_MIN
	MOVS	  rr_hi, #0x80
	B         $revbytes

$dvnd_nonneg:
	MOVS	  tmp_lo, dvnd_hi		    ; ELSE IF DVND != 0
	ORRS	  tmp_lo, dvnd_lo
	BEQ	  $revbytes

        MOVS      rr_lo, #0			    ; THEN Q=LLONG_MAX
        MVNS      rr_lo, rr_lo 
        MOVS      rr_hi, #0x80
	MVNS	  rr_hi, rr_hi

	; ELSE DVND == 0, so Q=R=0.
        ; Q==0 IF DVND==0 (BOTH USE THE SAME REGISTERS)
	; R==0 IF DVSR==0 (BOTH USE THE SAME REGISTERS)

$revbytes:
        REV       rr_hi, rr_hi ; The 0x80 belongs in the most significant byte
        
$call_ldiv0
	BL	  __aeabi_ldiv0
        POP       {r4, r5}
        MOV       r8, r4
        MOV       r9, r5
        POP       {r4-r7, pc}                  ;
	.else
        MOVS      rr_lo, #0                         ; IF DVSR IS 0,
        MOVS      rr_hi, #0                         ; RETURN Q=0, R=0
        POP       {r4, r5}
        MOVS      r8, r4
        MOVS      r9, r5
        POP       {r4-r7, pc}                  ;
        .endif

$nonzero_dvsr:
        ; STORE THE SIGN OF REMAINDER WHICH IS THE SIGN OF THE DIVIDEND IN 
        ; BIT 31 OF SIGN. AND STORE THE SIGN OF THE QUOTIENT WHICH IS SIGN
        ; OF DIVISOR XORED WITH SIGN OF DIVIDEND IN BIT 30 OF SIGN.

        MOV       tmp_lo, sign
        LSRS      tmp_lo, idvs_hi, #1               ; 
        ASRS      tmp_hi, dvnd_hi, #1
        EORS      tmp_lo, tmp_hi                    ;
        MOV       sign, tmp_lo
        BPL       $pos_dvnd                         ; 
	MOVS	  tmp_hi, #0
        RSBS      dvnd_lo, dvnd_lo, #0              ; DVND = ABS(DVND)
        SBCS      tmp_hi, dvnd_hi                   ;
        MOVS      dvnd_hi, tmp_hi
$pos_dvnd:
        MOVS      tmp_hi, #0
        MOV       q_lo, tmp_hi                      ; INITIALIZE THE QUOTIENT
        MOVS      tmp_lo, #0x80
        REV       tmp_lo, tmp_lo
        ANDS      tmp_lo, idvs_hi
        MOV       q_hi, tmp_lo
        BEQ       $pos_dvsr                         ;
        RSBS      idvs_lo, idvs_lo, #0              ; DVSR = ABS(DVSR)
        SBCS      tmp_hi, idvs_hi                   ;
        MOVS      idvs_hi, tmp_hi
$pos_dvsr:
        CPY       dvsr_hi, idvs_hi                  ; MAKE A COPY OF THE   
        CPY       dvsr_lo, idvs_lo                  ; DIVISOR (R2:R3) INTO DVSR

        ; CALCULATE THE MAXIMUM DIVISOR SHIFT AMOUNT WITH PSEUDO BINARY SEARCH
        ; IF DVND >> 32 > DVSR THEN DVSR = DVSR << 32

        CMP       dvsr_hi, #0                       ; IF (DVSR_HI == 0 AND 
        BNE       $skip5
        CMP       dvsr_lo, dvnd_hi                  ;    DVSRLO < DVND_HI)
$skip5:
        BHI       $skip6
        MOVS      dvsr_hi, dvsr_lo                  ;    DVSR_HI = DVSRLO
        MOVS      dvsr_lo, #0                       ;    DVSR_LO = 0
$skip6:
        ; IF DVND >> 16 > DVSR THEN DVSR = DVSR << 16
        LSRS      tmp_lo, dvnd_lo, #16              ; SHIFT DVND BY 16 INTO
        LSLS      tmp_hi, dvnd_hi, #16
        ORRS      tmp_lo, tmp_hi                    ; TMP                   
        LSRS      tmp_hi, dvnd_hi, #16              ; 
        CMP       dvsr_hi, tmp_hi                   ; COMPARE DVSR WITH TMP
	
        BNE       $skip7
	CMP       dvsr_lo, tmp_lo                   ;
$skip7:
        BHI       $skip8
        LSLS      dvsr_hi, dvsr_hi, #16             ; SET DVSR = DVSR << 16
        LSRS      tmp_lo, dvsr_lo, #16
        ORRS      dvsr_hi, tmp_lo                   ;
        LSLS      dvsr_lo, dvsr_lo, #16             ;
$skip8:
        ; IF DVND >> 16 > DVSR THEN DVSR = DVSR << 16
        LSRS      tmp_lo, dvnd_lo, #8               ; SHIFT DVND BY 16 INTO
        LSLS      tmp_hi, dvnd_hi, #24
        ORRS      tmp_lo, tmp_hi                    ; TMP
        LSRS      tmp_hi, dvnd_hi, #8           ; 
        CMP       dvsr_hi, tmp_hi                   ; COMPARE DVSR WITH TMP

        BNE       $skip9
        CMP       dvsr_lo, tmp_lo                   ;
$skip9:
	
        BHI       $skip10
        LSLS      dvsr_hi, dvsr_hi, #8              ; SET DVSR = DVSR << 8
        LSRS      tmp_lo, dvsr_lo, #24
        ORRS      dvsr_hi, tmp_lo                   ;
        LSLS      dvsr_lo, dvsr_lo, #8              ;
$skip10:
        ; NOW FIND EXACTLY WHERE THE SHIFTED DIVISOR SHOULD BE SO THAT WE CAN
        ; JUMP INTO THE CORRECT LOCATION OF THE UNROLLED DIVIDE LOOP.
        LSRS      tmp_lo, dvnd_lo, #1               ;
        LSLS      tmp_hi, dvnd_hi, #31
        ORRS      tmp_lo, tmp_hi                    ;
        LSRS      tmp_hi, dvnd_hi, #1               ;
        CMP       dvsr_hi, tmp_hi                   ;

        BNE       $skip11
        CMP       dvsr_lo, tmp_lo                   ;
$skip11:
        BHI       mod1                              ;

        LSRS      tmp_lo, dvnd_lo, #2               ;
        LSLS      tmp_hi, dvnd_hi, #30
        ORRS      tmp_lo, tmp_hi                    ;
        LSRS      tmp_hi, dvnd_hi, #2               ;
        CMP       dvsr_hi, tmp_hi                   ;

        BNE       $skip12
        CMP       dvsr_lo, tmp_lo                   ;
$skip12:
        BHI       mod2                              ; BRANCHING INTO DIVIDE LOOP

        LSRS      tmp_lo, dvnd_lo, #3               ;
        LSLS      tmp_hi, dvnd_hi, #29
        ORRS      tmp_lo, tmp_hi                    ;
        LSRS      tmp_hi, dvnd_hi, #3               ;
        CMP       dvsr_hi, tmp_hi                   ;
	
        BNE       $skip13
        CMP       dvsr_lo, tmp_lo                   ;
$skip13:
        BHI       mod3                              ;

        LSRS      tmp_lo, dvnd_lo, #4               ;
        LSLS      tmp_hi, dvnd_hi, #28
        ORRS      tmp_lo, tmp_hi                    ;
        LSRS      tmp_hi, dvnd_hi, #4               ;
        CMP       dvsr_hi, tmp_hi                   ;
	
        BNE       $skip14
        CMP       dvsr_lo, tmp_lo                   ;
$skip14:
        BHI       mod4                              ;

        LSRS      tmp_lo, dvnd_lo, #5               ;
        LSLS      tmp_hi, dvnd_hi, #27
        ORRS      tmp_lo, tmp_hi                    ;
        LSRS      tmp_hi, dvnd_hi, #5               ;
        CMP       dvsr_hi, tmp_hi                   ;

        BNE       $skip15
        CMP       dvsr_lo, tmp_lo                   ;
$skip15:
        BHI       mod5                              ;

        LSRS      tmp_lo, dvnd_lo, #6               ;
        LSLS      tmp_hi, dvnd_hi, #26
        ORRS      tmp_lo, tmp_hi                    ;
        LSRS      tmp_hi, dvnd_hi, #6               ;
        CMP       dvsr_hi, tmp_hi                   ;
	
        BNE       $skip16
        CMP       dvsr_lo, tmp_lo                   ;
$skip16:
        BHI       mod6                              ;

        LSRS      tmp_lo, dvnd_lo, #7               ;
        LSLS      tmp_hi, dvnd_hi, #25
        ORRS      tmp_lo, tmp_hi                    ;
        LSRS      tmp_hi, dvnd_hi, #7               ;
        CMP       dvsr_hi, tmp_hi                   ;
	
        BNE       $skip17
        CMP       dvsr_lo, tmp_lo                   ;
$skip17:
        BHI       mod7                              ;

        ; THE DIVIDE LOOP IS UNROLLED 8 TIMES.
        ; IF DIVIDEND IS LARGER THAN DIVISOR, SHIFT A 1 INTO THE QUOTIENT
        ; AND SUBTRACT THE DIVISOR, ELSE SHIFT A 0 INTO THE QUOTIENT.
divll:
        LSLS      tmp_hi, dvsr_hi, #7               ; LEFT SHIFT DVSR BY 7 
        LSRS      tmp_lo, dvsr_lo, #25
        ORRS      tmp_hi, tmp_lo                    ; INTO TMP
        LSLS      tmp_lo, dvsr_lo, #7               ;
        CMP       dvnd_hi, tmp_hi                   ; IF (DVND >= TMP)      
        BNE       $skip18
        CMP       dvnd_lo, tmp_lo                   ; 
$skip18:
        BCC       $1                                ; 
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;    DVND = DVND - TMP
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$1:
        MOV       tmp_lo, q_lo                  ; SHIFT THE CARRY BIT DEFED
        MOV       tmp_hi, q_hi                  ; BY CMP OR SBCS INTO THE
        ADCS      tmp_lo, tmp_lo, tmp_lo                  ;
        ADCS      tmp_hi, tmp_hi, tmp_hi                  ;
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi
                                                    ; QUOTIENT

mod7:
        LSLS      tmp_hi, dvsr_hi, #6               ; UNROLLED LOOP 
        LSRS      tmp_lo, dvsr_lo, #26
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #6               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip19
        CMP       dvnd_lo, tmp_lo                   ;
$skip19:

        BCC       $2                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$2:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo, tmp_lo                  ;
        ADCS      tmp_hi, tmp_hi, tmp_hi                  ;
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi
        
mod6:
        LSLS      tmp_hi, dvsr_hi, #5               ;
        LSRS      tmp_lo, dvsr_lo, #27
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #5               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip20
        CMP       dvnd_lo, tmp_lo                   ;
$skip20:

        BCC       $3                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$3:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo, tmp_lo                  ;
        ADCS      tmp_hi, tmp_hi, tmp_hi                  ;
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi
        
mod5:
        LSLS      tmp_hi, dvsr_hi, #4               ;
        LSRS      tmp_lo, dvsr_lo, #28
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #4               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip21
        CMP       dvnd_lo, tmp_lo                   ;
$skip21:

        BCC       $4                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$4:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo, tmp_lo                  ;
        ADCS      tmp_hi, tmp_hi, tmp_hi                  ;
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi
        
mod4:
        LSLS      tmp_hi, dvsr_hi, #3               ;
        LSRS      tmp_lo, dvsr_lo, #29
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #3               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip22
        CMP       dvnd_lo, tmp_lo                   ;
$skip22:

        BCC       $5                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$5:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo, tmp_lo                  ;
        ADCS      tmp_hi, tmp_hi, tmp_hi                  ;
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi
        
mod3:
        LSLS      tmp_hi, dvsr_hi, #2               ;
        LSRS      tmp_lo, dvsr_lo, #30
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #2               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip23
        CMP       dvnd_lo, tmp_lo                   ;
$skip23:

        BCC       $6                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$6:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo, tmp_lo                  ;
        ADCS      tmp_hi, tmp_hi, tmp_hi                  ;
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi
        
mod2:
        LSLS      tmp_hi, dvsr_hi, #1               ;
        LSRS      tmp_lo, dvsr_lo, #31
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #1               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip24
        CMP       dvnd_lo, tmp_lo                   ;
$skip24:

        BCC       $7                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$7:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo, tmp_lo                  ;
        ADCS      tmp_hi, tmp_hi, tmp_hi                  ;
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi

mod1:
        CMP       dvnd_hi, dvsr_hi                  ;
        BNE       $skip25
        CMP       dvnd_lo, dvsr_lo                  ;
$skip25:
        
        BCC       $8                                ;
        SUBS      dvnd_lo, dvnd_lo, dvsr_lo         ;
        SBCS      dvnd_hi, dvnd_hi, dvsr_hi         ;
$8:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo, tmp_lo                  ;
        ADCS      tmp_hi, tmp_hi, tmp_hi                  ;
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi

        ; IF THERE IS SHIFTED DIVISOR, THEN UNSHIFT THE DIVISOR BY 8 AND
        ; CONTINUE THE LOOP
        CMP       idvs_hi, dvsr_hi                  ; 
        BNE       $skip26
        CMP       idvs_lo, dvsr_lo                  ;
$skip26:
        BCS       $skip27
        LSRS      dvsr_lo, dvsr_lo, #8              ;
        LSLS      tmp_lo, dvsr_hi, #24
        ORRS      dvsr_lo, tmp_lo                   ; 
        LSRS      dvsr_hi, dvsr_hi, #8              ;
        B         divll                             ;
$skip27:
        ; ELSE WE ARE DONE. 
	; PLACE THE QUOTIENT INTO rq_hi:rq_lo AND SET THE SIGN.
        ; rr_hi:rr_lo ALREADY CONTAINS THE REMAINDER; SET THE CORRECT SIGN.
        CPY       rq_hi, q_hi                       ;
        CPY       rq_lo, q_lo                       ;
        MOV       tmp_hi, sign                      ;
        MOVS      tmp_hi, tmp_hi
        BPL       $chk_q_sign                       ;

	MOVS  	  tmp_hi, #0
        RSBS      rr_lo, rr_lo, #0                  ;
        SBCS      tmp_hi, rr_hi                     ;
        MOVS      rr_hi, tmp_hi
$chk_q_sign:
        MOV       tmp_hi, sign
        LSLS      tmp_hi, tmp_hi, #1                ;
        MOV       sign, tmp_hi
        BPL       return                            ;
	MOVS	  tmp_hi, #0
        RSBS      rq_lo, rq_lo, #0                  ;
        SBCS      tmp_hi, rq_hi                     ;
        MOVS      rq_hi, tmp_hi
return:
        .if __TI_EABI_ASSEMBLER                     ; EABI REQUIRES Q IN R0, R1
        CPY       tmp_hi, rq_hi                     ; R IN R2, R3
        CPY       tmp_lo, rq_lo                     ; DO A SWAP
        CPY       rq_hi, rr_hi
        CPY       rq_lo, rr_lo
        CPY       rr_hi, tmp_hi
        CPY       rr_lo, tmp_lo
        .endif

        POP       {r4, r5}
        MOV       r8, r4
        MOV       r9, r5
        POP       {r4-r7, pc}                    ;
	.endasmfunc

	.endif                          ; __TI_ARM_V6M0__ 

	.end
