;******************************************************************************
;* STKCHK32.ASM  - STACK OVERFLOW CHECK -  v16.9.6                            *
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
;* C_STKCHK - CHECK THE STACK FOR OVERFLOW TO MANAGE THE STACK DYNAMICALLY
;*            32 BIS
;****************************************************************************
;*
;*   o FRAME SIZE IS IN V1              
;****************************************************************************
	.arm
 
	.if __TI_EABI_ASSEMBLER
	    .asg	handle_stkovf, 	__TI_HANDLE_STKOVF
	    .asg	exit, 		__TI_EXIT
	.else
	    .clink
	    .asg	_handle_stkovf, __TI_HANDLE_STKOVF
	    .asg	_exit, 		__TI_EXIT
	.endif

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.armfunc C_STKCHK, C_STKCHK_LEAF
	.endif

        .global C_STKCHK
        .global C_STKCHK_LEAF

C_STKCHK: .asmfunc stack_usage(0)
C_STKCHK_LEAF:
        LDR       V9, c_stack 		; Load the top of the stack address
	ADD	  V9, V9, V1  		; Add the frame size 
	ADD	  V9, V9, #32 		; Add max register save size
        CMP       V9, SP      		; Return if no stack overflow
        BLT       L1

        LDR       V1, c_stkchkc 	; _stkchk_called is set if we already 
        LDR       V9, [V1, #0]		; detected stack overflow 
        CMP       V9, #0	
        BNE       L1			; return if _stkchk_called is set

        MOV       V9, #1		; Now we have detected stack overflow
        STR       V9, [V1, #0]		; So call the user function to 

        BL        __TI_HANDLE_STKOVF	;   handle the stack overflow

        MOV       R0, #0

        BL        __TI_EXIT		; Call the exit routine
L1:
	BX	  LR
	.endasmfunc

;******************************************************************************
;* CONSTANT TABLE                                                             *
;******************************************************************************
            .align  4
c_stkchkc:  .field          _stkchk_called,32
            .align  4
c_stack:    .field          __stack,32

;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
        .global __stack
	.global _stkchk_called
        .global __TI_HANDLE_STKOVF
        .global __TI_EXIT



