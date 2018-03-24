;******************************************************************************
;* I_DIV16.ASM  - 16 BIT STATE -  v16.9.6                                     *
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
;* I$DIV/I$MOD - DIVIDE TWO SIGNED 32 BIT NUMBERS.
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
;*   o SIGN OF REMAINDER IS THE SIGN OF THE DIVIDEND
;*
;*   o EABI MODE, QUOTIENT IN r0, REMAINDER IN r1
;*   o EABI MODE, DIVIDE BY ZERO RETURNS
;*   	- 0 IF DIVIDEND == 0
;*   	- INT_MAX IF DIVIDEND > 0
;*   	- INT_MIN IF DIVIDEND < 0
;*
;****************************************************************************
	.thumb

        .if __TI_EABI_ASSEMBLER                   ; ASSIGN EXTERNAL NAMES 
	.ref __aeabi_idiv0
        .asg __aeabi_idivmod, __TI_I$DIV          ; BASED ON RTS BEING BUILT
        .else
	.clink
        .asg I$DIV, __TI_I$DIV
        .endif

dvs     .set    r2              ; WORK COPY OF THE DIVISOR (SHIFTED)
quo     .set    r3              ; WORK COPY OF THE QUOTIENT
negs    .set    r4              ; SAVED COPY OF THE SIGNS

        .if !__TI_EABI_ASSEMBLER
	.if __TI_ARM9ABI_ASSEMBLER
	    .thumbfunc I$MOD
	.endif
	
	.global I$MOD
I$MOD:
	.endif
	
	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_I$DIV
	.endif

	.global __TI_I$DIV
	.if __TI_EABI_ASSEMBLER
	.global __aeabi_idiv
__aeabi_idiv:
	.endif
__TI_I$DIV:	.asmfunc stack_usage(16)
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        PUSH    {r2-r4, lr}             ; SAVE CONTEXT
	.else
	PUSH	{r2-r5}
	.endif

        CMP     r1, #0                  ; CHECK FOR DIVISION BY ZERO
        BEQ     _div_by_zero_           ;

        LSRS    negs, r1, #1            ; MOVE THE SIGN OF THE DIVISOR TO negs
        CMP     r1, #0                  ;
        BPL     _ct1_                   ;
        NEGS    r1, r1                  ; ABSOLUTE SIGN OF THE DIVISOR
_ct1_:  ASRS    dvs, r0, #1             ;
        EORS    negs, dvs               ; MOVE THE SIGN OF THE DIVIDEND TO negs
        CMP     r0, #0                  ;
        BPL     _ct2_                   ;
        NEGS     r0, r0                  ; ABSOLUTE SIGN OF THE DIVIDEND

_ct2_:  MOVS    quo, #0                 ; INITIALIZE THE QUOTIENT
        MOVS    dvs, r1                 ; INITIALIZE THE DIVISOR (SHIFTED)

_sdvs_loop_:
        CMP     r0, dvs                 ; 
        BLS     _sdiv_                  ;
        LSLS    dvs, dvs, #1            ; CALCULATE THE MAXIMUM DIVISOR
        B       _sdvs_loop_             ; SHIFT AMOUNT

_sdiv_:
        CMP     r0, dvs                 ; IF DIVIDEND IS LARGER THAN DIVISOR,
        ADCS    quo, quo                ;  SHIFT A 1 INTO THE QUOTIENT, ELSE 0
        CMP     r0, dvs                 ; IF DIVIDEND IS LARGER THAN DIVISOR,
        BCC     _cc1_                   ;  SUBTRACT THE DIVISOR,
        SUBS    r0, r0, dvs             ; 
_cc1_:  CMP     r1, dvs                 ; IF THERE IS SHIFTED DIVISOR, THEN
        BCS     _cc2_                   ;
        LSRS    dvs, dvs, #1            ; CONTINUE THE LOOP.
        B       _sdiv_                  ; 
_cc2_:  MOVS    r1, quo                 ; ELSE DONE. PLACE THE QUOTIENT
                                        ; IT ITS RIGHT PLACE.
        CMP     negs, #0                ;
        BPL     _ct3_                   ;
        NEGS    r0, r0                  ; SET THE SIGN OF THE REMAINDER AND
_ct3_:  LSLS    negs, negs, #1          ;
        BPL     _ct4_                   ;
        NEGS    r1, r1                  ; SET THE SIGN OF THE QUOTIENT.
_ct4_:
        .if __TI_EABI_ASSEMBLER         ; EABI RTS, QUOT IN R0, REM IN R1
        MOVS    r2, r0                  ; SWAP R0 & R1
        MOVS    r0, r1
        MOVS    r1, r2
        .endif

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        POP     {r2-r4, pc}             ;
	.else
	POP	{r2-r5}
	BX	lr
	.endif

_div_by_zero_:
	.if __TI_EABI_ASSEMBLER         ; EABI RTS, QUOT IN R0, REM IN R1
        MOVS	r3, #1                  ;
	LSLS	r3, r3, #31		; r3 = 0x80000000

	CMP     r0, #0
	BEQ	_idiv0_			; IF DIVIDEND IS 0, RETURN 0

	BLT     _neg_
	MVNS    r3,r3
_neg_:
	MOVS    r0,r3
_idiv0_:
	.if __TI_TMS470_V4__
	MOV	r5, lr
	BL      __aeabi_idiv0
	MOV	lr, r5
	.else
	BL	__aeabi_idiv0
	.endif
	
	.else
	MOVS	r0, #0			; DIVIDE BY ZERO RETURNS ZERO
        .endif

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        POP     {r2-r4, pc}             ;
	.else
	POP	{r2-r5}
	BX	lr
	.endif
	.endasmfunc

        .end
