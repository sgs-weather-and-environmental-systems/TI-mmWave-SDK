/*
 *  ======== clock.c ========
 *  The clock example shows how to use the ti.sysbios.knl.Clock module to
 *  create one-shot and periodic Clock Instances. Clock Instances are 
 *  essentially functions that run after a certain number of Clock ticks.
 */    

#include <xdc/std.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Clock.h>

Void clk0Fxn(UArg arg0);
Void clk1Fxn(UArg arg0);
        
/*
 *  ======== main ========
 */
Int main()
{
    Clock_Handle clk2;       
    Clock_Params clkParams;

    /* Create a periodic Clock Instance with period = 5 system time units */
    Clock_Params_init(&clkParams);
    clkParams.period = 5;
    clkParams.startFlag = TRUE;
    Clock_create(clk0Fxn, 5, &clkParams, NULL);
    
    /* Create an one-shot Clock Instance with timeout = 11 system time units */
    clkParams.period = 0;
    clkParams.startFlag = FALSE;
    clk2 = Clock_create(clk1Fxn, 11, &clkParams, NULL);

    Clock_start(clk2);
                
    BIOS_start();    /* does not return */
    return(0);
}

/*
 *  ======== clk0Fxn =======
 */
Void clk0Fxn(UArg arg0)
{
    UInt32 time;
    
    time = Clock_getTicks();
    System_printf("System time in clk0Fxn = %lu\n", (ULong)time);
}

/*
 *  ======== clk1Fxn =======
 */
Void clk1Fxn(UArg arg0)
{
    UInt32 time;
    
    time = Clock_getTicks();
    System_printf("System time in clk1Fxn = %lu\n", (ULong)time);
    System_printf("Calling BIOS_exit() from clk1Fxn\n");
    BIOS_exit(0);
}

