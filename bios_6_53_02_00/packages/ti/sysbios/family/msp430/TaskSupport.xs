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
 *  ======== TaskSupport.xs ========
 */

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.msp430.elf.MSP430X":
            return (["TaskSupport_asm.asm"]);
            break;

        case "iar.targets.msp430.MSP430":
        case "iar.targets.msp430.MSP430X_small":
        case "iar.targets.msp430.MSP430X_large":
            return (["TaskSupport_asm_iar.asm"]);
            break;

	default:
	    return (null);
	    break;
    }
}

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    /* provide getAsmFiles() for Build.getAsmFiles() */
    this.$private.getAsmFiles = getAsmFiles;

    /* set fxntab default */
    this.common$.fxntab = false;
}

/*
 *  ======== stackUsedMeta ========
 */
function stackUsed$view(stackData)
{
    var size = stackData.length;
    var index = 0;
    /*
     * The stack is filled with 0xBE. Because the type is Char, not UChar,
     * ROV reads this value as signed: -66.
     */
    while(stackData[index] == -66) {
        index++;
    }

    return (size - index);
}

/*
 *  ======== getCallStack$view ========
 */
function getCallStack$view(taskRawView, taskState, threadType)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Task = xdc.useModule('ti.sysbios.knl.Task');

    var CallStack = xdc.useModule('xdc.rov.CallStack');

    var stackData = Program.fetchArray({type: 'xdc.rov.support.ScalarStructs.S_UInt16', isScalar: true}, taskRawView.context, 32);
    var sp = 0;
    var pc = 0;
    var ra = 0

    /*
     * PC should be within TaskSupport_swap() but the debugger can't do call stack for
     * assembly coded functions. So, we set the PC to the saved .
     */
    pc = stackData[15]; /* set pc to saved RA */
    sp = Number(taskRawView.context) + 16*2;


    if (taskState == Task.Mode_RUNNING) {
        switch (threadType) {
            /* The program has called BIOS_exit(), use live registers */
            case "Main":
            /* This is the current thread, use live registers */
            case "Task":
                CallStack.fetchRegisters(["PC", "SP"]);
                sp = CallStack.getRegister("SP");
                pc = CallStack.getRegister("PC");
                break;

            /*
             * The running task has been pre-empted by a Hwi and/or Swi.
             * Assume its a Hwi.
             */
            case "Hwi":
            case "Swi":
                /* fetch PC, SP from Hwi stack */
                try {
                    var HwiProxy = Program.$modules['ti.sysbios.hal.Hwi'].HwiProxy.$name;
                    var hwiRawView = Program.scanRawView(HwiProxy);
//                    pc = hwiRawView.modState.irp;
                    var taskSP = hwiRawView.modState.taskSP;
                    var stackTaskSP = Program.fetchArray({type: 'xdc.rov.support.ScalarStructs.S_UInt16', isScalar: true}, taskSP, 32);
                }
                catch (e) {
                    return (e.toString);
                }

                /*
                 * search for saved IRP on task stack
                 * pc = IRP
                 * sp = &IRP + 2 words
                 * lr = one word before saved IRP on task stack
                 */
                for (var i = 32; i < 512; i++) {
                    if (stackTaskSP[i] == pc) {
                        sp = taskSP + i*4 + 2*4;
                        pc = stackTaskSP[i-1];
                        break;
                    }
                }

                break;
        }
    }

    CallStack.setRegister("SP", sp);
    CallStack.setRegister("PC", pc);

    var bts = "";

    var enumStrArray = String(taskState).split(".");
    bts += "Task_" + enumStrArray[enumStrArray.length - 1];

    bts += ", PC = 0x" + pc.toString(16);
    bts += ", SP = 0x" + sp.toString(16);

    bts += "\n";

    bts += CallStack.toText();

    return (bts);
}
