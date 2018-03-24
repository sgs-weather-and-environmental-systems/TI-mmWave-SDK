;******************************************************************************
;* U_DIV16.ASM  - 16 BIT STATE -  v16.9.6                                     *
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
;* U$DIV/U$MOD - DIVIDE TWO UNSIGNED 32 BIT NUMBERS - SMALL CODE SIZE VERSION
;*
;****************************************************************************
;*
;*   o DIVIDEND IS IN r0
;*   o DIVISOR IS IN r1
;*
;*   o QUOTIENT IS PLACED IN r1
;*   o REMAINDER IS PLACED IN r0
;*
;*   o DIVIDE BY ZERO RETURNS ZERO
;*
;*   o EABI MODE, QUOTIENT IN r0, REMAINDER IN r1
;*   o EABI MODE, DIVIDE BY ZERO RETURNS
;*   	- 0 IF DIVIDEND == 0
;*   	- UINT_MAX IF DIVIDEND > 0
;*
;****************************************************************************
	.thumb

        .if __TI_EABI_ASSEMBLER                   ; ASSIGN EXTERNAL NAMES 
	.ref __aeabi_idiv0
        .asg __aeabi_uidivmod, __TI_U$DIV         ; BASED ON RTS BEING BUILT
        .else
	.clink
        .asg U$DIV, __TI_U$DIV
        .endif

dvs     .set    r2              ; WORK COPY OF THE DIVISOR (SHIFTED)
quo     .set    r3              ; WORK COPY OF THE QUOTIENT
max     .set    r4              ; MAX DIVIDEND FOR DIVISOR SHIFT AMOUNT

        .if !__TI_EABI_ASSEMBLER
	.if __TI_ARM9ABI_ASSEMBLER
	    .thumbfunc U$MOD
	.endif
	
	.global U$MOD
U$MOD:
	.endif
	
	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_U$DIV
	.endif

	.global __TI_U$DIV
	.if __TI_EABI_ASSEMBLER
	.global __aeabi_uidiv
__aeabi_uidiv:
	.endif
__TI_U$DIV:	.asmfunc stack_usage(16)
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        PUSH    {r2-r4, lr}             ; SAVE CONTEXT
	.else
	PUSH	{r2-r5}
	.endif
 
        MOVS    dvs, r1                 ; CHECK FOR DIVISION BY ZERO
        BEQ     _div_by_zero_           ;

        MOVS    quo, #0                 ; INITIALIZE THE QUOTIENT

        MOVS    max, #1                 ;
        LSLS    max, max, #31           ;
        CMP     r0, max                 ; SETUP THE MAX DIVIDEND WHEN
        BCS     _udvs_loop_             ; CALCULATING THE DIVISOR SHIFT
        MOVS    max, r0                 ; AMOUNT

_udvs_loop_:
        CMP     max, dvs                ;
        BLS     _udiv_                  ;
        LSLS    dvs, dvs, #1            ; CALCULATE THE MAXIMUM DIVISOR
        B       _udvs_loop_             ; SHIFT AMOUNT

_udiv_:
        CMP     r0, dvs                 ; IF DIVIDEND IS LARGER THAN DIVISOR,
        ADCS    quo, quo                ;  SHIFT A 1 INTO THE QUOTIENT, ELSE 0
        CMP     r0, dvs                 ; IF DIVIDEND IS LARGER THAN DIVISOR,
        BCC     _cc1_                   ;  SUBTRACT THE DIVISOR,
        SUBS    r0, r0, dvs             ; 
_cc1_:  CMP     r1, dvs                 ; IF THERE IS SHIFTED DIVISOR, THEN
        BCS     _cc2_                   ;
        LSRS    dvs, dvs, #1            ; CONTINUE THE LOOP.
        B       _udiv_                  ; 
_cc2_:  MOVS    r1, quo                 ; ELSE DONE. PLACE THE QUOTIENT
        .if __TI_EABI_ASSEMBLER         ; EABI RTS, QUOT IN R0, REM IN R1
        MOVS    r2, r0                  ; SWAP R0 & R1
        MOVS    r0, r1
        MOVS    r1, r2
        .endif
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        POP     {r2-r4, pc}             ; IT ITS RIGHT PLACE.
	.else
	POP	{r2-r5}
	BX	lr
	.endif

_div_by_zero_:
        .if __TI_EABI_ASSEMBLER         ; EABI RTS, QUOT IN R0, REM IN R1
	CMP     r0, #0
	BEQ     _divi_zero_
	MVNS    r0, r1			; IF DIVIDEND IS +VE, RETURN UINT_MAX
					; R1 IS ZERO AT THIS POINT
_divi_zero_:
	.if __TI_TMS470_V4__
	MOV	r5, lr
	BL      __aeabi_idiv0
	MOV	lr, r5
	.else
	BL      __aeabi_idiv0
	.endif
	.else
        MOVS    r0, #0                  ; DIVIDE BY ZERO RETURNS ZERO
        .endif
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        POP     {r2-r4, pc}             ;
	.else
	POP	{r2-r5}
	BX	lr
	.endif

	.endasmfunc

        .end
