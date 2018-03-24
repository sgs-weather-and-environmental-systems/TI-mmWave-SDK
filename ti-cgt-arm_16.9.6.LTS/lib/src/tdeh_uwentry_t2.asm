;/****************************************************************************/
;/*  tdeh_uwentry_t2.asm v16.9.6                                             */
;* 
;* Copyright (c) 2005-2017 Texas Instruments Incorporated
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
;/****************************************************************************/

	.thumb


	;_Unwind_RaiseException - An asm wrapper for __TI_Unwind_RaiseException
	; Creates a Register Buffer on the stack, and passes a ptr to this area
	; as the 2nd parameter (in R1)

	.global  _Unwind_RaiseException
	.thumbfunc _Unwind_RaiseException
  
	.global __TI_Unwind_RaiseException
	
_Unwind_RaiseException: .asmfunc stack_usage(64)

	STR	lr, [sp, #-8]
	STR	sp, [sp, #-12]
	SUB     sp, sp, #12
		
	STMDB	sp!, {r0-r12}   
	STR	lr, [sp, #15*4]	    ; COPY regbuf core[LR] into core[PC]
	MOV	r1, sp
	BL	__TI_Unwind_RaiseException
	LDR	lr, [sp, #14*4]
	ADD	sp, sp, #16*4
	BX	lr

	.endasmfunc


	;_Unwind_Resume - An asm wrapper for __TI_Unwind_Resume. Creates a 
	; Register Buffer on the stack, and passes a ptr to this area
	; as the 2nd parameter (in R1), tail calls __TI_Unwind_Resume

	.global  _Unwind_Resume
	.thumbfunc _Unwind_Resume

	.global __TI_Unwind_Resume

_Unwind_Resume: .asmfunc stack_usage(64)

	STR	lr, [sp, #-8]
	STR	sp, [sp, #-12]
	SUB     sp, sp, #12

	STMDB	sp!, {r0-r12}   
	MOV	r1, sp
	B	__TI_Unwind_Resume

	.endasmfunc


	; __TI_Install_CoreRegs - Copies Register buffer (ptr to which is 
	; passed in R0) into the machine registers

	.global  __TI_Install_CoreRegs
	.thumbfunc __TI_Install_CoreRegs

__TI_Install_CoreRegs: .asmfunc stack_usage(0)
	; R0 contains address of register array to restore
	; All the registers right now except R0 and R15 (of course)
	; are garbage as far as I care.
	LDR	R2, [R0, #15*4]	; load stored PC to R2
	LDR	R1, [R0, #1*4]	; load stored R1 to R1
	STR	R2, [R0, #1*4]	; overwrite stored R1 with PC
	ADD	R2, R0, #2*4	; set R2 to point to the stored R2
	LDMIA	R2, {R2-R12}	; restore registers r2-r12 (now we can't use them)
	LDR	R13, [R0, #13*4]; restore R13
	LDR	R14, [R0, #14*4]; restore R14
	LDMIA   R0, {R0, R15}	; restore R0 and the PC

	.endasmfunc

	
	; __cxa_end_cleanup - Calls __TI_cxa_end_cleanup to perform 
	; bookkeeping for foreign exceptions and exceptions thrown during 
	; cleanup - __TI_cxa_end_cleanup returns ptr to UE in R0,
	; call _Unwind_Resume with UE * as parm

	.global  __cxa_end_cleanup
	.thumbfunc __cxa_end_cleanup

        .global __TI_cxa_end_cleanup
        .global _Unwind_Resume

__cxa_end_cleanup: .asmfunc stack_usage(48)
	STMDB	r13!, {r1-r12}		; preserve reg changes due to dtors
        BL	__TI_cxa_end_cleanup
        LDMIA	r13!, {r1-r12}
        B	_Unwind_Resume

	.endasmfunc

	.if __TI_VFP_SUPPORT__ | __TI_NEON_SUPPORT__

	; __TI_preserve_low_VFP - Stores the low VFP registers into memory
	
	.global  __TI_preserve_low_VFP
	.thumbfunc __TI_preserve_low_VFP
	
__TI_preserve_low_VFP:	 .asmfunc stack_usage(0)
	.if __TI_NEON_SUPPORT__
	VSTMIA  {D0-D15}, r0
	.else	
	FSTMIAD	r0, {D0-D15}
	.endif
	BX	lr
	
	.endasmfunc

	; __TI_restore_low_VFP - Loads the low VFP registers from memory

	.global  __TI_restore_low_VFP
	.thumbfunc __TI_restore_low_VFP
	
__TI_restore_low_VFP:	.asmfunc stack_usage(0)
	.if __TI_NEON_SUPPORT__
	VLDMIA  {D0-D15}, r0
	.else	
	FLDMIAD	r0, {D0-D15}
	.endif
	BX	lr

	.endasmfunc

	.endif

	.if __TI_VFPV3_SUPPORT__ | __TI_NEON_SUPPORT__

	; __TI_preserve_high_VFP - Stores the high VFP registers into memory

	.global  __TI_preserve_high_VFP
	.thumbfunc __TI_preserve_high_VFP
	
__TI_preserve_high_VFP:	 .asmfunc stack_usage(0)
	.if __TI_NEON_SUPPORT__
	VSTMIA	{D16-D31}, r0
	.else
	FSTMIAD	r0, {D16-D31}
	.endif
	BX	lr
	
	.endasmfunc

	; __TI_restore_high_VFP - Loads the high VFP registers from memory

	.global  __TI_restore_high_VFP
	.thumbfunc __TI_restore_high_VFP
	
__TI_restore_high_VFP:	.asmfunc stack_usage(0)
	.if __TI_NEON_SUPPORT__
	VLDMIA	{D16-D31}, r0
	.else
	FLDMIAD	r0, {D16-D31}
	.endif	
	BX	lr

	.endasmfunc

	.endif

	.end
