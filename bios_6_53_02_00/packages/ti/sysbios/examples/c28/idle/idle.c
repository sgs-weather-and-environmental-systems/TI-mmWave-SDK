/* 
 *  28x specific Idle example.
 *  
 *  This example:
 * 
 *  1) prints "Hello world" in main()
 *  
 *  2) prints the current value of a counter from
 *     within an Idle function each time an
 *     a timer interrupt goes off.
 * 
 *  All output is routed to a log buffer which can be viewed
 *  using the RTA "Raw Logs" viewer. After loading and running
 *  the application, launch the Tools->RTA->Raw Logs tool to
 *  view the logs.
 */
 
#include <xdc/std.h>
#include <xdc/runtime/Log.h>
#include <ti/sysbios/BIOS.h>

/* Flag used by idle function to check if interrupt occurred */
volatile Bool isrFlag = FALSE;

/* Counter incremented by timer interrupt */
volatile UInt tickCount = 0;

/*
 *  ======== main ========
 */
Int main()
{
    /*
     * Print "Hello world" to a log buffer. 
     */
    Log_info0("Hello world\n");

    /* 
     * Start BIOS
     * Perform a few final initializations and then
     * fall into a loop that continually calls the
     * installed Idle functions.
     */
    BIOS_start();    /* does not return */
    return(0);
}

/*
 *  ======== myTickFxn ========
 *  Timer Tick function that increments a counter, and sets the isrFlag.
 */
Void myTickFxn(UArg arg) 
{
    tickCount += 1;    /* increment the counter */

    isrFlag = TRUE;    /* tell background that new data is available */
}

/*
 *  ======== myIdleFxn ========
 *  Background idle function that is called repeatedly 
 *  from within BIOS_start() thread.
 */
Void myIdleFxn(Void) 
{
    if (isrFlag == TRUE) {
        isrFlag = FALSE;
        /*
         * Print the current value of tickCount to a log buffer. 
         */
        Log_info1("Tick Count = %d\n", tickCount);
    }
}
