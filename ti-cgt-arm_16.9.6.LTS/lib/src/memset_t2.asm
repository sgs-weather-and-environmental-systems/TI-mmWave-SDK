;******************************************************************************
;* MEMSET_T2.ASM  - THUMB-2 STATE -  v16.9.6                                  *
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
	CPY	A4, A3			; EABI, swap second and third args
	CPY	A3, A2			; for __aeabi_memset* functions
	CPY	A2, A4
	
	.else
	.clink
        .asg _memset, __TI_MEMSET

	.endif

	.thumbfunc __TI_MEMSET
	.global __TI_MEMSET
__TI_MEMSET:	.asmfunc stack_usage(20)
	PUSH	{R0, R4, R5, R6, LR}	; save R0 also since original dst
					; address is returned.

	TST	R0, #3			; check for word alignment
	BEQ	_word_aligned

			; set bytes until there are no more
					; to set or until address is aligned
_unaligned_loop:
	CMP	R2, #0
	ITTT	HI
	STRBHI	R1, [R0], #1
	SUBSHI	R2, R2, #1
	TSTHI	R0, #3
	BNE	_unaligned_loop
          
	CMP	R2, #0			; return early if no more bytes
	IT	EQ
	POPEQ	{R0, R4, R5, R6, PC}	; to set.

_word_aligned:
	ANDS	R1, R1, #255		; be safe since prototype has value as
					; as an int rather than unsigned char

	ORR	R1, R1, R1, LSL	#8      ; replicate byte in 2nd byte of
					; register

	CMP	R2,#4			; are at least 4 bytes being set
	BCC	_memset3

	ORR	R1, R1, R1, LSL	#16	; replicate byte in upper 2 bytes
					; of register. note that each of
					; the bottom 2 bytes already contain 
					; the byte value from above.

	CMP	R2,#8			; are at least 8 bytes being set
	BCC	_memset7
        
	CPY	R6,R1			; copy bits into another register so
					; 8 bytes at a time can be copied.
					; use R5 since it is already being
					; saved/restored.

	CMP	R2,#16			; are at least 16 bytes being set
	BCC	_memset15

	CPY	R4, R1			; copy bits into 2 other registers so
	CPY	R5, R1			; 16 bytes at a time can be copied

	SUBS	R3, R2, #15		; set up loop count
	ANDS	R2, R2, #15		; determine number of bytes to set
					; after setting 16 byte blocks

_memset16_loop:				; set blocks of 16 bytes
	STMIA	R0!, {R1, R4, R5, R6}
	SUBS	R3, R3, #16
	BHI	_memset16_loop

_memset15:				; may still be as many as 15 bytes to 
					; set. the address in R0 is guaranteed
					; to be word aligned here.

	TST	R2, #8			; are at least 8 bytes being set
	IT	NE
	STMIANE	R0!, {R1, R6}


_memset7:				; may still be as many as 7 bytes to 
					; set. the address in R0 is guaranteed
					; to be word aligned here.

	TST	R2, #4			; are at least 4 bytes being set
	IT	NE
	STRNE	R1, [R0], #4

_memset3:				; may still be as many as 3 bytes to 
					; set. the address in R0 is guaranteed
					; to be word aligned here.

	TST	R2, #2			; are there at least 2 more bytes to 
	IT	NE
	STRHNE	R1, [R0], #2		; set.  the address in R0 is guaranteed
					; to be half-word aligned here.
	
	TST	R2, #1			; is there one remaining byte to set
	IT	NE
	STRBNE	R1, [R0]


	POP     {R0, R4, R5, R6, PC}		; restore regs and return
	.endasmfunc

	.end
