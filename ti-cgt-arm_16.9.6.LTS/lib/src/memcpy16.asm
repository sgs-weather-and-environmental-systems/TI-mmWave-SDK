;******************************************************************************
;* MEMCPY16.ASM  - 16 BIT STATE -  v16.9.6                                    *
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
;* C$MEMCPY - COPY CHARACTERS FROM SOURCE TO DEST
;*
;****************************************************************************
;*
;*   o DESTINATION LOCATION IS IN r0
;*   o SOURCE LOCATION IS IN r1
;*   o NUMBER OF CHARACTERS TO BE COPIED IS IN r2
;****************************************************************************

        .thumb
 
        .if __TI_EABI_ASSEMBLER 
        .asg memcpy, __TI_C$MEMCPY
	.thumbfunc __aeabi_memcpy
	.thumbfunc __aeabi_memcpy4
	.thumbfunc __aeabi_memcpy8
	.global __aeabi_memcpy
	.global __aeabi_memcpy4
	.global __aeabi_memcpy8
__aeabi_memcpy:
__aeabi_memcpy4:
__aeabi_memcpy8:
        .else
	.clink
        .asg C$MEMCPY, __TI_C$MEMCPY
        .endif
 
	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_C$MEMCPY
	.endif

        .global __TI_C$MEMCPY
__TI_C$MEMCPY: .asmfunc stack_usage(0)
        CMP     r2, #0                  ; CHECK FOR n == 0
        BEQ     _ret2_			;
 
        MOV	r12, r0			; SAVE RETURN VALUE

	LSLS	r3, r1, #30		; CHECK ADDRESS ALIGNMENT
	BNE	_unaln			; IF NOT WORD ALIGNED, HANDLE SPECIALLY
	LSLS	r3, r0, #30		;
	BNE	_saln			;

_aln:	CMP	r2, #16			; ADDRESSES AND LENGTH ARE WORD ALIGNED
	BCC	_udr16			; IF n < 16, SKIP 16 BYTE COPY CODE

_ovr16:	PUSH	{r4 - r6}		; COPYING 16 BYTES OR MORE.
	SUBS	r2, #16			;
_lp16:	LDMIA	r1!, {r3 - r6}		;
	STMIA	r0!, {r3 - r6}		;
	SUBS	r2, #16			;
	BCS	_lp16			;
	POP	{r4 - r6}		; RESTORE THE SAVED REGISTERS AND
	ADDS	r2, #16			; CONTINUE THE COPY IF THE REMAINDER
	BEQ	_ret_			; IS NONZERO.
	
_udr16: CMP	r2, #4			; IF UNDER 16, THEN COMPUTE 
	BCC	_off1			; THE COPY CODE TO EXECUTE, AND
	CMP	r2, #8			; GO THERE
	BCC	_c4			;
	CMP	r2, #12			;
	BCC	_c8			;

_c12:	LDMIA	r1!, {r3}		; COPY 12 BYTES
	STMIA	r0!, {r3}		; 
_c8:	LDMIA	r1!, {r3} 		; COPY 8 BYTES
	STMIA	r0!, {r3}		;
_c4:	LDMIA	r1!, {r3} 		; COPY 4 BYTES
	STMIA	r0!, {r3}		;

_oddsz:	LSLS	r2, r2, #30		; HANDLE THE TRAILING BYTES
	BEQ	_ret_			;
	LSRS	r2, r2, #30		;
	B	_lp1			;

_unaln:	LDRB	r3, [r1]		; THE ADDRESSES ARE NOT WORD ALIGNED.
	STRB	r3, [r0]		; COPY BYTES UNTIL THE SOURCE IS
	ADDS	r1, r1, #1		;
	ADDS	r0, r0, #1		;
	SUBS	r2, r2, #1		; WORD ALIGNED OR THE COPY SIZE
	BEQ	_ret_			; BECOMES ZERO
	LSLS	r3, r1, #30		;
	BNE	_unaln			;

_saln:	LSLS	r3, r0, #31		; IF THE ADDRESSES ARE OFF BY 1 BYTE
	BNE	_off1			; JUST BYTE COPY

	LSLS	r3, r0, #30		; IF THE ADDRESSES ARE NOW WORD ALIGNED
	BEQ	_aln			; GO COPY.  ELSE THEY ARE OFF BY 2, SO
					; GO SHORT WORD COPY

_off2:	SUBS	r2, r2, #4		; COPY 2 BYTES AT A TIME...
	BCC	_oddb			;
_cp4s:	LDMIA	r1!, {r3}		; LOAD IN CHUNKS OF 4
	.if	.TMS470_BIG
	STRH	r3, [r0, #2]		;
	LSRS	r3, r3, #16		;
	STRH	r3, [r0]		;
	.else
	STRH	r3, [r0]		;
	LSRS	r3, r3, #16		;
	STRH	r3, [r0, #2]		;
	.endif
	ADDS	r0, r0, #4		;
	SUBS	r2, r2, #4		;
	BCS	_cp4s			;
	B	_oddb			;

_cp4:	LDMIA	r1!, {r3}		; COPY 1 BYTE AT A TIME, IN CHUNKS OF 4
	.if	.TMS470_BIG
	STRB	r3, [r0, #3]		;
	LSRS	r3, r3, #8		;
	STRB	r3, [r0, #2]		;
	LSRS	r3, r3, #8		;
	STRB	r3, [r0, #1]		;
	LSRS	r3, r3, #8		;
	STRB	r3, [r0]		;
	.else
	STRB	r3, [r0]		;
	LSRS	r3, r3, #8		;
	STRB	r3, [r0, #1]		;
	LSRS	r3, r3, #8		;
	STRB	r3, [r0, #2]		;
	LSRS	r3, r3, #8		;
	STRB	r3, [r0, #3]		;
	.endif
	ADDS	r0, r0, #4		;
_off1:	SUBS	r2, r2, #4		;
	BCS	_cp4			;

_oddb:	ADDS	r2, r2, #4		; THEN COPY THE ODD BYTES.
	BEQ	_ret_			;
	
_lp1:	LDRB	r3, [r1]		;
	STRB	r3, [r0]		;
	ADDS	r1, r1, #1		;
	ADDS	r0, r0, #1		;
	SUBS	r2, r2, #1		;
	BNE	_lp1			;
_ret_:	MOV	r0, r12			;
_ret2_:	BX	lr

	.endasmfunc

	.end
