;******************************************************************************
;* ULL_DIV16.ASM  - 16 BIT STATE -  v16.9.6                                   *
;*                                                                            *
;* Copyright (c) 2012-2017 Texas Instruments Incorporated                     *
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
;* ULL$DIV/ULL$MOD - DIVIDE TWO UNSIGNED 64 BIT NUMBERS.
;*
;****************************************************************************
;*
;*   o DIVIDEND IS IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*   o DIVISOR IS IN r2:r3 (r3:r2 IF LITTLE ENDIAN)
;*
;*   o QUOTIENT IS PLACED IN r2:r3  (r3:r2 IF LITTLE ENDIAN)
;*   o REMAINDER IS PLACED IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*
;*   o DIVIDE BY ZERO RETURNS ZERO
;*
;****************************************************************************
	.if !__TI_ARM_V6M0__

	.thumb
	.clink

    	.global ULL_MOD

	.if __TI_ARM9ABI_ASSEMBLER
	.thumbfunc ULL$DIV, ULL$MOD
	.endif

	.global ULL$DIV
	.global ULL$MOD
ULL$DIV: .asmfunc stack_usage(4)
ULL$MOD:
        PUSH {lr}
	NOP
	BX  pc		        ; Change to 32-bit state
	NOP
	.align
	.arm
	BL  ULL_MOD             ; and call 32-bit DIV/MOD routine.
	ADD lr, pc, #0x1
	BX  lr                  ; Change the state back to 16-bit
	.thumb
	POP {pc}

	.endasmfunc
	.endif                  ; !__TI_ARM_V6M0__

;****************************************************************************
;*
;*   This is an actually-16-bit version derived from the t2 version for v6m0.
;*
;*   o DIVIDEND IS IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*   o DIVISOR IS IN r2:r3  (r3:r2 IF LITTLE ENDIAN)
;*
;*   o QUOTIENT IS PLACED IN r2:r3  (r3:r2 IF LITTLE ENDIAN)
;*   o REMAINDER IS PLACED IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*
;*   o DIVIDE BY ZERO RETURNS ZERO
;*
;*   o EABI MODE, QUOTIENT, REMAINDER REGISTERS SWAPPED
;*   o EABI MODE, DIVIDE BY ZERO RETURNS
;*   	- 0 IF DIVIDEND == 0
;*   	- ULLONG_MAX IF DIVIDEND > 0
;*
;****************************************************************************
	
        .if __TI_ARM_V6M0__

	.thumb

        .if __TI_EABI_ASSEMBLER                     ; ASSIGN EXTERNAL NAMES 
        .asg __aeabi_uldivmod, __TI_ULL$DIV         ; BASED ON RTS BEING BUILT
        .else
	.clink
        .asg ULL$DIV, __TI_ULL$DIV
        .endif

	.if .TMS470_LITTLE

dvnd_hi .set    r1                                  ; HIGH WORD OF DIVIDEND
dvnd_lo .set    r0                                  ; LOW WORD OF DIVIDEND
idvs_hi .set    r3				    ; HIGH WORD OF DIVISOR
idvs_lo .set    r2				    ; LOW WORD OF DIVISOR
rq_hi   .set    r3			  	    ; HIGH WORD OF RESULT QUO
rq_lo   .set    r2			  	    ; LOW WORD OF RESULT QUO
rr_hi   .set    r1				    ; HIGH WORD OF RESULT REM
rr_lo   .set    r0				    ; HIGH WORD OF RESULT REM

	.else

dvnd_hi .set    r0                                  ; HIGH WORD OF DIVIDEND
dvnd_lo .set    r1                                  ; LOW WORD OF DIVIDEND
idvs_hi .set    r2				    ; HIGH WORD OF DIVISOR
idvs_lo .set    r3				    ; LOW WORD OF DIVISOR

rq_hi   .set    r2			  	    ; HIGH WORD OF RESULT QUO
rq_lo   .set    r3			  	    ; LOW WORD OF RESULT QUO
rr_hi   .set    r0				    ; HIGH WORD OF RESULT REM
rr_lo   .set    r1				    ; HIGH WORD OF RESULT REM

	.endif


q_hi    .set    LR                                  ; HIGH WORD OF QUOTIENT
q_lo    .set    r8                                  ; LOW WORD OF QUOTIENT
dvsr_hi .set    r4                                  ; HIGH WORD OF DIVISOR COPY
dvsr_lo .set    r5                                  ; LOW WORD OF DIVISOR COPY
tmp_hi  .set    r6                                  ; HIGH WORD OF TEMP
tmp_lo  .set    r7                                  ; LOW WORD OF TEMP

        .if !__TI_EABI_ASSEMBLER                    ; RT-ABI DOES NOT USE MOD
	.thumbfunc ULL$MOD
	.global ULL$MOD
ULL$MOD:	
        .endif

	.thumbfunc __TI_ULL$DIV
	.global __TI_ULL$DIV
__TI_ULL$DIV: .asmfunc stack_usage(24)
        PUSH      {r4-r7, lr}                  ; PUSH r4-r8, lr
        MOV       r4, r8
        PUSH      {r4}
        
        CPY       dvsr_hi, idvs_hi                  ; MAKE A COPY OF INPUT 
        CPY       dvsr_lo, idvs_lo                  ; DIVISOR (R2:R3) INTO DVSR
        
        CMP       dvsr_hi, dvnd_hi                  ; IF DVND < DVSR,
        
        BNE       $skip1
        CMP       dvsr_lo, dvnd_lo                  ; RETURN Q=0, R=DVND 
$skip1:
        BLS       $skip2
        MOVS      rq_hi, #0                         ;
        MOVS      rq_lo, #0                         ;
        B         $return
$skip2:
        CMP       dvsr_hi, #0                       ; IF DVSR IS 0,
        BNE       $skip3
        CMP       dvsr_lo, #0                       ; RETURN Q=0, R=0 
$skip3:
	.if __TI_EABI_ASSEMBLER
	BNE	  _not_zero_			    

	CMP	  dvnd_hi, #0			    ; EABI DVSR IS 0, RETURN
	BNE       $skip4
	CMP	  dvnd_lo, #0			    
        BEQ       $skip5
	; EABI, QUOTIENT AND REMAINDER ARE SWAPPED. 
	; Q [rr_hi:rr_lo], R [rq_hi:rq_lo]
$skip4:	
        MOVS      tmp_lo, #0
        MVNS      rr_lo, tmp_lo    ; Q=ULLONG_MAX IF DVND > 0 
	MVNS      rr_hi, tmp_lo
$skip5:
        ; Q==0 IF DVND==0 (BOTH USE THE SAME REGISTERS)
	; R==0 IF DVSR==0 (BOTH USE THE SAME REGISTERS)
	BL	  __aeabi_ldiv0
        POP      {r4}
        MOV      r8, r4
        POP      {r4-r7, pc}                    ;
	.else
	BNE     $skip6
        MOVS    rr_lo, #0                         ;
        MOVS    rr_hi, #0                         ;
        POP     {r4}
        MOVS    r8, r4
        POP     {r4-r7, pc}                  ;
$skip6:
	.endif

_not_zero_:
        MOVS     tmp_lo, #0
        MOV      q_lo, tmp_lo                      ; INITIALIZE THE QUOTIENT
        MOV      q_hi, tmp_lo                      ; TO ZERO

        ; CALCULATE THE MAXIMUM DIVISOR SHIFT AMOUNT WITH PSEUDO BINARY SEARCH
        ; IF DVND >> 32 > DVSR THEN DVSR = DVSR << 32

        CMP       dvsr_hi, #0                       ; IF (DVSR_HI == 0 AND 
        BNE       $skip7
        CMP       dvsr_lo, dvnd_hi                  ;          DVSRLO < DVND_HI)
$skip7:
        BHI       $skip8
        MOVS      dvsr_hi, dvsr_lo                  ;    DVSR_HI = DVSRLO
        MOVS      dvsr_lo, #0                       ;    DVSR_LO = 0
$skip8:
        ; IF DVND >> 16 > DVSR THEN DVSR = DVSR << 16
        LSRS      tmp_lo, dvnd_lo, #16              ; SHIFT DVND BY 16 INTO TMP
        LSLS      tmp_hi, dvnd_hi, #16
        ORRS      tmp_lo, tmp_hi
        LSRS      tmp_hi, dvnd_hi, #16
        CMP       dvsr_hi, tmp_hi                   ; COMPARE DVSR WITH TMP
	BNE       $skip9
        CMP       dvsr_lo, tmp_lo                   ;
$skip9:
        BHI       $skip10
        LSLS      dvsr_hi, dvsr_hi, #16             ; SET DVSR = DVSR << 16
        LSRS      tmp_lo, dvsr_lo, #16
        ORRS      dvsr_hi, tmp_lo                   ;
        LSLS      dvsr_lo, dvsr_lo, #16             ;
$skip10:
        ; IF DVND >> 16 > DVSR THEN DVSR = DVSR << 16
        LSRS      tmp_lo, dvnd_lo, #8               ; SHIFT DVND BY 16 INTO
        LSLS      tmp_hi, dvnd_hi, #24
        ORRS      tmp_lo, tmp_hi                    ; TMP
        LSRS      tmp_hi, dvnd_hi, #8               ; 
        CMP       dvsr_hi, tmp_hi                   ; COMPARE DVSR WITH TMP
        BNE       $skip11
        CMP       dvsr_lo, tmp_lo                   ;
$skip11:
	BHI       $skip12
        LSLS      dvsr_hi, dvsr_hi, #8              ; SET DVSR = DVSR << 8
        LSRS      tmp_lo, dvsr_lo, #24
        ORRS      dvsr_hi, tmp_lo                   ;
        LSLS      dvsr_lo, dvsr_lo, #8              ;
$skip12:
        ; NOW FIND EXACTLY WHERE THE SHIFTED DIVISOR SHOULD BE SO THAT WE CAN
        ; JUMP INTO THE CORRECT LOCATION OF THE UNROLLED DIVIDE LOOP.
        LSRS      tmp_lo, dvnd_lo, #1               ;
        LSLS      tmp_hi, dvnd_hi, #31
        ORRS      tmp_lo, tmp_hi
        LSRS      tmp_hi, dvnd_hi, #1               ;
        CMP       dvsr_hi, tmp_hi                   ;
	BNE       $skip13
        CMP       dvsr_lo, tmp_lo                   ;
$skip13:
        BHI       mod1                              ;

        LSRS      tmp_lo, dvnd_lo, #2               ;
        LSLS      tmp_hi, dvnd_hi, #30
        ORRS      tmp_lo, tmp_hi
        LSRS      tmp_hi, dvnd_hi, #2               ;
        CMP       dvsr_hi, tmp_hi                   ;
	BNE       $skip14
        CMP       dvsr_lo, tmp_lo                   ;
$skip14:
        BHI       mod2                              ; BRANCHING INTO DIVIDE LOOP

        LSRS      tmp_lo, dvnd_lo, #3               ;
        LSLS      tmp_hi, dvnd_hi, #29
        ORRS      tmp_lo, tmp_hi
        LSRS      tmp_hi, dvnd_hi, #3               ;
        CMP       dvsr_hi, tmp_hi                   ;
	BNE       $skip15
        CMP       dvsr_lo, tmp_lo                   ;
$skip15:
        BHI       mod3                              ;

        LSRS      tmp_lo, dvnd_lo, #4               ;
        LSLS      tmp_hi, dvnd_hi, #28
        ORRS      tmp_lo, tmp_hi
        LSRS      tmp_hi, dvnd_hi, #4               ;
        CMP       dvsr_hi, tmp_hi                   ;
	BNE       $skip16
        CMP       dvsr_lo, tmp_lo                   ;
$skip16:
        BHI       mod4                              ;

        LSRS      tmp_lo, dvnd_lo, #5               ;
        LSLS      tmp_hi, dvnd_hi, #27
        ORRS      tmp_lo, tmp_hi
        LSRS      tmp_hi, dvnd_hi, #5               ;
        CMP       dvsr_hi, tmp_hi                   ;
	BNE       $skip17
        CMP       dvsr_lo, tmp_lo                   ;
$skip17:
        BHI       mod5                              ;

        LSRS      tmp_lo, dvnd_lo, #6               ;
        LSLS      tmp_hi, dvnd_hi, #26
        ORRS      tmp_lo, tmp_hi
        LSRS      tmp_hi, dvnd_hi, #6               ;
        CMP       dvsr_hi, tmp_hi                   ;
	BNE       $skip18
        CMP       dvsr_lo, tmp_lo                   ;
$skip18:
        BHI       mod6                              ;

        LSRS      tmp_lo, dvnd_lo, #7               ;
        LSLS      tmp_hi, dvnd_hi, #25
        ORRS      tmp_lo, tmp_hi
        LSRS      tmp_hi, dvnd_hi, #7               ;
        CMP       dvsr_hi, tmp_hi                   ;
	BNE       $skip19
        CMP       dvsr_lo, tmp_lo                   ;
$skip19:
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
        BNE       $skip20
        CMP       dvnd_lo, tmp_lo                   ; 
$skip20:
        BCC       $1                                ; 
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;    DVND = DVND - TMP
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$1:
        MOV       tmp_lo, q_lo                      ; SHIFT THE CARRY BIT DEFED
        MOV       tmp_hi, q_hi                      ; BY CMP OR SBCS INTO THE
        ADCS      tmp_lo, tmp_lo                    ; QUOTIENT
        ADCS      tmp_hi, tmp_hi                    ; (must swap into low regs)
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi

mod7:
        LSLS      tmp_hi, dvsr_hi, #6               ; UNROLLED LOOP 
        LSRS      tmp_lo, dvsr_lo, #26
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #6               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip21
        CMP       dvnd_lo, tmp_lo                   ;
$skip21:

        BCC       $2                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$2:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi   
        ADCS      tmp_lo, tmp_lo
        ADCS      tmp_hi, tmp_hi
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi
        
mod6:
        LSLS      tmp_hi, dvsr_hi, #5               ;
        LSRS      tmp_lo, dvsr_lo, #27
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #5               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip22
        CMP       dvnd_lo, tmp_lo                   ;
$skip22:

        BCC       $3                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$3:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo
        ADCS      tmp_hi, tmp_hi
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi
        
mod5:
        LSLS      tmp_hi, dvsr_hi, #4               ;
        LSRS      tmp_lo, dvsr_lo, #28
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #4               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip23
        CMP       dvnd_lo, tmp_lo                   ;
$skip23:

        BCC       $4                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$4:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo
        ADCS      tmp_hi, tmp_hi
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi
        
mod4:
        LSLS      tmp_hi, dvsr_hi, #3               ;
        LSRS      tmp_lo, dvsr_lo, #29
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #3               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip24
        CMP       dvnd_lo, tmp_lo                   ;
$skip24:

        BCC       $5                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$5:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo
        ADCS      tmp_hi, tmp_hi
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi
mod3:
        LSLS      tmp_hi, dvsr_hi, #2               ;
        LSRS      tmp_lo, dvsr_lo, #30
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #2               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip25
        CMP       dvnd_lo, tmp_lo                   ;
$skip25:

        BCC       $6                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$6:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo
        ADCS      tmp_hi, tmp_hi
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi
        
mod2:
        LSLS      tmp_hi, dvsr_hi, #1               ;
        LSRS      tmp_lo, dvsr_lo, #31
        ORRS      tmp_hi, tmp_lo                    ;
        LSLS      tmp_lo, dvsr_lo, #1               ;
        CMP       dvnd_hi, tmp_hi                   ;
        BNE       $skip26
        CMP       dvnd_lo, tmp_lo                   ;
$skip26:

        BCC       $7                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$7:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo
        ADCS      tmp_hi, tmp_hi
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi

mod1:
        CMP       dvnd_hi, dvsr_hi                  ;
        BNE       $skip27
        CMP       dvnd_lo, dvsr_lo                  ;
$skip27:
        
        BCC       $8                                ;
        SUBS      dvnd_lo, dvnd_lo, dvsr_lo         ;
        SBCS      dvnd_hi, dvnd_hi, dvsr_hi         ;
$8:
        MOV       tmp_lo, q_lo
        MOV       tmp_hi, q_hi
        ADCS      tmp_lo, tmp_lo
        ADCS      tmp_hi, tmp_hi
        MOV       q_lo, tmp_lo
        MOV       q_hi, tmp_hi

        ; IF THERE IS SHIFTED DIVISOR, THEN UNSHIFT THE DIVISOR BY 8 AND
        ; CONTINUE THE LOOP
        CMP       idvs_hi, dvsr_hi                  ; 
        BNE       $skip28
        CMP       idvs_lo, dvsr_lo                  ;
$skip28:
        BCS       $skip29
        LSRS      dvsr_lo, dvsr_lo, #8              ;
        LSLS      tmp_lo, dvsr_hi, #24
        ORRS      dvsr_lo, tmp_lo                  ;
        LSRS      dvsr_hi, dvsr_hi, #8              ;
        B         divll                             ;
$skip29:
        ; ELSE WE ARE DONE. PLACE THE QUOTIENT INTO rq_hi:rq_lo. 
	; rr_hi:rr_lo ALREADY CONTAINS THE REMAINDER.
        CPY       rq_hi, q_hi                       ;
        CPY       rq_lo, q_lo                       ;

$return:
        .if __TI_EABI_ASSEMBLER                     
        CPY       tmp_hi, rq_hi                     ; EABI REQUIRES Q IN R0, R1
        CPY       tmp_lo, rq_lo                     ; R IN R2, R3
        CPY       rq_hi, rr_hi                      ; DO A SWAP
        CPY       rq_lo, rr_lo
        CPY       rr_hi, tmp_hi
        CPY       rr_lo, tmp_lo
        .endif
        
        POP       {r4}
        MOV       r8, r4
        POP       {r4-r7, pc}                    ;
	.endasmfunc

	.if __TI_EABI_ASSEMBLER
	; THIS FUNCTION REQUIRED TO CONFORM TO EABI SPEC
	; RETURNS THE VALUE PASSED TO IT AS A PARAMETER
	; IF EXCEPTIONS SUPPORTED, RAISE SIGFPE
	.thumbfunc __aeabi_ldiv0
__aeabi_ldiv0:	.asmfunc stack_usage(0)
	BX	lr
	.endasmfunc
	.endif

        .endif                          ; __TI_ARM_V6M0__ 

	.end
