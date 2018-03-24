;******************************************************************************
;* FD_EABI16.ASM   - EABI SPECIFIC DOUBLE HELPER FUNCTIONS  -  v16.9.6        *
;*                 AS REQUIRED BY: Run-Time ABI for the ARM Architecture      *
;*                                                                            *
;* Copyright (c) 2012-2017 Texas Instruments Incorporated                     *
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

	.global  __aeabi_cdcmple
	.global  __aeabi_dsub

tmp	.set	r5

	.thumb


;****************************************************************************
;* __AEABI_DNEG -  DOUBLE NEGATION
;****************************************************************************
	.if .TMS470_BIG_DOUBLE
rp_hi	.set	r0	; High word of regpair 
	.else
rp_hi	.set	r1	; High word of regpair
	.endif

	.sect ".text:__aeabi_dneg"
	.global  __aeabi_dneg
	.thumbfunc __aeabi_dneg
__aeabi_dneg: .asmfunc stack_usage(4)
	PUSH	{tmp, lr}
        MOVS    tmp, #0x80
        LSLS    tmp, tmp, #24
	EORS	rp_hi, tmp      	; NEGATE OPERAND
	POP	{tmp, pc} 	  
	.endasmfunc 


;****************************************************************************
;* __AEABI_DRSUB -  DOUBLE REVERSE SUBTRACTION
;*                  SWAP INPUTS, CALL __AEABI_DSUB
;****************************************************************************
	.sect ".text:__aeabi_drsub"
	.global  __aeabi_drsub
	.thumbfunc __aeabi_drsub
__aeabi_drsub: .asmfunc stack_usage(4)
	PUSH	{tmp, lr}

	; SWAP INPUTS
	MOVS tmp, r0
	MOVS r0,  r2
	MOVS r2,  tmp
	MOVS tmp, r1
	MOVS r1,  r3
	MOVS r3,  tmp

	BL __aeabi_dsub
	POP   {tmp, pc} 	  
	.endasmfunc 


;****************************************************************************
;* __AEABI_DCMPEQ -  DOUBLE EQUALITY TEST     
;*                   RETURNS 1 IF INPUTS ARE EQUAL, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_dcmpeq"
	.global  __aeabi_dcmpeq
	.thumbfunc __aeabi_dcmpeq
__aeabi_dcmpeq: .asmfunc stack_usage(4)
	PUSH	{lr}
	BL	__aeabi_cdcmple

	BNE	$ne
	MOVS	r0, #1			; Z set
        B       $endeq
$ne:	MOVS	r0, #0			; Z clear
$endeq:
	POP     {pc} 	  
	.endasmfunc

	
;****************************************************************************
;* __AEABI_DCMPLT -  DOUBLE LESS-THAN TEST     
;*                   RETURNS 1 IF INP1 < INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_dcmplt"
	.global  __aeabi_dcmplt
	.thumbfunc __aeabi_dcmplt
__aeabi_dcmplt: .asmfunc stack_usage(4)
	PUSH	{lr}
	BL	__aeabi_cdcmple

        BCS     $cs
	MOVS	r0, #1			; C clear
        B       $endlt
$cs:	MOVS	r0, #0			; C set
$endlt:
	POP     {pc} 	  
	.endasmfunc


;****************************************************************************
;* __AEABI_DCMPLE -  DOUBLE LESS-THAN OR EQUAL TO TEST     
;*                   RETURNS 1 IF INP1 <= INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_dcmple"
	.global  __aeabi_dcmple
	.thumbfunc __aeabi_dcmple
__aeabi_dcmple: .asmfunc stack_usage(4)
	PUSH	{lr}
	BL	__aeabi_cdcmple

        BHI     $hi
	MOVS	r0, #1			; C clear or Z set
        B       $endle
$hi:	MOVS	r0, #0			; C set and Z clear
$endle:
	POP     {pc} 	  
	.endasmfunc


;****************************************************************************
;* __AEABI_DCMPGT -  DOUBLE GREATER-THAN TEST     
;*                   RETURNS 1 IF INP1 > INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_dcmpgt"
	.global  __aeabi_dcmpgt
	.thumbfunc __aeabi_dcmpgt
__aeabi_dcmpgt: .asmfunc stack_usage(4)
	PUSH	{lr}
	BL	__aeabi_cdcmple

        BLS     $ls
	MOVS	r0, #1			; C set and Z clear
        B       $endgt
$ls:	MOVS	r0, #0			; C clear or Z set
$endgt:
	POP     {pc}
	.endasmfunc


;****************************************************************************
;* __AEABI_DCMPGE -  DOUBLE GREATER-THAN OR EQUAL TO TEST     
;*                   RETURNS 1 IF INP1 >= INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_dcmpge"
	.global  __aeabi_dcmpge
	.thumbfunc __aeabi_dcmpge
__aeabi_dcmpge: .asmfunc stack_usage(4)
	PUSH	{lr}
	BL	__aeabi_cdcmple

	BCC     $cc
        MOVS	r0, #1			; C set 
        B       $endge
$cc:	MOVS	r0, #0			; C clear
$endge:	
	POP	{pc} 	  
	.endasmfunc


;****************************************************************************
;* __AEABI_DCMPUN -  DOUBLE UNORDERED                         
;*                   RETURNS 1 IF EITHER NUMBER IS A NaN, 0 OTHERWISE 
;*                   DOUBLE NaN: 
;*                         SIGN BIT: 0
;*                         EXPONENT: 11111111111 
;*                         MANTISSA: At least one bit set in the 20 most
;*                                   significant bits (EABI, Section 4.1.1.1)
;****************************************************************************
	.if .TMS470_BIG_DOUBLE
rp1_hi	.set	r0	; High word of regpair 1
rp2_hi	.set	r2	; High word of regpair 2
	.else
rp1_hi	.set	r1	; High word of regpair 1
rp2_hi	.set	r3	; High word of regpair 2
	.endif

msk	.set	r4

	.sect ".text:__aeabi_dcmpun"
	.global  __aeabi_dcmpun
	.thumbfunc __aeabi_dcmpun
__aeabi_dcmpun: .asmfunc stack_usage(8)
	PUSH	{r4, tmp, lr}
	; check for all 1s in exponent
	LSLS	tmp, rp1_hi, #1
	LSRS	tmp, tmp, #21
	MOVS	msk, #0x80		; LOAD 0x7FF into msk
        LSLS    msk, msk, #4
	SUBS	msk, msk, #1
	CMP	tmp, msk
	BNE	$op2

	; check for non-zero mantissa
	MOVS	msk, #0x10		; 0xFFFFF   
        LSLS    msk, msk, #16
        SUBS    msk, msk, #1            
	ANDS	msk, msk, tmp
	
        BEQ     $op2
	MOVS	r0, #1			; != 0 implies non-zero mantissa
	POP	{r4, tmp, pc} 	  

$op2:
	; repeat for op2
	; check for all 1s in exponent
	LSLS	tmp, rp2_hi, #1
	LSRS	tmp, tmp, #21
	MOVS	msk, #0x80		; LOAD 0x7FF into msk
        LSLS    msk, msk, #4
	SUBS	msk, msk, #1
	CMP	tmp, msk
	BNE	$fin

	; check for non-zero mantissa
	MOVS	msk, #0x10		; 0xFFFFF   
        LSLS    msk, msk, #16
        SUBS     msk, msk, #1            
	ANDS	msk, msk, tmp
	
        BEQ     $fin
        MOVS	r0, #1			; != 0 implies non-zero mantissa
	POP	{r4, tmp, pc} 	  

$fin:
	MOVS	r0, #0			
	POP	{r4, tmp, pc} 	  
	.endasmfunc

	.end
	

