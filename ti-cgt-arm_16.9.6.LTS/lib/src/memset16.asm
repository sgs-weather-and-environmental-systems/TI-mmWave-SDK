;******************************************************************************
;* MEMSET16.ASM  - 16 BIT STATE -  v16.9.6                                    *
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
;* memset - INITIALIZE MEMORY WITH VALUE.
;* 
;*	C Prototype   : void *memset(void *s, int c, size_t n);
;*      C++ Prototype : void *std::memset(void *s, int c, std::size_t n);
;*
;****************************************************************************
;*
;*   o DESTINATION LOCATION IS IN r0
;*   o INITIALIZATION VALUE IS IN r1
;*   o NUMBER OF BYTES TO INITIALIZE IS IN r2
;*
;*   o ORIGINAL DESTINATION LOCATION RETURNED IN r0
;****************************************************************************

	.thumb

        .if __TI_EABI_ASSEMBLER 
        .asg memset, __TI_MEMSET

	.thumbfunc __aeabi_memset
	.thumbfunc __aeabi_memset4
	.thumbfunc __aeabi_memset8
	.thumbfunc __aeabi_memclr
	.thumbfunc __aeabi_memclr4
	.thumbfunc __aeabi_memclr8
	.global __aeabi_memset
	.global __aeabi_memset4
	.global __aeabi_memset8
	.global __aeabi_memclr
	.global __aeabi_memclr4
	.global __aeabi_memclr8

__aeabi_memclr:
__aeabi_memclr4:
__aeabi_memclr8:
	MOVS	A3, #0			; __aeabi_memclr* writes 0s

__aeabi_memset:
__aeabi_memset4:
__aeabi_memset8:
	MOVS	A4, A3			; EABI, swap second and third args
	MOVS	A3, A2			; for __aeabi_memset* functions
	MOVS	A2, A4
	
	.elseif __TI_ARM9ABI_ASSEMBLER
	.clink
        .asg _memset, __TI_MEMSET

	.else
	.clink
        .asg $memset, __TI_MEMSET

	.global _memset
	.arm
_memset:
	ADD 	IP, PC, #1
	BX	IP
	.thumb

	.endif

        .if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_MEMSET
        .endif

	.global __TI_MEMSET
__TI_MEMSET:	.asmfunc stack_usage(0)
	MOV	R12, R0			; save R0 also since original dst
					; address is returned.

	LSLS	R3, R0, #30
	BEQ	_word_aligned

_unaligned_loop:			; set bytes until there are no more
	CMP	R2, #0			; to set or until address is aligned
        BEQ	_done
	STRB	R1, [R0]
	ADDS	R0, #1
	SUBS	R2, #1
	LSLS	R3, R0, #30
	BNE	_unaligned_loop
          
_word_aligned:
	CMP	R2,#4			; are at least 4 bytes being set
	BCC	_memset3

	LSLS	R1, R1, #24		; be safe since prototype has value as
	LSRS	R1, R1, #24		; as an int rather than unsigned char

	LSLS	R3, R1, #8		; replicate byte in all 4 bytes of
	ORRS	R1, R3			; register
	LSLS	R3, R1, #16
	ORRS	R1, R3

	CMP	R2,#8			; are at least 8 bytes being set
	BCC	_memset7
        
	MOVS	R3,R1			; copy bits into another register so
					; 8 bytes at a time can be copied.

	CMP	R2,#16			; are at least 16 bytes being set
	BCC	_memset15

	PUSH	{R4, R5, R6}		; save regs needed by 16 byte copies

	MOVS	R4, #15

	SUBS	R6, R2, R4		; set up loop count
	ANDS	R2, R4			; determine number of bytes to set
					; after setting 16 byte blocks


	MOVS	R4, R1			; copy bits into 2 other registers so
	MOVS	R5, R1			; 16 bytes at a time can be copied
	

_memset16_loop:				; set blocks of 16 bytes
	STMIA	R0!, {R1, R3, R4, R5}
	SUBS	R6, #16
	BHI	_memset16_loop

	POP	{R4, R5, R6}		; resotre regs used by 16 byte copies

_memset15:				; may still be as many as 15 bytes to 
					; set. the address in R0 is guaranteed
					; to be word aligned here.

	CMP	R2, #8
	BCC	_memset7	
	STMIA	R0!, {R1, R3}		; are at least 8 bytes being set
	SUBS	R2, #8

_memset7:				; may still be as many as 7 bytes to 
					; set. the address in R0 is guaranteed
					; to be word aligned here.

	CMP	R2,#4			; are at least 4 bytes being set
	BCC	_memset3
	STMIA	R0!, {R1}
	SUBS	R2, #4

_memset3:				; may still be as many as 3 bytes to 
					; set. the address in R0 is guaranteed
					; to be word aligned here.

	CMP	R2, #0
	BEQ	_done			; if 0 bytes left to set then done

	SUBS	R2, #1
_memset1_loop:
	STRB	R1, [R0, R2]
	SUBS	R2, #1
	BCS	_memset1_loop


_done:					; all done, restore regs and return
	MOV	R0, R12
	BX	LR

	.endasmfunc

	.end
