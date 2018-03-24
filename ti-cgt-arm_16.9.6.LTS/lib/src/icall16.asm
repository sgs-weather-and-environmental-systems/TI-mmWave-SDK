;******************************************************************************
;* ICALL16.ASM  - 16 BIT STATE -  v16.9.6                                     *
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
;* IND$CALL - PERFORM INDIRECT CALL, SUPPORTING DUAL STATE INTERWORKING
;*
;****************************************************************************
;*
;*   o ADDRESS OF CALLED FUNCTION IS IN r4
;*   o r4 GETS DESTROYED
;*
;****************************************************************************
	.thumb
	
        .if !__TI_EABI_ASSEMBLER
	.clink
	.endif
	
 	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc IND$CALL
	.endif

	.global IND$CALL
IND$CALL: .asmfunc stack_usage(0)
	MOV	ip, r4			; SAVE OFF DESTINATION ADDRESS
	LSRS	r4, r4, #1		; TEST STATE OF DESTINATION
	BCC	ep_32                   ;
	BX	ip                      ; INDIRECT CALL TO 16BIS ENTRY POINT
	NOP				;

ep_32:	MOV	r4, lr			; STORE RETURN ADDRESS IN r4
	MOV	lr, pc			; SETUP NEW RETURN ADDRESS
	BX	ip			; INDIRECT CALL TO 32BIS ENTRY POINT
	.arm
	BX	r4			; RETURN
	.thumb

	.endasmfunc

	.end

