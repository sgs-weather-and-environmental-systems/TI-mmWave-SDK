;* ========================================================================= *
;* c60asm.i  v8.1.3                                                          *
;*                                                                           *
;* Copyright (c) 2002-2017 Texas Instruments Incorporated                    *
;* http://www.ti.com/                                                        *
;*                                                                           *
;*  Redistribution and  use in source  and binary forms, with  or without    *
;*  modification,  are permitted provided  that the  following conditions    *
;*  are met:                                                                 *
;*                                                                           *
;*     Redistributions  of source  code must  retain the  above copyright    *
;*     notice, this list of conditions and the following disclaimer.         *
;*                                                                           *
;*     Redistributions in binary form  must reproduce the above copyright    *
;*     notice, this  list of conditions  and the following  disclaimer in    *
;*     the  documentation  and/or   other  materials  provided  with  the    *
;*     distribution.                                                         *
;*                                                                           *
;*     Neither the  name of Texas Instruments Incorporated  nor the names    *
;*     of its  contributors may  be used to  endorse or  promote products    *
;*     derived  from   this  software  without   specific  prior  written    *
;*     permission.                                                           *
;*                                                                           *
;*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    *
;*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    *
;*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    *
;*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    *
;*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    *
;*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    *
;*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    *
;*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    *
;*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    *
;*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    *
;*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     *
;*                                                                           *
;* ========================================================================= *
;*                                                                           *
;*   TEXAS INSTRUMENTS, INC.                                                 *
;*                                                                           *
;*   NAME                                                                    *
;*       c60asm.i -- CALL/RET compatibility bridge for pre-4.30 tools        *
;*                                                                           *
;*   USAGE                                                                   *
;*       Just .include at top of your source file.  Alternately, use         *
;*       the compiler flag -ahi or -ahc to force inclusion in the            *
;*       source-file.                                                        *
;*                                                                           *
;*   DESCRIPTION                                                             *
;*       This file provides a set of pseudo-operations that are intended     *
;*       to replace the "B" and "BNOP" branch instructions in certain        *
;*       usage scenarios.  The point of the new pseudo-ops is to allow the   *
;*       tools to provide more precise information to the profiler as to     *
;*       the *purpose* of a branch, so that it can provide more accurate     *
;*       profile data.                                                       *
;*                                                                           *
;*       Mnemonic    Purpose                                                 *
;*       CALL        Calls to functions that will return to this function.   *
;*       RET         Exiting (returning from) this function.                 *
;*       CALLRET     Calling a function that will return on your behalf.     *
;*       CALLNOP     Same as CALL, but with parallel NOPs (C64x only)        *
;*       RETNOP      Same as RET, but with parallel NOPs (C64x only)         *
;*       CRNOP       Same as CALLRET, but with parallel NOPs (C64x only)     *
;*                                                                           *
;*   NOTES                                                                   *
;*       This file is actually just a compatibility shim, intended to        *
;*       provide forward compatibility between tool versions < 4.30          *
;*       and tool versions >= 4.30.  The purpose of this file it purely      *
;*       compatibility.  Tool versions >= 4.30 are required to gain the      *
;*       greater-precision information for the profiler.                     *
;* ========================================================================= *

;* ========================================================================= *
;* Create "asmver" with current version of assembler. Value is 0 if assembler
;* version predates the predefined symbol.
;* ========================================================================= *
           .if $isdefed("__TI_ASSEMBLER_VERSION__")
           .asg    __TI_ASSEMBLER_VERSION__, asmver
           .elseif $isdefed(".ASSEMBLER_VERSION")
           .asg    .ASSEMBLER_VERSION, asmver
           .else
           .asg    0, asmver
           .endif

;* ========================================================================= *
;* If the assembler version predates the support call mnemonics
;* ========================================================================= *
           .if asmver < 430
           .asg    B,    CALL     ; Function Call
           .asg    B,    RET      ; Return from a Function
           .asg    B,    CALLRET  ; Function call with Call / Ret chaining.

           .asg    B,    call     ; Function Call
           .asg    B,    ret      ; Return from a Function
           .asg    B,    callret  ; Function call with Call / Ret chaining.

           .if .TMS320C6400 | .TMS320C6740 | .TMS320C6600
           .asg    BNOP, CALLNOP  ; C64x BNOP as a Fn. Call
           .asg    BNOP, RETNOP   ; C64x BNOP as a Fn. Return
           .asg    BNOP, CRNOP    ; C64x Fn call w/, Call/Ret chaining via BNOP.

           .asg    BNOP, callnop  ; C64x BNOP as a Fn. Call
           .asg    BNOP, retnop   ; C64x BNOP as a Fn. Return
           .asg    BNOP, crnop    ; C64x Fn call w/, Call/Ret chaining via BNOP.
           .endif

           .asg ";" , .asmfunc
           .asg ";" , .endasmfunc
           .endif
