/*
 *  ======== log.c ========
 *  Example showing use of logs.
 * 
 *  All output is routed to a log buffer which can be viewed
 *  using the RTA "Raw Logs" viewer. After loading and running
 *  the application, launch the Tools->RTA->Raw Logs tool to
 *  view the logs.
 */

#include <xdc/std.h>
#include <xdc/runtime/Log.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>

#include <xdc/cfg/global.h>

Void tsk0Fxn(UArg arg0, UArg arg1);
Void tsk1Fxn(UArg arg0, UArg arg1);
Void tsk2Fxn(UArg arg0, UArg arg1);
Void idl0Fxn();

/*
 *  ======== main ========
 */
Int main(Int argc, Char* argv[])
{
    BIOS_start();    /* does not return */
    return(0);
}

/*
 *  ======== tsk0Fxn ========
 */
Void tsk0Fxn(UArg arg0, UArg arg1)
{
    Log_info2("tsk0 Entering. arg0,1 = %d %d", 
        (Int)arg0, (Int)arg1);
        
    Log_warning2("tsk0 demonstrating warning event. arg0,1 = %d %d",
        (Int)arg0, (Int)arg1);
    
    Log_info0("tsk0 Calling Task_yield");
    Task_yield();
    
    Log_info0("tsk0 Exiting");
}

/*
 *  ======== tsk1Fxn ========
 */
Void tsk1Fxn(UArg arg0, UArg arg1)
{
    Log_info2("tsk1 Entering. arg0,1 = %d %d", 
        (Int)arg0, (Int)arg1);

    Log_error2("tsk1 demonstrating error event. arg0,1 = %d %d",
        (Int)arg0, (Int)arg1);
        
    Log_info0("tsk1 Calling Semaphore_pend");
    Semaphore_pend(sem0, BIOS_WAIT_FOREVER);
    
    Log_info0("tsk1 Exiting");
}

/*
 *  ======== tsk2Fxn ========
 */
Void tsk2Fxn(UArg arg0, UArg arg1)
{
    Log_info2("tsk2 Entering. arg0,1 = %d %d", 
        (Int)arg0, (Int)arg1);

    Log_info0("tsk2 Calling Task_yield");
    Task_yield();
    
    Log_info0("tsk2 Exiting");
}


/*
 *  ======== idl0Fxn ========
 */
Void idl0Fxn()
{
    Log_info0("Entering idl0Fxn.");

    Semaphore_post(sem0);

    Log_info0("Exiting idl0Fxn.");

    BIOS_exit(0);
}

