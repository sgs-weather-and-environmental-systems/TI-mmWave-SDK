/*
 *  ======== small.c ========
 *  The simple example uses the Clock module to periodically post a Swi, every
 *  500 Clock ticks. Counters are incremented both in the function invoked by
 *  Clock, and in the Swi's function.  The application configuration 
 *  (see small.cfg) disables non-essential SYS/BIOS features, to create an 
 *  application with a small memory footprint.
 */

#include <xdc/std.h>

#include <xdc/runtime/System.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Swi.h>

#include <xdc/cfg/global.h>

UInt clkCount = 0;
UInt swiCount = 0;

/*
 *  ======== main ========
 */
Int main()
{ 
    BIOS_start();    /* does not return */
    return(0);
}

/*
 *  ======== myClkFxn ========
 *  A simple Clock function that posts a Swi for execution.
 */
Void myClkFxn(UArg arg)
{
    clkCount++;		/* increment clock function counter */
    Swi_post(swi);	/* post Swi */
}

/*
 *  ======== mySwiFxn ========
 *  A simple Swi function that increments a counter.
 */
Void mySwiFxn(UArg arg)
{
    swiCount++;		/* increment Swi counter */

    /* ... */
}
