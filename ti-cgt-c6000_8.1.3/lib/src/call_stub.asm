;******************************************************************************
;* call_stub  v8.1.3                                                          *
;*                                                                            *
;* Copyright (c) 2000-2017 Texas Instruments Incorporated                     *
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

 .if .TMS320C6400 | .TMS320C6740 | .TMS320C6600

        .global __call_stub, __c6xabi_call_stub

; THIS CALL STUB SAVES SOME SOC REGISTERS ON THE STACK EFFECTIVELY
; EMULATING THE SOE BEHAVIOR ON THESE SOC REGISTERS.
; WE GENERALLY JUMP TO THIS FUNCTION FROM A FILE LOCAL STUB THAT LOADS THE
; ADDRESS OF THE CALLED FUNCTION INTO B31. FOR EFFICIENCY (PERFORMANCE)
; THE LOAD DOES NOT COMPLETE TILL WE ARE 1 CYCLE IN THIS FUNCTION.
; IT IS **** NECESSARY **** THAT THE CALL NOT HAPPEN TILL 1 CYCLE AFTER
; WE HAVE REACHED THIS CALL STUB

	.sect	".text:__call_stub"

__c6xabi_call_stub
__call_stub: .asmfunc
	stw  a2,      *b15--[2]
        call b31
||      stdw a7:a6,   *b15--
        stdw a1:a0,   *b15--
        stdw b7:b6,   *b15--
        stdw b5:b4,   *b15--
        stdw b1:b0,   *b15--
        stdw b3:b2,   *b15--
||      addkpc __stub_ret, b3, 0
__stub_ret: ; actual call_occurs

        lddw *++b15, b3:b2
        lddw *++b15, b1:b0
        lddw *++b15, b5:b4
        lddw *++b15, b7:b6
        lddw *++b15, a1:a0
        b b3        
||      lddw *++b15, a7:a6
        ldw  *++b15[2], a2
        nop 4
        .endasmfunc

 .endif
