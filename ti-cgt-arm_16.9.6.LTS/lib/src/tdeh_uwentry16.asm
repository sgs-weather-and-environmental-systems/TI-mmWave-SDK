;/****************************************************************************/
;/*  tdeh_uwentry16.asm v16.9.6                                              */
;* 
;* Copyright (c) 2012-2017 Texas Instruments Incorporated
;* http://www.ti.com/ 
;* 
;*  Redistribution and  use in source  and binary forms, with  or without
;*  modification,  are permitted provided  that the  following conditions
;*  are met:
;* 
;*     Redistributions  of source  code must  retain the  above copyright
;*     notice, this list of conditions and the following disclaimer.
;* 
;*     Redistributions in binary form  must reproduce the above copyright
;*     notice, this  list of conditions  and the following  disclaimer in
;*     the  documentation  and/or   other  materials  provided  with  the
;*     distribution.
;* 
;*     Neither the  name of Texas Instruments Incorporated  nor the names
;*     of its  contributors may  be used to  endorse or  promote products
;*     derived  from   this  software  without   specific  prior  written
;*     permission.
;* 
;*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS
;*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT
;*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
;*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT
;*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT
;*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;* 
;/*                                                                          */
;/*  Target-Specific entry points for Table-Driven Exception Handling        */
;/*                                                                          */
;/*  This version differs from the thumb-2 version in that it does not save  */
;/*  R4-R12 (save on call regs). The thumb-2 version saves all sixteen       */
;/*  registers, but that is not possible with 16bit thumb instructions. See  */
;/*  tdeh_uwentry_msp430.asm in msp_rts for a good explanation of what these */
;/*  functions do.                                                           */
;/*                                                                          */
;/****************************************************************************/

	.thumb


	;_Unwind_RaiseException - An asm wrapper for __TI_Unwind_RaiseException
	; Creates a Register Buffer on the stack, and passes a ptr to this area
	; as the 2nd parameter (in R1)

	.global  _Unwind_RaiseException
	.thumbfunc _Unwind_RaiseException
  
	.global __TI_Unwind_RaiseException
	
_Unwind_RaiseException: .asmfunc stack_usage(28)

	ADD     sp, #-12
	MOV     r4, lr
        STR	r4, [sp, #4]
        MOV     r4, sp
	STR	r4, [sp]
		
	PUSH	{r0-r3}   
	MOV     r4, lr
        STR	r4, [sp, #6*4]	    ; COPY regbuf core[LR] into core[PC]
	MOV	r1, sp
	BL	__TI_Unwind_RaiseException
        LDR	r4, [sp, #5*4]
	MOV     lr, r4
	ADD	sp, sp, #7*4
	BX	lr

	.endasmfunc


	;_Unwind_Resume - An asm wrapper for __TI_Unwind_Resume. Creates a 
	; Register Buffer on the stack, and passes a ptr to this area
	; as the 2nd parameter (in R1), tail calls __TI_Unwind_Resume

	.global  _Unwind_Resume
	.thumbfunc _Unwind_Resume

	.global __TI_Unwind_Resume

_Unwind_Resume: .asmfunc stack_usage(28)

	ADD     sp, #-12
        MOV    r4, lr
	STR	r4, [sp, #4]
        MOV    r4, sp
	STR	r4, [sp]

	PUSH	{r0-r3}
	MOV	r1, sp
	
	; __TI_Unwind_Resume ends up too far away for a 16bit B
	LDR	r4, $CON1
	MOV	pc, r4
	;B	__TI_Unwind_Resume

	.endasmfunc
	
	.align 4
$CON1:	.word __TI_Unwind_Resume


	; __TI_Install_CoreRegs - Copies Register buffer (ptr to which is 
	; passed in R0) into the machine registers

	.global  __TI_Install_CoreRegs
	.thumbfunc __TI_Install_CoreRegs

__TI_Install_CoreRegs: .asmfunc stack_usage(0)
	; R0 contains address of register array to restore
	; All the registers right now except R0 and R15 (of course)
	; are garbage as far as I care.
	LDR	R2, [R0, #6*4]	; load stored PC to R2
	LDR	R1, [R0, #1*4]	; load stored R1 to R1
	STR	R2, [R0, #1*4]	; overwrite stored R1 with PC
	MOVS    R4, #2*4
        ADDS	R2, R0, R4	; set R2 to point to the stored R2
        LDR     R3, [R2, #4]
        LDR     R2, [R2]
	LDR	R4, [R0, #4*4]  ; restore R13
        MOV     R13, R4
	LDR	R4, [R0, #5*4]  ; restore R14
        MOV     R14, R4
        LDR     R4, [R0, #4]
        LDR     R0, [R0]
	MOV     PC, R4

	.endasmfunc

	
	; __cxa_end_cleanup - Calls __TI_cxa_end_cleanup to perform 
	; bookkeeping for foreign exceptions and exceptions thrown during 
	; cleanup - __TI_cxa_end_cleanup returns ptr to UE in R0,
	; call _Unwind_Resume with UE * as parm

	.global  __cxa_end_cleanup
	.thumbfunc __cxa_end_cleanup

        .global __TI_cxa_end_cleanup
        .global _Unwind_Resume

__cxa_end_cleanup: .asmfunc stack_usage(12)
	PUSH	{r1-r3}		; preserve reg changes due to dtors
        BL	__TI_cxa_end_cleanup
        POP	{r1-r3}
        B	_Unwind_Resume

	.endasmfunc
	
	.end
