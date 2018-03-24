;******************************************************************************
;* FD_TOS_T2.ASM  - THUMB-2 STATE -  v16.9.6                                  *
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
;* FD$TOFS - CONVERT AN IEEE 754 FORMAT DOUBLE PRECISION FLOATING 
;* 	     POINT NUMBER TO 754 FORMAT SINGLE PRECISION FLOATING 
;****************************************************************************
;*
;*   o INPUT OP IS IN r0:r1
;*   o RESULT IS RETURNED IN r0
;*   o r1 IS DESTROYED
;*
;*   o OVERFLOW RETURNS +/- INFINITY (0x7F800000/FF800000)
;*   o DENORMALIZED NUMBERS ARE TREATED AS UNDERFLOWS
;*   o UNDERFLOW RETURNS ZERO (0x00000000)
;*   o ROUNDING MODE:  ROUND TO NEAREST
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
;*
;* +--------------------------------------------------------------+
;* | SINGLE PRECISION FLOATING POINT FORMAT                       |
;* |   32-bit representation                                      |
;* |   31 30    23 22                    0                        |
;* |   +-+--------+-----------------------+                       |
;* |   |S|    E   |           M           +                       |
;* |   +-+--------+-----------------------+                       |
;* |                                                              |
;* |   <S>  SIGN FIELD    :        0 - POSITIVE VALUE             |
;* |                               1 - NEGATIVE VALUE             |
;* |                                                              |
;* |   <E>  EXPONENT FIELD:       00 - ZERO IFF M == 0            |
;* |                         01...FE - EXPONENT VALUE (127 BIAS)  |
;* |                              FF - INFINITY                   |
;* |                                                              |
;* |   <M>  MANTISSA FIELD:  FRACTIONAL MAGNITUDE WITH IMPLIED 1  |
;* +--------------------------------------------------------------+
;*
;****************************************************************************

	.thumb

        .if __TI_EABI_ASSEMBLER         ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_d2f, __TI_FD$TOFS  ; RTS BEING BUILT
        .else
	.clink
        .asg FD$TOFS, __TI_FD$TOFS
        .endif

	.global	__TI_FD$TOFS

	.if .TMS470_BIG_DOUBLE
rp1_hi	.set	r0	; High word of regpair 1
rp1_lo	.set	r1	; Low word of regpair 1
	.else
rp1_hi	.set	r1	; High word of regpair 1
rp1_lo	.set	r0	; Low word of regpair 1
	.endif

tmp     .set    r2
tmp2    .set    r3

	.thumbfunc __TI_FD$TOFS
__TI_FD$TOFS: .asmfunc
	PUSH	{r2, r3}			;
	MOV	tmp2, #0xFF000000		; GENERATE 0xFFE00000
	ORR	tmp2, tmp2, #0x00E00000		;
	MOV	tmp, rp1_hi, LSL #1		; REMOVE SIGN BIT
	SUBS	tmp, tmp, tmp2			; CHECK FOR FULL EXPONENT
	BCS	specin				; SPECIAL NaN / INF HANDLING

	LSR	rp1_lo, rp1_lo, #20		; SETUP MANTISSA INTO rp1_lo
	ORR	rp1_lo, rp1_lo, rp1_hi, LSL #12	;

	ADDS	rp1_lo, rp1_lo, #0x00000100	; ADD 1/2 FOR ROUNDING
	ITT	CS
	LSRCS	rp1_lo, rp1_lo, #1		;
	ADDCS	rp1_hi, rp1_hi, #0x00100000	;

	LSR	rp1_lo, rp1_lo, #9		; ALIGN MANTISSA
	CMP	rp1_hi, #0			; AND ADD SIGN
	IT	MI
	ORRMI	rp1_lo, rp1_lo, #0x80000000	;

	LSL	rp1_hi, rp1_hi, #1		; SETUP EXPONENT
	LSRS	rp1_hi, rp1_hi, #21		;


	SUBS	rp1_hi, rp1_hi, #0x380		; ADJUST FOR THE BIAS
	BMI     unfl                            ; CHECK FOR UNDERFLOW / ZERO

	CMP	rp1_hi, #0xFF			; CHECK FOR OVERFLOW
	BCS	ovfl				;

	ORR	r0, rp1_lo, rp1_hi, LSL #23	; ADD EXPONENT INTO RESULT
	POP	{r2, r3}			;
	BX	lr				;

specin:						; HANDLE INF AND NaN INPUTS
	MVNS	tmp2, tmp2			; BUILD 0x001FFFFF
	ANDS	tmp, tmp, tmp2			; REMOVE THE EXPONENT
	ORRS	tmp, tmp, rp1_lo		; CHECK IF THIS IS A NaN
	BEQ	ovfl				; ON FALSE RETURN INFINITY

	MVNS	r0, tmp2			; 0xFFE00000 -- IS A NaN
	POP	{r2, r3}			;
	BX	lr				; RETURN A NaN
        
unfl:   MOVS    r0, #0                          ;
	POP	{r2, r3}			;
	BX      lr                              ;

ovfl:	AND	r1, rp1_hi, #0x80000000		; OVERFLOW, RETURN +/- INF
	MOVS	r0, #0xFF
	LSL	r0, r0, #23
	ORRS	r0, r0, r1
	POP	{r2, r3}			;
	BX	lr				;

	.endasmfunc

	.end
