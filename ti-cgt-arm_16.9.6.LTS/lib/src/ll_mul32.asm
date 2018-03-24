;******************************************************************************
;* LL_MUL32.ASM  - 32 BIT STATE -  v16.9.6                                    *
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
;* __aeabi_lmul - MULTIPLY TWO 64 BIT SIGNED LONG LONG NUMBERS
;****************************************************************************
;*
;*   o INPUT OP1 IS IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*   o INPUT OP2 IS IN r2:r3 (r3:r2 IF LITTLE ENDIAN)
;*   o RESULT IS RETURNED IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*   o INPUT OP2 IN r2:r3 IS NOT DESTROYED
;*
;*   o THE UPPER 64 BITS OF THE 64 X 64 MULTIPLICATION RESULT IS IGNORED.
;*
;****************************************************************************

	.arm

	; Not used by TI tools - multiply generated inline

        .if __TI_EABI_ASSEMBLER            ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_lmul, __TI_LL_MUL     ; RTS BEING BUILT
        .else
	.clink
        .asg LL_MUL, __TI_LL_MUL
        .endif

	.if .TMS470_LITTLE

l1_hi	.set r1
l1_lo	.set r0
l2_hi	.set r3
l2_lo	.set r2

	.else

l1_hi	.set r0
l1_lo	.set r1
l2_hi	.set r2
l2_lo	.set r3

	.endif


	.global	__TI_LL_MUL
	.armfunc __TI_LL_MUL
__TI_LL_MUL:	.asmfunc stack_usage(12)
	STMFD	SP!, {r4-r5, lr}	;

        ; r4:r5 = l1_hi:l1_lo * l2_hi:l2_lo = 
	;	LO32(l1_hi*l2_lo):0 + LO32(l1_lo*l2_hi):0 + ALL64(l1_lo*l2_lo)
        MUL     r4, l2_lo, l1_hi        ;  r4 = LO32(l1_hi*l2_lo)
        MLA     r4, l2_hi, l1_lo, r4    ;  r4 = LO32(l1_hi*l2_lo) + 
					;		LO32(l1_lo*l2_hi)
        MOV     r5, #0                  ;  r4:r5 = r4:0
        UMLAL   r5, r4, l2_lo, l1_lo    ;  r4:r5 = ALL64(l1_lo*l2_lo) + r4:0
        MOV     l1_hi, r4               ;  RETURN THE RESULT IN l1_hi:l1_lo 
        MOV     l1_lo, r5               ;

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   SP!,  {r4-r5, pc}       ;
	.else
	LDMFD	SP!,  {r4-r5, lr}
	BX	lr
	.endif

	.endasmfunc

	.end
