;******************************************************************************
;* FS_TOD32.ASM  - 32 BIT STATE -  v16.9.6                                    *
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
;* FS_TOFD - CONVERT AN IEEE 754 FORMAT SINGLE PRECISION FLOATING 
;* 	     POINT NUMBER TO 754 FORMAT DOUBLE PRECISION FLOATING 
;****************************************************************************
;*
;*   o INPUT OP IS IN r0
;*   o RESULT IS RETURNED IN r0:r1
;*
;*   o OVERFLOW RETURNS +/- INFINITY 
;*       (0x7ff00000:00000000) or (0xfff00000:00000000) 
;*   o DENORMALIZED NUMBERS ARE TREATED AS UNDERFLOWS
;*   o UNDERFLOW RETURNS ZERO (0x00000000:00000000)
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

	.arm

	.if __TI_EABI_ASSEMBLER            ; ASSIGN EXTERNAL NAMES BASED ON
	.asg __aeabi_f2d, __TI_FS_TOFD  ; RTS BEING BUILT
	.else
	.clink
	.asg FS_TOFD, __TI_FS_TOFD
	.endif

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.armfunc __TI_FS_TOFD
	.endif

	.if .TMS470_BIG_DOUBLE
rhi	.set	r0	; High word of regpair 1
rlo	.set	r1	; Low word of regpair 1
	.else
rhi	.set	r1	; High word of regpair 1
rlo	.set	r0	; Low word of regpair 1
	.endif

e0	.set	lr

	.global	__TI_FS_TOFD
__TI_FS_TOFD: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}		; SAVE CONTEXT

	MOVS	e0, r0, LSL #1		; SETUP EXPONENT IN e0
	MOVS	e0, e0, LSR #24		;
	BEQ	unfl			; CHECK FOR UNDERFLOW / ZERO

	CMP	e0, #0xFF		; CHECK FOR INFINITY
	BEQ	ovfl			; AND RETURN OVERFLOW

	ADD	e0, e0, #0x380		; ADJUST FOR THE BIAS

	MOV	r1, r0, LSR #31		; ENCODE SIGN WITH EXPONENT
	ORR	e0, e0, r1, LSL #11	;

	.if .TMS470_LITTLE_DOUBLE	; IN LITTLE ENDIAN MODE 
	MOV    rhi, r0			; MOVE THE VALUE TO RHI
	.endif

	MOV	rlo, rhi, LSL #29	; SETUP LOW PART OF MANTISSA
	MOV	rhi, rhi, LSL #9	; AND SETUP HIGH PART OF MANTISSA
	MOV	rhi, rhi, LSR #12		;
	ORR	rhi, rhi, e0, LSL #20	; OR SIGN AND EXPONENT INTO RESULT
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD	sp!, {pc}		;
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	
unfl:	MOV	rhi, #0x0		; IF UNDERFLOW, RETURN 0
	MOV	rlo, #0x0		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD	sp!, {pc}		;
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif

ovfl:					; IF OVERFLOW, RETURN +/- INFINITY / NaN
	.if .TMS470_LITTLE_DOUBLE	; IN LITTLE ENDIAN MODE 
	MOV	rhi, r0			; MOVE THE VALUE TO RHI
	.endif
	MOV	rlo, r0,  LSL #9	; KEEP THE MANTISSA FOR NaN VS INFINITY
	MOV	rhi, rhi, LSR #23	; ISOLATE SIGN AND EXPONENT
	MOV	rhi, rhi, LSL #3
	ADD	rhi, rhi, #7
	MOV	rhi, rhi, LSL #20
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD	sp!, {pc}		;
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif

	.endasmfunc

	.end
