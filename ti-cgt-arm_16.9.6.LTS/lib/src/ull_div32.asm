;******************************************************************************
;* ULL_DIV32.ASM  - 32 BIT STATE -  v16.9.6                                   *
;*                                                                            *
;* Copyright (c) 1996-2017 Texas Instruments Incorporated                     *
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
;* ULL_DIV/ULL_MOD - DIVIDE TWO UNSIGNED 64 BIT NUMBERS.
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
;*
;*   o EABI MODE, QUOTIENT, REMAINDER REGISTERS SWAPPED
;*   o EABI MODE, DIVIDE BY ZERO RETURNS
;*   	- 0 IF DIVIDEND == 0
;*   	- ULLONG_MAX IF DIVIDEND > 0
;*
;****************************************************************************

	.arm

        .if __TI_EABI_ASSEMBLER                     ; ASSIGN EXTERNAL NAMES 
        .asg __aeabi_uldivmod, __TI_ULL_DIV         ; BASED ON RTS BEING BUILT
        .else
	.clink
        .asg ULL_DIV, __TI_ULL_DIV
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
;dvnd_hi .set    r0                                  ; HIGH WORD OF DIVIDEND
;dvnd_lo .set    r1                                  ; LOW WORD OF DIVIDEND
dvsr_hi .set    r4                                  ; HIGH WORD OF DIVISOR COPY
dvsr_lo .set    r5                                  ; LOW WORD OF DIVISOR COPY
tmp_hi  .set    r6                                  ; HIGH WORD OF TEMP
tmp_lo  .set    r7                                  ; LOW WORD OF TEMP

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.armfunc __TI_ULL_DIV
	.endif

	.if !__TI_EABI_ASSEMBLER                    ; RT-ABI DOES NOT USE MOD
	.global ULL_MOD
	.if __TI_ARM9ABI_ASSEMBLER
	.armfunc ULL_MOD
        .endif
ULL_MOD:	
	.endif

	.global __TI_ULL_DIV
__TI_ULL_DIV: .asmfunc stack_usage(24)
        STMFD     SP!, {r4-r8, lr}                  ;
        MOV       dvsr_hi, idvs_hi                  ; MAKE A COPY OF INPUT 
        MOV       dvsr_lo, idvs_lo                  ; DIVISOR (R2:R3) INTO DVSR

        CMP       dvsr_hi, dvnd_hi                  ; IF DVND < DVSR,
        CMPEQ     dvsr_lo, dvnd_lo                  ; RETURN Q=0, R=DVND 
        MOVHI     rq_hi, #0                         ;
        MOVHI     rq_lo, #0                         ;
        .if __TI_EABI_ASSEMBLER                     
        BHI $return                                 ; SWAP VALUES FOR EABI
        .else
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMHIFD   SP!, {r4-r8, pc}
	.else
	LDMHIFD	  SP!, {r4-r8, lr}
	BXHI	  lr
	.endif
        .endif

        CMP       dvsr_hi, #0                       ; IF DVSR IS 0,
        CMPEQ     dvsr_lo, #0                       ; RETURN Q=0, R=0 

	.if __TI_EABI_ASSEMBLER
	BNE	  _not_zero_			    

	CMP	  dvnd_hi, #0			    ; EABI DVSR IS 0, RETURN
	CMPEQ	  dvnd_lo, #0			    
	; EABI, QUOTIENT AND REMAINDER ARE SWAPPED. 
	; Q [rr_hi:rr_lo], R [rq_hi:rq_lo]
	MVNNE	  rr_lo, #0			    ; Q=ULLONG_MAX IF DVND > 0 
	MVNNE	  rr_hi, #0			

        ; Q==0 IF DVND==0 (BOTH USE THE SAME REGISTERS)
	; R==0 IF DVSR==0 (BOTH USE THE SAME REGISTERS)
	BL	  __aeabi_ldiv0
	.if !__TI_TMS470_V4__
        LDMFD   SP!, {r4-r8, pc}                    ;
	.else
	LDMFD	SP!, {r4-r8, lr}
	BX	lr
	.endif
	.else
        MOVEQ     rr_lo, #0                         ;
        MOVEQ     rr_hi, #0                         ;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMEQFD   SP!, {r4-r8, pc}                  ;
	.else
	LDMEQFD	  SP!, {r4-r8, lr}
	BXEQ	  lr
	.endif
	.endif

_not_zero_:
        MOV       q_lo, #0                          ; INITIALIZE THE QUOTIENT
        MOV       q_hi, #0                          ; TO ZERO

        ; CALCULATE THE MAXIMUM DIVISOR SHIFT AMOUNT WITH PSEUDO BINARY SEARCH
        ; IF DVND >> 32 > DVSR THEN DVSR = DVSR << 32

        CMP       dvsr_hi, #0                       ; IF (DVSR_HI == 0 AND 
        CMPEQ     dvsr_lo, dvnd_hi                  ;          DVSRLO < DVND_HI)
        MOVLS     dvsr_hi, dvsr_lo                  ;    DVSR_HI = DVSRLO
        MOVLS     dvsr_lo, #0                       ;    DVSR_LO = 0

        ; IF DVND >> 16 > DVSR THEN DVSR = DVSR << 16
        MOV       tmp_lo, dvnd_lo, LSR #16          ; SHIFT DVND BY 16 INTO
        ORR       tmp_lo, tmp_lo, dvnd_hi, LSL #16  ; TMP                   
        MOV       tmp_hi, dvnd_hi, LSR #16          ; 
        CMP       dvsr_hi, tmp_hi                   ; COMPARE DVSR WITH TMP
        CMPEQ     dvsr_lo, tmp_lo                   ;
        MOVLS     dvsr_hi, dvsr_hi, LSL #16         ; SET DVSR = DVSR << 16
        ORRLS     dvsr_hi, dvsr_hi, dvsr_lo, LSR #16;
        MOVLS     dvsr_lo, dvsr_lo, LSL #16         ;

        ; IF DVND >> 16 > DVSR THEN DVSR = DVSR << 16
        MOV       tmp_lo, dvnd_lo, LSR #8           ; SHIFT DVND BY 16 INTO
        ORR       tmp_lo, tmp_lo, dvnd_hi, LSL #24  ; TMP
        MOV       tmp_hi, dvnd_hi, LSR #8           ; 
        CMP       dvsr_hi, tmp_hi                   ; COMPARE DVSR WITH TMP
        CMPEQ     dvsr_lo, tmp_lo                   ;
        MOVLS     dvsr_hi, dvsr_hi, LSL #8          ; SET DVSR = DVSR << 8
        ORRLS     dvsr_hi, dvsr_hi, dvsr_lo, LSR #24;
        MOVLS     dvsr_lo, dvsr_lo, LSL #8          ;

        ; NOW FIND EXACTLY WHERE THE SHIFTED DIVISOR SHOULD BE SO THAT WE CAN
        ; JUMP INTO THE CORRECT LOCATION OF THE UNROLLED DIVIDE LOOP.
        MOV       tmp_lo, dvnd_lo, LSR #1           ;
        ORR       tmp_lo, tmp_lo, dvnd_hi, LSL #31  ;
        MOV       tmp_hi, dvnd_hi, LSR #1           ;
        CMP       dvsr_hi, tmp_hi                   ;
        CMPEQ     dvsr_lo, tmp_lo                   ;
        BHI       mod1                              ;

        MOV       tmp_lo, dvnd_lo, LSR #2           ;
        ORR       tmp_lo, tmp_lo, dvnd_hi, LSL #30  ;
        MOV       tmp_hi, dvnd_hi, LSR #2           ;
        CMP       dvsr_hi, tmp_hi                   ;
        CMPEQ     dvsr_lo, tmp_lo                   ;
        BHI       mod2                              ; BRANCHING INTO DIVIDE LOOP

        MOV       tmp_lo, dvnd_lo, LSR #3           ;
        ORR       tmp_lo, tmp_lo, dvnd_hi, LSL #29  ;
        MOV       tmp_hi, dvnd_hi, LSR #3           ;
        CMP       dvsr_hi, tmp_hi                   ;
        CMPEQ     dvsr_lo, tmp_lo                   ;
        BHI       mod3                              ;

        MOV       tmp_lo, dvnd_lo, LSR #4           ;
        ORR       tmp_lo, tmp_lo, dvnd_hi, LSL #28  ;
        MOV       tmp_hi, dvnd_hi, LSR #4           ;
        CMP       dvsr_hi, tmp_hi                   ;
        CMPEQ     dvsr_lo, tmp_lo                   ;
        BHI       mod4                              ;

        MOV       tmp_lo, dvnd_lo, LSR #5           ;
        ORR       tmp_lo, tmp_lo, dvnd_hi, LSL #27  ;
        MOV       tmp_hi, dvnd_hi, LSR #5           ;
        CMP       dvsr_hi, tmp_hi                   ;
        CMPEQ     dvsr_lo, tmp_lo                   ;
        BHI       mod5                              ;

        MOV       tmp_lo, dvnd_lo, LSR #6           ;
        ORR       tmp_lo, tmp_lo, dvnd_hi, LSL #26  ;
        MOV       tmp_hi, dvnd_hi, LSR #6           ;
        CMP       dvsr_hi, tmp_hi                   ;
        CMPEQ     dvsr_lo, tmp_lo                   ;
        BHI       mod6                              ;

        MOV       tmp_lo, dvnd_lo, LSR #7           ;
        ORR       tmp_lo, tmp_lo, dvnd_hi, LSL #25  ;
        MOV       tmp_hi, dvnd_hi, LSR #7           ;
        CMP       dvsr_hi, tmp_hi                   ;
        CMPEQ     dvsr_lo, tmp_lo                   ;
        BHI       mod7                              ;

        ; THE DIVIDE LOOP IS UNROLLED 8 TIMES.
        ; IF DIVIDEND IS LARGER THAN DIVISOR, SHIFT A 1 INTO THE QUOTIENT
        ; AND SUBTRACT THE DIVISOR, ELSE SHIFT A 0 INTO THE QUOTIENT.
divll:
        MOV       tmp_hi, dvsr_hi, LSL #7           ; LEFT SHIFT DVSR BY 7 
        ORR       tmp_hi, tmp_hi, dvsr_lo, LSR #25  ; INTO TMP
        MOV       tmp_lo, dvsr_lo, LSL #7           ;
        CMP       dvnd_hi, tmp_hi                   ; IF (DVND >= TMP)      
        CMPEQ     dvnd_lo, tmp_lo                   ; 
        BCC       $1                                ; 
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;    DVND = DVND - TMP
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$1:
        ADCS      q_lo, q_lo, q_lo                  ; SHIFT THE CARRY BIT DEFED
        ADC       q_hi, q_hi, q_hi                  ; BY CMP OR SBCS INTO THE 
                                                    ; QUOTIENT

mod7:
        MOV       tmp_hi, dvsr_hi, LSL #6           ; UNROLLED LOOP 
        ORR       tmp_hi, tmp_hi, dvsr_lo, LSR #26  ;
        MOV       tmp_lo, dvsr_lo, LSL #6           ;
        CMP       dvnd_hi, tmp_hi                   ;
        CMPEQ     dvnd_lo, tmp_lo                   ;

        BCC       $2                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$2:
        ADCS      q_lo, q_lo, q_lo                  ;
        ADC       q_hi, q_hi, q_hi                  ;
        
mod6:
        MOV       tmp_hi, dvsr_hi, LSL #5           ;
        ORR       tmp_hi, tmp_hi, dvsr_lo, LSR #27  ;
        MOV       tmp_lo, dvsr_lo, LSL #5           ;
        CMP       dvnd_hi, tmp_hi                   ;
        CMPEQ     dvnd_lo, tmp_lo                   ;

        BCC       $3                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$3:
        ADCS      q_lo, q_lo, q_lo                  ;
        ADC       q_hi, q_hi, q_hi                  ;
        
mod5:
        MOV       tmp_hi, dvsr_hi, LSL #4           ;
        ORR       tmp_hi, tmp_hi, dvsr_lo, LSR #28  ;
        MOV       tmp_lo, dvsr_lo, LSL #4           ;
        CMP       dvnd_hi, tmp_hi                   ;
        CMPEQ     dvnd_lo, tmp_lo                   ;

        BCC       $4                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$4:
        ADCS      q_lo, q_lo, q_lo                  ;
        ADC       q_hi, q_hi, q_hi                  ;
        
mod4:
        MOV       tmp_hi, dvsr_hi, LSL #3           ;
        ORR       tmp_hi, tmp_hi, dvsr_lo, LSR #29  ;
        MOV       tmp_lo, dvsr_lo, LSL #3           ;
        CMP       dvnd_hi, tmp_hi                   ;
        CMPEQ     dvnd_lo, tmp_lo                   ;

        BCC       $5                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$5:
        ADCS      q_lo, q_lo, q_lo                  ;
        ADC       q_hi, q_hi, q_hi                  ;
        
mod3:
        MOV       tmp_hi, dvsr_hi, LSL #2           ;
        ORR       tmp_hi, tmp_hi, dvsr_lo, LSR #30  ;
        MOV       tmp_lo, dvsr_lo, LSL #2           ;
        CMP       dvnd_hi, tmp_hi                   ;
        CMPEQ     dvnd_lo, tmp_lo                   ;

        BCC       $6                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$6:
        ADCS      q_lo, q_lo, q_lo                  ;
        ADC       q_hi, q_hi, q_hi                  ;
        
mod2:
        MOV       tmp_hi, dvsr_hi, LSL #1           ;
        ORR       tmp_hi, tmp_hi, dvsr_lo, LSR #31  ;
        MOV       tmp_lo, dvsr_lo, LSL #1           ;
        CMP       dvnd_hi, tmp_hi                   ;
        CMPEQ     dvnd_lo, tmp_lo                   ;

        BCC       $7                                ;
        SUBS      dvnd_lo, dvnd_lo, tmp_lo          ;
        SBCS      dvnd_hi, dvnd_hi, tmp_hi          ;
$7:
        ADCS      q_lo, q_lo, q_lo                  ;
        ADC       q_hi, q_hi, q_hi                  ;

mod1:
        CMP       dvnd_hi, dvsr_hi                  ;
        CMPEQ     dvnd_lo, dvsr_lo                  ;
        
        BCC       $8                                ;
        SUBS      dvnd_lo, dvnd_lo, dvsr_lo         ;
        SBCS      dvnd_hi, dvnd_hi, dvsr_hi         ;
$8:
        ADCS      q_lo, q_lo, q_lo                  ;
        ADC       q_hi, q_hi, q_hi                  ;

        ; IF THERE IS SHIFTED DIVISOR, THEN UNSHIFT THE DIVISOR BY 8 AND
        ; CONTINUE THE LOOP
        CMP       idvs_hi, dvsr_hi                  ; 
        CMPEQ     idvs_lo, dvsr_lo                  ;
        MOVCC     dvsr_lo, dvsr_lo, LSR #8          ;
        ORRCC     dvsr_lo, dvsr_lo, dvsr_hi, LSL #24;
        MOVCC     dvsr_hi, dvsr_hi, LSR #8          ;
        BCC       divll                             ;

        ; ELSE WE ARE DONE. PLACE THE QUOTIENT INTO rq_hi:rq_lo. 
	; rr_hi:rr_lo ALREADY CONTAINS THE REMAINDER.
        MOV       rq_hi, q_hi                       ;
        MOV       rq_lo, q_lo                       ;

        .if __TI_EABI_ASSEMBLER                     
$return:
        MOV       tmp_hi, rq_hi                     ; EABI REQUIRES Q IN R0, R1
        MOV       tmp_lo, rq_lo                     ; R IN R2, R3
        MOV       rq_hi, rr_hi                      ; DO A SWAP
        MOV       rq_lo, rr_lo
        MOV       rr_hi, tmp_hi
        MOV       rr_lo, tmp_lo
        .endif

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   SP!, {r4-r8, pc}                    ;
	.else
	LDMFD	SP!, {r4-r8, lr}
	BX	lr
	.endif
	.endasmfunc

	.if __TI_EABI_ASSEMBLER
	; THIS FUNCTION REQUIRED TO CONFORM TO EABI SPEC
	; RETURNS THE VALUE PASSED TO IT AS A PARAMETER
	; IF EXCEPTIONS SUPPORTED, RAISE SIGFPE
	.armfunc __aeabi_ldiv0
__aeabi_ldiv0:	.asmfunc stack_usage(0)
	BX	lr
	.endasmfunc
	.endif

	.end
