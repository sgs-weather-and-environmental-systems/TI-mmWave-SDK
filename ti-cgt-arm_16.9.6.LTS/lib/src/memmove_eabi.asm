;******************************************************************************
;* MEMMOVE_EABI.ASM                 v16.9.6                                   *
;*                                                                            *
;* Copyright (c) 2004-2017 Texas Instruments Incorporated                     *
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
;*                                                                            *
;* Memory copy functions required by			                      *
;* Run-time ABI for the ARM Architecture, 30th Oct 2003, Section 4.3.4        *
;******************************************************************************

	.global	 memmove

	.global	 __aeabi_memmove
	.global	 __aeabi_memmove4
	.global	 __aeabi_memmove8

	.if .TMS470_32BIS

	.arm

	.armfunc __aeabi_memmove
__aeabi_memmove: .asmfunc stack_usage(0)
	B memmove
	.endasmfunc

	.armfunc __aeabi_memmove4
__aeabi_memmove4: .asmfunc stack_usage(0)
	B memmove
	.endasmfunc

	.armfunc __aeabi_memmove8
__aeabi_memmove8: .asmfunc stack_usage(0)
	B memmove
	.endasmfunc

	.else					; ! .TMS470_32BIS

	.thumb

	.thumbfunc __aeabi_memmove
__aeabi_memmove: .asmfunc stack_usage(0)
	.if !__TI_TMS470_V4__
	PUSH	{lr}
	BL	memmove				; 
	POP	{pc}
	.else
	PUSH	{r4}
	MOV	r4, lr
	BL	memmove
	MOV	lr, r4
	POP	{r4}
	BX	lr
	.endif
	.endasmfunc

	.thumbfunc __aeabi_memmove4
__aeabi_memmove4: .asmfunc stack_usage(0)
	.if !__TI_TMS470_V4__
	PUSH	{lr}
	BL	memmove
	POP	{pc}
	.else
	PUSH	{r4}
	MOV	r4, lr
	BL	memmove
	MOV	lr, r4
	POP	{r4}
	BX	lr
	.endif
	.endasmfunc

	.thumbfunc __aeabi_memmove8
__aeabi_memmove8: .asmfunc stack_usage(0)
	.if !__TI_TMS470_V4__
	PUSH	{lr}
	BL	memmove
	POP	{pc}
	.else
	PUSH	{r4}
	MOV	r4, lr
	BL	memmove
	MOV	lr, r4
	POP	{r4}
	BX	lr
	.endif
	.endasmfunc

	.endif					; .TMS470_32BIS

	.end
