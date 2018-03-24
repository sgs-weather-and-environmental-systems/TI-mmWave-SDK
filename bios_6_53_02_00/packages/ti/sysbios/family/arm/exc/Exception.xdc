/*
 * Copyright (c) 2015, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 *  ======== Exception.xdc ========
 */

package ti.sysbios.family.arm.exc;

import xdc.rov.ViewInfo;

import xdc.runtime.Error;

import ti.sysbios.BIOS;

/*!
 *  ======== Exception ========
 *  Exception Module
 *
 *  The Exception module is a basic ARM exception handler.
 *  When an exception occurs, the execution state is saved into
 *  a buffer with a structure of type {@link #ExcContext ExcContext}.
 *
 *  By default, a formatted dump of this structure is also sent to
 *  the console using System_printf(). This behavior can be suppressed
 *  by setting the {@link #enableDecode} config parameter to 'false'.
 *
 *  An ROV view of the exception context is provided when
 *  attached to the target board with CCS.
 *
 *  @a(Notes)
 *  No attempt is made to return from an exception as these are
 *  generally fatal in nature.
 *
 *  When used, the Exception module will override the default
 *  exception handlers provided by the current Hwi module.
 */

@ModuleStartup          /* generates call to Exception_Module_startup at startup */
@DirectCall

module Exception
{
    /*! Exception hook function type definition. */
    typedef Void (*ExceptionHookFuncPtr)(ExcContext *);

    /* Exception types */
    enum Type {
        Type_Supervisor = 0x13,         /*! Supervisor (SWI). */
        Type_PreAbort   = 0x17,         /*! Abort exception. */
        Type_DataAbort  = 0x18,         /*! Abort exception. */
        Type_UndefInst  = 0x1b          /*! Undefined instruction exception. */
    };

    /*!
     *  Exception Context - Register contents at the time of an exception.
     */
    struct ExcContext {
        /* Thread Context */
        BIOS.ThreadType threadType; /* Type of thread executing at */
                                    /* the time the exception occurred */
        Ptr     threadHandle;       /* Handle to thread executing at */
                                    /* the time the exception occurred */
        Ptr     threadStack;        /* Address of stack contents of thread */
                                    /* executing at the time the exception */
                                    /* occurred */
        SizeT   threadStackSize;    /* size of thread stack */

        Type    type;

        /* Internal Registers */
        Ptr     r0;
        Ptr     r1;
        Ptr     r2;
        Ptr     r3;
        Ptr     r4;
        Ptr     r5;
        Ptr     r6;
        Ptr     r7;
        Ptr     r8;
        Ptr     r9;
        Ptr     r10;
        Ptr     r11;
        Ptr     r12;
        Ptr     sp;
        Ptr     lr;
        Ptr     pc;
        Ptr     psr;

        /* Fault registers */
        Ptr     dfsr;
        Ptr     ifsr;
        Ptr     dfar;
        Ptr     ifar;
    }

    /*! @_nodoc */
    metaonly struct ModuleView {
        String      exception;      /* Summary Exception */
    };

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                ['Basic',
                    {
                        type: ViewInfo.TREE,
                        viewInitFxn: 'viewInitBasic',
                        structName: 'ExcContext'
                    }
                ],
                ['Module',
                    {
                        type: ViewInfo.MODULE,
                        viewInitFxn: 'viewInitModule',
                        structName: 'ModuleView'
                    }
                ]
            ]
        });

    /*! Error raised when a SWI exception occurs */
    config Error.Id E_swi = {
        msg: "E_swi: pc = 0x%08x, lr = 0x%08x."
    };

    /*! Error raised when an prefetch abort exception occurs */
    config Error.Id E_prefetchAbort = {
        msg: "E_prefetchAbort: pc = 0x%08x, lr = 0x%08x."
    };

    /*! Error raised when an data abort exception occurs */
    config Error.Id E_dataAbort = {
        msg: "E_dataAbort: pc = 0x%08x, lr = 0x%08x."
    };

    /*! Error raised when an undefined instruction exception occurs */
    config Error.Id E_undefinedInstruction = {
        msg: "E_undefinedInstruction: pc = 0x%08x, lr = 0x%08x."
    };

    /*!
     *  Enable full exception decoding, default is true.
     *
     *  When enabled, the exception handler will fully
     *  decode an exception and dump the registers to the
     *  system console.
     *
     *  When set to false, only an Error is printed on the console.
     *
     *  In either case, the full exception context is always
     *  saved and visible with ROV.
     */
    config Bool enableDecode = true;

    /*!
     *  ======== excStackSize ========
     *  Exception stack size in MAUs.
     *  Default size is same as Hwi stack size.
     *
     *  If running in SMP mode, the exception stacks
     *  on all cores are set to this size.
     */
    metaonly config SizeT excStackSize;

    /*!
     *  ======== excStackSection ========
     *  Memory section used for Exception stack.
     *  Default is null, which results in the stack
     *  being placed in .bss.
     *
     *  The exception stacks on all cores are placed
     *  in this section.
     */
    metaonly config String excStackSection = null;

    /*!
     *  ======== excContextBuffer ========
     *  User Exception Context Buffer Address
     *
     *  By default, when an exception occurs, an {@link #ExcContext}
     *  structure is allocated on the exception stack and filled in
     *  by the exception handler.
     *
     *  If {@link #excContextBuffer} is initialized by the user, the
     *  {@link #ExcContext} structure will be placed at that address instead.
     *
     *  The buffer must be large enough to contain an {@link #ExcContext}
     *  structure.
     *
     *  @a(Note)
     *  If running in SMP mode and both excContextBuffer and
     *  excContextBuffers[0] are set, then excContextBuffer is used on Core0.
     */
    metaonly config Ptr excContextBuffer;
    metaonly config Ptr excContextBuffers[];

    /*!
     *  ======== excStackBuffer ========
     *  User Exception Stack Buffer Address
     *
     *  When an exception occurs, a pointer to the base address
     *  of the stack being used by the thread causing the exception is stored
     *  in the ExcContext buffer.
     *
     *  If {@link #excStackBuffer} is initialized by the user, the
     *  entire contents of that stack will also be
     *  copied to the address specified.
     *
     *  The buffer must be large enough to contain the largest task stack or ISR
     *  stack defined in the application.
     *
     *  @a(Note)
     *  If running in SMP mode and both excStackBuffer and
     *  excStackBuffers[0] are set, then excStackBuffer is used on Core0.
     */
    metaonly config Ptr excStackBuffer;
    metaonly config Ptr excStackBuffers[];

    /*!
     *  ======== excHookFunc ========
     *  User Exception hook function.
     *
     *  Called just after exception context has been initialized.
     *
     *  @a(Note)
     *  If running in SMP mode and both excHookFunc and excHookFuncs[0]
     *  are set, then excHookFunc is used on Core0.
     */
    config ExceptionHookFuncPtr excHookFunc = null;
    config ExceptionHookFuncPtr excHookFuncs[];

    /*!
     *  @_nodoc
     *  ======== initCoreX ========
     *  Assembly code mode registers setup
     *
     *  Called by core-specific SMP boot function
     */
    Void initCoreX();

internal:   /* not for client use */

    /*
     *  ======== initCore0 ========
     *  Assembly code mode registers setup on Core0
     */
    Void initCore0();

    /*!
     *  ======== excHandlerAsm ========
     *  asm code common exception handler
     */
    Void excHandlerAsm();

    /*!
     *  ======== excHandlerDataAsm ========
     *  asm code Data Abort exception handler
     */
    Void excHandlerDataAsm();

    /*!
     *  ======== excHandler ========
     *  C function exception Handler
     */
    Void excHandler(UInt *excStack, UInt lr);

    /*!
     *  ======== excDumpContext ========
     */
    Void excDumpContext(UInt pc);

    struct Module_State {
        Bool        excActive[];        // TRUE if an exception has occurred
        ExcContext  *excContext[];      // Exception context
        Ptr         excStackBuffers[];  // where to copy thread's stack
        Char        excStack[][];       // buffer used for exception stack
        SizeT       excStackSize;
    };
}
