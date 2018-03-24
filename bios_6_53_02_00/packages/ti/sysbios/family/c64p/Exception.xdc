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
 *
 */

package ti.sysbios.family.c64p;

import xdc.rov.ViewInfo;
import xdc.runtime.Error;
import xdc.runtime.Diags;
import xdc.runtime.Log;

/*!
 *  ======== Exception ========
 *  Exception Module
 *
 *  The Exception module is a basic C64+ exception handler.  It is generally
 *  considered to be a program endpoint, since an exception usually
 *  indicates something fatal to the system.
 *
 *  During initialization, the Exception module sets TSR.GEE and TSR.XEN to
 *  enable the CPU to recognize the EXECP input.
 *
 *  Function hooks are provided to the user for hooking in their own functions
 *  at different points of an exception. The hook functions are called in the
 *  following order:
 *  (1) exceptionHook - called whenever an exception occurs.
 *  (2) internalHook - called only when an internal exception occurs.
 *  (3) externalHook - called only when an external exception occurs.
 *  (4) nmiHook - called only when a legacy NMI occurs.
 *  (5) returnHook - called whenever an exception occurs.
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                                                                                                                 -->
 *    <tr><td> {@link #clearLastStatus}         </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #evtEvtClear}             </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #evtExpMaskEnable}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getLastStatus}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #setReturnPtr}            </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started (e.g. Mod_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started (e.g. Mod_Module_startupDone() returns FALSE).</li>
 *           </ul>
 *       </ul>
 *    </td></tr>
 *
 *  </table>
 *  @p
 */

@ModuleStartup         /* generate a call to Exception at startup */
@DirectCall
module Exception
{
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
                 ['Exception',
                    {
                        type: ViewInfo.TREE,
                        viewInitFxn: 'viewInitException',
                        structName: 'Context'
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

    // -------- Module Types --------

    /*! FuncPtr - Hook function type definition. */
    typedef Void (*FuncPtr)(void);

    /*! @_nodoc
     *  Context - Register contents at the time of the exception.
     *  dispatch() creates a Context structure on the Hwi ISR stack or
     *  context buffer and fills it before calling handler.  A pointer
     *  to this Context structure is returned by getLastStatus().
     */
    struct Context {
        Ptr ILC;        //! register ILC
        Ptr RILC;       //! register RILC
        Ptr AMR;        //! register AMR
        Ptr SSR;        //! register SSR
        Ptr IRP;        //! register IRP
        Ptr NRP;        //! register NRP
        Ptr ITSR;       //! register ITSR
        Ptr NTSR;       //! register NTSR
        Ptr EFR;        //! register EFR
        Ptr IERR;       //! register IERR
        Ptr B30;        //! general purpose register b30
        Ptr B31;        //! general purpose register b31
        Ptr B28;        //! general purpose register b28
        Ptr B29;        //! general purpose register b29
        Ptr B26;        //! general purpose register b26
        Ptr B27;        //! general purpose register b27
        Ptr B24;        //! general purpose register b24
        Ptr B25;        //! general purpose register b25
        Ptr B22;        //! general purpose register b22
        Ptr B23;        //! general purpose register b23
        Ptr B20;        //! general purpose register b20
        Ptr B21;        //! general purpose register b21
        Ptr B18;        //! general purpose register b18
        Ptr B19;        //! general purpose register b19
        Ptr B16;        //! general purpose register b16
        Ptr B17;        //! general purpose register b17
        Ptr B14;        //! general purpose register b14
        Ptr B15;        //! general purpose register b15
        Ptr B12;        //! general purpose register b12
        Ptr B13;        //! general purpose register b13
        Ptr B10;        //! general purpose register b10
        Ptr B11;        //! general purpose register b11
        Ptr B8;         //! general purpose register b8
        Ptr B9;         //! general purpose register b9
        Ptr B6;         //! general purpose register b6
        Ptr B7;         //! general purpose register b7
        Ptr B4;         //! general purpose register b4
        Ptr B5;         //! general purpose register b5
        Ptr B2;         //! general purpose register b2
        Ptr B3;         //! general purpose register b3
        Ptr B0;         //! general purpose register b0
        Ptr B1;         //! general purpose register b1
        Ptr A30;        //! general purpose register a30
        Ptr A31;        //! general purpose register a31
        Ptr A28;        //! general purpose register a28
        Ptr A29;        //! general purpose register a29
        Ptr A26;        //! general purpose register a26
        Ptr A27;        //! general purpose register a27
        Ptr A24;        //! general purpose register a24
        Ptr A25;        //! general purpose register a25
        Ptr A22;        //! general purpose register a22
        Ptr A23;        //! general purpose register a23
        Ptr A20;        //! general purpose register a20
        Ptr A21;        //! general purpose register a21
        Ptr A18;        //! general purpose register a18
        Ptr A19;        //! general purpose register a19
        Ptr A16;        //! general purpose register a16
        Ptr A17;        //! general purpose register a17
        Ptr A14;        //! general purpose register a14
        Ptr A15;        //! general purpose register a15
        Ptr A12;        //! general purpose register a12
        Ptr A13;        //! general purpose register a13
        Ptr A10;        //! general purpose register a10
        Ptr A11;        //! general purpose register a11
        Ptr A8;         //! general purpose register a8
        Ptr A9;         //! general purpose register a9
        Ptr A6;         //! general purpose register a6
        Ptr A7;         //! general purpose register a7
        Ptr A4;         //! general purpose register a4
        Ptr A5;         //! general purpose register a5
        Ptr A2;         //! general purpose register a2
        Ptr A3;         //! general purpose register a3
        Ptr A0;         //! general purpose register a0
        Ptr A1;         //! general purpose register a1
    };

    /*! Status - structure filled by getLastStatus(). */
    struct Status {
        Bits32  efr;            //! Exception flag register
        Bits32  nrp;            //! NMI return pointer register
        Bits32  ntsr;           //! NMI/Exception task state register
        Bits32  ierr;           //! Internal Exception report register
        Context *excContext;//! Context structure filled by last exception
    };

    // -------- Module Constants --------

    /*
     *  Bitmasks for C64+ Exception Flag Register (EFR).
     */
    const Bits32 EFRSXF = 0x00000001;   //! Software exception flag
    const Bits32 EFRIXF = 0x00000002;   //! Internal exception flag
    const Bits32 EFREXF = 0x40000000;   //! EXCEP flag
    const Bits32 EFRNXF = 0x80000000;   //! NMI exception flag

    /*
     *  Bitmasks for C64+ Exception Clear Register (ECR).
     */
    const Bits32 ECRSXF = EFRSXF;       //! Software exception flag
    const Bits32 ECRIXF = EFRIXF;       //! Internal exception flag
    const Bits32 ECREXF = EFREXF;       //! EXCEP flag
    const Bits32 ECRNXF = EFRNXF;       //! NMI exception flag

    /*
     *  Bitmasks for C64+ Internal Exception Report Register (IERR).
     */
    const Bits32 IERRIFX = 0x00000001;  //! Instruction fetch exception
    const Bits32 IERRFPX = 0x00000002;  //! Fetch packet exception
    const Bits32 IERREPX = 0x00000004;  //! Execute packet exception
    const Bits32 IERROPX = 0x00000008;  //! Opcode exception
    const Bits32 IERRRCX = 0x00000010;  //! Resource conflict exception
    const Bits32 IERRRAX = 0x00000020;  //! Resource access exeption
    const Bits32 IERRPRX = 0x00000040;  //! Priviledge exception
    const Bits32 IERRLBX = 0x00000080;  //! Loop buffer exception
    const Bits32 IERRMSX = 0x00000100;  //! Missed stall exception

    /*
     *  Exception-related bitmasks for C64+ Task State Register (TSR).
     */
    const Bits32 TSRGEE = 0x00000004;   //! Global exception enable
    const Bits32 TSRXEN = 0x00000008;   //! External exception enable
    const Bits32 TSREXC = 0x00000400;   //! Exception processing

    /* TSR Privilege Mode bits */
    const Bits32 TSRCXM   = 0x000000C0; //! Current execution mode bits
    const Bits32 TSRCXMSHIFT = 6;       //! TSR.CXM left shift value
    const Bits32 TSRCXMSV = 0x00000000; //! Supervisor mode
    const Bits32 TSRCXMUS = 0x00000040; //! User mode

    /* size of buffer (in bytes) to hold exception context */
    const UInt32 sizeContextBuf = 320;

    /*! Error raised when {@link #enablePrint Exception.enablePrint} is false */
    config Error.Id E_exceptionMin = {
        msg: "E_exceptionMin: pc = 0x%08x, sp = 0x%08x.\nTo see more exception detail, use ROV or set 'ti.sysbios.family.c64p.Exception.enablePrint = true;'"
    };

    /*! Error raised when {@link #enablePrint Exception.enablePrint} is true */
    config Error.Id E_exceptionMax = {
        msg: "E_exceptionMax: pc = 0x%08x, sp = 0x%08x."
    };

    // -------- Module Parameters --------

    /*!
     *  If true, the exception context is saved to an internal buffer.
     *  If false, the exception context is saved to the bottom of the isr stack
     *  and no memory for the internal buffer is allocated.
     */
    config Bool useInternalBuffer = false;

    /*!
     *  enableExternalMPC - Enable handling of Memory Protection
     *  Controller (MPC) exceptions.
     */
    config Bool enableExternalMPC = false;

    /*!
     *  enablePrint - Enable print of exception details and Register values
     */
    config Bool enablePrint = true;

    /*!
     *  exceptionHook - Function hook called by handler
     *  This is called anytime an exception occurs.
     */
    config FuncPtr exceptionHook = null;

    /*!
     *  internalHook - Function hook called by internalHandler
     *  Function is only called when an internal exception has occurred.
     */
    config FuncPtr internalHook = null;

    /*!
     *  externalHook - Function hook called by externalHandler
     *  Function is only called when an external exception has occurred.
     */
    config FuncPtr externalHook = null;

    /*!
     *  nmiHook - Function hook called by nmiHandler
     *  Function is called for legacy NMI exceptions only
     */
    config FuncPtr nmiHook = null;

    /*! returnHook - Function hook called at the end of Exception_dispatch */
    config FuncPtr returnHook = null;

    /*!
     *  getLastStatus - Fills passed status structure with the Status
     *  fields that were recorded by the last invocation of
     *  dispatch(), handler() and internalHandler().
     *  The 'excContext' is valid only in the scope of sub-handler
     *  "Hook" functions.
     */
    Void getLastStatus(Status *status);

    /*!
     *  clearLastStatus - Clears internal Status structure.
     */
    Void clearLastStatus();

    /*!
     *  setReturnPtr - Configures dispatch() to "return" (branch) to the
     *  passed ptr.
     */
    FuncPtr setReturnPtr(FuncPtr ptr);

    /*!
     *  evtEvtClear - Clear a C64+ event from the EVTFLAG register.
     */
    Void evtEvtClear(UInt event);

    /*!
     *  evtExpMaskEnable - Enable a C64+ event to generate an exception.
     */
    Void evtExpMaskEnable(UInt event);

    /*! @_nodoc
     *  dispatch - The default low-level dispatcher, plugged into the
     *  C64+ NMI vector.
     */
    Void dispatch();

internal:

    /* MPC CPU Access Memory Protecton Fault Event numbers */
    const UInt EVTPMCCMPA = 120;        /* PMC memory protection fault event */
    const UInt EVTDMCCMPA = 122;        /* DMC memory protection fault event */
    const UInt EVTUMCCMPA = 124;        /* UMC memory protection fault event */
    const UInt EVTEMCCMPA = 126;        /* EMC memory protection fault event */

    /*!
     *  handler - The high-level dispatcher, called by dispatch().
     *  Performs the following steps in order:
     *    a. records EFR/NRP/NTSR in a Status structure
     *    b. logs EFR/NRP/NTSR.CXM with text output to module's logger
     *    c. calls exceptionHook
     *    d. clears EFR
     *    e. calls into subhandlers
     *    f. aborts system
     */
    Void handler(Bool abortFlag);

    /*!
     *  internalHandler - Internal exception handler called by
     *  handler().  Performs the following steps in order:
     *    a. records IERR in a Status structure
     *    b. logs IERR with text output to module's logger
     *    c. calls internalHook
     *    d. clears IERR
     */
    Void internalHandler();

    /*!
     *  externalHandler - External exception handler called by
     *  handler().  Performs the following steps in order:
     *    a. logs text output to module's logger
     *    b. calls externalHook
     */
    Void externalHandler();

    /*!
     *  nmiHandler - Legacy NMI handler called by handler().
     *  Performs the following steps in order:
     *    a. logs text output to module's logger
     *    b. calls nmiHook
     */
    Void nmiHandler();

    /*
     *  ======== decodeMpfsr ========
     */
    Void decodeMpfsr(UInt mpfsr);

    struct Module_State {
        Bits32  efr;
        Bits32  nrp;
        Bits32  ntsr;
        Bits32  ierr;
        FuncPtr returnHook;
        Context *excContext;
        Char    scratch[16];    // sratch memory used by dispatch
        Char    *excPtr;        // points to isrStack or contextBuf
        Char    contextBuf[];   // Need at least 74 words for context buf
    };
}

