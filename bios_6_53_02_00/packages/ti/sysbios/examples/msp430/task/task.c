/* 
 *  MSP430 specific Task example.
 *  
 *  This example:
 * 
 *  1) prints "Hello world" in main().
 *  
 *  2) increments a counter within a timer interrupt.
 * 
 *  3) every 10 timer interrupts, the timer interrupt handler
 *     posts a semaphore to awaken a task to perform additional
 *     work. 
 * 
 *  4) prints "10 ticks" from within the task function awakened 
 *     each time 10 interrupts have been serviced.
 * 
 *  All output is routed to a log buffer which can be viewed
 *  using the RTA "Raw Logs" viewer. After loading and running
 *  the application, launch the Tools->RTA->Raw Logs tool to
 *  view the logs.
 */

/*
 * The msp430.h header is included for referencing P1DIR and P1OUT, used below
 * to blink an LED connected to P1.0.  Many development boards (e.g.,
 * MSP-EXP430F5438, MSP-TS430PN80USB, ...) provide an LED at this port
 * location.  Because this example can be run on custom development boards, the
 * code to control the LED is commented out below.  To enable blinking of the
 * LED, remove the comments around the modifications of P1DIR and P1OUT. If
 * the LED is at a different location, change the port direction, output,
 * and bit locations accordingly.
 */
#include <msp430.h>

#include <xdc/std.h>
#include <xdc/runtime/Log.h>
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>

/* Semaphore handle defined in task.cfg */
extern const Semaphore_Handle mySem;

/* Counter incremented by timer interrupt */
volatile UInt tickCount = 0;

/*
 *  ======== main ========
 */
Int main()
{
    /*
     * Uncomment this next line to initialize the port direction for the LED.
     */
    /* P1DIR |= 0x1; */

    /*
     * Print "Hello world" to a log buffer. 
     */
    Log_info0("Hello world\n");

    /* 
     * Start BIOS.
     * Begins task scheduling.
     */
    BIOS_start();        /* does not return */
    return(0);
}

/*
 *  ======== myTickFxn ========
 *  Timer ISR function that posts a Swi to peform 
 *  the non-realtime service functions.
 */
Void myTickFxn(UArg arg) 
{
    /*
     * Uncomment this next line to toggle the LED state.
     */
    /* P1OUT ^= 0x1; */

    tickCount += 1;      /* increment the counter */

    /* every 10 timer interrupts post the semaphore */
    if ((tickCount % 10) == 0) {
        Semaphore_post(mySem);
    }
}

/*
 *  ======== myTaskFxn ========
 *  Task function that pends on a semaphore until 10 ticks have
 *  expired.
 */
Void myTaskFxn(Void) 
{
    /*
     * Do this forever
     */
    while (TRUE) {
        /* 
         * Pend on "mySemaphore" until the timer ISR says 
         * its time to do something.
         */ 
        Semaphore_pend(mySem, BIOS_WAIT_FOREVER);

        /*
         * Print the current value of tickCount to a log buffer. 
         */
        Log_info1("10 ticks. Tick Count = %d\n", tickCount);
    }
}
