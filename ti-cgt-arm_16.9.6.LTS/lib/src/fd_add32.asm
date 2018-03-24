;******************************************************************************
;* FD_ADD32.ASM  - 32 BIT STATE -  v16.9.6                                    *
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

;*****************************************************************************
;* FD_ADD/FD_SUB - ADD / SUBTRACT TWO IEEE 754 FORMAT DOUBLE PRECISION FLOATING 
;* 	           POINT NUMBERS.
;*****************************************************************************
;*
;*   o INPUT OP1 IS IN r0:r1
;*   o INPUT OP2 IS IN r2:r3
;*   o RESULT IS RETURNED IN r0:r1
;*   o INPUT OP2 IN r2:r3 IS PRESERVED
;*
;*   o SUBTRACTION, OP1 - OP2, IS IMPLEMENTED WITH ADDITION, OP1 + (-OP2)
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o OVERFLOW RETURNS +/- INFINITY 
;*       (0x7ff00000:00000000) or (0xfff00000:00000000) 
;*   o DENORMALIZED NUMBERS ARE TREATED AS UNDERFLOWS
;*   o UNDERFLOW RETURNS ZERO (0x00000000:00000000)
;*   o ROUNDING MODE:  ROUND TO NEAREST (TIE TO EVEN)
;*
;*   o IF OPERATION INVOLVES INFINITY AS AN INPUT, THE FOLLOWING SUMMARIZES
;*     THE RESULT:
;*                   +----------+----------+----------+ 
;*         ADDITION  + OP2 !INF | OP2 -INF + OP2 +INF +
;*        +----------+==========+==========+==========+ 
;*        + OP1 !INF +    -     |   -INF   +   +INF   +
;*        +----------+----------+----------+----------+ 
;*        + OP1 -INF +   -INF   |   -INF   +   -INF   +
;*        +----------+----------+----------+----------+ 
;*        + OP1 +INF +   +INF   |   +INF   +   +INF   +
;*        +----------+----------+----------+----------+
;*
;*                   +----------+----------+----------+ 
;*       SUBTRACTION + OP2 !INF | OP2 -INF + OP2 +INF +
;*        +----------+==========+==========+==========+ 
;*        + OP1 !INF +    -     |   +INF   +   -INF   +
;*        +----------+----------+----------+----------+ 
;*        + OP1 -INF +   -INF   |   -INF   +   -INF   +
;*        +----------+----------+----------+----------+ 
;*        + OP1 +INF +   +INF   |   +INF   +   +INF   +
;*        +----------+----------+----------+----------+
;*
;****************************************************************************
;*
;* +------------------------------------------------------------------+
;* | DOUBLE PRECISION FLOATING POINT FORMAT                           |
;* |   64-bit representation                                          |
;* |   31 30      20 19                  0                            |
;* |   +-+----------+---------------------+                           |
;* |   |S|     E    |        M1           |                           |
;* |   +-+----------+---------------------+                           |
;* |                                                                  |
;* |   31                                0                            |
;* |   +----------------------------------+                           |
;* |   |             M2                   |                           |
;* |   +----------------------------------+                           |
;* |                                                                  |
;* |   <S>  SIGN FIELD    :          0 - POSITIVE VALUE               |
;* |                                 1 - NEGATIVE VALUE               |
;* |                                                                  |
;* |   <E>  EXPONENT FIELD: 0000000000 - ZERO IFF M == 0              |
;* |            0000000001..1111111110 - EXPONENT VALUE(1023 BIAS)    |
;* |                        1111111111 - INFINITY                     |
;* |                                                                  |
;* |   <M1:M2>  MANTISSA FIELDS:  FRACTIONAL MAGNITUDE WITH IMPLIED 1 |
;* +------------------------------------------------------------------+
;*
;****************************************************************************

	.arm

        .if __TI_EABI_ASSEMBLER         ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_dadd, __TI_FD_ADD  ; RTS BEING BUILT
        .asg __aeabi_dsub, __TI_FD_SUB
        .else
	.clink
        .asg FD_ADD, __TI_FD_ADD
        .asg FD_SUB, __TI_FD_SUB
        .endif

	.global	__TI_FD_ADD
	.global __TI_FD_SUB

	.if .TMS470_BIG_DOUBLE

rp1_hi	.set	r0	; High word of regpair 1
rp1_lo	.set	r1	; Low word of regpair 1
rp2_hi	.set	r2	; High word of regpair 2
rp2_lo	.set	r3	; Low word of regpair 2

	.else

rp1_hi	.set	r1	; High word of regpair 1
rp1_lo	.set	r0	; Low word of regpair 1
rp2_hi	.set	r3	; High word of regpair 2
rp2_lo	.set	r2	; Low word of regpair 2

	.endif

op1m1	.set	r4
op1m2	.set	r5
op1e	.set	r6
op2m1	.set	r7
op2m2	.set	r8
op2e	.set	r9
shift	.set	r10
sticky  .set    r11
tmp	.set	lr

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.armfunc __TI_FD_SUB, __TI_FD_ADD
	.endif

__TI_FD_SUB: .asmfunc stack_usage(40)
	STMFD	sp!, {r2-r11, lr}
	EOR	rp2_hi, rp2_hi, #0x80000000	; NEGATE SECOND OPERAND
	B	_start				

__TI_FD_ADD:
	STMFD	sp!, {r2-r11, lr}
	
_start:	MOV	op2m1, rp2_hi, LSL #12		; BUILD INPUT #2 MANTISSA
	MOV	op2m1, op2m1, LSR #3		
	ORR	op2m1, op2m1, rp2_lo, LSR #23	
	MOV	op2m2, rp2_lo, LSL #9		
	MOV	op2e, rp2_hi, LSL #1		; BUILD INPUT #2 EXPONENT
	MOVS	op2e, op2e, LSR #21		
	BNE	$1			

        ORR     tmp, op2m1, op2m2	; IF DENORMALIZED NUMBER (op2m != 0 AND
        MOVNE   rp1_hi, #0              ; op2e == 0), THEN UNDERFLOW
	MOVNE	rp1_lo, #0			;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD   sp!, {r2-r11, pc}       ; ELSE IT IS ZERO SO RETURN INPUT #1
	.else
	LDMFD	sp!, {r2-r11, lr}
	BX	lr
	.endif
	
$1:	ORR	op2m1, op2m1, #0x20000000 	; SET IMPLIED ONE IN MANTISSA
	MOV	shift, #0x700			; INITIALIZE shift WITH 0x7FF
	ADD	shift, shift, #0xFF		
	CMP	op2e, shift			; IF op2e==0x7FF, THEN OVERFLOW
	BNE	$2			
	MOV	rp1_lo, #0			
	MOV	rp1_hi, rp2_hi, LSR #20
	MOV	rp1_hi, rp1_hi, LSL #20
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   sp!, {r2-r11, pc}
	.else
	LDMFD	sp!, {r2-r11, lr}
	BX lr
	.endif      

$2:     CMP     rp2_hi, #0             
	BPL	$3				; IF INPUT #2 IS NEGATIVE,
        RSBS    op2m2, op2m2, #0        	;  THEN NEGATE THE MANTISSA
        RSC     op2m1, op2m1, #0        	

$3:	MOV	op1m1, rp1_hi, LSL #12		; BUILD INPUT #1 MANTISSA
	MOV	op1m1, op1m1, LSR #3	
	ORR	op1m1, op1m1, rp1_lo, LSR #23	
	MOV	op1m2, rp1_lo, LSL #9		
	MOV	op1e, rp1_hi, LSL #1		; BUILD INPUT #1 EXPONENT
	MOVS	op1e, op1e, LSR #21	
	BNE	$4				

        ORR     tmp, op1m1, op1m2		; IF DENORMALIZED NUMBER 
        MOVNE   rp1_hi, #0              	; (op1m != 0 AND op1e == 0),
	MOVNE	rp1_lo, #0			; THEN UNDERFLOW
        MOVEQ   rp1_hi, rp2_hi          	; ELSE IT IS ZERO SO RETURN 
	MOVEQ	rp1_lo, rp2_lo			; INPUT #2
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   sp!, {r2-r11, pc}
	.else
	LDMFD	sp!, {r2-r11, lr}
	BX lr
	.endif      

$4:	ORR	op1m1, op1m1, #0x20000000 	; SET IMPLIED ONE IN MANTISSA
	CMP	op1e, shift			; IF op1e==0x7FF, THEN OVERFLOW
	BNE	$5				
	MOV	rp1_lo, #0		
	MOV	rp1_hi, rp1_hi, LSR #20
	MOV	rp1_hi, rp1_hi, LSL #20
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   sp!, {r2-r11, pc}
	.else
	LDMFD	sp!, {r2-r11, lr}
	BX lr
	.endif      

$5:     CMP     rp1_hi, #0                  	
	BPL	$6			; IF INPUT #1 IS NEGATIVE,
        RSBS    op1m2, op1m2, #0       	;  THEN NEGATE THE MANTISSA
        RSC     op1m1, op1m1, #0       	

$6:     SUBS    shift, op1e, op2e      	; GET THE SHIFT AMOUNT
	BPL	$7				
        MOV     tmp, op1m1             	; IF THE SHIFT AMOUNT IS NEGATIVE, THEN
        MOV     op1m1, op2m1           	;  SWAP THE TWO MANTISSA SO THAT op1m
	MOV  	op2m1, tmp		;  CONTAINS THE LARGER VALUE,
	MOV	tmp, op1m2		
	MOV	op1m2, op2m2			
	MOV	op2m2, tmp			
        RSB     shift, shift, #0       	;  AND NEGATE THE SHIFT AMOUNT,
        MOV     op1e, op2e             	;  AND ENSURE THE LARGER EXP. IS IN op1e

$7:     CMP     shift, #54             	; IF THE SECOND MANTISSA IS SIGNIFICANT,
        MOVPL   sticky, #0
	BPL	no_add				

	CMP	shift, #0		; ADJUST THE SECOND MANTISSA, BASED
        MOVEQ   sticky, #0
	BEQ	no_sft			; UPON ITS EXPONENT.

        RSB     tmp, shift, #57         ; CALCULATE STICKY BIT
        SUBS    op2e, tmp, #32          ; PERFORM LONG LONG LSL BY tmp
        MOVCS   sticky, op2m2, LSL op2e ;  WE DON'T CARE ABOUT THE ACTUAL RESULT
        MOVCC   sticky, op2m1, LSL tmp
        ORRCC   sticky, sticky, op2m2   ; ALL OF OP2M2 IS INCLUDED IN STICKY

	RSBS	tmp, shift, #32         ; tmp := 32 - shift
	MOV	tmp, op2m1, LSL tmp	; set tmp to op2m1 shifted left by 32 - _shift_ places
	MOVCC	tmp, op2m1
	MOV	op2m1, op2m1, ASR shift	;
	MOV	op2m2, op2m2, LSR shift	;
	SUBCC	shift, shift, #32	; used for overflow
	MOVCC	op2m2, tmp, ASR shift
	ADDCS	op2m2, op2m2, tmp	; op2m2 is zero everywhere tmp isn't and vice versa

no_sft:	ADDS	op1m2, op1m2, op2m2	; ADD IT TO THE FIRST MANTISSA
	ADCS	op1m1, op1m1, op2m1	;

no_add: ORRS    tmp, op1m1, op1m2	;
        MOVEQ   rp1_hi, #0              ; IF THE RESULT IS ZERO, 
	MOVEQ	rp1_lo, #0		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMEQFD sp!, {r2-r11, pc}       ;  THEN UNDERFLOW
	.else
	LDMEQFD sp!, {r2-r11, lr}
	BXEQ	lr
	.endif

	CMP	op1m1, #0		; 
        MOVPL   tmp, #0x0               ; IF THE RESULT IS POSITIVE, NOTE SIGN
	BPL	nloop			;
        MOV     tmp, #0x1               ; IF THE RESULT IS NEGATIVE, THEN
        RSBS    op1m2, op1m2, #0x0      ;  NOTE THE SIGN AND
	RSC	op1m1, op1m1, #0x0	;  NEGATE THE RESULT

nloop:  MOVS    op1m2, op1m2, LSL #1    ; NORMALIZE THE RESULTING MANTISSA
	ADCS	op1m1, op1m1, op1m1	; 
        SUB     op1e, op1e, #1          ; ADJUSTING THE EXPONENT AS NECESSARY
        BPL     nloop                   ;
 
        ANDS    shift, op1m2, #0x400    ; GUARD BIT   
        BEQ     no_round                ; IF GUARD BIT 0, DO NOT ROUND
        AND     op2e, op1m2, #0x100     ; IF RESULT REQUIRED NORMALIZATION
        ORR     sticky, sticky, op2e    ;  BIT 26 MUST BE ADDED TO STICKY
        ADDS    op1m2, op1m2, #0x400    ; ROUND THE MANTISSA TO THE NEAREST
	ADCS	op1m1, op1m1, #0	;
        ADDCS   op1e, op1e, #1          ; ADJUST EXPONENT IF AN OVERFLOW OCCURS
        BCS     ovfl                    ; IF OVERFLOW, RESULT IS ALREADY EVEN
        AND     op2e, op1m2, #0x200     ; GET ROUND BIT
        ORRS    sticky, sticky, op2e    ; (ROUND + STICKY)
                                        ; IF (ROUND + STICKY) == 0
        BICEQ   op1m2, op1m2, #0x800    ; WE HAVE A TIE, ROUND TO  EVEN

no_round:
        BIC     op1m2, op1m2, #0x700    ; CLEAR GUARD, ROUND, AND STICKY BITS
        MOVS    op1m2, op1m2, LSL #1    ; REMOVE THE IMPLIED ONE
	ADC	op1m1, op1m1, op1m1	;

ovfl:   ADDS    op1e, op1e, #2          ; NORMALIZE THE EXPONENT
        MOVLE   rp1_hi, #0              ; CHECK FOR UNDERFLOW
	MOVLE	rp1_lo, #0		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMLEFD sp!, {r2-r11, pc}       ;
	.else
	LDMLEFD sp!, {r2-r11, lr}
	BXLE	lr
	.endif

	MOV	shift, #0x700		;
	ADD	shift, shift, #0xFF	;
        CMP     op1e, shift             ; CHECK FOR OVERFLOW
	BCC	$9
	MOV	rp1_lo, #0		;
	AND	rp2_hi, rp2_hi, #0x80000000
	MOV	rp1_hi, #0xFF
	MOV	rp1_hi, rp1_hi, LSL #3
	ADD	rp1_hi, rp1_hi, #7
	MOV	rp1_hi, rp1_hi, LSL #20
	ORR	rp1_hi, rp1_hi, rp2_hi
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   sp!, {r2-r11, pc}
	.else
	LDMFD	sp!, {r2-r11, lr}
	BX lr
	.endif      

 
$9:     MOV	op2m1, op1m1, LSL #20	      ; REPACK THE MANTISSA INTO 
	ORR	rp1_lo, op2m1, op1m2, LSR #12 ; rp1_hi:rp1_lo
	MOV	rp1_hi, op1m1, LSR #12	      ;
        ORR     rp1_hi, rp1_hi, op1e, LSL #20 ; REPACK THE EXPONENT INTO rp1_hi
        ORR     rp1_hi, rp1_hi, tmp, LSL #31  ; REPACK THE SIGN INTO rp1_hi
 
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   sp!, {r2-r11, pc}
	.else
	LDMFD	sp!, {r2-r11, lr}
	BX lr
	.endif      
 
	.endasmfunc

	.end
