;******************************************************************************
;* STKCHK16.ASM  - STACK OVERFLOW CHECK -  v16.9.6                            *
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
;* C$STKCHK - CHECK THE STACK FOR OVERFLOW TO MANAGE THE STACK DYNAMICALLY
;*            16 BIS
;****************************************************************************
;*
;*   o FRAME SIZE IS IN V1            
;****************************************************************************
	.thumb

	.if __TI_EABI_ASSEMBLER
	    .asg	handle_stkovf, 	__TI_HANDLE_STKOVF
	    .asg	exit, 		__TI_EXIT
	    .thumbfunc  C$STKCHK, C$STKCHK_LEAF
	.elseif __TI_ARM9ABI_ASSEMBLER
	    .clink
	    .asg	_handle_stkovf, __TI_HANDLE_STKOVF
	    .asg	_exit, 		__TI_EXIT
	    .thumbfunc  C$STKCHK, C$STKCHK_LEAF
	.else
	    .clink
	    .asg	$handle_stkovf, __TI_HANDLE_STKOVF
	    .asg	$exit, 		__TI_EXIT
	.endif

        .global C$STKCHK
        .global C$STKCHK_LEAF

C$STKCHK: .asmfunc stack_usage(4)
C$STKCHK_LEAF:
        PUSH      {V2}

        LDR       V2, c_stack 		; Load the top of the stack address
	ADDS	  V2, V2, V1		; Add frame size to it
	ADDS	  V2, #32		; Add the maximum register save size 

        CMP       V2, SP	
        BLT       L2			; Return if stack does not overflow

        LDR       V1, c_stkchkc 	; Load the stkchk called flag
        LDR       V2, [V1, #0]
        CMP       V2, #0		; If flag is set, we already detected 
        BNE       L2			; overflow, just exit

        MOVS      V2, #1		; Set the stkchk called flag
        STR       V2, [V1, #0]	
        BL        __TI_HANDLE_STKOVF 	; Call the user defined function

	
        MOVS      R0, #0
        BL        __TI_EXIT		; Call the exit routine

L2:
	POP	   {V2}
        BX	  LR
	.endasmfunc

;******************************************************************************
;* CONSTANT TABLE                                                             *
;******************************************************************************
           .align  4
c_stkchkc: .field          _stkchk_called,32
           .align  4
c_stack:   .field          __stack,32

;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
        .global __TI_HANDLE_STKOVF
        .global __TI_EXIT
        .global __stack
	.global _stkchk_called

