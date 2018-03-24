;******************************************************************************
;* tdeh_uwentry_c6000.asm v8.1.3                                              *
;*                                                                            *
;* Copyright (c) 2008-2017 Texas Instruments Incorporated                     *
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

        .asg A15, FP
        .asg B14, DP
        .asg B15, SP

        .cdecls CPP, LIST, "tdeh_c6000.h"

_USE_BNOP .set (.TMS320C6400 | .TMS320C6740 | .TMS320C6600)
_USE_STDW .set (.TMS320C6400 | .TMS320C6740 | .TMS320C6600)
_USE_LDDW .set (.TMS320C6400 | .TMS320C6740 | .TMS320C6600 | .TMS320C6700)
_USE_DINT .set (.TMS320C6400_PLUS | .TMS320C6740 | .TMS320C6600)

;------------------------------------------------------------------------------
; _Unwind_RaiseException - wrapper for C function __TI_Unwind_RaiseException
;
; _Unwind_Reason_Code _Unwind_RaiseException(_Unwind_Exception *);
;
; _Unwind_Reason_Code __TI_Unwind_RaiseException(_Unwind_Exception *uexcep,
;                                                _Unwind_Context   *context);
;------------------------------------------------------------------------------
; This function is the language-independent starting point for
; propagating an exception.  It is called by __cxa_throw.
;
; This function needs to capture the state of the caller, which means
; all of the SOE registers (including DP and SP) as well as the return
; address.  (The stack unwinder finds the data for the caller by
; looking up the return address in the EXIDX table to find the
; "apparently throwing call site.")
;
; The state is saved in an array allocated on the stack, which is
; passed as the second argument to __TI_Unwind_RaiseException.
;------------------------------------------------------------------------------

        ;
        ; We index the register buffer by _Unwind_Reg_Id, so it needs
        ; to be big enough to hold all the registers, even the ones we
        ; don't really save.  This size is _UR_REG_LAST+1, which is an
        ; odd number, so bump it up to maintain stack alignment.
        ;
        .asg (_Unwind_Reg_Id._UR_REG_LAST+2), FRM_SZ

        .def _Unwind_RaiseException
        .ref __TI_Unwind_RaiseException
_Unwind_RaiseException: .asmfunc stack_usage(FRM_SZ * 4)

        ; This function must:
        ; 1. Save all of the SOE registers in stack-allocated "context,"
        ;    including RETA as "PC".
        ; 2. Call __TI_Unwind_RaiseException(uexcep, context)
        ;    If things go well, this call never returns.
        ; 3. If __TI_Unwind_RaiseException returns an error, return
        ;    its return value to the original caller (stored in "PC")

	; PIC Code

	MVKL $PCR_OFFSET(__TI_Unwind_RaiseException,base_pcr), B2 
	MVKH $PCR_OFFSET(__TI_Unwind_RaiseException,base_pcr), B2 

base_pcr:
_Unwind_Resume_ENTRY:

	MVC PCE1,B1
	ADD B1, B2, B2

        .if _USE_STDW

        MV SP, B1
 ||     MV DP, B0
 ||     STW B3, *SP--[2]

        STDW B1:B0, *SP--

        MVKL RL0, B3
        MVKH RL0, B3
        CALL B2                                 ; takes two args, A4 and B4
                                                ; returns a value in A4

 ||     STDW B13:B12, *SP--
        STDW B11:B10, *SP--[2]
        STDW A15:A14, *SP--
        STDW A13:A12, *SP--
        STDW A11:A10, *SP--[2]
        ADDAW SP, 2, B4

        .else

        STW SP, *SP[_Unwind_Reg_Id._UR_SP - FRM_SZ + 2]
||      ADDK -(FRM_SZ * 4), SP

        ADDAW SP, 2, B4

        STW B3, *B4[_Unwind_Reg_Id._UR_PC]
        STW DP, *B4[_Unwind_Reg_Id._UR_DP]
        STW B13, *B4[_Unwind_Reg_Id._UR_B13]
        STW B12, *B4[_Unwind_Reg_Id._UR_B12]
        STW B11, *B4[_Unwind_Reg_Id._UR_B11]
        STW B10, *B4[_Unwind_Reg_Id._UR_B10]
        STW A15, *B4[_Unwind_Reg_Id._UR_A15]

        MVKL RL0, B3
        MVKH RL0, B3
        CALL B2                                 ; takes two args, A4 and B4
                                                ; returns a value in A4

        STW A14, *B4[_Unwind_Reg_Id._UR_A14]
        STW A13, *B4[_Unwind_Reg_Id._UR_A13]
        STW A12, *B4[_Unwind_Reg_Id._UR_A12]
        STW A11, *B4[_Unwind_Reg_Id._UR_A11]
        STW A10, *B4[_Unwind_Reg_Id._UR_A10]

        .endif

RL0:
        ;
        ; If __TI_Unwind_RaiseException returns (it can only return
        ; with an error), return to the original caller (__cxa_throw),
        ; but do not restore any of the other registers.  (Why not?
        ; seems like we should).
        ;

        LDW *SP[_Unwind_Reg_Id._UR_PC + 2], B3
        NOP 4

        .if _USE_BNOP

        ADDAW SP, FRM_SZ, SP
 ||     RETNOP B3,5

        .else

        RET B3
        ADDAW SP, FRM_SZ, SP
        NOP 4

        .endif

        .endasmfunc

;------------------------------------------------------------------------------
; _Unwind_Resume - wrapper for C function __TI_Unwind_Resume
;
; void _Unwind_Resume(_Unwind_Exception *);
;
; void __TI_Unwind_Resume(_Unwind_Exception *uexcep, _Unwind_Context *context);
;------------------------------------------------------------------------------
; This function is the language-independent "resume" function.  After
; each frame gets a chance to perform cleanup, this function is called
; to resume propagating the exception to the next call frame.  It is
; called by __cxa_end_cleanup, below.
;
; Creates a register buffer just as _Unwind_RaiseException does, but
; calls a different function afterward.  __TI_Unwind_Resume never returns.
;------------------------------------------------------------------------------

        .def _Unwind_Resume
        .ref __TI_Unwind_Resume
_Unwind_Resume: .asmfunc stack_usage(FRM_SZ * 4)

        ;
        ; This function must:
        ; 1. Save all of the SOE registers in stack-allocated "context."
        ;    It need not save RETA, which will be clobbered by
        ;    __TI_Unwind_Resume.
        ; 2. Call __TI_Unwind_Resume(uexcept, context)
        ;    This call never returns.
        ;
        ; The code for _Unwind_RaiseException does all of what we
        ; want, so just tail call it.  Since __TI_Unwind_Resume never
        ; returns, this path will never reach the epilog of
        ; _Unwind_RaiseException.
        ;

        .if _USE_BNOP

        BNOP _Unwind_Resume_ENTRY, 3

        .else

        B _Unwind_Resume_ENTRY
        NOP 3

        .endif

	; PIC Code

	MVKL $PCR_OFFSET(__TI_Unwind_Resume,base_pcr), B2 ; takes args A4,B4
	MVKH $PCR_OFFSET(__TI_Unwind_Resume,base_pcr), B2 

        .endasmfunc

;------------------------------------------------------------------------------
; __TI_Install_CoreRegs - Set machine state to effect return, branch, or call
;
; void __TI_Install_CoreRegs(void *core_regs);
;------------------------------------------------------------------------------
; __TI_Install_CoreRegs is where the unwinder finally writes to the
; actual registers.  It is called when the actual registers need to be
; modified, such as when unwinding is completely done, or when handler
; code needs to be executed.  It called by __TI_targ_regbuf_install,
; which is just a wrapper for this function.  This function performs
; either a simulated return or a call to a cleanup/catch handler or
; __cxa_call_unexpected.
;
; __TI_targ_regbuf_install is eventually called from two places,
; __TI_Unwind_RaiseException and __TI_Unwind_Resume.
;
; __TI_Unwind_RaiseException calls __TI_unwind_frame to begin phase 2
; unwinding if a handler was found for the current exception.  (Phase
; 2 unwinding actually unwinds the stack and calls cleanup/catch
; handlers).  __TI_unwind_frame unwinds the frame until a
; cleanup/catch handler which needs to be run is found, at which point
; it calls __TI_targ_regbuf_install.  The pseudo-PC in the register
; buffer will have been set by the personality routine to the landing
; pad for the handler, so instead of performing a simulated return, we
; call the catch handler landing pad.  The very first thing the catch
; handler landing pad does is call __cxa_begin_catch, which takes one
; argument, the _Unwind_Exception pointer.  For this reason, this
; function needs to install A4 from the register buffer.
;
; During phase 2 unwinding, __cxa_end_cleanup calls _Unwind_Resume,
; which calls __TI_Unwind_Resume.  __TI_Unwind_Resume calls
; __TI_unwind_frame when the personality routine returns
; _URC_CONTINUE_UNWIND, and things proceed as when
; __TI_Unwind_RaiseException calls __TI_unwind_frame.
;
; __TI_Unwind_Resume will also call __TI_targ_regbuf_install if the
; personality routine returns _URC_INSTALL_CONTEXT.  This happens when
; a cleanup/catch/fespec handler is found.  The personality routine
; sets PC to the handler landing pad and A4 to the _Unwind_Context
; pointer.
;
; Additionally, for FESPEC, the personality routine may set PC to
; "__cxa_call_unexpected" and A4 to the _Unwind_Context pointer, and
; return _URC_INSTALL_CONTEXT, which results in a call to
; __cxa_call_unexpected.
;
; Returns to the location in "PC."
;------------------------------------------------------------------------------

        .def __TI_Install_CoreRegs
__TI_Install_CoreRegs: .asmfunc stack_usage(0)

        ; This function must:
        ; 1. Restore all of the SOE registers from "context," which
        ;    lives in some ancestor call's frame.
        ; 2. Restore A4 (in case we are simulating a call).
        ; 3. Restore RETA from "PC" (in case we are simulating a call).
        ; 4. Branch to the address in "PC".

        LDW *A4[_Unwind_Reg_Id._UR_PC], B3 ; must finish before
                                           ; branch starts

        .if _USE_LDDW

        LDDW *A4[_Unwind_Reg_Id._UR_B12 / 2], B13:B12 ; Divide by 2 may
        LDDW *A4[_Unwind_Reg_Id._UR_B10 / 2], B11:B10 ; round down, allowing
        LDDW *A4[_Unwind_Reg_Id._UR_A14 / 2], A15:A14 ; access from correct
        LDDW *A4[_Unwind_Reg_Id._UR_A12 / 2], A13:A12 ; location regardless
        LDDW *A4[_Unwind_Reg_Id._UR_A10 / 2], A11:A10 ; of endianness

        .else

        LDW *A4[_Unwind_Reg_Id._UR_B13], B13
        LDW *A4[_Unwind_Reg_Id._UR_B12], B12
        LDW *A4[_Unwind_Reg_Id._UR_B11], B11
        LDW *A4[_Unwind_Reg_Id._UR_B10], B10
        LDW *A4[_Unwind_Reg_Id._UR_A15], A15
        LDW *A4[_Unwind_Reg_Id._UR_A14], A14
        LDW *A4[_Unwind_Reg_Id._UR_A13], A13
        LDW *A4[_Unwind_Reg_Id._UR_A12], A12
        LDW *A4[_Unwind_Reg_Id._UR_A11], A11
        LDW *A4[_Unwind_Reg_Id._UR_A10], A10

        .endif

        ;
        ; Tricky pipeline stuff in the following code.
        ;
        ; 1. All register restores must be completed before the branch
        ;    completes.
        ; 2. The SP restore must not complete until all other restores are
        ;    dispatched.  (An interrupt could happen after the SP restore and
        ;    scribble on the stack space used to hold the other registers).
        ; 3. The A4 restore must not complete until all instructions using A4
        ;    to read the register context are dispatched.
        ; 4. The B3 restore must not complete before the branch is dispatched.
        ; 5. For the A4/B3/DP/SP restores, if interrupts are enabled, the
        ;    restores must not be dispatched until all other restores are
        ;    dispatched.  (C6x flushes the pipeline on interrupts, so the SP
        ;    modification can happen before the next instruction is
        ;    dispatched.  Disable interrupts during SP restore or put it in
        ;    the delay slot of a branch.)
        ; 6. The DP would normally have to be protected from interrupts
        ;    occuring, but we will have a problem anyway with interrupts if
        ;    the value of the DP changes.  Revisit this later.


	.if (_USE_DINT & _USE_BNOP & _USE_LDDW)

	DINT
||      LDDW *A4[_Unwind_Reg_Id._UR_B14 / 2], SP:DP
        LDW *A4[_Unwind_Reg_Id._UR_B3], B3
        LDW *A4[_Unwind_Reg_Id._UR_A4], A4
||  	BNOP B3, 5
||	RINT

	.else

        .if __TI_NO_PARALLEL_LOADS=1 ; No parallel loads

        B INT_OFF_LABEL ; only to disable interrupts
||      LDW *A4[_Unwind_Reg_Id._UR_B14], DP 

        LDW *A4[_Unwind_Reg_Id._UR_B15], SP

        B   B3
||      LDW *A4[_Unwind_Reg_Id._UR_B3], B3

        LDW *A4[_Unwind_Reg_Id._UR_A4], A4

        NOP 2
        ; b int_off_label occurs
INT_OFF_LABEL:
        NOP 2
        ; b b3 occurs

        .else ; Allow parallel loads

        MV  A4, B0

        B B3                            ; can return, but not always to the
||      LDW *B0[_Unwind_Reg_Id._UR_B14], DP ; caller of __TI_Install_CoreRegs
||      LDW *A4[_Unwind_Reg_Id._UR_B3], A0

        LDW *B0[_Unwind_Reg_Id._UR_B15], SP
||      LDW *A4[_Unwind_Reg_Id._UR_A4], A4

        NOP 3

        MV A0, B3

        .endif ; Parallel loads

	.endif

        .endasmfunc

;------------------------------------------------------------------------------
; __cxa_end_cleanup - generic C++ helper function
;
; void __cxa_end_cleanup(void)
;
; _Unwind_Exception *__TI_cxa_end_cleanup(void);
;
; void _Unwind_Resume(_Unwind_Exception *);
;------------------------------------------------------------------------------
; __cxa_end_cleanup is a C++-specific function, called directly in
; compiler-generated code.  It calls __TI_cxa_end_cleanup to perform
; bookkeeping for foreign exceptions and exceptions thrown during
; cleanup.  It calls _Unwind_Resume to continue unwinding the stack.
;
; Saves/restores state to preserve changes made during destructors
; from changes made in the course of executing __TI_cxa_end_cleanup.
;------------------------------------------------------------------------------
        .def __cxa_end_cleanup
        .ref __TI_cxa_end_cleanup
__cxa_end_cleanup: .asmfunc stack_usage(FRM_SZ * 4)

        ; Doesn't need to store PC or SP

        ; There is some amount of confusion in this function.  I don't
        ; think we should need to save the SOE registers around the
        ; call to __TI_cxa_end_cleanup.

        SUBAW SP, FRM_SZ, SP

        STW B14, *SP[_Unwind_Reg_Id._UR_B14 + 2]
        STW B13, *SP[_Unwind_Reg_Id._UR_B13 + 2]
        STW B12, *SP[_Unwind_Reg_Id._UR_B12 + 2]
        STW B11, *SP[_Unwind_Reg_Id._UR_B11 + 2]
        STW B10, *SP[_Unwind_Reg_Id._UR_B10 + 2]
        STW B3,  *SP[_Unwind_Reg_Id._UR_B3 + 2]
        STW A15, *SP[_Unwind_Reg_Id._UR_A15 + 2]
        STW A14, *SP[_Unwind_Reg_Id._UR_A14 + 2]
        STW A13, *SP[_Unwind_Reg_Id._UR_A13 + 2]
        STW A12, *SP[_Unwind_Reg_Id._UR_A12 + 2]
        STW A11, *SP[_Unwind_Reg_Id._UR_A11 + 2]
        STW A10, *SP[_Unwind_Reg_Id._UR_A10 + 2]

        MVKL RL1, B3
        MVKH RL1, B3

	; PIC Code

cxa_base_pcr:
	MVC PCE1,B1
	MVKL $PCR_OFFSET(__TI_cxa_end_cleanup,cxa_base_pcr), B0 
	MVKH $PCR_OFFSET(__TI_cxa_end_cleanup,cxa_base_pcr), B0 
	ADD B1, B0, B0

        CALL B0                         ; returns a value in A4
        NOP 5

RL1:
        LDW *SP[_Unwind_Reg_Id._UR_B14 + 2], B14
        LDW *SP[_Unwind_Reg_Id._UR_B13 + 2], B13
        LDW *SP[_Unwind_Reg_Id._UR_B12 + 2], B12
        LDW *SP[_Unwind_Reg_Id._UR_B11 + 2], B11
        LDW *SP[_Unwind_Reg_Id._UR_B10 + 2], B10
        LDW *SP[_Unwind_Reg_Id._UR_B3  + 2], B3
        LDW *SP[_Unwind_Reg_Id._UR_A15 + 2], A15
        LDW *SP[_Unwind_Reg_Id._UR_A14 + 2], A14
        LDW *SP[_Unwind_Reg_Id._UR_A13 + 2], A13
        LDW *SP[_Unwind_Reg_Id._UR_A12 + 2], A12
        LDW *SP[_Unwind_Reg_Id._UR_A11 + 2], A11
        LDW *SP[_Unwind_Reg_Id._UR_A10 + 2], A10

        ADDAW SP, FRM_SZ, SP

        CALL _Unwind_Resume             ; takes value from __TI_cxa_end_cleanup
        NOP 5

        .endasmfunc
